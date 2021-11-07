import 'package:web_scraper/web_scraper.dart';

class SparScraper {
  final String domain;
  var page = '/test-sites/e-commerce/allinone';
  // final webScraper = WebScraper('https://webscraper.io');
  late final WebScraper webScraper;
  SparScraper.spardomain({this.domain = 'https://vipspar.com'}) {
    webScraper = WebScraper(domain);
  }
  SparScraper.teste({this.domain = 'https://webscraper.io'}) {
    webScraper = WebScraper(domain);
  }

  Future<void> get_contents() async {
    if (domain.startsWith('https://webscraper.io')) {
      if (await webScraper
          .loadWebPage('/test-sites/e-commerce/allinone/computers/laptops')) {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        var productNames = webScraper.getElement(
            'div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
        var productDescriptions = webScraper.getElement(
            'div.thumbnail > div.caption > p.description', ['class']);

        print(productDescriptions);
      }
    }
  }

  Future<Map<String, dynamic>> get_spar_items(String endpoint) async {
    var product_detais = <String, dynamic>{
      'code': '0000',
      'category': '(empty)'
    };
    var d = endpoint.split(domain);
    print(d);
    // print('sleeping');
    Future.delayed(Duration(seconds: 4));
    // print('done...');
    try {
      if (await webScraper.loadWebPage(endpoint.split(domain)[1])) {
        var codexpath = webScraper.getElement('span.sku', ['class']);
        var categoryXpath = webScraper.getElement('span.posted_in', ['class']);

        try {
          var code = codexpath[0]['title'] as String;
          var category = categoryXpath[0]['title'] as String;
          product_detais['code'] = code.trim();
          product_detais['category'] = category.split(':')[1].trim();
        } catch (e) {
          print('$e');
          // product_detais['code'] = codexpath;
          // product_detais['category'] = categoryXpath; // print()
        }
      }
    } catch (e) {
      print(e);
    }
    return product_detais;
  }
}
