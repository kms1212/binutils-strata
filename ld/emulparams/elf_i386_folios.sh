source_sh ${srcdir}/emulparams/elf_i386.sh

TEXT_START_ADDR=0x00400000
ELF_INTERPRETER_NAME=\"/System/Processes/Current/RuntimeLinker.app\"

FOLIOS_BASE_EM_FILE=$EXTRA_EM_FILE
EXTRA_EM_FILE=folios
