http = require "http"

class Web
   get: (url, callback) ->
      req = _make_request url, callback
      req.end()

   post: (url, data, callback) ->
      req = _make_request url, callback
      req.write data
      req.end()

   _make_request = (url, callback) ->
      options =
         host: url
         path: "/"

      req = http.request options, (response) ->
         str = ""
         response.on 'data', (chunk) ->
            str += chunk

         response.on 'end', () ->
            callback str
      return req

root = exports ? window
root.Web = Web

