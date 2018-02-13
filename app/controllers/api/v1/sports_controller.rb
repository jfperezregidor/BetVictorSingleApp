module Api
  module V1
    class SportsController < ApplicationController
        
        def index
        
            #~ response = JSON.parse(HTTParty.get("http://www.betvictor.com/live/en/live/list.json"))
            #~ Rails.logger.debug(response)
            #~ result = response['sports']
            #~ result.sort_by { |hash| hash['pos'].to_i }
            #~ render json:{ status: 200,data: result}
            data = JSON.parse(File.read('qwerty/jsonBeauty.json'))
            result = data['sports']
            result.sort_by { |hash| hash['pos'].to_i }
            render json:{ status: 200,data: result}
        end
        def show
            data = JSON.parse(File.read('qwerty/jsonBeauty.json'))
            result = []
            objArray = data['sports']
            #~ Rails.logger.debug(objArray)
            for index in 0 ... objArray.size
                if objArray[index]["id"].to_i == params[:id].to_i
                    result = objArray[index]['events']
                    result.sort_by { |hash| hash['pos'].to_i }
                    break
                end
            end
            render json:{ status: 200,data: result}
        end
    end
  end
end
