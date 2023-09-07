Channel
  .fromPath('data/meta/random.txt')
  .splitText( by: 2 )
  .subscribe {
    print it;
    print "--- end of the chunk ---\n"
  }

/*The subscribe operator permits execution of
user defined functions each time a new value 
is emitted by the source channel.
*/
