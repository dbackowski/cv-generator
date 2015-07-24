require 'cv/generator/erb_data'
require 'yaml'
require 'erb'
require 'tempfile'

class Pdf
  def initialize(yaml_file)
    @yaml_file = yaml_file
    @css_files = []
  end

  def generate
    load_data
    generate_html
    generate_pdf
  ensure
    @html_file.close && @html_file.unlink if @html_file

    @css_files.each do |css_file|
      css_file.close
      css_file.unlink
    end if @css_files
  end

  private

  def load_data
    @erb_data = Cv::Generator::ErbData.new(YAML.load_file(@yaml_file))
  end

  def copy_css_templates
    Dir[File.join(File.dirname(__FILE__), '../../../templates/simple/css/*')].each do |css_file|
      tmp = Tempfile.new([File.basename(css_file, '.css'), '.css'])
      tmp.write(File.read(css_file))
      @css_files << tmp
    end

    @erb_data.css_paths = @css_files.map(&:path)
  end

  def generate_html
    copy_css_templates
    template = ERB.new(File.read(File.join(File.dirname(__FILE__),
                                           '../../../templates/simple/index.html.erb')), nil, '-')

    @html_file = Tempfile.new(['cv', '.html'])
    @html_file.write(template.result(@erb_data.get_binding))
    @html_file.flush
  end

  def generate_pdf
    system("wkhtmltopdf -q #{@html_file.path} cv.pdf")
  end
end
