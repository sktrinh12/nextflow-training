params.ncbi_api_key = "e432b3221deaef30302ed951c67add82e808"
params.accession = ['ERR908507', 'ERR908506']

process fastqc { 
  container "biocontainers/fastqc:v0.11.5"
  input:
  tuple val(sample_id), path(reads_file)

  output:
  path("fastqc_${sample_id}_logs")

  script:
  """
  mkdir fastqc_${sample_id}_logs
  fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads_file}
  """
}

workflow {
    reads = Channel
     .fromSRA(params.accession, apiKey: params.ncbi_api_key)
		fastqc(reads)
}
