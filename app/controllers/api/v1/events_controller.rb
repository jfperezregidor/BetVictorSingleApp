module Api
  module V1
    class EventsController < ApplicationController

        def index
            data = JSON.parse(File.read('qwerty/jsonBeauty.json'))
            result = []
            objArray = data['sports']
            for index in 0 ... objArray.size
                if objArray[index]['id'].to_i == params['sport_id'].to_i
                    result = objArray[index]['events']
                    result.sort_by { |hash| hash['pos'].to_i }
                    break
                end
            end
            render json:{ status: 200,data: result}
        end
        
        def show
            data = JSON.parse(File.read('qwerty/jsonBeauty.json'))
            events = []
            objArray = data['sports']
            for index in 0 ... objArray.size
                if objArray[index]["id"].to_i == params['sport_id'].to_i
                    events = objArray[index]['events']
                    break
                end
            end
            
            for index in 0 ... events.size
                if events[index]["id"].to_i == params[:id].to_i
                    result = events[index]['outcomes']
                    break
                end
            end
            
            render json:{ status: 200,data: result}
        end
        
    end
  end
end

