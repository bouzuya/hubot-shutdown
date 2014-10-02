# Description
#   A Hubot script that shutdown gracefully
#
# Configuration:
#   None
#
# Commands:
#   hubot shutdown - graceful shutdown
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.respond /shutdown$/i, (res) ->
    res.send 'See you!'
    res.robot.shutdown()
