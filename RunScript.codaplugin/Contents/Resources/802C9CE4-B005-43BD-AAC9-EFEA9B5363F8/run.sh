#! /bin/bash
if [[ "${CODA_FILEPATH}" == *.py ]]; then
	MODE="/usr/bin/env python"
fi

if [[ "${CODA_FILEPATH}" == *.rb ]]; then
	MODE="/usr/bin/env ruby"
fi

if [[ "${CODA_FILEPATH}" == *.pl ]]; then
	MODE="/usr/bin/env perl"
fi

if [[ "${CODA_FILEPATH}" == *.php ]]; then
	MODE="/usr/bin/env php"
fi

if [[ "${CODA_FILEPATH}" == *.sh || "${CODA_FILEPATH}" == *.bash ]]; then
	MODE="/usr/bin/env bash"
fi

echo "<html><head><style type=\"text/css\">body { font-family: \"Helvetica Neue\", Helvetica; font-size: 24px; background-color: #415d75; color: #d0e6ef; margin: 60px; }</style><title>Run Script</title></head><body>"

if [ -n "$MODE" ]; then
	# extra redirection and piping to force coda to display stderr
	$MODE "$CODA_FILEPATH" 2>&1 | sed 's:.*:&<br>:' | tee /dev/null
else
	echo "Unknown filetype or file has not been saved. File extension must be .bash, .php, .pl, .py, .rb or .sh."
fi

echo "</body></html>"