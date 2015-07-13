#!/bin/bash
createdb indexed_text
psql indexed_text < schema.sql
while read line; do echo "INSERT INTO indexed_text VALUES $line"; done < "$1"