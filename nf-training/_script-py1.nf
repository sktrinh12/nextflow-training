params.reads = "$projectDir"
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
    /usr/local/bin/python3 ${p}/bin/kmer.py -k ${params.k} -sq ${p}/data/test/vibrio_cholerae_sequence.txt
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

