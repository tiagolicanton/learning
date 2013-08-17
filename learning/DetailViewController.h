//
//  DetailViewController.h
//  learning
//
//  Created by 脚脚 on 8/17/13.
//  Copyright (c) 2013 脚脚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
