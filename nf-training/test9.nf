params.reads = "$projectDir/data/ggal/*_{1,2}.fq"

/* The matching files are emitted as tuples, 
in which the first element is the grouping 
key of the matching pair and the second 
element is the list of files 
(sorted in lexicographical order)
*/

workflow {
    Channel
				.fromFilePairs(params.reads, flat:true)
				.view()
}
