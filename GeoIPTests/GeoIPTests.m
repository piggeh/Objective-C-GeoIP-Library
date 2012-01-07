//
//  GeoIPTests.m
//  GeoIPTests
//
//  Created by Matthew Layden on 26/12/2011.
//

#import "GeoIPTests.h"

@implementation GeoIPTests

@synthesize geo;

- (void)setUp
{
    geo = [[GeoIP alloc] initWithDatabase:@"/Users/matt/Downloads/GeoIP.dat"];
    STAssertNotNil(geo, @"Could not create GeoIP instance");
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [geo release];
    [super tearDown];
}

- (void)testIpToLong {
    
    // LAN IP address
    STAssertEquals([geo ipToLong:@"127.0.0.1"], 2130706433L, @"ipToLong 127.0.0.1 expects 2130706433");
    STAssertEquals([geo ipToLong:@"192.168.0.1"], 3232235521L, @"ipToLong 192.168.0.1 expects 3232235521");
    
    // WAN IP address
    STAssertEquals([geo ipToLong:@"207.97.227.239"], 3479299055L, @"ipToLong 207.97.227.239 expects 3479299055");
    STAssertEquals([geo ipToLong:@"173.194.70.147"], 2915190419L, @"ipToLong 73.194.70.147 expects 2915190419");
    STAssertEquals([geo ipToLong:@"178.236.4.29"], 3001811997L, @"ipToLong 178.236.4.29 expects 3001811997");
}

- (void)testIpToCountryCode {
    STAssertEqualObjects([geo lookupCountryCodeForIp:@"127.0.0.1"], @"--", @"");
    STAssertEqualObjects([geo lookupCountryCodeForIp:@"192.168.0.1"], @"--", @"");
    STAssertEqualObjects([geo lookupCountryCodeForIp:@"207.97.227.239"], @"US", @"");
    STAssertEqualObjects([geo lookupCountryCodeForIp:@"173.194.70.147"], @"US", @"");
    STAssertEqualObjects([geo lookupCountryCodeForIp:@"178.236.4.29"], @"IE", @"");
}

- (void)testIpToCountryName {
    STAssertEqualObjects([geo lookupCountryNameForIp:@"127.0.0.1"], @"--", @"");
    STAssertEqualObjects([geo lookupCountryNameForIp:@"192.168.0.1"], @"--", @"");
    STAssertEqualObjects([geo lookupCountryNameForIp:@"207.97.227.239"], @"United States", @"");
    STAssertEqualObjects([geo lookupCountryNameForIp:@"173.194.70.147"], @"United States", @"");
    STAssertEqualObjects([geo lookupCountryNameForIp:@"178.236.4.29"], @"Ireland", @"");
}

@end
