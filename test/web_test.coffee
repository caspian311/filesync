{ Web } = require "../src/web"

describe "Web", ->
   mock_file_upload_util = {}
   test_object = new Web("www.google.com", 80, mock_file_upload_util)

   describe "#get", ->
      it "should fetch the data from a website", (done) ->
         test_object.get "/", (data) ->
            assert !!~ data.indexOf "<html"
            assert !!~ data.indexOf "</html>"
            assert !!~ data.indexOf "Google"
            done()

   describe "#upload_file", ->
      it "should call file upload util", ->
         mock_file_upload_util.upload_file = sinon.spy()
         path_to_file = "path_to_file"
         web_path = "path_to_file"

         test_object.upload_file web_path, path_to_file, () ->

         sinon.assert.calledWithMatch mock_file_upload_util.upload_file, sinon.match.any 
