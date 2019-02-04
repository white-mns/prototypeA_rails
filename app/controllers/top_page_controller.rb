class TopPageController < ApplicationController
  def index
  end

  def make_battle_log
      begin
          @result = IO.popen("./battle_start") {|io|
            io.gets
          }
      rescue
          @result = "結果生成エラー"
      end
  end
end
