VERSION=v23.01.00

mkdir /build
cd /build
git clone https://github.com/nv-legate/legate.core.git -b ${VERSION} --depth 1
(cd legate.core && python3 setup.py install -- -DLegion_USE_CUDA:BOOL=ON)

git clone https://github.com/nv-legate/cunumeric.git -b ${VERSION} --depth 1
(cd cunumeric && python3 install.py)

rustc
numactl
intel-mkl
ninja-build
pip3 install scikit-build
