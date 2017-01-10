# CROP Files

RES=415x415
POS=+150+45

SRES=64x64
SPOS=+0+0

ARES=64x640
APOS=+0+0

rm -rf crop*
rm -rf bomb.bmp

for i in `ls *.bmp`; do
        echo "CROP & SCALE " $i
	montage -crop $RES$POS $i -geometry $RES+0+0 bmp:crop-$i
	mogrify -filter Point -antialias -resize $SRES crop-$i
done;

echo "MONTAGE Bomb";
montage -tile 1x20 -geometry $SRES crop-bomb*.bmp -crop $ARES bmp:bomb.bmp
