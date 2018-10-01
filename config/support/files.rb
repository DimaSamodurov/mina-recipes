def remote_file(file_path, content: nil)
  body = content
  body ||= yield if block_given?
  template_path = default_template_path(file_path)
  body ||= erb(template_path) if template_path
  raise ":content argument, block value or default template is expected for #{file_path}." if body.nil?
  command %(echo #{Shellwords.escape body} | sudo tee #{file_path})
end

def default_template_path(remote_file_path)
  template_name = remote_file_path.tr('/', '_')
  mask = File.join(__dir__, '..', '**/templates/**/*')
  files = Dir[mask]
  template_path = files.detect { |path| File.basename(path) == template_name }
  File.realpath template_path if template_path
end
