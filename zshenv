export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH:/Library/TeX/texbin:$HOME/bin"

# Android SDK
export ANDROID_HOME=$HOME/android-sdk-macosx
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# pkg-config 的设置，一部分安装程序不会添加到pkg-config中，需要手动添加路径
export PKG_CONFIG_PATH=""
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/opencv3/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/sqlite/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig:/usr/lib/pkgconfig

# 默认没有UTF-8
export LANG=zh_CN.UTF-8

#快速进入工作目录
export WORKSPACE=$HOME/Documents/workspace

# virtualenv
## 限制pip的安装方式，只安装到虚拟环境中
export PIP_REQUIRE_VIRTUALENV=true
## virtualenvwrapper
export WORKON_HOME=$HOME/opt/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# Homebrew github token
export HOMEBREW_GITHUB_API_TOKEN="396f7eb06b98bb0fc480ba364a4255a55a0ea975"

# 在iPython中使用Matlab
# export MATLAB_EXECUTABLE=/Applications/MATLAB_R2017b.app/bin/matlab
