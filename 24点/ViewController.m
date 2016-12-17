//
//  ViewController.m
//  24点
//
//  Created by 潘若冰 on 2016/12/11.
//  Copyright © 2016年 潘若冰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
-(void)dfs:(float [4][4])array numberWith:(int)n;

@end

@implementation ViewController

char string[3][20];
int l = 0;
float number[4][4];
float sum = 0;
_Bool sumIs24(float sum)
{
    if (fabsf(sum-24)<0.1) {
        return 1;
    }
    else
        return 0;
}

float caculate(float a,float b,int i){
    switch (i) {
        case 0:
            return a+b;
            break;
        case 1:
            return a-b;
            break;
        case 2:
            return a*b;
            break;
        case 3:
            return a/b;
            break;
        case 4:
            return b-a;
            break;
        case 5:
            return b/a;
            break;
            
        default:
            break;
    }
    return 0;

}

-(void)clear
{
    [_str setString:@""];
    _textField1.text = @"";
    _textField2.text = @"";
    _textField3.text = @"";
    _textField4.text = @"";
    _label.text = @"";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:46/255.0 green:169/255.0 blue:223/255.0 alpha:1.0];
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(50, 35, 150, 50)];
    text.text = @"请输入4个数字";
    text.textColor = [UIColor colorWithRed:83/255.0 green:61/255.0 blue:91/255.0 alpha:1.0];
    _textField1 = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    _textField2 = [[UITextField alloc]initWithFrame:CGRectMake(120, 100, 50, 50)];
    _textField3 = [[UITextField alloc]initWithFrame:CGRectMake(190, 100, 50, 50)];
    _textField4 = [[UITextField alloc]initWithFrame:CGRectMake(260, 100, 50, 50)];
    _textField1.borderStyle = UITextBorderStyleRoundedRect;
    _textField2.borderStyle = UITextBorderStyleRoundedRect;
    _textField3.borderStyle = UITextBorderStyleRoundedRect;
    _textField4.borderStyle = UITextBorderStyleRoundedRect;
    _textField1.textColor = [UIColor blackColor];
    _textField2.textColor = [UIColor blackColor];
    _textField3.textColor = [UIColor blackColor];
    _textField4.textColor = [UIColor blackColor];
    _textField1.textAlignment = NSTextAlignmentCenter;
    _textField2.textAlignment = NSTextAlignmentCenter;
    _textField3.textAlignment = NSTextAlignmentCenter;
    _textField4.textAlignment = NSTextAlignmentCenter;
    _textField1.delegate = self;
    _textField2.delegate = self;
    _textField3.delegate = self;
    _textField4.delegate = self;
    _array1 = [[NSMutableArray alloc]init];
    _str = [[NSMutableString alloc]init];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(95, 200,70 , 50)];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(195, 200, 70, 50)];
    [btn2 setTitle:@"清除" forState:UIControlStateNormal];
    [btn setTitle:@"计算" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(calculate) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, 500)];
    _label.textColor = [UIColor blackColor];
    _label.numberOfLines = 0;
    [self.view addSubview:btn2];
    [self.view addSubview:_label];
    [self.view addSubview:btn];
    [self.view addSubview:text];
    [self.view addSubview:_textField1];
    [self.view addSubview:_textField2];
    [self.view addSubview:_textField3];
    [self.view addSubview:_textField4];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)dfs:(float [4][4])array numberWith:(int)n
{
    //    for (int i = 0; i<4; i++) {
    //        if (book[i]==0) {
    //            flag = 0;
    //        }
    //    }
    //    if (flag==1&&sumIs24(sum)) {
    //        l++;
    //        return;
    //    }
    //    else
    //        flag = 1;
//    array[0][0] = 3;
//    array[0][1] = 3;
//    array[0][2] = 7;
//    array[0][3] = 7;

    if (sumIs24(sum)&&n==1) {
        l++;
        
        for (int i = 0; i<3; i++) {
            printf("%s ",string[i]);
//            [self.str initWithCString:<#(nonnull const char *)#> encoding:<#(NSStringEncoding)#>];
            NSString *astring = [[NSString alloc] initWithCString:string[i]];
            if([astring isEqualToString:@""]){
                continue;
            }
            [self.str appendString:astring];
            [self.str appendString:@"  "];
        }
//        [self.array1 addObject:_str];
        [self.str appendString:@"\n"];
        printf("\n");
        return;
    }
    for (int i = 0; i<6; i++) {
        for (int j = 0; j<n-1; j++) {
            for (int k = j+1; k<n; k++) {
                sum = caculate(array[4-n][j], array[4-n][k], i);
                array[5-n][0] = sum;
                switch (i) {
                    case 0:
                        sprintf(string[4-n], "%g+%g=%g ",array[4-n][j],array[4-n][k],sum);
                        break;
                    case 1:
                        sprintf(string[4-n], "%g-%g=%g ",array[4-n][j],array[4-n][k],sum);
                        break;
                    case 2:
                        sprintf(string[4-n], "%g*%g=%g ",array[4-n][j],array[4-n][k],sum);
                        break;
                    case 3:
                        sprintf(string[4-n], "%g/%g=%g ",array[4-n][j],array[4-n][k],sum);
                        break;
                    case 4:
                        sprintf(string[4-n], "%g-%g=%g ",array[4-n][k],array[4-n][j],sum);
                        break;
                    case 5:
                        sprintf(string[4-n], "%g/%g=%g ",array[4-n][k],array[4-n][j],sum);
                        
                    default:
                        break;
                }
                for (int t = 0; t<n; t++) {
                    if (t!=j&&t!=k) {
                        array[5-n][1] = array[4-n][t];
                        for (int m = 0; m<n; m++) {
                            if (m!=t&&m!=j&&m!=k) {
                                array[5-n][2] = array[4-n][m];
                            }
                        }
                    }
                }
                [self dfs:array numberWith:n-1];
            }
        }
    }
    
    
}


-(void)calculate
{
    NSString *string1 = _textField1.text;
    NSString *string2 = _textField2.text;
    NSString *string3 = _textField3.text;
    NSString *string4 = _textField4.text;
    float num1 = [string1 floatValue];
    float num2 = [string2 floatValue];
    float num3 = [string3 floatValue];
    float num4 = [string4 floatValue];
    number[0][0] = num1;
    number[0][1] = num2;
    number[0][2] = num3;
    number[0][3] = num4;
    [self dfs:number numberWith:4];
//    NSString *str1 = [NSString stringWithFormat:@"%@",_array1];
//    _label.text = [NSString stringWithFormat:@"%@",_array1];
    _label.text = _str;

    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (string.length>0) {
        if ([string characterAtIndex:0]<='0' || [string characterAtIndex:0]>'9') {
            NSLog(@"请输入数字！");
            return  NO;
        }
        if (textField.text.length>=2) {
            NSLog(@"不能超过两位数");
            return NO;
        }
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
