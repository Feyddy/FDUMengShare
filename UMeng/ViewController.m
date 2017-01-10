//
//  ViewController.m
//  UMeng
//
//  Created by t3 on 17/1/7.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "ViewController.h"
#import <UShareUI/UShareUI.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *feyddyBlogWeb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSURL *url = [NSURL URLWithString:@"https://feyddy.github.io"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.feyddyBlogWeb loadRequest:request];
    
    
    
    
}
- (IBAction)shareButton:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [weakSelf shareTextToPlatformType:platformType];
        
    }];
}


- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"Feyddy博客地址" descr:@"博客地址为：https://feyddy.github.io" thumImage:[UIImage imageNamed:@"Icon-60"]];
    
    shareObject.webpageUrl = @"https://feyddy.github.io";
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//        NSString *message = nil;
//        if (!error) {
//            //            message = [NSString stringWithFormat:@"分享成功"];
//            //            [MBProgressHUD showSuccess:message ToView:self.view];
//            [HSChangeIntegralToShare isChangeIntegrals:^(id responseObject) {
//                
//                DLOG(@"%@",responseObject);
//                if ([responseObject isEqualToString:@"0000"]) {
//                    [MBProgressHUD showAutoMessage:@"分享成功"];
//                    
//                }else if ([responseObject isEqualToString:@"2023"]){
//                    [MBProgressHUD showAutoMessage:@"今日已分享"];
//                }else {
//                    [MBProgressHUD showAutoMessage:@"数据有误"];
//                }
//                
//            }];
//            
//        } else {
//            DLOG(@"%@",error);
//            message = [NSString stringWithFormat:@"取消分享"];
//            [MBProgressHUD showError:message ToView:self.view];
//        }
        
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
