//
//  GeoIP.m
//  GeoIP
//
//  Created by Matthew Layden on 26/12/2011.
//

#import "GeoIP.h"

@implementation GeoIP


@synthesize database;
@synthesize COUNTRY_BEGIN;
@synthesize countryCodes;
@synthesize countryNames;

- (id)initWithDatabase:(NSString *)path {
    self = [super init];
    if(self) {
        [self setCOUNTRY_BEGIN:16776960];
        [self setCountryCodes:[[NSArray alloc] initWithObjects:@"--",@"AP",@"EU",@"AD",@"AE",@"AF",@"AG",@"AI",@"AL",@"AM",@"AN",@"AO",@"AQ",@"AR",@"AS",@"AT",@"AU",@"AW",@"AZ",@"BA",@"BB",@"BD",@"BE",@"BF",@"BG",@"BH",@"BI",@"BJ",@"BM",@"BN",@"BO",@"BR",@"BS",@"BT",@"BV",@"BW",@"BY",@"BZ",@"CA",@"CC",@"CD",@"CF",@"CG",@"CH",@"CI",@"CK",@"CL",@"CM",@"CN",@"CO",@"CR",@"CU",@"CV",@"CX",@"CY",@"CZ",@"DE",@"DJ",@"DK",@"DM",@"DO",@"DZ",@"EC",@"EE",@"EG",@"EH",@"ER",@"ES",@"ET",@"FI",@"FJ",@"FK",@"FM",@"FO",@"FR",@"FX",@"GA",@"GB",@"GD",@"GE",@"GF",@"GH",@"GI",@"GL",@"GM",@"GN",@"GP",@"GQ",@"GR",@"GS",@"GT",@"GU",@"GW",@"GY",@"HK",@"HM",@"HN",@"HR",@"HT",@"HU",@"ID",@"IE",@"IL",@"IN",@"IO",@"IQ",@"IR",@"IS",@"IT",@"JM",@"JO",@"JP",@"KE",@"KG",@"KH",@"KI",@"KM",@"KN",@"KP",@"KR",@"KW",@"KY",@"KZ",@"LA",@"LB",@"LC",@"LI",@"LK",@"LR",@"LS",@"LT",@"LU",@"LV",@"LY",@"MA",@"MC",@"MD",@"MG",@"MH",@"MK",@"ML",@"MM",@"MN",@"MO",@"MP",@"MQ",@"MR",@"MS",@"MT",@"MU",@"MV",@"MW",@"MX",@"MY",@"MZ",@"NA",@"NC",@"NE",@"NF",@"NG",@"NI",@"NL",@"NO",@"NP",@"NR",@"NU",@"NZ",@"OM",@"PA",@"PE",@"PF",@"PG",@"PH",@"PK",@"PL",@"PM",@"PN",@"PR",@"PS",@"PT",@"PW",@"PY",@"QA",@"RE",@"RO",@"RU",@"RW",@"SA",@"SB",@"SC",@"SD",@"SE",@"SG",@"SH",@"SI",@"SJ",@"SK",@"SL",@"SM",@"SN",@"SO",@"SR",@"ST",@"SV",@"SY",@"SZ",@"TC",@"TD",@"TF",@"TG",@"TH",@"TJ",@"TK",@"TM",@"TN",@"TO",@"TL",@"TR",@"TT",@"TV",@"TW",@"TZ",@"UA",@"UG",@"UM",@"US",@"UY",@"UZ",@"VA",@"VC",@"VE",@"VG",@"VI",@"VN",@"VU",@"WF",@"WS",@"YE",@"YT",@"RS",@"ZA",@"ZM",@"ME",@"ZW",@"A1",@"A2",@"O1",@"AX",@"GG",@"IM",@"JE",@"BL",@"MF", nil]];
        
        [self setCountryNames:[[NSArray alloc] initWithObjects:@"--", @"Asia/Pacific Region", @"Europe", @"Andorra", @"United Arab Emirates", @"Afghanistan", @"Antigua and Barbuda", @"Anguilla", @"Albania", @"Armenia", @"Netherlands Antilles", @"Angola", @"Antarctica", @"Argentina", @"American Samoa", @"Austria", @"Australia", @"Aruba", @"Azerbaijan", @"Bosnia and Herzegovina", @"Barbados", @"Bangladesh", @"Belgium", @"Burkina Faso", @"Bulgaria", @"Bahrain", @"Burundi", @"Benin", @"Bermuda", @"Brunei Darussalam", @"Bolivia", @"Brazil", @"Bahamas", @"Bhutan", @"Bouvet Island", @"Botswana", @"Belarus", @"Belize", @"Canada", @"Cocos (Keeling) Islands", @"Congo, The Democratic Republic of the", @"Central African Republic", @"Congo", @"Switzerland", @"Cote D'Ivoire", @"Cook Islands", @"Chile", @"Cameroon", @"China", @"Colombia", @"Costa Rica", @"Cuba", @"Cape Verde", @"Christmas Island", @"Cyprus", @"Czech Republic", @"Germany", @"Djibouti", @"Denmark", @"Dominica", @"Dominican Republic", @"Algeria", @"Ecuador", @"Estonia", @"Egypt", @"Western Sahara", @"Eritrea", @"Spain", @"Ethiopia", @"Finland", @"Fiji", @"Falkland Islands (Malvinas)", @"Micronesia, Federated States of", @"Faroe Islands", @"France", @"France, Metropolitan", @"Gabon", @"United Kingdom", @"Grenada", @"Georgia", @"French Guiana", @"Ghana", @"Gibraltar", @"Greenland", @"Gambia", @"Guinea", @"Guadeloupe", @"Equatorial Guinea", @"Greece", @"South Georgia and the South Sandwich Islands", @"Guatemala", @"Guam", @"Guinea-Bissau", @"Guyana", @"Hong Kong", @"Heard Island and McDonald Islands", @"Honduras", @"Croatia", @"Haiti", @"Hungary", @"Indonesia", @"Ireland", @"Israel", @"India", @"British Indian Ocean Territory", @"Iraq", @"Iran, Islamic Republic of", @"Iceland", @"Italy", @"Jamaica", @"Jordan", @"Japan", @"Kenya", @"Kyrgyzstan", @"Cambodia", @"Kiribati", @"Comoros", @"Saint Kitts and Nevis", @"Korea, Democratic People's Republic of", @"Korea, Republic of", @"Kuwait", @"Cayman Islands", @"Kazakhstan", @"Lao People's Democratic Republic", @"Lebanon", @"Saint Lucia", @"Liechtenstein", @"Sri Lanka", @"Liberia", @"Lesotho", @"Lithuania", @"Luxembourg", @"Latvia", @"Libyan Arab Jamahiriya", @"Morocco", @"Monaco", @"Moldova, Republic of", @"Madagascar", @"Marshall Islands", @"Macedonia", @"Mali", @"Myanmar", @"Mongolia", @"Macau", @"Northern Mariana Islands", @"Martinique", @"Mauritania", @"Montserrat", @"Malta", @"Mauritius", @"Maldives", @"Malawi", @"Mexico", @"Malaysia", @"Mozambique", @"Namibia", @"New Caledonia", @"Niger", @"Norfolk Island", @"Nigeria", @"Nicaragua", @"Netherlands", @"Norway", @"Nepal", @"Nauru", @"Niue", @"New Zealand", @"Oman", @"Panama", @"Peru", @"French Polynesia", @"Papua New Guinea", @"Philippines", @"Pakistan", @"Poland", @"Saint Pierre and Miquelon", @"Pitcairn Islands", @"Puerto Rico", @"Palestinian Territory", @"Portugal", @"Palau", @"Paraguay", @"Qatar", @"Reunion", @"Romania", @"Russian Federation", @"Rwanda", @"Saudi Arabia", @"Solomon Islands", @"Seychelles", @"Sudan", @"Sweden", @"Singapore", @"Saint Helena", @"Slovenia", @"Svalbard and Jan Mayen", @"Slovakia", @"Sierra Leone", @"San Marino", @"Senegal", @"Somalia", @"Suriname", @"Sao Tome and Principe", @"El Salvador", @"Syrian Arab Republic", @"Swaziland", @"Turks and Caicos Islands", @"Chad", @"French Southern Territories", @"Togo", @"Thailand", @"Tajikistan", @"Tokelau", @"Turkmenistan", @"Tunisia", @"Tonga", @"Timor-Leste", @"Turkey", @"Trinidad and Tobago", @"Tuvalu", @"Taiwan", @"Tanzania, United Republic of", @"Ukraine", @"Uganda", @"United States Minor Outlying Islands", @"United States", @"Uruguay", @"Uzbekistan", @"Holy See (Vatican City State)", @"Saint Vincent and the Grenadines", @"Venezuela", @"Virgin Islands, British", @"Virgin Islands, U.S.", @"Vietnam", @"Vanuatu", @"Wallis and Futuna", @"Samoa", @"Yemen", @"Mayotte", @"Serbia", @"South Africa", @"Zambia", @"Montenegro", @"Zimbabwe", @"Anonymous Proxy", @"Satellite Provider", @"Other", @"Aland Islands", @"Guernsey", @"Isle of Man", @"Jersey", @"Saint Barthelemy", @"Saint Martin", nil]];
        [self loadDatabase:path];
    }
    return self;
}


