## Benchmark for cdscheckers

```bash
cd ~/c11-ra-rmw-benchmark/cdschecker_modified_benchmarks/
export LD_LIBRARY_PATH=$HOME/c11tester-ra-rmw/ && export C11TESTER="-v3 -x1" && export CC=/home/vagrant/c11tester-benchmarks/clang CXX=/home/vagrant/c11tester-benchmarks/clang++
make clean && make
./test_rub_all.sh
```

## Benchmark for Phoenix

First you need to get all 5 required assets from the following [Github Repository](https://github.com/kozyraki/phoenix).

Then compile and run tests:
```bash
export LD_LIBRARY_PATH=$HOME/c11tester-ra-rmw/ && export C11TESTER="-v3 -x1" && export CC=/home/vagrant/c11tester-benchmarks/clang CXX=/home/vagrant/c11tester-benchmarks/clang++
cd phoenix-2.0
make
# Take histogram as an example
cd tests/histogram/
./histogram-pthread $PATH_TO_HISTOGRAM_DATA_FOLDER/small.bpm
```

## Benchmark for Memcached

First build memcached:
```
export LD_LIBRARY_PATH=$HOME/c11tester-ra-rmw/ && export C11TESTER="-v3 -x1" && export CC=/home/vagrant/c11tester-benchmarks/clang CXX=/home/vagrant/c11tester-benchmarks/clang++
./configure && make && make test && sudo make install
```

```bash
export LD_LIBRARY_PATH=$HOME/c11tester-ra-rmw/ && export C11TESTER="-v3 -x1" && export CC=/home/vagrant/c11tester-benchmarks/clang CXX=/home/vagrant/c11tester-benchmarks/clang++
./memcached -p 11212
```

```bash
# Run in another terminal instance
memtier
```
