#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

function share
	python -m SimpleHTTPServer 8080 $argv
end