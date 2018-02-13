module Api::V1
    class SportsController < ApplicationController
        
        def index
            #~ # to use - to get a Json file from BetVictor URL
            #~ begin
            #~ response = JSON.parse(HTTParty.get("http://www.betvictor.com/live/en/live/list.json"))
            #~ result = response['sports']
            #~ result.sort_by { |hash| hash['pos'].to_i }
            #~ render json:{ status: 200,data: result}
            #~ rescue
                #~ render json:{ status: 404,data: []}
            #~ ensure # will always get executed
                
            #~ end 
            
            # to use - to read a Json file in the folder qwerty
            begin 
                data = JSON.parse(File.read('qwerty/jsonBeauty.json'))
                result = data['sports']
                result.sort_by { |hash| hash['pos'].to_i }
                render json:{ status: 200,data: result}
                
            rescue
                render json:{ status: 404,data: []}
            ensure # will always get executed
                
            end 
        end
        def show
        
            #~ # to use - to get a Json file from BetVictor URL
            #~ begin
            #~ response = JSON.parse(HTTParty.get("http://www.betvictor.com/live/en/live/list.json"))
            #~ objArray = response['sports']
            #~ for index in 0 ... objArray.size
                #~ if objArray[index]["id"].to_i == params[:id].to_i
                    #~ result = objArray[index]['events']
                    #~ result.sort_by { |hash| hash['pos'].to_i }
                    #~ break
                #~ end
            #~ end
            #~ render json:{ status: 200,data: result}
            #~ rescue
                #~ render json:{ status: 404,data: []}
            #~ ensure # will always get executed
                
            #~ end 
            
            # to use - to read a Json file in the folder qwerty
            begin 
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
            rescue
                render json:{ status: 404,data: []}
            ensure # will always get executed
                
            end 
        end
    end
  end

