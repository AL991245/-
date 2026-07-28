#import <substrate.h>
#import <UIKit/UIKit.h>

%ctor {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注入成功" message:@"dylib加载完成" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:0 handler:nil]];
        UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
        [root presentViewController:alert animated:YES completion:nil];
    });
}
 