- (BOOL)loadDatabase:(NSString *)path {
    [self setDatabase:[NSFileHandle fileHandleForReadingAtPath:path]];
    return [self database] != nil;
}

- (long)ipToLong:(NSString *)ip {
    NSArray *chunks = [ip componentsSeparatedByString:@"."];
    NSInteger ipAsLong = 0;
    for(int i = 0; i < 4; i += 1) {
        long c = [[chunks objectAtIndex:i] doubleValue];
        if(c < 0) {
            c += 256;
        }
        ipAsLong += c << ((3 - i) * 8);
    }
    
    return ipAsLong;
}

- (NSInteger)lookup:(NSInteger)offset :(NSInteger)ip :(NSInteger)depth {
    if(depth < 0) {
        NSLog(@"Error seeking country.");
        return 0;
    }
    
    [[self database] seekToFileOffset:6 * offset];
    NSData *testRange = [[self database] readDataOfLength:6];
    NSInteger x0 = 0;
    NSInteger x1 = 0;
    
    for(NSInteger i = 0; i < 2; i += 1) {
        
        if(i == 0) {
            x0 = 0;
        } else {
            x1 = 0;
        }
        
        for(NSInteger j = 0; j < 3; j += 1) {
            NSData *byte = [testRange subdataWithRange:NSMakeRange(i * 3 + j, 1)];
            unsigned char* r = (unsigned char*)[byte bytes];
            NSInteger y = (int) r[0];
            if(y < 0) {
                y += 256;
            }
            
            if(i == 0) {
                x0 += y << (j * 8);
            } else {
                x1 += y << (j * 8);
            }
        }
    }
    
    
    if(ip & (1 << depth)) {
        if(x1 >= COUNTRY_BEGIN) {
            return x1;
        }
        return [self lookup:x1 :ip :depth - 1];
    } else {
        if(x0 >= COUNTRY_BEGIN) {
            return x0;
        }
        return [self lookup:x0 :ip :depth - 1];
    }
}

- (NSInteger)lookupIp:(NSString *)ip {
    NSInteger response = [self lookup:0 :[self ipToLong:ip] :31];
    return response - COUNTRY_BEGIN;
}

- (NSString *)lookupCountryCodeForIp:(NSString *)ip {
    return [countryCodes objectAtIndex:[self lookupIp:ip]];
}

- (NSString *)lookupCountryNameForIp:(NSString *)ip {
    return [countryNames objectAtIndex:[self lookupIp:ip]];
}

@end
