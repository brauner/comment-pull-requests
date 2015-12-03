# Comment Pull-Request (CPR)

This script is intended to allow collaborators on projects hosted on GitHub to
create comment pull-requests (CPR) by setting a state on commits on a project.

The state will contain the description

**"This PR is intended for discussion only."**

and the context will be set to

**"comment-pull-request/work-in-progress".**

The default state for CPRs should be `pending` to reflect the fact that not all
"checks" have succeeded i.e. the discussion has not died down.

This script makes use of the status feature of the GitHub API. The GitHub
status API allows external services to mark commits with a `success`,
`failure`, `error`, or `pending` state. The state that is set on a commit will
be reflected in pull-requests (PR) that the commit is involved in.

This what a CPR looks like:

![CPR example](https://raw.githubusercontent.com/brauner/cpr/master/img/cpr.png)

Ideally a CPR should contain `[wip]` in its commit message header to mark it as
"work in progress".

![wip example](https://raw.githubusercontent.com/brauner/cpr/master/img/wip.png)
