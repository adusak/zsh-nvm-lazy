# Lazy load nvm, with multiple entrypoints
# Add more entrypoints by defining the ZSH_LAZY_NVM_BINARIES array
add_lazy() {
    function_name=$1
    shift 1
    binaries=("$@")
    for binary in $binaries
    do
        $binary() {
            for FUNCTION in $binaries
            do
                unset -f $FUNCTION
            done
            $function_name
            $0 $@
        }
    done
}

