if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    OS=SuSe
    VER=Unknown
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    OS=Redhat
    VER=Unknown
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo ${machine} ${OS} ${VER}
if type "zsh" &>/dev/null; then
    if [ 'Linux' = $machine ]; then
        if type "apt-get" &> /dev/null; then
            echo "sudo apt-get install zsh -Y"
            sudo apt-get install zsh -Y
        elif type "yum" &>/ dev/null; then
            echo "sudo yum install zsh -Y"
            sudo yum install zsh -Y
        else
            echo "Not supported this distribution!"
            exit 1
        fi

    elif [ 'Mac' = $machine ]; then
        if type "brew" &> /dev/null; then
            echo "/bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
            /bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)
        fi
        echo "brew install zsh"
        brew install zsh
    else
        echo 'Not supported this distribution!'
        exit 1
    fi
fi
