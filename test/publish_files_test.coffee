{ PublishFiles } = require "../src/publish_files"

describe "PublishFiles", ->
   mock_web = {}
   test_object = new PublishFiles(mock_web)

   describe "#execute", ->
      it "should make call to webserver", ->
         mock_web.upload_file = sinon.spy() 

         args = ["local_file.txt"]
         test_object.execute args

         sinon.assert.calledWithMatch mock_web.upload_file, "/files", args[0], sinon.match.any
