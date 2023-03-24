//
//  ServiceDelegate.m
//  XPCservice
//
//  Created by Márton Greber on 12/27/22.
//

#import "ServiceDelegate.h"
#import "XPC.h"
#import "XPCProtocol.h"

@implementation ServiceDelegate

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
    XPC *exportedObject = [[XPC alloc] init];
    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCProtocol)];
    newConnection.exportedObject = exportedObject;
    [newConnection resume];
    return YES;
}

@end
