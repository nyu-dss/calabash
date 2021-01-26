for volume in ../data/vol*; do
  volume_name=$(basename $volume)
  for pdf in $volume/pdf/*; do
    echo "performing in place ocr on $pdf"
    ocrmypdf -l eng+fra+spa $pdf $pdf
  done
done
