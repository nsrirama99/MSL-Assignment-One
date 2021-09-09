//
//  DataModel.h
//  MSL-Assignment-One
//
//  Created by UbiComp on 9/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject

+(DataModel*)sharedInstance;

@property (nonatomic, strong) NSMutableArray* charNames;
@property (nonatomic, strong) NSMutableArray* stageNames;
@property (nonatomic, strong) NSMutableArray* musicNames;

@property (nonatomic, strong) NSMutableDictionary* charDict;
@property (nonatomic, strong) NSMutableDictionary* stageDict;
@property (nonatomic, strong) NSMutableDictionary* musicDict;

@end

NS_ASSUME_NONNULL_END
