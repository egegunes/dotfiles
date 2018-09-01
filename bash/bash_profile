for file in ~/.{bashrc,aliases,functions,exports}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done

unset file
