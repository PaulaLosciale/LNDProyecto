document.addEventListener("DOMContentLoaded", function () {
  // Obtener parámetros de la URL
  const urlParams = new URLSearchParams(window.location.search);
  const xmlFile = urlParams.get("file");
  const xmlType = urlParams.get("type");

  // Mostrar información del documento
  document.getElementById(
    "document-title"
  ).textContent = `Detalles de ${xmlType}`;

  const metaContainer = document.getElementById("document-meta");
  metaContainer.innerHTML = `
        <span><i class="fas fa-file"></i> ${xmlFile.split("/").pop()}</span>
        <span><i class="fas fa-calendar"></i> ${new Date().toLocaleDateString()}</span>
    `;

  // Cargar y transformar el XML
  if (xmlFile && xmlType) {
    loadAndTransformXML(xmlFile, xmlType);
  } else {
    document.getElementById("xml-content").innerHTML = `
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i> No se ha especificado un documento para visualizar
            </div>
        `;
  }
});

function loadAndTransformXML(xmlPath, xmlType) {
  const xmlContent = document.getElementById("xml-content");
  xmlContent.innerHTML =
    '<div class="loading"><i class="fas fa-spinner fa-spin"></i> Cargando documento...</div>';

  // Determinar archivo XSL
  const xslFile = `xslt/${xmlType.toLowerCase()}.xsl`;

  Promise.all([
    fetch(xmlPath).then((res) => res.text()),
    fetch(xslFile).then((res) => res.text()),
  ])
    .then(([xmlText, xslText]) => {
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(xmlText, "text/xml");
      const xslDoc = parser.parseFromString(xslText, "text/xml");

      // Verificar errores
      const xmlError = xmlDoc.querySelector("parsererror");
      const xslError = xslDoc.querySelector("parsererror");

      if (xmlError || xslError) {
        throw new Error(xmlError ? "Error en el XML" : "Error en el XSL");
      }

      // Procesar transformación
      const xsltProcessor = new XSLTProcessor();
      xsltProcessor.importStylesheet(xslDoc);

      const resultDocument = xsltProcessor.transformToDocument(xmlDoc);
      const resultHtml = new XMLSerializer().serializeToString(resultDocument);

      xmlContent.innerHTML = resultHtml;
    })
    .catch((error) => {
      console.error("Error:", error);
      xmlContent.innerHTML = `
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i> Error al cargar el documento: ${error.message}
            </div>
        `;
    });
}
