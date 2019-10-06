require "minitest/autorun"

class TestCommandBuilds < Minitest::Test
  def setup
  end

  def test_setup_rvm_ruby
    verify_dry_run 'ubuntu:setup:rvm_ruby'
  end

  def verify_dry_run(mina_command)
    result = `mina -s #{mina_command}`
    assert_match  /Elapsed time/, result
  end
end