class TopPageController < ApplicationController
  def index
  end

  def make_battle_log
      begin
          @result = Array.new
          IO.popen("./battle_start") {|io|
              while line = io.gets
                  @result.push(line)
              end
          }
      rescue
          @result = "結果生成エラー"
      end
  end
end
