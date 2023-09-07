Channel
  .fromPath("data/meta/patients_*.csv") // <-- just use a pattern
  .splitCsv(header:true)
  .view { row -> "${row.patient_id}\t${row.num_samples}" }
