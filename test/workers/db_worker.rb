# bump..........

require 'mysql2'

class DbWorker < IronWorker::Base
  merge_gem 'activerecord', :require=>'active_record'
  merge '../models/db_model'


  def run

    n = DbModel.new(:name=>"jane", :age=>21)
    n.save!

    to = DbModel.first
    puts 'found: ' + to.inspect
    @object = to

    n.delete
  end

  def ob
    @object
  end


end
