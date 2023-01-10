/*
 * pipeline input parameters
 */
params.transcriptome_file = "$projectDir/data/test/dataset_rev_compl.txt"
params.outdir = "results"
log.info """\
    P Y T H O N - 2   P I P E L I N E
    ===================================
    transcriptome: ${params.transcriptome_file}
    outdir       : ${params.outdir}
    """
    .stripIndent()

process INDEX {
    input:
    path transcriptome

    output:
    stdout

    """
    /root/miniconda3/envs/genetics/bin/python $projectDir/bin/reverse_complement.py -sq $params.transcriptome_file
    """
}


workflow {

    index_ch = INDEX(params.transcriptome_file)
    index_ch.view()
}

workflow.onComplete {
    log.info ( workflow.success ? "\nDone!" : "Oops .. something went wrong" )
}
