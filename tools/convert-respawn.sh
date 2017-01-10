# CROP Files

SRES=128x128
ARES=128x1280
SPOS=+0+0

rm -rf crop*
rm -rf respawn.png

for i in `ls *.png`; do
        echo "SCALE " $i
	cp $i crop-$i
	mogrify -filter Point -antialias -resize $SRES crop-$i
done;

echo "MONTAGE Sick";
montage -tile 1x20 -background transparent -geometry $SRES crop-*.png -crop $ARES respawn.png
