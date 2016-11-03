config = require './config';

buf = new Buffer(Math.random().toString(36).substr(2))

module.exports = (robot) ->
  robot.respond /.*/i, (res) ->
    session_id = buf.toString();
    if res.match.input != robot.name+" ai clear"
      res.http("http://www.yige.ai/v1/query?token=#{config.token}&query=#{res.match.input}&session_id=#{session_id}").get() (err, msg, body) ->
        post = JSON.parse(body)
        res.send post.answer

  robot.respond /ai clear/i,(res) ->
    new_session =Math.random().toString(36).substr(2)
    buf = new Buffer(new_session)