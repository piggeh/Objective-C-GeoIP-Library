//
//  GeoIP.h
//  GeoIP
//
//  Created by Matthew Layden on 26/12/2011.
//

#import <Foundation/Foundation.h>

@interface GeoIP : NSObject
{
    NSFileHandle    *database;
    NSInteger       COUNTRY_BEGIN;
    NSArray         *countryCodes;
    NSArray         *countryNames;
}

@property (copy) NSFileHandle *database;
@property NSInteger COUNTRY_BEGIN;
@property (copy) NSArray *countryCodes;
@property (copy) NSArray *countryNames;

- (id)initWithDatabase:(NSString *)path;
- (BOOL)loadDatabase:(NSString *)path;
- (long)ipToLong:(NSString *)ip;
- (NSInteger)lookup:(NSInteger)offset :(NSInteger)ip :(NSInteger)depth;
- (NSInteger)lookupIp:(NSString *)ip;
- (NSString *)lookupCountryCodeForIp:(NSString *)ip;
- (NSString *)lookupCountryNameForIp:(NSString *)ip;

@end
