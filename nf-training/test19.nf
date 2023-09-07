Channel
  .fromPath("data/meta/patients_1.csv")
  .splitCsv(header: true)
  // row is a list object
  .view { row -> "${row.patient_id},${row.num_samples}" }
