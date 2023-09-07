count=0

Channel
  .fromPath('data/meta/random.txt')
  .splitText() /* split on each row */
  .view { "${count++}: ${it.toUpperCase().trim()}" }
