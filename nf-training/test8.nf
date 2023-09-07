params.reads = "$projectDir/data/ggal/*.fq"

workflow {
    Channel
        .fromPath(params.reads, checkIfExists: true, hidden: true)
				.view()
}
