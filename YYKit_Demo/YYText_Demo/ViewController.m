//
//  ViewController.m
//  YYText_Demo
//
//  Created by 崔林豪 imac on 2021/6/24.
//

#import "ViewController.h"
#import "YYText.h"
#import "YYLabel.h"

#import "YYLabel.h"
#import "Masonry.h"



@interface ViewController ()


@property (nonatomic, strong) YYLabel *contentLabel;

@property (nonatomic, strong) UILabel *moveTipLabel;

@property (nonatomic, strong) UILabel *myTitleLabel;


@end

@implementation ViewController

#pragma mark - lazy Load
- (UILabel *)myTitleLabel {
    if (!_myTitleLabel) {
        _myTitleLabel = [[UILabel alloc] init];
       
        _myTitleLabel.font = [UIFont systemFontOfSize:30];
        //_myTitleLabel.textColor = kHexColor(@"#333333");
        _myTitleLabel.text = @"我的功能";
    }
    return _myTitleLabel;
}

- (UILabel *)moveTipLabel {
    if (!_moveTipLabel) {
        _moveTipLabel = [[UILabel alloc] init];
        _moveTipLabel.font = [UIFont systemFontOfSize:20];
        _moveTipLabel.textAlignment = NSTextAlignmentRight;
       
        _moveTipLabel.numberOfLines = 2;
        //_moveTipLabel.textColor = kHexColor(@"#999999");
        _moveTipLabel.text = @"按住后，拖动可调整应用位置与排序";//支持配置
        _moveTipLabel.backgroundColor = UIColor.systemRedColor;
        
    }
    return _moveTipLabel;
}

- (YYLabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[YYLabel alloc] init];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:20];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _contentLabel.backgroundColor = UIColor.lightGrayColor;
    }
    return _contentLabel;
}



#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 300, 400)];
    vv.backgroundColor = UIColor.systemBlueColor;
    [self.view addSubview:vv];
    
    
//    [vv addSubview:self.contentLabel];
//    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.top.mas_equalTo(10);
//        make.size.mas_equalTo(CGSizeMake(100, 90));
//    }];
//
//    self.contentLabel.text = @"123232";
    
    [vv addSubview:self.myTitleLabel];
    CGFloat titleWidth = [self.myTitleLabel sizeThatFits:CGSizeMake(1000, 20)].width;
    //向上 20  向左 4
    [self.myTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(5);
        make.width.offset(titleWidth);
    }];
    
    [vv addSubview:self.moveTipLabel];
    [self.moveTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(50 - 14);
        make.right.offset(-5);
        make.left.greaterThanOrEqualTo(self.myTitleLabel.mas_right).offset(5);
        
    }];
    //self.moveTipLabel.hidden = YES;
    
    ////codeTest
    //行间距减去 12  上14
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    //paraStyle.lineSpacing = 20;
    //设置负数没有效果的
    paraStyle.lineSpacing = 5;
    
    paraStyle.alignment = NSTextAlignmentRight;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName : paraStyle};
    NSMutableAttributedString * astr = [[NSMutableAttributedString alloc] initWithString:self.moveTipLabel.text attributes:attributes];
    NSDictionary *attribute = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
    [astr addAttributes:attribute range:NSMakeRange(0, self.moveTipLabel.text.length)];
    self.moveTipLabel.attributedText = astr;
    
    
    
}




@end
