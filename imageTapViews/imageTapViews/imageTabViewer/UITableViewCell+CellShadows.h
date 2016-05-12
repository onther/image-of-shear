//
//  UITableViewCell+CellShadows.h
//  imageTapViews
//
//  Created by mac on 16/4/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CellShadows)
/** adds a drop shadow to the background view of the (grouped) cell */
- (void)addShadowToCellInTableView:(UITableView *)tableView
                       atIndexPath:(NSIndexPath *)indexPath;

@end
