# CROP Files
RES=182x292
POS=+229+89

# SCALE
SRES=80x128
SPOS=+0+0

ARES=80x2560
APOS=+0+0

FRES=320x2560
FPOS=+0+0

BACKGROUND="#FF00FF"

rm -rf crop*
rm -rf out*
rm -rf player.bmp

for i in `ls *.bmp`; do
        echo "CROP & SCALE " $i
	montage -crop $RES$POS $i -geometry $RES+0+0 bmp:crop-$i
	mogrify -filter Point -antialias -resize $SRES crop-$i
done;

echo "MONTAGE back";
montage -tile 1x20 -geometry $SRES crop-*back*.bmp -crop $ARES tiff:out03

echo "MONTAGE front";
montage -tile 1x20 -geometry $SRES crop-*front*.bmp -crop $ARES tiff:out04

echo "MONTAGE left";
montage -tile 1x20 -geometry $SRES crop-*left*.bmp -crop $ARES tiff:out01

echo "MONTAGE right";
montage -tile 1x20 -geometry $SRES crop-*right*.bmp -crop $ARES tiff:out02

echo "MONTAGE all"
montage -tile 4x1 -geometry $ARES$APOS out01 out02 out03 out04 bmp:player.bmp
