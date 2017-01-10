# CROP Files

RES=214x295
POS=+211+65

SRES=93x128
SPOS=+0+0

# 1x20
# ARES=93x2560
# APOS=+0+0
#

# 1x50
# ARES=93x6400
# APOS=+0+0
#

# 1x60
ARES=93x7680
APOS=+0+0
#

# 1x70
# ARES=93x8960
# APOS=+0+0
#

rm -rf crop*
rm -rf out*

for i in `ls *.bmp`; do
        echo "CROP & SCALE " $i
	montage -crop $RES$POS $i -geometry $RES+0+0 bmp:crop-$i
	mogrify -filter Point -antialias -resize $SRES crop-$i
done;

echo "MONTAGE SingeAnim";
montage -tile 1x70 -geometry $SRES crop-*.bmp -crop $ARES bmp:out.bmp
