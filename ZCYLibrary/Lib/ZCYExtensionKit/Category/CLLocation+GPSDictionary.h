//
//  CLLocation+GPSDictionary.h
//  TravelNote
//
//  Created by liu  on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <ImageIO/ImageIO.h>

@interface CLLocation (GPSDictionary)

//CLLocation对象转换为图片的GPSDictionary
-(NSDictionary*)GPSDictionary;
- (NSDictionary*) EXIFMetadataWithHeading:(CLHeading*)heading;
@end
@interface NSDate (EXIFGPS)

- (NSString*) ISODate;
- (NSString*) ISOTime;

@end