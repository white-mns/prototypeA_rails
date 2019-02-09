class TopPageController < ApplicationController
  def index
  end

  def make_battle_log
      @result = Array.new
      begin
          IO.popen("./battle_start") {|io|
              while line = io.gets
                  @result.push(line)
              end
          }
      rescue
          @result.push("結果生成エラー")
      end
  end
end
