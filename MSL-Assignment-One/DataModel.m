//
//  DataModel.m
//  MSL-Assignment-One
//
//  Created by UbiComp on 9/9/21.
//

#import "DataModel.h"

@implementation DataModel
@synthesize charNames = _charNames;
@synthesize stageNames = _stageNames;
@synthesize musicNames = _musicNames;

+(DataModel*)sharedInstance {
    static DataModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[DataModel alloc] init];
    });
    return _sharedInstance;
}

//
//Array Getters
//
-(NSArray*)charNames {
    if(!_charNames) {
        [self loadNames];
    }
    return _charNames;
}

-(NSArray*)stageNames {
    if(!_stageNames) {
        [self loadNames];
    }
    return _stageNames;
}

-(NSArray*)musicNames {
    if(!_musicNames) {
        [self loadNames];
    }
    return _musicNames;
}


-(int)loadNames {
    NSDictionary* fileDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Names" ofType:@"plist"]];
    
    _charNames = [fileDict objectForKey:@"Characters"];
    _stageNames = [fileDict objectForKey:@"Stages"];
    _musicNames = [fileDict objectForKey:@"Music"];
    
    return 1;
}

-(UIImage*)getImageWithName:(NSString*)name {
    UIImage* image = nil;
    
    
    image = [UIImage imageNamed:name];
    
    return image;
}

-(NSArray*)getAllChars {
    return _charNames;
}

-(NSInteger)numberOfChars { return self.charNames.count; }
-(NSInteger)numberOfStages { return self.stageNames.count; }
-(NSInteger)numberOfMusic { return self.musicNames.count; }

-(NSString*)getCharNameForIndex:(NSInteger)index {
    return self.charNames[index]; //_charNames[index];
}
-(NSString*)getStageNameForIndex:(NSInteger)index {
    return self.stageNames[index]; //_stageNames[index];
}
-(NSString*)getMusicNameForIndex:(NSInteger)index {
    return self.musicNames[index]; //_musicNames[index];
}



@end
