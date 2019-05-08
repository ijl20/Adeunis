#!/bin/bash
if [ $# -lt 1 ]; then
  echo Usage: data_to_js.sh INPUT_FILE \[OUTPUT_FILE\]
  echo will convert line-per-json-object file into json array in OUTPUT_FILE.json
  echo if OUTPUT_FILE is omitted, then output will be to INPUT_FILE with suffix replaced with \".json\"
  exit 2
fi
awk ' BEGIN { print "[" } END { print prev_line; print "]" }  {if (NR>1) { print prev_line,"," }} {prev_line=$0} ' $1 >${1%.*}.json
