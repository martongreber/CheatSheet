//
//  XPCProtocol.h
//  XPCservice
//
//  Created by Márton Greber on 12/27/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol XPCProtocol
- (void)getAnswer:(NSString *)text withReply:(void (^)(NSString * _Nonnull))reply;
@end
NS_ASSUME_NONNULL_END
