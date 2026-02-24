# This shell script emits a C file. -*- C -*-
#   Copyright (C) 2010-2025 Free Software Foundation, Inc.
#
# This file is part of the GNU Binutils.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
# MA 02110-1301, USA.
#

if test -n "$FOLIOS_BASE_EM_FILE" ; then
  source_em "${srcdir}/emultempl/${FOLIOS_BASE_EM_FILE}.em"
fi

fragment <<EOF

static int
gld${EMULATION_NAME}_find_potential_libraries
  (char *name, lang_input_statement_type *entry)
{
  if (entry->flags.dynamic)
    {
      if (ldfile_open_file_search (name, entry, "lib", ".dl")) return 1;
      if (ldfile_open_file_search (name, entry, "", ".dl")) return 1;
    }

  if (ldfile_open_file_search (name, entry, "lib", ".sl")) return 1;
  if (ldfile_open_file_search (name, entry, "", ".sl")) return 1;

  return 0;
}

EOF

LDEMUL_FIND_POTENTIAL_LIBRARIES=gld"$EMULATION_NAME"_find_potential_libraries
