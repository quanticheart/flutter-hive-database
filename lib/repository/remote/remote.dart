import 'package:http/http.dart' as http;

import '../model/amiibo.dart';

class Remote {
  final base = "www.amiiboapi.com";

  Future<List<Amiibo>?> amiiboList() async {
    var url = Uri.https(base, '/api/amiibo/', {'q': '{http}'});
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final list = AmiiboList.fromJson(response.body);
        return list.amiibo;
      } else {
        return null;
      }
    } finally {}
  }

  Future<List<Amiibo>?> amiiboListByName(String name) async {
    var url = Uri.https(base, '/api/amiibo/', {'character': name});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final list = AmiiboList.fromJson(response.body);
      return list.amiibo;
    } else {
      return null;
    }
  }

  Future<Amiibo?> amiiboDetails(String tail) async {
    var url = Uri.https(base, '/api/amiibo/', {'id': tail});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final list = AmiiboDetails.fromJson(response.body);
      return list.amiibo;
    } else {
      return null;
    }
  }
}
