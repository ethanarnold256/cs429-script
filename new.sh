#!/bin/bash
# Files
INDEX="\
<html>
	<head>
		<link rel=\"stylesheet\" href=\"css/style.css\">
		<title>New Project</title>
	</head>
	<body>
		<h1>Hello world!</h1>
		<script src=\"js/script.js\"></script>
	</body>
</html>"
STYLE="\
body {
	margin: 0;
}"
SCRIPT="\
console.log(\"Hello world!\")"
PROJECT_NAME="my_proj"
# Create
if [ $# -eq 0 ]; then
	echo "No parameters. Defaulting to \"$PROJECT_NAME\""
else
	PROJECT_NAME="$@"
fi
# Creation
mkdir $PROJECT_NAME $PROJECT_NAME/img $PROJECT_NAME/js $PROJECT_NAME/css
touch $PROJECT_NAME/index.html $PROJECT_NAME/css/style.css $PROJECT_NAME/js/script.js
echo "$INDEX" >> $PROJECT_NAME/index.html
echo "$STYLE" >> $PROJECT_NAME/css/style.css
echo "$SCRIPT" >> $PROJECT_NAME/js/script.js
echo "\"$PROJECT_NAME\" has been created."
# Automation
code $PROJECT_NAME
firefox $PROJECT_NAME/index.html
