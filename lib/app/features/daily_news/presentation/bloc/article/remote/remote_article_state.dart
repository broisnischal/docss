import 'package:dio/dio.dart';
import 'package:docss/app/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticleState extends Equatable {
  const RemoteArticleState({this.articles, this.error});

  final List<ArticleEntity>? articles;
  final DioException? error;

  @override
  List<Object?> get props => [articles, error];
}

// class RemoteArticleInitial extends RemoteArticleState {
//   const RemoteArticleInitial() : super();
// }

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading() : super();
}

class RemoteArticleSuccess extends RemoteArticleState {
  const RemoteArticleSuccess({required List<ArticleEntity> articles})
      : super(articles: articles);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError({required DioException error}) : super(error: error);
}

// class RemoteArticleEmpty extends RemoteArticleState {
//   const RemoteArticleEmpty() : super();
// }

// class RemoteArticleFailure extends RemoteArticleState {
//   const RemoteArticleFailure({required List<ArticleEntity> articles})
//       : super(articles: articles);
// }
