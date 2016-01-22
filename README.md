## 我的emacs配置
这个配置是从purcell的配置fork过来，同时添加了我需要的一些配置。

目前我主要是添加了C/C++和python的配置环境。

### C/C++的配置
C/C++的配置主要用了gtags和semantic的组合来完成符号的查找和跳转。
gtags的优点是速度快，缺点是不能精确定位。semantic能够精确定位，
缺点是速度慢。所以我的方法是当semantic无法解析的时候（因为一开始
没有解析整个项目），就让gtags查找定义，等gtags定位到新的文件，
semantic也开始对那个文件进行解析。这样以后semantic就可以解析新浏览
的文件的符号了。看起来有点麻烦，但实际上效果让我很满意。特别是semantic
有时遇到一些符号没法正确解析，gtags却靠猜的方法找到了定义，两者配合
真是不错。

另外如果项目是CMake构建的，那么还有其他像irony这样的插件可以完成精确
解析。

### python的配置
elpy。没什么多说的。
