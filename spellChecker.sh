!#bin/sh
apt install -y aspell-it;
echo $(pwd)
cd /github/workspace
cd $INPUT_DIRECTORY
ls *.pdf > pdfList.txt
while IFS= read -r document || [ -n "$document" ]
do
    pdftotext $document
    (aspell list < "${document%.*}".txt) > "${document%.*}"-Errors.txt
done < "pdfList.txt"
rm pdfList.txt