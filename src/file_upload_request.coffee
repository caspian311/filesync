fs = require "fs"

class FileUploadRequest
   create_upload: (request, path_to_file) ->
      boundary_key = Math.random().toString(16)
      boundary_key = "WebKitFormBoundaryw6K6UjkDGICIy2sm"

      full_path = fs.realpathSync(path_to_file)
      filename = _extract_filename full_path
      content_prefix = """------#{boundary_key}\r\nContent-Disposition: form-data; name="uploaded_file"; filename="#{filename}"\r\nContent-Type: text/plain\r\n\r\n"""
      content_suffix = "\r\n------#{boundary_key}--\r\n"

      content = fs.readFileSync path_to_file
      file_content_size = content.length

      request.setHeader "Content-Type","multipart/form-data; boundary=----#{boundary_key}"

      request.write content_prefix
      request.write content
      request.write content_suffix
      request.end

#      fs.createReadStream(full_path, { bufferSize: 4*1024 })
#         .on('end', ->
#               request.end content_suffix
#               console.log "*********************"
#               console.log request
#               console.log "*********************"
#               )
#            .pipe(request, { end: false }) 


   _extract_filename = (full_path) ->
      full_path.substring(full_path.lastIndexOf("/") + 1)

root = exports ? window
root.FileUploadRequest = FileUploadRequest
