[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a1308c563620460c93501f69d64666fe)](https://www.codacy.com/manual/alekskuzmin/liquid-ruby-generator?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=alekskuzmin/liquid-ruby-generator&amp;utm_campaign=Badge_Grade)

# liquid-ruby-generator

## Template-based file generator for your code and beyond

Generate code modules (or any other files) with specified directory structure.

Templates should follow the [liquid](https://github.com/Shopify/liquid) syntax, although two custom filters were added to facilitate the typical program code generation: `camelcase` and `uncapitalize`. The `camelcase` acts on the argument consisting of words separated by hyphens (see below).

Template files should end with `.liquid` extension which is removed by the generator to get the resulting filename. File and directory names can be templated using the {{module_name}} syntax. Filenames are camel-cased by default assuming the words in the name are separated by hyphens. For example, `{{module_name}}-abstract-factory.kt.liquid` rendered with `my-module` as an argument will result in a generated file `MyModuleAbstractFactory.kt`. Templated directory names are not camel-cased but juxtaposed. For example, `{{module_name}}assets` rendered with `my-module` as an argument will result in a generated directory `mymoduleassets`

The output directory structure is exactly the same as the template directory structure.

## Usage

Invoke the script passing the template directory name as an argument:

``` bash
ruby ModuleGenerator.rb your-module-name
```

The generated directory with the module contents will appear near the template directory.
