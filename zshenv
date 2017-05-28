export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH:/Library/TeX/texbin:$HOME/bin:$HOME/bin/node_modules/.bin:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/opt/opencv3/bin"

# Android SDK
export ANDROID_HOME=$HOME/android-sdk-macosx

# pkg-config 的设置，一部分安装程序不会添加到pkg-config中，需要手动添加路径
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/sqlite/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/opencv3/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig


#快速进入工作目录
export WORKSPACE=$HOME/Documents/workspace

# pyenv settings
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


