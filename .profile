cat $LPATHS

if [ -f ~/.bash_aliases ]; then
    echo "adding bash_aliases...."
    . ~/.bash_aliases
fi

if [ -f ~/.bash_exports ]; then
    echo "adding bash_exports...."
    . ~/.bash_exports
fi

if [ -f ~/.bash_wrappers ]; then
    echo "adding bash_wrappers...."
    . ~/.bash_wrappers
fi
