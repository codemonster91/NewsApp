// To parse this JSON data, do
//
//     final topTechNewsApiModel = topTechNewsApiModelFromJson(jsonString);

import 'dart:convert';

TopTechNewsApiModel topTechNewsApiModelFromJson(String str) => TopTechNewsApiModel.fromJson(json.decode(str));

String topTechNewsApiModelToJson(TopTechNewsApiModel data) => json.encode(data.toJson());

class TopTechNewsApiModel {
    TopTechNewsApiModel({
        this.status,
        this.totalResults,
        this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory TopTechNewsApiModel.fromJson(Map<String, dynamic> json) => TopTechNewsApiModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        this.id,
        this.name,
    });

    Id id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : idValues.map[json["id"]],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : idValues.reverse[id],
        "name": name,
    };
}

enum Id { ENGADGET, WIRED, TECHCRUNCH }

final idValues = EnumValues({
    "engadget": Id.ENGADGET,
    "techcrunch": Id.TECHCRUNCH,
    "wired": Id.WIRED
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
