module.exports = (grunt) ->
	globalConfig =
		src: "dev"
		dest: "fancy"

	grunt.initConfig
		includes:
			files:
				src: ["dev/*.html"] # Source files
				dest: "fancy" # Destination directory
				flatten: true
				cwd: "."
				options:
					silent: false
					filenamePrefix: "includes/"
					filenameSuffix: ".html"

		clean:
			files: ["fancy/*.html", "fancy/*.js", "fancy/img/"]

		copy:
			main:
				files: [
					expand: true
					cwd: "dev/img/"
					src: ["**"]
					dest: "fancy/img"
				,
					expand: true
					cwd: "dev/js"
					src: ["**"]
					dest: "fancy/js"
				,
					expand: true
					cwd: "dev/img/svg/"
					src: "*"
					dest: "fancy/img/svg/"
					filter: "isFile"
				]
		watch:
			files: ["dev/*.html", "dev/js/*.js", "dev/includes/*.html", "dev/img/icons*.png"]
			tasks: ["clean", "includes", "copy"]

	require("matchdep").filterDev("grunt-*").forEach grunt.loadNpmTasks
	grunt.registerTask "default", ["watch"]
	grunt.registerTask "a", ["clean", "includes", "copy"]