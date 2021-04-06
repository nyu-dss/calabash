# for issues with cover sheet as last page (vol3no2 through vol5no1)
# requires pdftk, https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

for pdf in ../data/vol5no1/pdf/*.pdf; do
  pdftk $pdf cat 1-r2 output ../data/sans-title-page/vol5no1/$(basename $pdf)
done