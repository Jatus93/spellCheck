!#bin/sh
cd /github/workspace
cd $INPUT_DIRECTORY
mkdir spellCheck
ls *.pdf > spellCheck/pdfList.txt
IFS=';' read -ra languages <<< "$INPUT_languages"
while IFS= read -r document || [ -n "$document" ]
do
    pdftotext $document
    lastLang=""
    for language in "${languages[@]}"
    do  
        toCheck=${document%.*}
        if [ -n "$lastLang" ]; then
            toCheck=${document%.*}-$lastLang
            echo $toCheck
        fi
        aspell --master="$language" list < "$toCheck".txt > "${document%.*}-$language".txt
        lastLang=$language 
    done
    cp ${document%.*}-$lastLang.txt spellCheck/${document%.*}-errors.txt
    rm *.txt
done < "spellCheck/pdfList.txt"