//
//  CLLocation+GPSDictionary.m
//  TravelNote
//
//  Created by liu  on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CLLocation+GPSDictionary.h"
NSString * const ISODateFormat = @"yyyy-MM-dd";
NSString * const ISOTimeFormat = @"HH:mm:ss.SSSSSS";
@implementation CLLocation (GPSDictionary)

-(NSDictionary*)GPSDictionary{
    CLLocationDegrees exifLatitude  = self.coordinate.latitude;
    CLLocationDegrees exifLongitude = self.coordinate.longitude;
    NSString *latRef;
    NSString *lngRef;
    if (exifLatitude < 0.0) {
        exifLatitude = exifLatitude * -1.0f;
        latRef = @"S";
    } else {
        latRef = @"N";
    }
    
    if (exifLongitude < 0.0) {
        exifLongitude = exifLongitude * -1.0f;
        lngRef = @"W";
    } else {
        lngRef = @"E";
    }
    NSMutableDictionary *locDict = [[NSMutableDictionary alloc] init];
    
    [locDict setObject:latRef forKey:(NSString*)kCGImagePropertyGPSLatitudeRef];
    [locDict setObject:[NSNumber numberWithFloat:exifLatitude] forKey:(NSString*)kCGImagePropertyGPSLatitude];
    [locDict setObject:lngRef forKey:(NSString*)kCGImagePropertyGPSLongitudeRef];
    [locDict setObject:[NSNumber numberWithFloat:exifLongitude] forKey:(NSString*)kCGImagePropertyGPSLongitude];
    [locDict setObject:[NSNumber numberWithFloat:self.horizontalAccuracy] forKey:(NSString*)kCGImagePropertyGPSDOP];
    [locDict setObject:[NSNumber numberWithFloat:self.altitude] forKey:(NSString*)kCGImagePropertyGPSAltitude];
    return locDict;
}
- (NSDictionary*) EXIFMetadataWithHeading:(CLHeading*)heading
{
    NSMutableDictionary *GPSMetadata = [NSMutableDictionary dictionary];
    
    NSNumber *altitudeRef = [NSNumber numberWithInteger: self.altitude < 0.0 ? 1 : 0];
    NSString *latitudeRef = self.coordinate.latitude < 0.0 ? @"S" : @"N";
    NSString *longitudeRef = self.coordinate.longitude < 0.0 ? @"W" : @"E";
    NSString *headingRef = @"T"; // T: true direction, M: magnetic
    
    // GPS metadata
    
    [GPSMetadata setValue:[NSNumber numberWithDouble:ABS(self.coordinate.latitude)] forKey:(NSString*)kCGImagePropertyGPSLatitude];
    [GPSMetadata setValue:[NSNumber numberWithDouble:ABS(self.coordinate.longitude)] forKey:(NSString*)kCGImagePropertyGPSLongitude];
    
    [GPSMetadata setValue:latitudeRef forKey:(NSString*)kCGImagePropertyGPSLatitudeRef];
    [GPSMetadata setValue:longitudeRef forKey:(NSString*)kCGImagePropertyGPSLongitudeRef];
    
    [GPSMetadata setValue:[NSNumber numberWithDouble:ABS(self.altitude)] forKey:(NSString*)kCGImagePropertyGPSAltitude];
    [GPSMetadata setValue:altitudeRef forKey:(NSString*)kCGImagePropertyGPSAltitudeRef];
    
    [GPSMetadata setValue:[self.timestamp ISOTime] forKey:(NSString*)kCGImagePropertyGPSTimeStamp];
    [GPSMetadata setValue:[self.timestamp ISODate] forKey:(NSString*)kCGImagePropertyGPSDateStamp];
    
    if (heading) {
        [GPSMetadata setValue:[NSNumber numberWithDouble:heading.trueHeading] forKey:(NSString*)kCGImagePropertyGPSImgDirection];
        [GPSMetadata setValue:headingRef forKey:(NSString*)kCGImagePropertyGPSImgDirectionRef];
    }
    
    return [GPSMetadata copy];
}

@end

@implementation NSDate (EXIFGPS)

- (NSString*) ISODate
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [f setDateFormat:ISODateFormat];
    return [f stringFromDate:self];
}

- (NSString*) ISOTime
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [f setDateFormat:ISOTimeFormat];
    return [f stringFromDate:self];
}




@end
