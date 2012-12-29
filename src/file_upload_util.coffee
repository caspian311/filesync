fs = require "fs"

class FileUploadUtil
   upload_file: (request, path_to_file) ->
      boundary_key = Math.random().toString(16)

      filename = _extract_filename path_to_file
      content_prefix = """------#{boundary_key}\r\nContent-Disposition: form-data; name="uploaded_file"; filename="#{filename}"\r\nContent-Type: text/plain\r\n\r\n"""
      content_suffix = "\r\n------#{boundary_key}--\r\n"

      request.setHeader "Content-Type","multipart/form-data; boundary=----#{boundary_key}"

      request.write content_prefix

      fs.createReadStream(path_to_file, { bufferSize: 4*1024 })
         .on('end', ->
               request.end content_suffix
               )
            .pipe(request, { end: false }) 

   _extract_filename = (path_to_file) ->
      full_path = fs.realpathSync(path_to_file)
      full_path.substring(full_path.lastIndexOf("/") + 1)

root = exports ? window
root.FileUploadUtil = FileUploadUtil
