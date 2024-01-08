# njusttt
A LaTeX thesis template for Nanjing University of Science &amp; Technology.
南京理工大学学位论文模板（硕博）

已通过的编译环境：
1. Overleaf + XeLaTeX
2. Windows + TeX live 2023 + XeLaTeX

注意事项：
1. 如果出现“Fandol字库中不存在宋体”的类似警告，需要手动指定当前操作系统中的CTeX默认字库（如Linux或Overleaf）。
例如，在`njustthesis.cls`中设置`fontset=ubuntu或windows`：
```
\LoadClass[a4paper,zihao=-4,UTF8,fontset=ubuntu]{ctexbook}
```
但该警告不影响生成效果，可以忽略。