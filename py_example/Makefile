example: example.c
	gcc -c -fPIC example.c -o example.o
	gcc -shared -Wl,-soname,libexample.so -o libexample.so example.o
