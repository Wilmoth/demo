class CalendarController < ApplicationController
    def index
        if params[:year] && params[:month] 
            @year = params[:year].to_i 
            @month = params[:month].to_i
        else
            @year = Date.today.year.to_i 
            @month = Date.today.month.to_i
        end
        @schedules = Schedule.all
        render template: 'calendar/index'
    end
end
