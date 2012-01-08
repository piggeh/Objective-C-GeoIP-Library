//
//  CountryLookupAppDelegate.h
//  CountryLookup
//
//  Created by Matthew Layden on 07/01/2012.
//

#import <Cocoa/Cocoa.h>
#import <GeoIP/GeoIP.h>

@interface CountryLookupAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    IBOutlet NSTextField *ipAddressField;
    IBOutlet NSButton *btnLookup;
    IBOutlet NSButtonCell *btnCountryDatabase;
    IBOutlet NSTextField *txtCountry;
    
    GeoIP *lookup;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) GeoIP *lookup;

- (IBAction)btnLookup_Click:(id)sender;
- (IBAction)btnCountryDatabase_Click:(id)sender;

@end

