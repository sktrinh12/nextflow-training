Channel
  .fromPath("data/meta/patients_1.csv")
  .splitCsv()
  // row is a list object
  .view { row -> "${row[0]},${row[3]}" }
