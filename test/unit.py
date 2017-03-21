#!/usr/bin/env python

import unittest
import urllib2
import sys

class TestStringMethods(unittest.TestCase):
    def test_api(self):
        result = urllib2.urlopen('http://%s/hello' % (testing_endpoint)).read()        
        self.assertEqual(result, 'world')

if __name__ == '__main__':
    testing_endpoint = str(sys.argv[1])
    print testing_endpoint
    del sys.argv[1:]
    unittest.main()
