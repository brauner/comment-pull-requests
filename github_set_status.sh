#! /bin/sh

USAGE="Usage: `basename $0` [-h] {-n username} [-t access-token] {-r repository} {-s status} {-c commit-sha}"

USERNAME=
TOKEN=
REPO=
STATUS="pending"
COMMIT=

while getopts hn:t:r:s:c OPT; do
        case "$OPT" in
                h)
                        echo $USAGE
                        exit 0
                        ;;
                n)
                        USERNAME="$OPTARG"
                        ;;
                t)      TOKEN="$OPTARG"
                        ;;
                r)
                        REPO="$OPTARG"
                        ;;
                r)
                        STATUS="$OPTARG"
                        ;;
                c)
                        COMMIT="$OPTARG"
                        ;;
        esac
done

if [ $# -lt 4 ]; then
        echo $USAGE >&2
        exit 1
fi

curl --user "$USERNAME:$TOKEN" \
        --request POST \
        --header "Content-Type: application/json" \
        --data '{
"state": "'"$STATUS"'",
"target_url": "",
"description": "This PR is intended for discussion only.",
"context": "pull-request/work-in-progress"
}' https://api.github.com/repos/$REPO/statuses/$COMMIT
