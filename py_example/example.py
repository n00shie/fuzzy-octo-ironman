#!/bin/env python
import ctypes

lib = ctypes.cdll.LoadLibrary('./libexample.so')

class Example(object):
    def __init__(self):
        return
    def example(self):
        lib.gnucall(ctypes.create_string_buffer(b'Hello World\n'))

ex = Example();
ex.example();
