params.reads = "$projectDir/data/ggal/gut_{1,2}.fq"
params.transcriptome_file = "$projectDir/data/ggal/transcriptome.fa"
params.multiqc = "$projectDir/multiqc"
params.outdir = "results"

println "reads: $params.reads"
log.info """\
         S C R I P T 1 - T E S T - P I P E L I N E    
         ===================================
         transcriptome: ${params.transcriptome_file}
         reads        : ${params.reads}
         outdir       : ${params.outdir}
         """
         .stripIndent()
