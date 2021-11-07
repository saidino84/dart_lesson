import 'package:dio/dio.dart';

import '../model/product.dart';
import '../scrap/spar.dart';

class FlaskApiRepository {
  final _dio = Dio();
  static final link = 'https://flaskchatbotmoz.herokuapp.com/get_fruits';

  Future<List<Product>> getProducts() async {
    var resp = await _dio.get(link);
    List<Product> prods = [];
    var p = resp.data['fruits'].map((element) async {
      Product product = Product.fromJsonFlask(element);
      var scraper = SparScraper.spardomain(domain: 'https://vipspar.com');
      print('Pegue o link de details ${product.prod_detail_uri}');
      var details = await scraper.get_spar_items('${product.prod_detail_uri}');

      var prod = product.copyWith(
          code: details['code'], category: details['category']);

      print(
          "Product: ${prod.name}  \ncode: ${prod.code} \ncategory: ${prod.category}");
      print('*' * 12);
      prods.add(prod);
      // return prod;
    }).toList();

    return prods;
  }

  Future<Product> getProduct() async {
    var resp = await _dio.get(link);
    var prod_ = Product();
    var p = resp.data['fruits']
        .map<Product>((map) => Product.fromJsonFlask(map))
        .toList();
    return p[0];
  }
}
