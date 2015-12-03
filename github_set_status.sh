#! /bin/sh

# github_set_status:
# Mark a commit/pull-request (PR) as a comment-pull-request (CPR).

# Authors:
# Christian Brauner <christian.brauner@mailbox.org>

# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

USAGE="Usage: `basename $0` [-h] {-n username} [-t access-token] {-r repository} [-s status] {-c commit-sha}"

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
		t)      
			TOKEN="$OPTARG"
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
"context": "comment-pull-request/work-in-progress"
}' https://api.github.com/repos/$REPO/statuses/$COMMIT
