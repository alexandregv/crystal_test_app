require "spec"
require "../src/crystal_test_app"

SPEC        = true
STDIN_SPEC  = IO::Memory.new
STDOUT_SPEC = IO::Memory.new

# write in
def write_in(*objects)
  op = STDIN_SPEC.pos
  STDIN_SPEC.puts(*objects)
  STDIN_SPEC.pos = op
end

# read_in
def gets(chomp = true)
  str = STDIN_SPEC.gets(chomp)
  STDOUT.puts(str)
  return str
end

# write_out
def puts(*objects)
  STDOUT.puts(*objects)
  op = STDOUT_SPEC.pos
  STDOUT_SPEC.puts(*objects)
  STDOUT_SPEC.pos = op
end

# read_out
def read_out(chomp = true)
  STDOUT_SPEC.gets(chomp)
end
