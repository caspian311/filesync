http = require "http"

class Web
   _url = "localhost"
   _port = "3000"

   constructor: (url, port, @file_upload_util) ->
      if url
         _url = url
      if port
         _port = port

   get: (web_path, callback) ->
      req = _make_request web_path, callback
      req.end()

   upload_file: (web_path, path_to_file, callback) ->
      req = _make_request web_path, callback
      @file_upload_util.upload_file req, path_to_file

   _make_request = (path, callback) ->
      options =
         host: _url
         port: _port
         path: path

      req = http.request options, (response) ->
         str = ""
         response.on 'data', (chunk) ->
            str += chunk

         response.on 'end', () ->
            callback str
      return req

root = exports ? window
root.Web = Web

