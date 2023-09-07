#!/usr/bin/env nextflow

workflow {
				ch = Channel.of(1,2,3)
				println(ch)     
				ch.view() 
}

