function check_os() {
   # Credit to <https://gist.github.com/gmolveau/d0e3efc219c5bcc6ecc13a1405ac6c73>
    echo "Checking Operating System..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        DISTRIB=$(awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2>/dev/null)
        if [[ ${DISTRIB} = "ubuntu"* ]]; then
            if uname -a | grep -q '^linux.*microsoft'; then
                echo "Ubuntu via WSL"
            else
                echo "Ubuntu"
            fi
        elif [[ ${DISTRIB} = "debian"* ]]; then
            echo "Debian"
        elif [[ ${DISTRIB} = "arch"* ]]; then
            echo "Arch"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macOS OSX"
    else
        echo "Error, unsupported operating system"
    fi
    echo ""
}