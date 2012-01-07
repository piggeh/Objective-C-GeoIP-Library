//
//  CountryLookupAppDelegate.m
//  CountryLookup
//
//  Created by Matthew Layden on 07/01/2012.
//

#import "CountryLookupAppDelegate.h"

@implementation CountryLookupAppDelegate

@synthesize window;
@synthesize lookup;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)btnLookup_Click:(id)sender {
    NSString *countryCode = [[self lookup] lookupCountryCodeForIp:[ipAddressField stringValue]];
    NSString *countryName = [[self lookup] lookupCountryNameForIp:[ipAddressField stringValue]];
    [txtCountry setStringValue:[NSString stringWithFormat:@"%@ is in %@ (%@)",
                                [ipAddressField stringValue],
                                countryName,
                                countryCode]];
}

- (IBAction)btnCountryDatabase_Click:(id)sender {
    
    NSOpenPanel* dlg = [NSOpenPanel openPanel];
    [dlg setCanChooseFiles:             TRUE];
    [dlg setCanChooseDirectories:       FALSE];
    [dlg setAllowsMultipleSelection:    FALSE];
    [dlg setAllowedFileTypes:           [NSArray arrayWithObject:@"dat"]];
    
    if ( [dlg runModal] == NSOKButton )
    {
        NSArray* files = [dlg URLs];
        for(int i = 0; i < [files count]; i += 1) {
            NSURL *filename = [files objectAtIndex:i];
            [self setLookup:[[GeoIP alloc] initWithDatabase:[filename path]]];
            [btnCountryDatabase setEnabled:FALSE];
            [btnLookup setEnabled:TRUE];
        }
    }
}
@end
