require_relative 'test_base'
require_relative 'one_line_worker'
require_relative 'merging_worker'
require_relative 'progress_worker'
#require_relative 'prawn_worker'

class QuickRun < TestBase

  def test_worker
    worker = ProgressWorker.new
    worker.s3_key = "YOOOOO"
    #worker = OneLineWorker.new
#    worker = MergingWorker.new
    #worker = PrawnWorker.new
    worker.queue

    status = worker.wait_until_complete
    p status
    p status["error_class"]
    p status["msg"]
    puts "\n\n\nLOG START:"
    log = worker.get_log
    puts log
    puts "LOG END\n\n\n"
    assert status["status"] == "complete", "Status was not complete, it was #{status["status"]}"
    assert log.include?(worker.s3_key)
  end

end

