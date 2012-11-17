# Cakefile

{exec} = require "child_process"

task "compile", "compile coffee script", ->
   exec "./node_modules/.bin/coffee 
      --compile --output lib/ src/
   ", (err, output) ->
      console.log output
      throw err if err

task "test", "run tests", ->
   invoke "compile"
   exec "NODE_ENV=test 
      ./node_modules/.bin/mocha 
      --compilers coffee:coffee-script 
      --reporter spec
      --require coffee-script 
      --require test/test_helper.coffee 
      --colors
   ", (err, output) ->
      console.log output
      throw err if err
