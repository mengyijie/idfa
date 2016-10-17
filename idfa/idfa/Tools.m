//
//  Tools.m
//  idfa
//
//  Created by mengyijie on 16/10/17.
//  Copyright © 2016年 mengyijie. All rights reserved.
//

#import "Tools.h"
#import <AdSupport/AdSupport.h>
#import "AAKeychainItemWrapper.h"


#define KEYCHINA_KEY @"5fc732311905cb27e82d67f4f6511f45"//自定义

@implementation Tools
+ (NSString *)KeychainIdfa{
    
    static NSString *idfa = NULL;
    
    if (idfa) return idfa;
    
    AAKeychainItemWrapper *keychain = [[AAKeychainItemWrapper alloc] initWithIdentifier:KEYCHINA_KEY
                                                                            accessGroup:nil];
    idfa = [keychain objectForKey:(__bridge id)kSecAttrAccount];
    
    if (idfa && ![idfa isEqualToString:@""]) return idfa;
    
    
    idfa = [self getIDFA];
    
    [keychain setObject:idfa forKey:(__bridge id)kSecAttrAccount];
    
    return idfa ? idfa : @"";
}
+(NSString *)getIDFA{
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (adId==nil||[adId isEqualToString:@""]||[adId isEqualToString:@"(null)"]) {
        adId=@"";
    }
    NSLog(@"%@",adId);
    return adId;
}

@end
