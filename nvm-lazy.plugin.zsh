# Lazy load nvm, with multiple entrypoints
# Add more entrypoints by defining the ZSH_LAZY_NVM_BINARIES array
function add_lazy() {
    for binary in $1;
    do
        $binary() {
            for FUNCTION in $1
            do
                unset -f $FUNCTION
            done
            $2()
            $binary $@
        }
    done
}

