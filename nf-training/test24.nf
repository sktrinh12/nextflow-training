include{ parseJsonFile } from './modules/parsers.nf'

process foo {
  input:
  tuple val(meta), path(data_file)

  """
  echo your_command $meta.region_id $data_file
  """
}

workflow {
  Channel.fromPath('data/meta/regions*.json') \
    | flatMap { parseJsonFile(it) } \
    | map { entry -> tuple(entry,"/some/data/${entry.patient_id}.txt") } \
    | foo
}
