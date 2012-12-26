{ PublishFiles } = require "../src/publish_files"

describe "PublishFiles", ->
   mock_web = {}
   test_object = new PublishFiles(mock_web)

   describe "#execute", ->
      it "should make call to webserver", ->
         mock_web.post = sinon.spy() 

         args = ["local_file.txt", "remote_file.txt"]
         test_object.execute args

         assert mock_web.post.calledWith expected_url, json_data
