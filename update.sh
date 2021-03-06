#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�g��Zupdate.sh �TMOA����Bv���`b"F���lggwG�;��ٶb0�S�2? QT�����t��Կ഻@�8x��<����>�4�ջw�,����A��D���Q]�U������C#�F�>���:[+���|����oq4a�����a��]_�7��X+�����ށ�LO�@:u47+~̉�)��F��g
E�	T_7���2�=�l�i��3;��WYN���+o�� �1�<Y	�}�@��p��65L��1nP�1'6]
tr�]EЁlā�zD��c*D�cC�#�>�1LR`�1�p�VZ�s��:5
���d�($G� ����8<�#z{����9�qD���/�w�M�% t?����#t#�%��X��p~�y�آ�tT��4�[��N���:��Qd�ϊ�͓/�r9�^�ڨ�w������L�1�pQ��9=��R=ZJ�ih]�e�H@!/u�u�)���bg��hi-ن��2��ƃP�/�mU��u�\T��e1#^$�֓�
��ơo9_#Ԗ�q�����_MɊ)M�G�'�u�����fh^�e%E����1-�Q�$�.����mB2���L:��T{��V�K�+�/i�V�����N�%f��*�ڳ LT�^0�<lY q'	�a_v�����hKI�����?�C�n��$^o�O{�Ĥ�⑞ٗ����`w2��G��r�!��Tl��S	��Yu�  