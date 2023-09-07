def f = file('data/meta/random.txt')
  def lines = f.splitText()
  def count=0
  for( String row : lines ) {
    log.info "${count++} ${row.toUpperCase()}"
  }
