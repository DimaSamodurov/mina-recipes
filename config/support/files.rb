def remote_file(file_path, content: nil)
  body = content || yield
  raise ':content argument or block value is expected.' if body.nil?
  command %(echo #{Shellwords.escape body} | sudo tee #{file_path})
end
