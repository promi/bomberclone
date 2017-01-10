# CROP Files

SRES=64x640
ARES=320x640
SPOS=+0+0

rm -rf crop*
rm -rf bomb.bmp

echo "MONTAGE Fire";
montage -tile 5x1 -geometry $SRES fire_single.bmp -geometry $SRES fire_single.bmp -geometry $SRES fire_single.bmp -geometry $SRES fire_single.bmp -geometry $SRES fire_single.bmp -crop $ARES bmp:fireout.bmp
