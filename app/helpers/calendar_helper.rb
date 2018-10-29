module CalendarHelper
    def show_tag(year,month,schedules)
        d = Date.new(year, month, 1) 
        first = d.wday
        prev_date = d.prev_month
        next_date = d.next_month
        p = Date.new(year, month, -1)
        last = p.day
        day = 1 - first
        html_tag = <<~EOS
        <h1>
        <a class="btn btn-default" href="/#{prev_date.year}/#{prev_date.mon}" role="button">&lt;前月</a>
        #{year}年#{month}月
        <a class="btn btn-default" href="/#{next_date.year}/#{next_date.mon}" role="button">翌月
        &gt;</a> 
        </h1>
        <h1>#{year}年#{month}月</h1>
        <table class="table table-bordered" style="table-layout:fixed;"> 
        <tr>
            <th scope="col">日</th> 
            <th scope="col">月</th> 
            <th scope="col">火</th> 
            <th scope="col">水</th> 
            <th scope="col">木</th> 
            <th scope="col">金</th> 
            <th scope="col">土</th>
        </tr>
        EOS
        while day <= last
            html_tag += '<tr>' 
            7.times {|i|
                if day <= 0 || day > last
                    html_tag += '<td>&nbsp;</td>'
                else
                    html_tag += "<td>#{day}"
                        target = Date.new(year, month, day) 
                        schedules.each {|val|
                            if val.date == target
                                html_tag += html_escape " #{val.username} #{val.mark}\n"
                            end 
                    }
                    html_tag += "</td>"
                end
                day += 1
            }
            html_tag += '</tr>' 
        end
        html_tag += '</table>'
        html_tag.html_safe 
    end
end
