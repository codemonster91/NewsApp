import 'package:api_by_mobx/TopNewsApiModel.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'news_api_store.g.dart';

class NewsApiStore = _NewsApiStoreBase with _$NewsApiStore;

abstract class _NewsApiStoreBase with Store {
  @observable
  TopNewsApiModel topNewsApiModel;

  @action
  fetchData() {
    topNewsApiModel = null;
    loadTopNewsApi().then((value) {
      print(value.articles[0].title);
      topNewsApiModel = value;
    });
  }

  Future<TopNewsApiModel> loadTopNewsApi() async {
    try {
      var response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=in",
        headers: {'X-Api-Key': '84d1c82a5d974bc1915957b133994af6'},
      );

      return topNewsApiModelFromJson(response.body);
    } catch (error) {
      print("There is an error in Top news Api " + error);
      return null;
    }
  }
}
