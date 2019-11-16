# Lazy load nvm, with multiple entrypoints
# Add more entrypoints by defining the ZSH_LAZY_NVM_BINARIES array
add_lazy() {
    function_name=$1
    shift 1
    rest_of_args=("$@")
    for binary in "${rest_of_args}"
    do
        echo "defining ${binary}"
        $binary() {
            for FUNCTION in $rest_of_args
            do
                unset -f $FUNCTION
            done
            $function_name()
            $binary $@
        }
    done
}

