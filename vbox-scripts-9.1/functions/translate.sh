#!/bin/bash -eu

#    Copyright 2015 Mirantis, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

# This file contains the functions for AT translated set 2 encoder

[ "$(basename ${0})" = "translate.sh" ] && exit 1

# XXX: hardcoded values are generated by:
#make_break_shift="$(eval echo \$at_table_$(echo -n Shift | xxd -ps))"
#make_shift="${make_break_shift% *}"
#break_shift="${make_break_shift#* }"

make_shift=36
break_shift=b6

map_set() {
  # $1 - keycode
  # $2 - normal value
  # $3 - shifted value
  [ "${2}${3}" = "nulnul" ] && return 1
  make=$(printf %02x "$1")
  break=$(printf %02x "$(($1 | 128))")
  eval "at_table_$(echo -n "${3#+}" | xxd -ps)='$make_shift $make $break $break_shift'"
  eval "at_table_$(echo -n "${2#+}" | xxd -ps)='$make $break'"
}

map_alias() {
  # $1,$3,$5,... - names
  # $2,$4,$6,... - aliases
  while [ -n "$1" -a -n "$2" ]; do
    eval "at_table_$(echo -n "${2#+}" | xxd -ps)=\${at_table_$(echo -n "${1#+}" | xxd -ps)}"
    shift
    shift
  done
}

# at_table_$normal = n
# at_table_$shifted = n
while read keycode n _ normal shifted rest; do
  [ "$keycode" = "keycode" ] || continue
  map_set "${n}" "${normal}" "${shifted}"
done < dumpkeys.cache

# Extra mapping
map_alias \
  one 1 exclam '!' \
  two 2 at '@' \
  three 3 numbersign '#' \
  four 4 dollar '$' \
  five 5 percent '%' \
  six 6 asciicircum '^' \
  seven 7 ampersand '&' \
  eight 8 asterisk '*' \
  nine 9 parenleft '(' \
  zero 0 parenright ')' \
  minus '-' underscore '_' \
  equal '=' plus '+'

map_alias \
  bracketleft '[' braceleft '{' \
  bracketright ']' braceright '}' \
  semicolon ';' colon ':' \
  apostrophe "'" quotedbl '"' \
  grave '`' asciitilde '~' \
  backslash "\\" bar '|' \
  comma ',' less '<' \
  period '.' greater '>' \
  slash '/' question '?' \
  space ' ' Return $'\n'

translate() {
  for t in $(echo -n "$*" | xxd -ps | sed -e 's/../& /g'); do
    n="at_table_$t"
    v="${!n}"
    [ -z "$v" ] && echo "$0: unknown char: '$t'." >&2
    echo -n " ${v}"
  done
  echo
}