process RANDOMNUM {

    output:
    path 'result.txt'

    script:
    """
    echo 3512 > result.txt
    """
}


process RANDOMADD {

    input:
		file 'result.txt'

    output:
    path 'resultadd.txt'

    script:
    """
	  cat result.txt > resultadd.txt
    """
}

workflow {
  emit_ch = RANDOMNUM()
	receiver_ch = RANDOMADD(emit_ch)
  receiver_ch.view { "Received: " + it.text }
}
