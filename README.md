## Benchmark for cdscheckers

```bash
cd ~/c11-ra-rmw-benchmark/cdschecker_modified_benchmarks/
export LD_LIBRARY_PATH=$HOME/c11tester-ra-rmw/ && export C11TESTER="-v3 -x1" && export CC=/home/vagrant/c11tester-benchmarks/clang CXX=/home/vagrant/c11tester-benchmarks/clang++
make clean && make
./test_rub_all.sh
```
