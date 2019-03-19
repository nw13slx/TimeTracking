for file in $(ls *.md)
do
    prefix=$(echo $file|sed "s/\.md//g")
    if [[ ! -f $prefix.html  ]]; then
        pandoc --wrap=auto --mathjax --mathml -c pandoc.css -s --toc --toc-depth=2 $prefix.md -o $prefix.html
        echo "first time compile $prefix"
    fi
    if [[ $prefix.md -nt $prefix.html ]]; then
        echo "compile $prefix"
        pandoc --wrap=auto --mathml --mathjax -c pandoc.css -s --toc --toc-depth=2 $prefix.md -o $prefix.html
    fi
done
