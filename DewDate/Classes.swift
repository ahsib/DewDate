//
//  Classes.swift
//  DewDate
//
//  Created by cscoi027 on 2016. 8. 10..
//  Copyright © 2016년 Koreauniv. All rights reserved.
//

import Foundation

typealias Time = (year:Int, mon:Int, day:Int, h:Int, m:Int)
typealias ID = String

enum repeat_intervals {
    case none, evr_day,evr_week, evr_2week, evr_mon,evr_year
}

enum move_times {
    case none, min5, min15, min30, min60, min90, min120
}

enum alarm_times {
    case none, oclock, min5, min10, min15, min30, min60, min120, day1, day2
}

enum invitation_status {
    case accepted, declined, postponed
}

class Event{
    var name:String
    var location:String?
    var isAllDay:Bool = false
    var start:Time
    var end:Time
    var repeat_interval:repeat_intervals = repeat_intervals.none    //= ["안함":false,"매일":false,"매주":false,"2주마다":false,"매월":false,"매년":false]
    var move_time:move_times = move_times.none    // = ["5분":false,"15분":false,"30분":false,"1시간":false,"1시간,30분":false,"2시간":false]
    var alarm:alarm_times = alarm_times.none   //= ["이동 시간 시작 시":false, "이동 시간 5분 전":false]
    
    init(name:String, start:Time, end:Time) {
        self.name = name
        self.start = start
        self.end = end
    }
    
    init(name:String, location:String, start:Time, end:Time) {
        self.name = name
        self.location = location
        self.start = start
        self.end = end
    }
    
    init(name:String, location:String, isAllDay:Bool, start:Time, end:Time, repeat_interval:repeat_intervals, move_time:move_times, alarm:alarm_times) {
        self.name = name
        self.location = location
        self.isAllDay = isAllDay
        self.start = start
        self.end = end
        self.repeat_interval = repeat_interval
        self.move_time = move_time
        self.alarm = alarm
    }
    
    func modify(new_name:String, new_location:String, new_isAllDay:Bool, new_start:Time, new_end:Time, new_repeat_interval:repeat_intervals, new_move_time:move_times, new_alarm:alarm_times) -> () {
        self.name = new_name
        self.location = new_location
        self.isAllDay = new_isAllDay
        self.start = new_start
        self.end = new_end
        self.repeat_interval = new_repeat_interval
        self.move_time = new_move_time
        self.alarm = new_alarm
    }
    
    /*
     func mod_naem(new_name:String) -> () {
     self.name = new_name
     }
     
     func mod_location(new_locaiton:String) -> () {
     self.location = new_locaiton
     }
     
     func mod_isAllDay() -> () {
     if self.isAllDay == true {
     self.isAllDay == false
     }
     
     }
     */
}

class Invitation {
    let invitor:ID
    let event:Event
    var status:invitation_status = invitation_status.postponed
    
    init (invitor:ID, event:Event) {
        self.invitor = invitor
        self.event = event
    }
}
