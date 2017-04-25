require 'liquid'
require 'pathname'
require 'fileutils'

moduleName = ARGV[0]
templatesFolder = "./ModuleTemplate"

print "You're about to generate a new module called " + moduleName + ". Searching the templates in " + templatesFolder + "...\n"

Dir[templatesFolder + '/**/*.liquid'].each do |fname|
    @template = Liquid::Template.parse(File.open(fname, "r").read)
    print "***********************************************************\n"
    print "Found " + fname + "\n"
    renderedTemplate = @template.render('module_name' => moduleName)
    print "Rendered template for " + fname + " is:\n"
    print "***********************************************************\n"
    print renderedTemplate
    print "***********************************************************\n"
    extn = File.extname(fname)
    file_name = File.basename(fname, extn)
    path = Pathname.new(File.dirname(fname))
    root  = Pathname.new(templatesFolder)
    relativePath = path.relative_path_from(root)
    dir_name = moduleName.downcase + "/" + relativePath.to_s + "/"
    response = FileUtils.mkdir_p(dir_name)
    generatedFileName = "./" + dir_name + moduleName + file_name
    print "Writing it to " + generatedFileName + "...\n"
    File.open(generatedFileName, "w") {|f| f.write(renderedTemplate) }
end

print "***********************************************************\n"
print "Your new module is ready.\n"
