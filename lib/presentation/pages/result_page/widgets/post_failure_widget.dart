import 'package:flutter/material.dart';
import 'package:task_project/data/bloc/path_bloc/path_cubit.dart';
import 'package:task_project/data/models/request/post_path_model.dart';

class PostFailureWidget extends StatelessWidget {
  const PostFailureWidget({
    Key? key,
    required this.context,
    required this.state,
    required this.data,
  }) : super(key: key);

  final BuildContext context;
  final PathState state;
  final List<PostPathModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.postResponse!.data!.length,
      itemBuilder: (context, index) {
        bool result = state.postResponse!.data![index].correct!;
        return Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: Card(
            elevation: 5,
            shadowColor: Colors.blue,
            child: Center(
              child: ListTile(
                title: Text(data[index].id!),
                subtitle: Text(
                  result.toString(),
                  style: TextStyle(
                      color: result ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
