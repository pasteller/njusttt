# NJUST-Thesis-Template
A LaTeX thesis template for Nanjing University of Sci. & Tech. 
南京理工大学学位论文Latex模板（硕博）

由于现有的Latex模板年久失修，且不适配Overleaf等在线写作平台。本模板的希望能做到为广大校友提供一个新的写作方式的选择。
由于作者能力有限，欢迎P/R。本模板会一直保持维护状态。

## 已测试编译环境：
1. Overleaf + XeLaTeX ✅
2. Windows + TeX live 2023 + XeLaTeX ✅

## 注意事项：
1. 本模板对Overleaf极为友好，编译时需要将compiler设置为XeLaTeX。
2. 如果出现`Package fontspec Warning: Font "FandolSong-Regular" does not contain requested Script "CJK"`的类似警告，需要手动指定当前操作系统中的CTeX默认字库（如Linux或Overleaf）。例如，在`njustthesis.cls`中设置`fontset=ubuntu或windows`：
    ```
    \LoadClass[a4paper,zihao=-4,UTF8,fontset=ubuntu]{ctexbook}
    ```
    正常情况下，该警告不影响生成效果，可以直接忽略。

## 致谢
本模板修改自前人的成果，包括但不限于：
1. njustThesis：https://github.com/jiec827/njustThesis。