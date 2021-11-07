import 'dart:async';

import 'model/book.dart';
import 'model/product.dart';
import 'repository/flask_repository.dart';
import 'scrap/spar.dart';

void main(List<String> arguments) async {
  // await getSparItems();
  var _query = '';
  List<Book> books = [];

  void searchBook(String query) {
    final _books = allbooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();
    _query = query;
    books = _books;
  }

  searchBook('sa');
  print('imprimindo o book');
  books.forEach((element) {
    print(element.title);
  });
}

Future<void> timerUtil() async {
  var dt = DateTime.now();
  final tim = DateTime.now().microsecondsSinceEpoch;

  Timer.periodic(Duration(seconds: 20), (t) {
    print('hi $tim');
  });
  final ag = DateTime.now().microsecondsSinceEpoch;
  print("past=$tim  ago=$ag");
  var d = tim - ag;
  print('difference $d then ${DateTime.fromMicrosecondsSinceEpoch(d)}');
}

Future<void> getSparItems() async {
  final repository = FlaskApiRepository();

  List<Product> products = await repository.getProducts();

  products.forEach((product) {
    print(
        'prod_name:${product.name} category =>${product.category} ${product.code}');
  });
}

Future<void> scraping_spar_test() async {
  var scraper = SparScraper.spardomain(domain: 'https://vipspar.com');
  // await scraper.get_contents();
  var endpoint = 'https://vipspar.com/shop/frutas-e-vegetais/banana-kg/'
      .split('https://vipspar.com')[1];
  Future.delayed(Duration(seconds: 2), () {
    print(endpoint);
    print('loading...');
  });
  final data = await scraper.get_spar_items(endpoint);

  print("categoria : ${data['category']} \n\n\ncode :${data['code']}");
}
