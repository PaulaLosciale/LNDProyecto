// Cargar documentos dinámicamente
document.addEventListener("DOMContentLoaded", function () {
  const documentData = [
    {
      date: "01/05/2025",
      type: "Vehículos",
      reference: "VH-001",
      file: "vehiculos.xml",
      path: "xml/vehiculos.xml",
    },
    {
      date: "02/05/2025",
      type: "Compradores",
      reference: "CP-002",
      file: "compradores.xml",
      path: "xml/compradores.xml",
    },
    {
      date: "03/05/2025",
      type: "Vendedores",
      reference: "VD-003",
      file: "vendedores.xml",
      path: "xml/vendedores.xml",
    },
    {
      date: "04/05/2025",
      type: "Pedidos",
      reference: "PD-004",
      file: "pedidos.xml",
      path: "xml/pedidos.xml",
    },
  ];

  const tableBody = document.querySelector(".document-table");

  // Limpiar tabla si ya tiene contenido
  while (tableBody.children.length > 1) {
    tableBody.removeChild(tableBody.lastChild);
  }

  // Añadir documentos a la tabla
  documentData.forEach((doc) => {
    const row = document.createElement("div");
    row.className = "table-row";
    row.innerHTML = `
          <div class="table-cell">${doc.date}</div>
          <div class="table-cell">${doc.type}</div>
          <div class="table-cell">${doc.reference}</div>
          <div class="table-cell">${doc.file}</div>
          <div class="table-cell">
              <a href="viewer.html?file=${encodeURIComponent(
                doc.path
              )}&type=${encodeURIComponent(doc.type)}" class="btn view-btn">
                  <i class="fas fa-eye"></i> Ver más
              </a>
          </div>
          <div class="table-cell">
              <a href="${doc.path}" download class="btn download-btn">
                  <i class="fas fa-download"></i> Descargar
              </a>
          </div>
      `;
    tableBody.appendChild(row);
  });
});
