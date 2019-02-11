//
//  MovieCollectionViewCell.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 11/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imegeView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *voteLabel;
@property (weak, nonatomic) IBOutlet UILabel *popularityLabel;

@end

NS_ASSUME_NONNULL_END
