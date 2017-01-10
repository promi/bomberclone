# CROP Files

SRES=64x64
ARES=64x320
SPOS=+0+0

echo "MONTAGE Stone";
montage -tile 1x5 -geometry $SRES stone0*.bmp -crop $ARES bmp:stone.bmp
