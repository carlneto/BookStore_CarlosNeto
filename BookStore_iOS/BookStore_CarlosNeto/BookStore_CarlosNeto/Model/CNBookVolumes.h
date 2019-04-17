//
//  CNBookVolumes.h
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 16/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

// GENERATED FROM RESPONSE

#import <Foundation/Foundation.h>

@class CNBookVolumes;
@class CNItem;
@class CNAccessInfo;
@class CNAccessViewStatus;
@class CNCountry;
@class CNEpub;
@class CNTextToSpeechPermission;
@class CNViewability;
@class CNKind;
@class CNSaleInfo;
@class CNSaleInfoListPrice;
@class CNCurrencyCode;
@class CNOffer;
@class CNOfferListPrice;
@class CNSaleability;
@class CNSearchInfo;
@class CNVolumeInfo;
@class CNCategory;
@class CNImageLinks;
@class CNIndustryIdentifier;
@class CNType;
@class CNLanguage;
@class CNMaturityRating;
@class CNPanelizationSummary;
@class CNPrintType;
@class CNReadingModes;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface CNAccessViewStatus : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNAccessViewStatus *)none;
+ (CNAccessViewStatus *)sample;
@end

@interface CNCountry : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNCountry *)pt;
@end

@interface CNTextToSpeechPermission : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNTextToSpeechPermission *)allowed;
+ (CNTextToSpeechPermission *)allowedForAccessibility;
@end

@interface CNViewability : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNViewability *)noPages;
+ (CNViewability *)partial;
@end

@interface CNKind : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNKind *)booksVolume;
@end

@interface CNCurrencyCode : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNCurrencyCode *)eur;
@end

@interface CNSaleability : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNSaleability *)forSale;
+ (CNSaleability *)notForSale;
@end

@interface CNCategory : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNCategory *)computers;
@end

@interface CNType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNType *)isbn10;
+ (CNType *)isbn13;
@end

@interface CNLanguage : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNLanguage *)en;
+ (CNLanguage *)pt;
@end

@interface CNMaturityRating : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNMaturityRating *)notMature;
@end

@interface CNPrintType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (CNPrintType *)book;
@end

#pragma mark - Object interfaces

@interface CNBookVolumes : NSObject
@property (nonatomic, copy)   NSString *kind;
@property (nonatomic, assign) NSInteger totalItems;
@property (nonatomic, copy)   NSMutableArray<CNItem *> *items;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface CNItem : NSObject
@property (nonatomic, assign)           CNKind *kind;
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, copy)             NSString *etag;
@property (nonatomic, copy)             NSString *selfLink;
@property (nonatomic, strong)           CNVolumeInfo *volumeInfo;
@property (nonatomic, strong)           CNSaleInfo *saleInfo;
@property (nonatomic, strong)           CNAccessInfo *accessInfo;
@property (nonatomic, nullable, strong) CNSearchInfo *searchInfo;
- (void)setFav:(BOOL)isFav;
- (BOOL)isFav;
@end

@interface CNAccessInfo : NSObject
@property (nonatomic, assign) CNCountry *country;
@property (nonatomic, assign) CNViewability *viewability;
@property (nonatomic, assign) BOOL isEmbeddable;
@property (nonatomic, assign) BOOL isPublicDomain;
@property (nonatomic, assign) CNTextToSpeechPermission *textToSpeechPermission;
@property (nonatomic, strong) CNEpub *epub;
@property (nonatomic, strong) CNEpub *pdf;
@property (nonatomic, copy)   NSString *webReaderLink;
@property (nonatomic, assign) CNAccessViewStatus *accessViewStatus;
@property (nonatomic, assign) BOOL isQuoteSharingAllowed;
@end

@interface CNEpub : NSObject
@property (nonatomic, assign)         BOOL isAvailable;
@property (nonatomic, nullable, copy) NSString *acsTokenLink;
@end

@interface CNSaleInfo : NSObject
@property (nonatomic, assign)           CNCountry *country;
@property (nonatomic, assign)           CNSaleability *saleability;
@property (nonatomic, assign)           BOOL isEbook;
@property (nonatomic, nullable, strong) CNSaleInfoListPrice *listPrice;
@property (nonatomic, nullable, strong) CNSaleInfoListPrice *retailPrice;
@property (nonatomic, nullable, copy)   NSString *buyLink;
@property (nonatomic, nullable, copy)   NSArray<CNOffer *> *offers;
@end

@interface CNSaleInfoListPrice : NSObject
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) CNCurrencyCode *currencyCode;
@end

@interface CNOffer : NSObject
@property (nonatomic, assign) NSInteger finskyOfferType;
@property (nonatomic, strong) CNOfferListPrice *listPrice;
@property (nonatomic, strong) CNOfferListPrice *retailPrice;
@end

@interface CNOfferListPrice : NSObject
@property (nonatomic, assign) NSInteger amountInMicros;
@property (nonatomic, assign) CNCurrencyCode *currencyCode;
@end

@interface CNSearchInfo : NSObject
@property (nonatomic, copy) NSString *textSnippet;
@end

@interface CNVolumeInfo : NSObject
@property (nonatomic, copy)             NSString *title;
@property (nonatomic, nullable, copy)   NSString *subtitle;
@property (nonatomic, nullable, copy)   NSArray<NSString *> *authors;
@property (nonatomic, copy)             NSString *publisher;
@property (nonatomic, nullable, copy)   NSString *publishedDate;
@property (nonatomic, nullable, copy)   NSString *theDescription;
@property (nonatomic, nullable, copy)   NSArray<CNIndustryIdentifier *> *industryIdentifiers;
@property (nonatomic, strong)           CNReadingModes *readingModes;
@property (nonatomic, nullable, strong) NSNumber *pageCount;
@property (nonatomic, assign)           CNPrintType *printType;
@property (nonatomic, nullable, copy)   NSArray<CNCategory *> *categories;
@property (nonatomic, assign)           CNMaturityRating *maturityRating;
@property (nonatomic, assign)           BOOL isAllowAnonLogging;
@property (nonatomic, copy)             NSString *contentVersion;
@property (nonatomic, nullable, strong) CNPanelizationSummary *panelizationSummary;
@property (nonatomic, strong)           CNImageLinks *imageLinks;
@property (nonatomic, assign)           CNLanguage *language;
@property (nonatomic, copy)             NSString *previewLink;
@property (nonatomic, copy)             NSString *infoLink;
@property (nonatomic, copy)             NSString *canonicalVolumeLink;
@property (nonatomic, nullable, strong) NSNumber *averageRating;
@property (nonatomic, nullable, strong) NSNumber *ratingsCount;
@end

@interface CNImageLinks : NSObject
@property (nonatomic, copy) NSString *smallThumbnail;
@property (nonatomic, copy) NSString *thumbnail;
@end

@interface CNIndustryIdentifier : NSObject
@property (nonatomic, assign) CNType *type;
@property (nonatomic, copy)   NSString *identifier;
@end

@interface CNPanelizationSummary : NSObject
@property (nonatomic, assign) BOOL isContainsEpubBubbles;
@property (nonatomic, assign) BOOL isContainsImageBubbles;
@end

@interface CNReadingModes : NSObject
@property (nonatomic, assign) BOOL isText;
@property (nonatomic, assign) BOOL isImage;
@end

NS_ASSUME_NONNULL_END
