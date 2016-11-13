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
[bargee@jubatus-barge ~]$ docker run -d --name jubatus-tutorial-python -v ~/jubatus-tutorial-python/config.json:/config.json ailispaw/jubatus jubaclassifier -f /config.json
```

### Run Jubatus Client

```
[bargee@jubatus-barge ~]$ docker run -t --rm -v ~/jubatus-tutorial-python:/jubatus-tutorial-python -w /jubatus-tutorial-python --link jubatus-tutorial-python:jubatus ailispaw/jubatus-client python tutorial.py -s jubatus
```

## Classifier

- http://jubat.us/en/tutorial/classifier.html

### Run Jubatus Server

```
[bargee@jubatus-barge ~]$ docker run -d --name jubatus-classifier -v /vagrant/classifier/gender.json:/gender.json ailispaw/jubatus jubaclassifier -f /gender.json
```

### Run Jubatus Client

```
[bargee@jubatus-barge ~]$ docker run -t --rm -v /vagrant/classifier:/jubatus-classifier -w /jubatus-classifier --link jubatus-classifier:jubatus ailispaw/jubatus-client python gender.py
```

## Anomaly

- http://jubat.us/en/tutorial/anomaly.html

### Download the dataset for the tutorial

```
[bargee@jubatus-barge ~]$ cd /vagrant/anomaly
[bargee@jubatus-barge anomaly]$ wget http://kdd.ics.uci.edu/databases/kddcup99/kddcup.data_10_percent.gz
[bargee@jubatus-barge anomaly]$ gunzip kddcup.data_10_percent.gz
[bargee@jubatus-barge anomaly]$ mv kddcup.data_10_percent kddcup.data_10_percent.txt
```

### Run Jubatus Server

```
[bargee@jubatus-barge ~]$ docker run -d --name jubatus-anomaly -v /vagrant/anomaly/config.json:/config.json ailispaw/jubatus jubaanomaly -f /config.json
```

### Run Jubatus Client

```
[bargee@jubatus-barge ~]$ docker run -t --rm -v /vagrant/anomaly:/jubatus-anomaly -w /jubatus-anomaly --link jubatus-anomaly:jubatus ailispaw/jubatus-client python anomaly.py
```

Note) It takes so long to complete the job with a large amount of data.
