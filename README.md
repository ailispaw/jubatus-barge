# Jubatus on Barge

## Build Jubatus environment on Barge

```
$ git clone https://github.com/ailispaw/jubatus-barge.git
$ cd jubatus-barge
$ vagrant up
```

## Basic Tutorial

- http://jubat.us/en/tutorial/tutorial.html
- https://github.com/jubatus/jubatus-tutorial-python

### Download the script and dataset for the tutorial

```
$ vagrant ssh
[bargee@jubatus-barge ~]$ git clone https://github.com/jubatus/jubatus-tutorial-python.git
[bargee@jubatus-barge ~]$ cd jubatus-tutorial-python
[bargee@jubatus-barge jubatus-tutorial-python]$ wget http://qwone.com/~jason/20Newsgroups/20news-bydate.tar.gz
[bargee@jubatus-barge jubatus-tutorial-python]$ tar xzf 20news-bydate.tar.gz
```

### Run Jubatus Server

```
[bargee@jubatus-barge ~]$ docker run -d --name jubatus -v ~/jubatus-tutorial-python/config.json:/config.json ailispaw/jubatus -f /config.json
```

### Run Jubatus Client

```
[bargee@jubatus-barge ~]$ docker run -t --rm -v ~/jubatus-tutorial-python:/jubatus-tutorial-python -w /jubatus-tutorial-python --link jubatus ailispaw/jubatus-client python tutorial.py -s jubatus
```
