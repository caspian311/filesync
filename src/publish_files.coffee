{ FileUploadRequest } = require "./file_upload_util"
http = require "http"

class PublishFiles
   constructor: (@web=new Web()) ->

   execute: (args) ->
      @web.upload_file "/files", args[0], (response) ->
         str = ""
         response.on "data", (chunk) ->
            str += chunk
         response.on "end", ->
            console.log str

root = exports ? window
root.PublishFiles = PublishFiles
