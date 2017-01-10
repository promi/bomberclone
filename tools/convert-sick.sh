# CROP Files

SRES=128x128
ARES=128x256
SPOS=+0+0

rm -rf crop*
rm -rf bomb.bmp

for i in `ls *.bmp`; do
        echo "SCALE " $i
	cp $i crop-$i
	mogrify -filter Point -antialias -resize $SRES crop-$i
done;

echo "MONTAGE Sick";
montage -tile 1x2 -geometry $SRES crop-sick*.bmp -crop $ARES bmp:sick.bmp
