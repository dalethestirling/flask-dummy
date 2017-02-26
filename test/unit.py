import urllib3

http = urllib3.PoolManager()
r = http.request('GET', 'http://127.0.0.1:5000/hello')
assert r.data == 'world'
