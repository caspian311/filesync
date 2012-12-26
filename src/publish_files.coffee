{ FileUploadRequest } = require "./file_upload_request"
http = require "http"

class PublishFiles
   constructor: (@file_upload_request=new FileUploadRequest()) ->

   execute: (args) ->
      options = {
         host: "localhost",
         port: 3000,
         method: "POST",
         path: "/files"
      }
      request = http.request options, (response) ->
         str = ""
         response.on "data", (chunk) ->
            str += chunk
         response.on "end", ->
            console.log str

      @file_upload_request.create_upload request, "/tmp/foo.txt"

   
root = exports ? window
root.PublishFiles = PublishFiles
