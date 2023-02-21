#!/bin/bash
# Defaults
INDEX="\
<html>
	<head>
		<meta charset=\"utf-8\" />
		<link rel=\"stylesheet\" href=\"./css/style.css\">
		<title>%NAME%</title>
	</head>
	<body>
		<script src=\"./js/autorun.js\"></script>
	</body>
</html>"
STYLE="\
body {
	font-family: sans-serif;
}"
AUTORUN="\
console.log(\"Hello world!\");"
# Error checking
[ $# -eq 0 ] && echo "ERROR: No parameters! Exiting prematurely." && exit 1
# Look for templates
if [ -r ./template_index.html ]; then INDEX=$(<./template_index.html)
else echo "template_index.html not found. Resorting to default template."; fi
if [ -r ./template_style.css ]; then INDEX=$(<./template_style.css)
else echo "template_style.css not found. Resorting to default template."; fi
if [ -r ./template_autorun.js ]; then INDEX=$(<./template_autorun.js)
else echo "template_autorun.js not found. Resorting to default template."; fi
# Iterate over arguments
for arg in "$@"; do
	[ -d ./$arg ] && echo "\"$arg\" already exists. Skipping this one." && continue
	mkdir $arg $arg/js $arg/css $arg/img
	echo "${INDEX//%NAME%/$arg}" >> $arg/index.html
	echo "$STYLE" >> $arg/css/style.css
	echo "$AUTORUN" >> $arg/js/autorun.js
	echo "\"$arg\" has been created."
done
