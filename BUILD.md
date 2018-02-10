# htmlify.p overview

For syntax highlighting, needs node.js installed.
Please run make init-highlights to automatically pull in the highlighting
grammar and build the highlighter.

For doc.perl6.org, the build process goes like this:
a cron job on hack.p6c.org as user 'doc.perl6.org' triggers the rebuild.

    */5 * * * * flock -n ~/update.lock -c ./doc/util/update-and-sync > update.log 2>&1

`util/update-and-sync` is under version control in the perl6/doc repo (same as
this file), and it first updates the git repository. If something changed, it
runs htmlify, captures the output, and on success, syncs both the generated
files and the logs. In case of failure, only the logs are synchronized.

The build logs are available at https://docs.perl6.org/build-log/
