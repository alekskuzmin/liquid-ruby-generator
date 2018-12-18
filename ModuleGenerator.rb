require 'liquid'
require 'pathname'
require 'fileutils'

moduleName = ARGV[0]
templatesFolder = "./ModuleTemplate"

print "You're about to generate a new module called '" + moduleName + "'. Searching the templates in " + templatesFolder + "...\n"

module TextFilter
    def camelcase(input) 
        input.split('-').map(&:capitalize).join
    end
    def uncapitalize(input)
        input[0, 1].downcase + input[1..-1]
    end
end

Liquid::Template.register_filter(TextFilter)

templates = templatesFolder + '/**/*.liquid'
if File.directory?(templatesFolder)    
    Dir[templates].each do |fname|
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
        relativePath = path.relative_path_from(root).to_s
        @relativePathTemplate = Liquid::Template.parse(relativePath)
        renderedRelativePath = @relativePathTemplate.render('module_name' => moduleName)
        renderedRelativePath = renderedRelativePath.split('-').join
        dir_name = moduleName.downcase + "/" + renderedRelativePath + "/"
        response = FileUtils.mkdir_p(dir_name)
        @filenameTemplate = Liquid::Template.parse(file_name)
        renderedFileName = @filenameTemplate.render('module_name' => moduleName)
        #TODO introduce parameters to handle the individual file types differently
        if file_name.end_with? "xml"
            renderedFileName = renderedFileName.split('-').join('_')
        else
            renderedFileName = renderedFileName.split('-').map(&:capitalize).join
        end
        generatedFileName = "./" + dir_name + renderedFileName        
        print "Writing it to " + generatedFileName + "...\n"
        File.open(generatedFileName, "w") {|f| f.write(renderedTemplate) }
    end
    print "***********************************************************\n"
    print "Your new module is ready.\n"
else
    print "Templates not found!\n"
end