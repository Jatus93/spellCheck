# spellCheck
GitHub Action for spell checking for pdf files
# Aspected inputs
`directory:<where the pdf files are stored>` 
`languages:"en_GB;en_US;..."`

# Output
In the chosen directory will be a filename-error.txt for each of the pdf checked

# Example
```yaml
name: spellCheck

on:
  push:
    branches:
      - 'master'
jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository contents
      uses: actions/checkout@v1

    - name: spellCheck
      uses: Jatus93/spellCheck@master
      with:
        directory: <where the pdf files are stored>
        languages: "en_GB;en_US;..."
    
    - name: upload artifact
      uses: actions/upload-artifact@v1
      with:
        name: Documents.tar.gz
        path: <where the pdf files are stored>
```
## DISCLAIMER
This software is based on [aspell](aspell.net)
