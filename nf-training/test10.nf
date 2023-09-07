params.reads = "$projectDir/data/ggal/*_{1,2}.fq"
params.ncbi_api_key = "e432b3221deaef30302ed951c67add82e808"

workflow {
    Channel
				.fromSRA(['SRP073307'], apiKey: params.ncbi_api_key)
				.view()
}
