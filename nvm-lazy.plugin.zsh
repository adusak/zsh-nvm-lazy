# Lazy load nvm, with multiple entrypoints
# Add more entrypoints by defining the ZSH_LAZY_NVM_BINARIES array
function add_lazy() {
    LAZIES[$1] = $2
}
for binaries fun_name in ${(kv)LAZIES};
do
    for binary in $binaries
    $binary() {
        for FUNCTION in $binaries
        do
            unset -f $FUNCTION
        done
        $fun_name()
        $binary $@
    }
done
