params.ncbi_api_key = "e432b3221deaef30302ed951c67add82e808"


ids = ['ERR908507', 'ERR908506', 'ERR908505']

workflow {
    Channel
				.fromSRA(ids, apiKey: params.ncbi_api_key)
				.view()
}
