params.reads = "$projectDir/data/meta/exercise5.2.8.csv"
params.transcriptome_file = "$projectDir/data/ggal/transcriptome.fa"
params.multiqc = "$projectDir/multiqc"
params.outdir = "results"

log.info """\
    R N A S E Q - N F   P I P E L I N E
    ===================================
    reads        : ${params.reads}
    transcriptome: ${params.transcriptome_file}
    outdir       : ${params.outdir}
    """
    .stripIndent()

/*
 * define the `index` process that creates a binary index
 * given the transcriptome file
 */

process INDEX {
    container 'quay.io/biocontainers/salmon:1.7.0--h84f40af_0'
    input:
    path transcriptome

    output:
    path 'salmon_index'

    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i salmon_index
    """
}

process QUANTIFICATION {
    container 'quay.io/biocontainers/salmon:1.7.0--h84f40af_0'
    tag "Salmon on $sample_id"
    publishDir params.outdir, mode:'copy'

    input:
    path salmon_index
    tuple val(sample_id), path(reads1), path(reads2)

    output:
    path "$sample_id", emit: quant_ch

    script:
    """
    salmon quant --threads $task.cpus --libType=U -i $salmon_index -1 ${reads1} -2 ${reads2} -o $sample_id
    """
}

/* process FASTQC { */
/*     container 'biocontainers/fastqc:v0.11.5' */
/*     tag "FASTQC on $sample_id" */

/*     input: */
/*     tuple val(sample_id), path(reads) */

/*     output: */
/*     path "fastqc_${sample_id}_logs" */

/*     script: */
/*     """ */
/*     mkdir fastqc_${sample_id}_logs */
/*     fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads} */
/*     """ */
/* } */

workflow {
    Channel
        .fromPath(params.reads)
					.splitCsv()
				  .view(){ row -> "${row[0]} || ${row[1]} || ${row[2]}" }
          .set { read_ch }

    index_ch = INDEX(params.transcriptome_file)
    quant_ch = QUANTIFICATION(index_ch, read_ch)
    /* fastqc_ch = FASTQC(read_pairs_ch) */
}
