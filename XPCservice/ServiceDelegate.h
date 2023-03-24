//
//  ServiceDelegate.h
//  XPCservice
//
//  Created by Márton Greber on 12/27/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServiceDelegate : NSObject <NSXPCListenerDelegate>

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection;

@end

NS_ASSUME_NONNULL_END
