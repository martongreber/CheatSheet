//
//  main.m
//  XPCservice
//
//  Created by Márton Greber on 12/27/22.
//

#import <Foundation/Foundation.h>
#import "ServiceDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ServiceDelegate *delegate = [[ServiceDelegate alloc] init];
        NSXPCListener *listener = [[NSXPCListener alloc] initWithMachServiceName:@"com.murculus.cheatsheet.xpc"];
        listener.delegate = delegate;
        [listener resume];
        [[NSRunLoop mainRunLoop] run];
    }
    return 0;
}
