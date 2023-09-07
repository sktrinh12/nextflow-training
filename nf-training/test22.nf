def f = file('data/meta/exercise5.2.8.csv')
  def lines = f.splitCsv()
  for( List row : lines ) {
    log.info "${row[0]} -- ${row[2]}"
  }
