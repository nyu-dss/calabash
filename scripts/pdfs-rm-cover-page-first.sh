# for issues with cover sheet as first page (vol2no2 through vol3no1)
# required pdftk, https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

for pdf in ../data/vol2no2/pdf/*.pdf; do
  pdftk $pdf cat 2-end output ../data/sans-title-page/vol2no2/$(basename $pdf)
done