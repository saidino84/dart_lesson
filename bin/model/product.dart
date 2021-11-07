// :author Saidino Python developer
// www.github.com/saidino84/ali_spar.git
class Product {
  String? id;
  double? price;
  String? description;
  String? name;
  String? code;
  String? category;
  bool available;
  String? imageUrl;
  String? expiredate;
  String? prod_detail_uri;
  bool? expired;
  int? likes;
  String? comments;
  String? notifications;

  Product({
    this.price = 1.0,
    this.description = 'sem descricao por enquanto',
    this.category = 'Desconhecido',
    this.imageUrl,
    this.expiredate,
    this.expired,
    this.comments,
    this.prod_detail_uri,
    this.available = false,
    this.code,
    this.likes = 1,
    this.name,
    this.notifications,
  });

  factory Product.fromJsonFlask(Map<String, dynamic> json) {
    var price = json["price"];
    try {
      if (price != null) {
        price = double.tryParse(price.toString().toLowerCase().split('mt')[0]);
        // print('PRECO  de ${json["product_name"]} FOI PEGO e  de $price');
      } else {
        print("PRECO FOI NULL ==> $price");
      }
    } catch (e) {
      print("ERRO AO PEGAR O PRECO FOI $e");
    }
    return Product(
      price: price,
      name: json["product_name"] ?? 'sem nome' as String?,
      prod_detail_uri: json['prod_details'],
      // code: json["code"] ?? '00001' as String?,
      // expired: json["expired"] ?? false as bool?,
      // expiredate: json["expiredate"] as String?,
      // comments: json["comments"] ?? '< no commets >' as String?,
      // likes: json["likes"] ?? 0 as int?,
      // category: json["category"] ?? 'Nao categorizado' as String?,
      description:
          json["description"] ?? ' sem descricao por enquanto !' as String?,
      imageUrl: json["url_img"] ??
          'https://vipspar.com/wp-content/themes/martfury/images/bg-404.jpg'
              as String?,
      notifications: json["notifications"] ?? 'sem notificacao' as String?,
    );
  }
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json["price"] ?? false as double?,
      name: json["name"] ?? 'sem nome' as String?,
      code: json["code"] ?? '00001' as String?,
      expired: json["expired"] ?? false as bool?,
      expiredate: json["expiredate"] as String?,
      comments: json["comments"] ?? '< no commets >' as String?,
      likes: json["likes"] ?? 0 as int?,
      category: json["category"] ?? 'Nao categorizado' as String?,
      description:
          json["description"] ?? ' sem descricao por enquanto !' as String?,
      imageUrl: json["imageUrl"] ??
          'https://vipspar.com/wp-content/themes/martfury/images/bg-404.jpg'
              as String?,
      notifications: json["notifications"] ?? 'sem notificacao' as String?,
    );
  }
  Map<String, dynamic> toJson() => {
        "code": this.code,
        "price": this.price,
        "name": this.name,
        "notifications": this.notifications,
        "category": this.category,
        "likes": this.likes,
        "imageUrl": this.imageUrl,
        "description": this.description,
        "expired": this.expired,
        "expiredate": this.expiredate,
        "comments": this.comments,
      };

  Product copyWith({
    String? id,
    double? price,
    String? description,
    String? name,
    String? code,
    String? category,
    String? imageUrl,
    String? expiredate,
    bool? expired,
    int? likes,
    String? comments,
    String? notifications,
  }) {
    return Product(
      price: price ?? this.price,
      name: name ?? this.name,
      code: code ?? this.code,
      expired: expired ?? this.expired,
      expiredate: expiredate ?? this.expiredate,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      notifications: notifications ?? this.notifications,
    );
  }
}
