//
//  YarukotoTableViewCell.m
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/24.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import "YarukotoTableViewCell.h"

@implementation YarukotoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /*
        複数行表示に対応するため、initでbodyLabel.numberOfLinesを0にしておきます。
        また、モデルのセッター(setMessage:)でbodyLabel.attributedText経由で本文を設定することで、行間を調整します。
        heightメソッドでは、boundingRectWithSize:を使って行の高さを返すようにします。
         */        
        _bodyLabel = [[UILabel alloc] init];
        // 行数制限なし
        _bodyLabel.numberOfLines = 0;
        [self addSubview:_bodyLabel];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    // パディング
    CGFloat pad = 5;
    
    // 本文ラベルのサイズ調整
    CGFloat bodyLabelW = self.bounds.size.width - pad * 2;
    CGFloat bodyLabelH = self.bounds.size.height - pad * 2;
    self.bodyLabel.frame = CGRectMake(pad, pad, bodyLabelW, bodyLabelH);
}

-(void) setBody:(NSString*)body {
	_body = body;
    
	// 行間設定
	CGFloat lineHeight = 16.0;
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.minimumLineHeight = lineHeight;
	paragrahStyle.maximumLineHeight = lineHeight;
	// 本文
	NSString *text = (_body == nil) ? @"" : _body;
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:20];
	NSDictionary *attributes = @{NSParagraphStyleAttributeName: paragrahStyle,
								 NSFontAttributeName: font};
	NSAttributedString *atext = [[NSAttributedString alloc] initWithString:text attributes:attributes];
	self.bodyLabel.attributedText = atext;
}

-(CGFloat) height {
	CGFloat pad = 5;
	CGFloat bodyLabelW = self.bodyLabel.bounds.size.width;
	CGSize bodySize = [self.bodyLabel.attributedText boundingRectWithSize:CGSizeMake(bodyLabelW, MAXFLOAT)
                                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                                                  context:nil].size;
    CGFloat h =bodySize.height + pad * 2;
	return h;
}

@end
