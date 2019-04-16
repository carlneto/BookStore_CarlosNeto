//
//  CNBookVolumes.m
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 16/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import "CNBookVolumes.h"

#define λ(decl, expr) (^(decl) { return (expr); })

static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

@interface CNBookVolumes (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNItem (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNAccessInfo (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNEpub (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNSaleInfo (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNSaleInfoListPrice (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNOffer (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNOfferListPrice (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNSearchInfo (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNVolumeInfo (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNImageLinks (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNIndustryIdentifier (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNPanelizationSummary (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface CNReadingModes (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@implementation CNAccessViewStatus
+ (NSDictionary<NSString *, CNAccessViewStatus *> *)values
{
    static NSDictionary<NSString *, CNAccessViewStatus *> *values;
    return values = values ? values : @{
                                        @"NONE": [[CNAccessViewStatus alloc] initWithValue:@"NONE"],
                                        @"SAMPLE": [[CNAccessViewStatus alloc] initWithValue:@"SAMPLE"],
                                        };
}

+ (CNAccessViewStatus *)none { return CNAccessViewStatus.values[@"NONE"]; }
+ (CNAccessViewStatus *)sample { return CNAccessViewStatus.values[@"SAMPLE"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNAccessViewStatus.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNCountry
+ (NSDictionary<NSString *, CNCountry *> *)values
{
    static NSDictionary<NSString *, CNCountry *> *values;
    return values = values ? values : @{
                                        @"PT": [[CNCountry alloc] initWithValue:@"PT"],
                                        };
}

+ (CNCountry *)pt { return CNCountry.values[@"PT"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNCountry.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNTextToSpeechPermission
+ (NSDictionary<NSString *, CNTextToSpeechPermission *> *)values
{
    static NSDictionary<NSString *, CNTextToSpeechPermission *> *values;
    return values = values ? values : @{
                                        @"ALLOWED": [[CNTextToSpeechPermission alloc] initWithValue:@"ALLOWED"],
                                        @"ALLOWED_FOR_ACCESSIBILITY": [[CNTextToSpeechPermission alloc] initWithValue:@"ALLOWED_FOR_ACCESSIBILITY"],
                                        };
}

+ (CNTextToSpeechPermission *)allowed { return CNTextToSpeechPermission.values[@"ALLOWED"]; }
+ (CNTextToSpeechPermission *)allowedForAccessibility { return CNTextToSpeechPermission.values[@"ALLOWED_FOR_ACCESSIBILITY"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNTextToSpeechPermission.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNViewability
+ (NSDictionary<NSString *, CNViewability *> *)values
{
    static NSDictionary<NSString *, CNViewability *> *values;
    return values = values ? values : @{
                                        @"NO_PAGES": [[CNViewability alloc] initWithValue:@"NO_PAGES"],
                                        @"PARTIAL": [[CNViewability alloc] initWithValue:@"PARTIAL"],
                                        };
}

+ (CNViewability *)noPages { return CNViewability.values[@"NO_PAGES"]; }
+ (CNViewability *)partial { return CNViewability.values[@"PARTIAL"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNViewability.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNKind
+ (NSDictionary<NSString *, CNKind *> *)values
{
    static NSDictionary<NSString *, CNKind *> *values;
    return values = values ? values : @{
                                        @"books#volume": [[CNKind alloc] initWithValue:@"books#volume"],
                                        };
}

+ (CNKind *)booksVolume { return CNKind.values[@"books#volume"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNKind.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNCurrencyCode
+ (NSDictionary<NSString *, CNCurrencyCode *> *)values
{
    static NSDictionary<NSString *, CNCurrencyCode *> *values;
    return values = values ? values : @{
                                        @"EUR": [[CNCurrencyCode alloc] initWithValue:@"EUR"],
                                        };
}

+ (CNCurrencyCode *)eur { return CNCurrencyCode.values[@"EUR"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNCurrencyCode.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNSaleability
+ (NSDictionary<NSString *, CNSaleability *> *)values
{
    static NSDictionary<NSString *, CNSaleability *> *values;
    return values = values ? values : @{
                                        @"FOR_SALE": [[CNSaleability alloc] initWithValue:@"FOR_SALE"],
                                        @"NOT_FOR_SALE": [[CNSaleability alloc] initWithValue:@"NOT_FOR_SALE"],
                                        };
}

+ (CNSaleability *)forSale { return CNSaleability.values[@"FOR_SALE"]; }
+ (CNSaleability *)notForSale { return CNSaleability.values[@"NOT_FOR_SALE"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNSaleability.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNCategory
+ (NSDictionary<NSString *, CNCategory *> *)values
{
    static NSDictionary<NSString *, CNCategory *> *values;
    return values = values ? values : @{
                                        @"Computers": [[CNCategory alloc] initWithValue:@"Computers"],
                                        };
}

+ (CNCategory *)computers { return CNCategory.values[@"Computers"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNCategory.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNType
+ (NSDictionary<NSString *, CNType *> *)values
{
    static NSDictionary<NSString *, CNType *> *values;
    return values = values ? values : @{
                                        @"ISBN_10": [[CNType alloc] initWithValue:@"ISBN_10"],
                                        @"ISBN_13": [[CNType alloc] initWithValue:@"ISBN_13"],
                                        };
}

+ (CNType *)isbn10 { return CNType.values[@"ISBN_10"]; }
+ (CNType *)isbn13 { return CNType.values[@"ISBN_13"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNLanguage
+ (NSDictionary<NSString *, CNLanguage *> *)values
{
    static NSDictionary<NSString *, CNLanguage *> *values;
    return values = values ? values : @{
                                        @"en": [[CNLanguage alloc] initWithValue:@"en"],
                                        @"pt": [[CNLanguage alloc] initWithValue:@"pt"],
                                        };
}

+ (CNLanguage *)en { return CNLanguage.values[@"en"]; }
+ (CNLanguage *)pt { return CNLanguage.values[@"pt"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNLanguage.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNMaturityRating
+ (NSDictionary<NSString *, CNMaturityRating *> *)values
{
    static NSDictionary<NSString *, CNMaturityRating *> *values;
    return values = values ? values : @{
                                        @"NOT_MATURE": [[CNMaturityRating alloc] initWithValue:@"NOT_MATURE"],
                                        };
}

+ (CNMaturityRating *)notMature { return CNMaturityRating.values[@"NOT_MATURE"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNMaturityRating.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation CNPrintType
+ (NSDictionary<NSString *, CNPrintType *> *)values
{
    static NSDictionary<NSString *, CNPrintType *> *values;
    return values = values ? values : @{
                                        @"BOOK": [[CNPrintType alloc] initWithValue:@"BOOK"],
                                        };
}

+ (CNPrintType *)book { return CNPrintType.values[@"BOOK"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return CNPrintType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection)
        {
            id y = f(x);
            if (y) {
                [result addObject:y];
            }
        }
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

CNBookVolumes *_Nullable CNBookVolumesFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [CNBookVolumes fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

CNBookVolumes *_Nullable CNBookVolumesFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return CNBookVolumesFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable CNBookVolumesToData(CNBookVolumes *volumes, NSError **error)
{
    @try {
        id json = [volumes JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable CNBookVolumesToJSON(CNBookVolumes *volumes, NSStringEncoding encoding, NSError **error)
{
    NSData *data = CNBookVolumesToData(volumes, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation CNBookVolumes
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"kind": @"kind",
                                                    @"totalItems": @"totalItems",
                                                    @"items": @"items",
                                                    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return CNBookVolumesFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return CNBookVolumesFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNBookVolumes alloc] initWithJSONDictionary:dict] : [[CNBookVolumes alloc] init];
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _items = map(_items, λ(id x, [CNItem fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNBookVolumes.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"items": map(_items, λ(id x, [x JSONDictionary])),
                                     }];
    
    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return CNBookVolumesToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return CNBookVolumesToJSON(self, encoding, error);
}
@end

@implementation CNItem
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"kind": @"kind",
                                                    @"id": @"identifier",
                                                    @"etag": @"etag",
                                                    @"selfLink": @"selfLink",
                                                    @"volumeInfo": @"volumeInfo",
                                                    @"saleInfo": @"saleInfo",
                                                    @"accessInfo": @"accessInfo",
                                                    @"searchInfo": @"searchInfo",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNItem alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _kind = [CNKind withValue:(id)_kind];
        _volumeInfo = [CNVolumeInfo fromJSONDictionary:(id)_volumeInfo];
        _saleInfo = [CNSaleInfo fromJSONDictionary:(id)_saleInfo];
        _accessInfo = [CNAccessInfo fromJSONDictionary:(id)_accessInfo];
        _searchInfo = [CNSearchInfo fromJSONDictionary:(id)_searchInfo];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = CNItem.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNItem.properties.allValues] mutableCopy];
    
    for (id jsonName in CNItem.properties) {
        id propertyName = CNItem.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"kind": [_kind value],
                                     @"volumeInfo": [_volumeInfo JSONDictionary],
                                     @"saleInfo": [_saleInfo JSONDictionary],
                                     @"accessInfo": [_accessInfo JSONDictionary],
                                     @"searchInfo": NSNullify([_searchInfo JSONDictionary]),
                                     }];
    
    return dict;
}
@end

@implementation CNAccessInfo
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"country": @"country",
                                                    @"viewability": @"viewability",
                                                    @"embeddable": @"isEmbeddable",
                                                    @"publicDomain": @"isPublicDomain",
                                                    @"textToSpeechPermission": @"textToSpeechPermission",
                                                    @"epub": @"epub",
                                                    @"pdf": @"pdf",
                                                    @"webReaderLink": @"webReaderLink",
                                                    @"accessViewStatus": @"accessViewStatus",
                                                    @"quoteSharingAllowed": @"isQuoteSharingAllowed",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNAccessInfo alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _country = [CNCountry withValue:(id)_country];
        _viewability = [CNViewability withValue:(id)_viewability];
        _textToSpeechPermission = [CNTextToSpeechPermission withValue:(id)_textToSpeechPermission];
        _epub = [CNEpub fromJSONDictionary:(id)_epub];
        _pdf = [CNEpub fromJSONDictionary:(id)_pdf];
        _accessViewStatus = [CNAccessViewStatus withValue:(id)_accessViewStatus];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = CNAccessInfo.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNAccessInfo.properties.allValues] mutableCopy];
    
    for (id jsonName in CNAccessInfo.properties) {
        id propertyName = CNAccessInfo.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"country": [_country value],
                                     @"viewability": [_viewability value],
                                     @"embeddable": _isEmbeddable ? @YES : @NO,
                                     @"publicDomain": _isPublicDomain ? @YES : @NO,
                                     @"textToSpeechPermission": [_textToSpeechPermission value],
                                     @"epub": [_epub JSONDictionary],
                                     @"pdf": [_pdf JSONDictionary],
                                     @"accessViewStatus": [_accessViewStatus value],
                                     @"quoteSharingAllowed": _isQuoteSharingAllowed ? @YES : @NO,
                                     }];
    
    return dict;
}
@end

@implementation CNEpub
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"isAvailable": @"isAvailable",
                                                    @"acsTokenLink": @"acsTokenLink",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNEpub alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNEpub.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"isAvailable": _isAvailable ? @YES : @NO,
                                     }];
    
    return dict;
}
@end

@implementation CNSaleInfo
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"country": @"country",
                                                    @"saleability": @"saleability",
                                                    @"isEbook": @"isEbook",
                                                    @"listPrice": @"listPrice",
                                                    @"retailPrice": @"retailPrice",
                                                    @"buyLink": @"buyLink",
                                                    @"offers": @"offers",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNSaleInfo alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _country = [CNCountry withValue:(id)_country];
        _saleability = [CNSaleability withValue:(id)_saleability];
        _listPrice = [CNSaleInfoListPrice fromJSONDictionary:(id)_listPrice];
        _retailPrice = [CNSaleInfoListPrice fromJSONDictionary:(id)_retailPrice];
        _offers = map(_offers, λ(id x, [CNOffer fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNSaleInfo.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"country": [_country value],
                                     @"saleability": [_saleability value],
                                     @"isEbook": _isEbook ? @YES : @NO,
                                     @"listPrice": NSNullify([_listPrice JSONDictionary]),
                                     @"retailPrice": NSNullify([_retailPrice JSONDictionary]),
                                     @"offers": NSNullify(map(_offers, λ(id x, [x JSONDictionary]))),
                                     }];
    
    return dict;
}
@end

@implementation CNSaleInfoListPrice
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"amount": @"amount",
                                                    @"currencyCode": @"currencyCode",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNSaleInfoListPrice alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _currencyCode = [CNCurrencyCode withValue:(id)_currencyCode];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNSaleInfoListPrice.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"currencyCode": [_currencyCode value],
                                     }];
    
    return dict;
}
@end

@implementation CNOffer
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"finskyOfferType": @"finskyOfferType",
                                                    @"listPrice": @"listPrice",
                                                    @"retailPrice": @"retailPrice",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNOffer alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _listPrice = [CNOfferListPrice fromJSONDictionary:(id)_listPrice];
        _retailPrice = [CNOfferListPrice fromJSONDictionary:(id)_retailPrice];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNOffer.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"listPrice": [_listPrice JSONDictionary],
                                     @"retailPrice": [_retailPrice JSONDictionary],
                                     }];
    
    return dict;
}
@end

@implementation CNOfferListPrice
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"amountInMicros": @"amountInMicros",
                                                    @"currencyCode": @"currencyCode",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNOfferListPrice alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _currencyCode = [CNCurrencyCode withValue:(id)_currencyCode];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNOfferListPrice.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"currencyCode": [_currencyCode value],
                                     }];
    
    return dict;
}
@end

@implementation CNSearchInfo
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"textSnippet": @"textSnippet",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNSearchInfo alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:CNSearchInfo.properties.allValues];
}
@end

@implementation CNVolumeInfo
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"title": @"title",
                                                    @"subtitle": @"subtitle",
                                                    @"authors": @"authors",
                                                    @"publisher": @"publisher",
                                                    @"publishedDate": @"publishedDate",
                                                    @"description": @"theDescription",
                                                    @"industryIdentifiers": @"industryIdentifiers",
                                                    @"readingModes": @"readingModes",
                                                    @"pageCount": @"pageCount",
                                                    @"printType": @"printType",
                                                    @"categories": @"categories",
                                                    @"maturityRating": @"maturityRating",
                                                    @"allowAnonLogging": @"isAllowAnonLogging",
                                                    @"contentVersion": @"contentVersion",
                                                    @"panelizationSummary": @"panelizationSummary",
                                                    @"imageLinks": @"imageLinks",
                                                    @"language": @"language",
                                                    @"previewLink": @"previewLink",
                                                    @"infoLink": @"infoLink",
                                                    @"canonicalVolumeLink": @"canonicalVolumeLink",
                                                    @"averageRating": @"averageRating",
                                                    @"ratingsCount": @"ratingsCount",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNVolumeInfo alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _industryIdentifiers = map(_industryIdentifiers, λ(id x, [CNIndustryIdentifier fromJSONDictionary:x]));
        _readingModes = [CNReadingModes fromJSONDictionary:(id)_readingModes];
        _printType = [CNPrintType withValue:(id)_printType];
        _categories = map(_categories, λ(id x, [CNCategory withValue:x]));
        _maturityRating = [CNMaturityRating withValue:(id)_maturityRating];
        _panelizationSummary = [CNPanelizationSummary fromJSONDictionary:(id)_panelizationSummary];
        _imageLinks = [CNImageLinks fromJSONDictionary:(id)_imageLinks];
        _language = [CNLanguage withValue:(id)_language];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = CNVolumeInfo.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNVolumeInfo.properties.allValues] mutableCopy];
    
    for (id jsonName in CNVolumeInfo.properties) {
        id propertyName = CNVolumeInfo.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"industryIdentifiers": NSNullify(map(_industryIdentifiers, λ(id x, [x JSONDictionary]))),
                                     @"readingModes": [_readingModes JSONDictionary],
                                     @"printType": [_printType value],
                                     @"categories": NSNullify(map(_categories, λ(id x, [x value]))),
                                     @"maturityRating": [_maturityRating value],
                                     @"allowAnonLogging": _isAllowAnonLogging ? @YES : @NO,
                                     @"panelizationSummary": NSNullify([_panelizationSummary JSONDictionary]),
                                     @"imageLinks": [_imageLinks JSONDictionary],
                                     @"language": [_language value],
                                     }];
    
    return dict;
}
@end

@implementation CNImageLinks
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"smallThumbnail": @"smallThumbnail",
                                                    @"thumbnail": @"thumbnail",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNImageLinks alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:CNImageLinks.properties.allValues];
}
@end

@implementation CNIndustryIdentifier
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"type": @"type",
                                                    @"identifier": @"identifier",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNIndustryIdentifier alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _type = [CNType withValue:(id)_type];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNIndustryIdentifier.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"type": [_type value],
                                     }];
    
    return dict;
}
@end

@implementation CNPanelizationSummary
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"containsEpubBubbles": @"isContainsEpubBubbles",
                                                    @"containsImageBubbles": @"isContainsImageBubbles",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNPanelizationSummary alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = CNPanelizationSummary.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNPanelizationSummary.properties.allValues] mutableCopy];
    
    for (id jsonName in CNPanelizationSummary.properties) {
        id propertyName = CNPanelizationSummary.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"containsEpubBubbles": _isContainsEpubBubbles ? @YES : @NO,
                                     @"containsImageBubbles": _isContainsImageBubbles ? @YES : @NO,
                                     }];
    
    return dict;
}
@end

@implementation CNReadingModes
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"text": @"isText",
                                                    @"image": @"isImage",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[CNReadingModes alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = CNReadingModes.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:CNReadingModes.properties.allValues] mutableCopy];
    
    for (id jsonName in CNReadingModes.properties) {
        id propertyName = CNReadingModes.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"text": _isText ? @YES : @NO,
                                     @"image": _isImage ? @YES : @NO,
                                     }];
    
    return dict;
}
@end

NS_ASSUME_NONNULL_END
