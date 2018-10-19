 #!/bin/sh
XXILINX_DIR=/opt/Xilinx
XXILINX_VER=8.2

. $XXILINX_DIR/$XXILINX_VER/ISE/settings.sh
. $XXILINX_DIR/$XXILINX_VER/EDK/settings.sh
exec   $XXILINX_DIR/$XXILINX_VER/EDK/bin/lin/xps
