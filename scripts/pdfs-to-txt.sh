for volume in ../src/vol*; do
  volume_name=$(basename $volume)
  for pdf in $volume/*.pdf; do
    doc_name=$(basename $pdf .pdf)
    pdf_dir="./data/${volume_name}/pdf"
    png_dir="./data/${volume_name}/png/${doc_name}"
    ocr_dir="./data/${volume_name}/ocr/${doc_name}"

    echo "converting $doc_name"
    mkdir -p $pdf_dir $png_dir $ocr_dir

    # copy pdf
    cp $pdf "./data/${volume_name}/pdf/${doc_name}.pdf"

    # convert to png
    gs -q -dNOPAUSE -dBATCH -sDEVICE=pnggray -g2550x3300 -dUseCropBox -dPDFFitPage -sOutputFile=$png_dir/%03d.png $pdf

    # export ocr
    for png in $png_dir/*.png; do
      ocr=$ocr_dir/$(basename $png .png)
      tesseract $png $ocr
    done
  done
done
