#!/bin/bash

createdb indexed_text
psql indexed_text < schema.sql
exec ruby server.rb $1