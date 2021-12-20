import 'package:flutter/material.dart';
import 'package:task_project/data/bloc/path_bloc/path_cubit.dart';
import 'package:task_project/data/models/request/post_path_model.dart';
import 'package:task_project/presentation/pages/graph_page/path_result_page.dart';

class PostSuccesWidget extends StatelessWidget {
  const PostSuccesWidget({
    Key? key,
    required this.state,
    required this.context,
    required this.data,
  }) : super(key: key);

  final BuildContext context;
  final PathState state;
  final List<PostPathModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        String path = "";
        var paths = data[index].result!.steps!;
        for (var i = 0; i < paths.length; i++) {
          if (i != paths.length - 1) {
            path += " (${paths[i].x},${paths[i].y}) => ";
          } else {
            path += " (${paths[i].x},${paths[i].y}) ";
          }
        }

        return Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: Card(
            elevation: 5,
            shadowColor: Colors.blue,
            child: Center(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GraphPage(
                          title: data[index].id!,
                          indexFromData: index,
                          path: path,
                        ),
                      ));
                },
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GraphPage(
                              title: data[index].id!,
                              indexFromData: index,
                              path: path,
                            ),
                          ));
                    },
                    icon: Icon(Icons.arrow_forward_rounded)),
                title: Text(path),
                subtitle: Text(data[index].id!),
              ),
            ),
          ),
        );
      },
    );
  }
}
