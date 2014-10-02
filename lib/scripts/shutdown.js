// Description
//   A Hubot script that shutdown gracefully
//
// Configuration:
//   None
//
// Commands:
//   hubot shutdown - graceful shutdown
//
// Author:
//   bouzuya <m@bouzuya.net>
//
module.exports = function(robot) {
  return robot.respond(/shutdown$/i, function(res) {
    res.send('See you!');
    return res.robot.shutdown();
  });
};
