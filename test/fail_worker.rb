# bump......
class FailWorker < SimpleWorker::Base

  def run
    puts "I am about to fail..."
    raise "Dang, I failed. Fail whale."
  end
end
