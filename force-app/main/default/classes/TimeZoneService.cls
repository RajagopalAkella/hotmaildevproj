public class TimeZoneService {
    public DateTime convertTimeToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone)
    {
        system.debug('#### input time: ' + dttime);
        //input
        TimeZone inputTZ = Timezone.getTimeZone(sourceTimezone);        
        Integer offsetInputTZ=inputTZ.getOffset(dttime);
        System.debug('#### Input ' + inputTZ.getID() + 
                     ' DateTime: ' + dttime +
                     ' input tz Offset to GMT: ' + offsetInputTZ + 
                     ' Hrs: ' + offsetInputTZ / (1000*60*60) +
                     ' Mins: ' + math.mod((offsetInputTZ / (1000 * 60)),60)
                    ); 
        
        //Calculate GMT
        DateTime gmtDT = dttime.addMinutes(offsetInputTZ / (1000 * 60));
        System.debug('#### GMT: ' + gmtDT);
        
        //Calculate target
        TimeZone targetTZ = Timezone.getTimeZone(targetTimezone);
        integer offsetTotargetTZ = targetTZ.getOffset(dttime);        
        
        integer correction = offsetTotargetTZ- offsetInputTZ;  
        system.debug('correction offset: ' + correction + 
                     ' Hrs: ' + correction / (1000*60*60) +
                     ' Mins: ' + math.mod((correction / (1000 * 60)),60)
                    );
        DateTime targetDT = gmtDT.addMinutes(offsetTotargetTZ / (1000 * 60));
        
        system.debug('#### Output ' + targetTZ.getID() + ' DateTime: ' + targetDT +
                     ' target tz offset to GMT: ' + offsetTotargetTZ + 
                     ' Hrs: ' + offsetTotargetTZ / (1000*60*60) +
                     ' Mins: ' + math.mod((offsetTotargetTZ / (1000 * 60)),60)
                    );
        
        return targetDT;
    }
}