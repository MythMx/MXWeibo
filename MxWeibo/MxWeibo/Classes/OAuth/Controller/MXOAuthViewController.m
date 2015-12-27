//
//  MXOAuthViewController.m
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXOAuthViewController.h"
#import "MXConst.h"
#import "MXHttpTool.h"
#import "MBProgressHUD.h"
#import "MXAccount.h"
#import "MXAccountTool.h"
#import "UIWindow+Switch.h"


@interface MXOAuthViewController ()<UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation MXOAuthViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    self.webView = webView;
    
    
    NSString *url = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@", MXAppKey, MXRediectUri];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:URL];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.webView animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.webView animated:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    
    NSRange range = [url rangeOfString:@"code="];
    
    if (range.length != 0) {
        
        NSString *code = [url substringFromIndex:range.location + range.length];
        
        [self getAccessTokenWithCode:code];
        
        return NO;
    }
    
    return YES;
}

- (void)getAccessTokenWithCode:(NSString *)code
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = MXAppKey;
    params[@"client_secret"] = MXAppSecret;
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = MXRediectUri;
    
    __weak typeof(self) wself = self;
    
    [MXHttpTool post:@"https://api.weibo.com/oauth2/access_token" params:params success:^(id json) {
        
        [MBProgressHUD hideHUDForView:wself.webView animated:YES];
        
        MXAccount *account = [MXAccount accountWithDict:json];
        
        //保存account信息
        [MXAccountTool saveAccount:account];
        
        
        //切换控制器
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window switchRootViewController];
        
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:wself.webView animated:YES];
    }];
}

@end
