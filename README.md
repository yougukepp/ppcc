微度(Radio) P2020交叉编译工具
====

Usage:

1. 下载需要的tar.xz包
2. git clone https://github.com/wenduxxx/pppc.git
3. cd ppcc
4. ./getVer.sh 根据获取的版本修改doc/ppcc.tex文档中软件版本
5. ./getVer.sh 根据获取的版本修改sh/0.setenv4ppc.sh中相应环境变量
6. ./buildPPCC.sh

TODO:

1. 编译目标glibc(step 4)时加上e500v2的性能优化
2. 优化工具链软件版本升级后的自动处理
3. strip生成的二进制文件(x86版、ppc版)

BUG: 暂无

