// Copyright © Microsoft Open Technologies, Inc.
//
// All Rights Reserved
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS
// OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
// ANY IMPLIED WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A
// PARTICULAR PURPOSE, MERCHANTABILITY OR NON-INFRINGEMENT.
//
// See the Apache License, Version 2.0 for the specific language
// governing permissions and limitations under the License.

#import <XCTest/XCTest.h>
#import "ADBrokerHelpers.h"
#import "../ADAuthenticationBroker/ADBrokerBase64Additions.h"
#import "NSString+ADHelperMethods.h"
#import <CommonCrypto/CommonHMAC.h>

@interface ADBrokerHelpersTests : XCTestCase

@end

@implementation ADBrokerHelpersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testKDFOfEvo {
    NSString* keyEncoded = @"8jvPwsy86vlWPq6S6/LsFP6idTXYUBS6JvuLe+6eTsc=";
    NSString* derivedKeyEncoded = @"VywMlfWil62OEFBgzBQW8jeFJ4jPQE0AoAFouBYW5t0=";
    NSString* ctxEncoded = @"jNKQ3AeSGL1aBzcfeckMxEZFm4x1o1G2";
    
    NSData* key = [NSData dataWithBase64String:keyEncoded];
    NSData* ctx = [NSData dataWithBase64String:ctxEncoded];
    NSData* kdf = [ADBrokerHelpers computeKDFInCounterMode:key
                                                     context:ctx];
    XCTAssertTrue([NSString adSame:derivedKeyEncoded toString:[kdf base64String]]);
}

@end
