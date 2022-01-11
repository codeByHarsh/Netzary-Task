class DataModal {
  List<Categories> categories = [];
  List<Data> data = [];
  List<Transacts>? transacts;
  List<BackgroundImages> backgroundImages = [];

  DataModal.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    if (json['transacts'] != null) {
      transacts = <Transacts>[];
      json['transacts'].forEach((v) {
        transacts!.add(Transacts.fromJson(v));
      });
    }
    if (json['background_images'] != null) {
      backgroundImages = <BackgroundImages>[];
      json['background_images'].forEach((v) {
        backgroundImages.add(BackgroundImages.fromJson(v));
      });
    }
  }
}

class Transacts {
  String? name;
  int? id;
  String? slug;
  String? labelSeller;
  String? labelBuyer;
  String? icon;
  String? priceUnit;

  Transacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
    labelSeller = json['label_seller'];
    labelBuyer = json['label_buyer'];
    icon = json['icon'];
    priceUnit = json['price_unit'];
  }
}

class Categories {
  String? name;
  String? slug;
  String? icon;

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
  }
}

class Data {
  String? type;
  List<Items>? items;
  String? title;
  String? summary;
  int? icon;
  bool? twoLine;
  String? seeAll;

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    title = json['title'];
    summary = json['summary'];
    icon = json['icon'];
    twoLine = json['two_line'];
    seeAll = json['see_all'];
  }
}

class Items {
  String? title;
  String? image;
  String? link;
  double? minPrice;
  double? price;
  String? listingId;
  String? createdSince;
  String? updatedSince;
  Category? category;
  String? categorySlug;
  String? slug;
  List<Attributes>? attributes;
  String thumbnail =
      'https://images.unsplash.com/photo-1525550557089-27c1bfedd06c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80';
  bool? isSpam;
  bool? isPremium;
  bool? isVerified;
  String? expiryDate;
  String? offer;
  bool? isChatAllowed;
  bool? isOffensive;
  bool? isAuction;
  bool? outKashmir;
  int? viewers;
  String? status;
  String? locality;
  String? city;
  int? posted;
  Transact? transact;
  bool? inWishlist;

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    link = json['link'];
    minPrice = json['min_price'];
    price = json['price'];
    listingId = json['listing_id'];
    createdSince = json['created_since'];
    updatedSince = json['updated_since'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    categorySlug = json['category_slug'];
    slug = json['slug'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    if (json['thumbnail'] != null) {
      thumbnail = json['thumbnail'];
    }
    isSpam = json['is_spam'];
    isPremium = json['is_premium'];
    isVerified = json['is_verified'];
    expiryDate = json['expiry_date'];
    offer = json['offer'];
    isChatAllowed = json['is_chat_allowed'];
    isOffensive = json['is_offensive'];
    isAuction = json['is_auction'];
    outKashmir = json['out_kashmir'];
    viewers = json['viewers'];
    status = json['status'];
    locality = json['locality'];
    city = json['city'];
    posted = json['posted'];
    transact =
        json['transact'] != null ? Transact.fromJson(json['transact']) : null;
    inWishlist = json['in_wishlist'];
  }
}

class Category {
  String? name;
  String? slug;
  int? id;
  String? description;
  String? icon;

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Attributes {
  int? id;
  String? key;
  int? keyId;
  String? value;
  bool? required;
  int? ordering;
  String? unit;

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    keyId = json['key_id'];
    value = json['value'];
    required = json['required'];
    ordering = json['ordering'];
    unit = json['unit'];
  }
}

class Transact {
  String? name;
  int? id;
  String? slug;
  String? labelSeller;
  String? labelBuyer;
  String? icon;
  String? priceUnit;

  Transact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
    labelSeller = json['label_seller'];
    labelBuyer = json['label_buyer'];
    icon = json['icon'];
    priceUnit = json['price_unit'];
  }
}

class BackgroundImages {
  String? title;
  String? image;
  int? id;

  BackgroundImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
  }
}
