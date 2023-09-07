Channel
  .fromPath('data/meta/random.txt')
  .splitText( by: 4 ) { it.toUpperCase() }
  .view()
