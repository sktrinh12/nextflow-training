Channel
  .fromPath("data/meta/patients_1.csv")
  .splitCsv(header: ['col1', 'col2', 'col3', 'col4', 'col5'] )
  // row is a list object
  .view { row -> "${row.col1},${row.col4}" }
