# docker-ruby

Using docker to provide multiple ruby runtimes. Designed for multi-runtime builds with common testing utilities pre-installed. Built to enable matrix-build like experience using CODESIGN2/docker-jenkins

[![Build Status](https://travis-ci.org/CODESIGN2/docker-ruby.svg?branch=master)](https://travis-ci.org/CODESIGN2/docker-ruby)

## Using

Probably best to build using your own derrived image. This was done as an experiment to deepen & evidence Jenkins CI expertise. 

It's used internally, but will maybe be revisited 1-2 times per-year.

No public real-world usage currently exists, but [open an issue](./issues) if you want to be the first. Reading through [php-ulid](https://github.com/Lewiscowles1986/php-ulid/blob/3358ae90d67474ddf9ce96753110459136b9eb76/Jenkinsfile) you should get an idea for the parts involved.

You don't need to run multiple runtimes in parallel, but it cuts down time testing, and can be used as a roadmapping tool.

## Notes / Troubleshooting

- Not all dependencies will be available for all platforms. 1.x is either EOL or expected to soon. EOL runtimes will be available on dockerhub, but removed from the travis.yml.
