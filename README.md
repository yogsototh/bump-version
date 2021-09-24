> This project has two homes.
> It is ok to work in github, still, for a better decentralized web
> please consider contributing (issues, PR, etc...) throught:
>
> https://gitlab.esy.fun/yogsototh/bump-version

---


# Semantic Versioning Bump

Increment your version using this command line tool.

It follows the SemVer conventions. See <http://semver.org>.

It depends only `zsh` so should be really portable
but also quite slow if you need to bump thousands versions per seconds.

In the future I might create a fast binary executable.

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

That's it!
