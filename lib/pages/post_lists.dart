import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/models/post_model.dart';
import 'package:rest_api/services/rest_client.dart';
import 'package:retrofit/retrofit.dart';

import '../suger_mummy.dart';

class PostFetch extends StatelessWidget {
  const PostFetch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cli = sm<RestClient>();
    return _ListPosts(cli);
  }

  FutureBuilder<List<PostModel>> _ListPosts(RestClient cli) {
    return FutureBuilder(
      future: cli.getPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<PostModel> posts = snapshot.data;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                title: Text(posts[index].title.toString()),
                subtitle: Text(posts[index].body.toString()),
                leading: const Icon(Icons.article),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
