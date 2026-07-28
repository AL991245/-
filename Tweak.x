#import <UIKit/UIKit.h>

// 程序入口，APP启动1秒弹出弹窗
%ctor{
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    CGRect screen = [UIScreen mainScreen].bounds;

    // 半透明黑色遮罩
    UIView *maskView = [[UIView alloc] initWithFrame:screen];
    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

    // 弹窗主体白色面板
    CGFloat popW = screen.size.width * 0.82;
    UIView *popup = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width-popW)/2, 100, popW, 360)];
    popup.backgroundColor = [UIColor whiteColor];
    popup.layer.cornerRadius = 16;

    // 右上角关闭按钮 ×
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(popW - 35, 5, 30, 30)];
    [closeBtn setTitle:@"×" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:22];
    // 点击关闭整个弹窗
    [closeBtn addTarget:maskView action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];

    // 主标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, popW-40, 25)];
    titleLabel.text = @"欢迎使用自由签";
    titleLabel.font = [UIFont boldSystemFontOfSize:18];

    // 有效期小字
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 42, popW-30, 18)];
    tipLabel.text = @"有效期至 2026-12-02(剩333天)";
    tipLabel.font = [UIFont systemFontOfSize:12];
    tipLabel.textColor = [UIColor darkGrayColor];

    // 中间大段公告文本
    UITextView *contentView = [[UITextView alloc] initWithFrame:CGRectMake(10, 65, popW-20, 200)];
    contentView.text = @"新增`Action手势`(路径：个性化功能-Action手势)\n新增Ai润色功能\n优化文字转语音\n修复多项已知bug";
    contentView.font = [UIFont systemFontOfSize:14];
    contentView.editable = NO;

    // 左下角按钮：更新教程
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 285, popW/2 - 18, 40)];
    [leftBtn setTitle:@"更新教程" forState:UIControlStateNormal];
    leftBtn.layer.borderWidth = 1;
    leftBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    leftBtn.layer.cornerRadius = 10;
    // 点击跳转网址
    [leftBtn addTarget:self action:@selector(openLeftUrl) forControlEvents:UIControlEventTouchUpInside];

    // 右下角按钮：官网
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(popW/2 + 8, 285, popW/2 - 18, 40)];
    [rightBtn setTitle:@"官网" forState:UIControlStateNormal];
    rightBtn.backgroundColor = [UIColor systemBlueColor];
    rightBtn.layer.cornerRadius = 10;
    [rightBtn addTarget:self action:@selector(openRightUrl) forControlEvents:UIControlEventTouchUpInside];

    // 把所有控件一层层嵌套添加
    [popup addSubview:closeBtn];
    [popup addSubview:titleLabel];
    [popup addSubview:tipLabel];
    [popup addSubview:contentView];
    [popup addSubview:leftBtn];
    [popup addSubview:rightBtn];
    [maskView addSubview:popup];
    [rootVC.view addSubview:maskView];
});
}

// 按钮跳转链接，自行修改引号内网址
void openLeftUrl(){
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://你的教程链接.com"]];
}
void openRightUrl(){
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://你的官网.com"]];
}
