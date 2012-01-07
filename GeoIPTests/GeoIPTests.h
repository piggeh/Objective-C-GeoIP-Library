//
//  GeoIPTests.h
//  GeoIPTests
//
//  Created by Matthew Layden on 26/12/2011.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GeoIP.h"

@interface GeoIPTests : SenTestCase
{
    GeoIP *geo;
}

@property (copy) GeoIP *geo;

@end
