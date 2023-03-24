//
//  main.m
//  XPCService_test
//
//  Created by Márton Greber on 12/27/22.
//

#import <Foundation/Foundation.h>
#import "../XPCservice/XPCProtocol.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to our simple REPL");
        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithMachServiceName:@"com.murculus.cheatsheet.xpc" options:(NSXPCConnectionOptions)nil];
        connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCProtocol)];
        [connection resume];

        id<XPCProtocol> service = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
            NSLog(@"Received error: %@", error);
        }];

        while (true) {
            NSLog(@"Insert text: ");
            char input[128];
            scanf("%s", input);
            NSString *text = [NSString stringWithUTF8String:input];
            [service getAnswer:text withReply:^(NSString *texto) {
                NSLog(@"%@", texto);
            }];
            if ([text isEqualToString:@"exit"]) {
                break;
            }
        }
    }
    return 0;
}
