# Lazy load nvm, with multiple entrypoints
# Add more entrypoints by defining the ZSH_LAZY_NVM_BINARIES array
add_lazy() {
    function_name=$1
    shift 1
    binaries=("$@")
    for binary in $binaries
    do
        echo "defining ${binary}"
        $binary() {
            echo "Invoked prefunction for ${0}"
            for FUNCTION in $binaries
            do
                echo "Removing prefunction for ${FUNCTION}"
                unset -f $FUNCTION
            done
            echo "Invoking function ${function_name}"
            $function_name
            echo "Invoking binary ${0}"
            $0 $@
        }
    done
}

