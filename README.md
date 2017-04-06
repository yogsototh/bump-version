# Semantic Versionning Bump

Increment your version using this command line tool.

It depends only `zsh` so should be really portable.

## Install

simply put the `bump.sh` script in directory present in your PATH
and make it executable `chmod ugo+x bump.sh`.

## Examples

~~~
$ bump.sh 0.14.2 major
1.0.0
$ bump.sh 0.14.2 minor
0.15.0
$ bump.sh 0.14.2 patch
0.14.3
$ bump.sh 0.14.2 qualifier rc1
0.14.2-rc1
~~~
