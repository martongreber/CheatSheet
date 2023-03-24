//
//  SourceEditorCommand.m
//  Extension
//
//  Created by Márton Greber on 12/27/22.
//

#import "SourceEditorCommand.h"
#import "../XPCservice/XPCProtocol.h"

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
    
    NSXPCConnection *connection = [[NSXPCConnection alloc] initWithMachServiceName:@"com.murculus.cheatsheet.xpc" options:(NSXPCConnectionOptions)nil];
    connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCProtocol)];
    [connection resume];

    id<XPCProtocol> service = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
        NSLog(@"Received error: %@", error);
    }];

    NSString *text = @"asdf";
    [service getAnswer:text withReply:^(NSString *texto) {
        NSLog(@"%@", texto);
    }];
    
    completionHandler(nil);
}

@end
