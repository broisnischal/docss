import 'package:docss/app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:docss/app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticleLoading) {
        print(state);
        return const Center(child: CupertinoActivityIndicator());
      }

      if (state is RemoteArticleError) {
        return const Center(child: Icon(Icons.refresh, color: Colors.red));
      }

      if (state is RemoteArticleSuccess) {
        return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(state.articles![index].url ?? ''),
              );
            });
      }

      return SizedBox();
    });
  }
}
