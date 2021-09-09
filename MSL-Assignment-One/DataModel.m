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

@synthesize charDict = _charDict;
@synthesize stageDict = _stageDict;
@synthesize musicDict = _musicDict;

+(DataModel*)sharedInstance {
    static DataModel* _sharedInstance = nil;
    static dispatch_once_t predicate = nil;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[DataModel alloc] init];
    });
    return _sharedInstance;
}

//
//Array Getters
//
-(NSMutableArray*)charNames {
    if(!_charNames) {
        
    }
    
    return _charNames;
}

-(NSMutableArray*)stageNames {
    if(!_stageNames) {
        
    }
    return _stageNames;
}

-(NSMutableArray*)musicNames {
    if(!_musicNames) {
        
    }
    return _musicNames;
}

//
//Dictionary Getters
//
-(NSMutableDictionary*)charDict {
    if(!_charDict) {
        
    }
    return _charDict;
}

-(NSMutableDictionary*)stageDict {
    if(!_stageDict) {
        
    }
    return _stageDict;
}

-(NSMutableDictionary*)musicDict {
    if(!_musicDict) {
        
    }
    return _musicDict;
}

@end
