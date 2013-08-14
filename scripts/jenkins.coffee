
module.exports = (robot) ->
  robot.respond /(.*) status$/i, (msg) ->
    msg.http("http://v2.webme.ws:8080/job/#{msg.match[1]}/lastBuild/api/json")
      .get() (err, res, body) ->
        data = JSON.parse(body)
        msg.send data.result
