# hubot-shutdown

A Hubot script that shutdown gracefully

## Installation

    $ npm install git://github.com/bouzuya/hubot-shutdown.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-shutdown.git#TAG'

## Example

    bouzuya> hubot help shutdown
      hubot> hubot shutdown - graceful shutdown

    bouzuya> hubot shutdown
      hubot> See you!

## Configuration

See [`src/scripts/shutdown.coffee`](src/scripts/shutdown.coffee).

## Development

`npm run`

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/bouzuya/hubot-shutdown
[travis-badge]: https://travis-ci.org/bouzuya/hubot-shutdown.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-shutdown
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-shutdown.png
[coveralls]: https://coveralls.io/r/bouzuya/hubot-shutdown
[coveralls-badge]: https://img.shields.io/coveralls/bouzuya/hubot-shutdown.svg
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
