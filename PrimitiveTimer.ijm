MonthNames = newArray("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
     DayNames = newArray("Sun", "Mon","Tue","Wed","Thu","Fri","Sat");
     getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
     TimeString ="Date: "+DayNames[dayOfWeek]+" ";
     if (dayOfMonth<10) {TimeString = TimeString+"0";}
     TimeString = TimeString+dayOfMonth+"-"+MonthNames[month]+"-"+year+"\nTime: ";
     if (hour<10) {TimeString = TimeString+"0";}
     TimeString = TimeString+hour+":";
     if (minute<10) {TimeString = TimeString+"0";}
     TimeString = TimeString+minute+":";
     if (second<10) {TimeString = TimeString+"0";}
     TimeString = TimeString+second;
    
     wait(3000);
     
     getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
     TimeString2 ="Date: "+DayNames[dayOfWeek]+" ";
     if (dayOfMonth<10) {TimeString2 = TimeString2+"0";}
     TimeString2 = TimeString2+dayOfMonth+"-"+MonthNames[month]+"-"+year+"\nTime: ";
     if (hour<10) {TimeString2 = TimeString2+"0";}
     TimeString2 = TimeString2+hour+":";
     if (minute<10) {TimeString2 = TimeString2+"0";}
     TimeString2 = TimeString2+minute+":";
     if (second<10) {TimeString2 = TimeString2+"0";}
     TimeString2 = TimeString2+second;
     
     
     showMessage("Start "+TimeString+"\nStop "+TimeString2);