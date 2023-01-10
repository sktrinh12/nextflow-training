params.reads = "$projectDir/etc-scripts/"
params.outdir = "results"
params.k = 3

log.info """\
        P Y T H O N - N F  P I P E L I N E
        ===================================
        reads        : ${params.reads}
        k            : ${params.k}
        outdir       : ${params.outdir}
        """
        .stripIndent()

datasource_ch = Channel.of(params.reads)

process KMER {
    input:
    path p

    output:
    stdout

    """
    python ${p}/kmer.py -k ${params.k} -sq ${p}/vibrio_cholerae_sequence.txt
    """
}

process CONVERTTOUPPER {
    input:
    val kmer

    output:
    stdout

    """
    echo '${kmer.trim()}' | tr '[a-z]' '[A-Z]' 
    """
}

workflow {
    kmer_ch = KMER(datasource_ch)
    results_ch = CONVERTTOUPPER(kmer_ch)
    results_ch.view{ it }
}

