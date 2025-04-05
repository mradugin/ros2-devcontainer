#
# Logging functions
#

info() {
	echo "$1"
}

debug() {
	[ -z "$QUIET" ] && echo "$1"
}

fatal() {
    echo "Error: $1" 1>&2
    exit 1
}
