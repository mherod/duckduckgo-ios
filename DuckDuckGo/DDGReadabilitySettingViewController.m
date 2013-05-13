//
//  DDGReadabilitySettingViewController.m
//  DuckDuckGo
//
//  Created by Johnnie Walker on 13/05/2013.
//
//

#import "DDGReadabilitySettingViewController.h"
#import "DDGSettingsViewController.h"
#import "DDGSearchController.h"

NSString * const DDGReadabilityModeKey = @"readability";

@implementation DDGReadabilitySettingViewController

- (void)configure
{
	self.title = NSLocalizedString(@"Region", @"View controller title");
    
    NSInteger readabilitySetting = [[NSUserDefaults standardUserDefaults] integerForKey:DDGSettingStoriesReadabilityMode];
    
    [self addRadioOptionWithTitle:@"Off" value:@(DDGReadabilityModeOff) key:DDGReadabilityModeKey selected:(readabilitySetting == DDGReadabilityModeOff)];
    [self addRadioOptionWithTitle:@"On if available" value:@(DDGReadabilityModeOnIfAvailable) key:DDGReadabilityModeKey selected:(readabilitySetting == DDGReadabilityModeOnIfAvailable)];
    [self addRadioOptionWithTitle:@"Readability only" value:@(DDGReadabilityModeOnExclusive) key:DDGReadabilityModeKey selected:(readabilitySetting == DDGReadabilityModeOnExclusive)];
    
}

-(void)saveData:(NSDictionary *)formData {
    NSNumber *readabilitySetting = [formData objectForKey:DDGReadabilityModeKey];
    [[NSUserDefaults standardUserDefaults] setInteger:[readabilitySetting integerValue] forKey:DDGSettingStoriesReadabilityMode];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    [self saveData:[self formData]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[self searchControllerDDG] popContentViewControllerAnimated:YES];
}

@end
