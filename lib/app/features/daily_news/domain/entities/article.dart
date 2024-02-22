import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  const ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];

  factory ArticleEntity.fromJson(Map<String, dynamic> json) {
    return ArticleEntity(
      source: SourceEntity.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }
}

class SourceEntity {
  final String? id;
  final String? name;

  const SourceEntity({
    this.id,
    this.name,
  });

  factory SourceEntity.fromJson(Map<String, dynamic> json) {
    return SourceEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }
}
