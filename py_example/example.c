#include <stdio.h>

// TODO: Try to directly compile the gnunet c library first, if it can
// not compile to shared static library, then we may consider use
// these kind of c wrapper for providing python calls

void gnucall(char *);

void gnucall ( char *s /* some gnu call required parameters */ ) {
    // some of GNU call here
    
    // test the python call
    printf("%s\n", s);
}
