import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/data/bloc/path_bloc/path_cubit.dart';
import 'package:task_project/data/core/string_constants.dart';
import 'package:task_project/data/models/request/post_path_model.dart';
import 'package:task_project/presentation/global_widgets/app_bar.dart';

import 'widgets/post_failure_widget.dart';
import 'widgets/post_success_widget.dart';

class ListOfResultPage extends StatefulWidget {
  ListOfResultPage({Key? key, required this.data}) : super(key: key);
  final List<PostPathModel> data;

  @override
  _ListOfResultPageState createState() => _ListOfResultPageState();
}

class _ListOfResultPageState extends State<ListOfResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context: context, title: StringConstants.listOfResult),
      body: BlocConsumer<PathCubit, PathState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.isPostSuccess) {
            return PostSuccesWidget(
              data: widget.data,
              context: context,
              state: state,
            );
          } else if (state.isPostFailure) {
            if (state.postResponse != null) {
              return PostFailureWidget(
                state: state,
                context: context,
                data: widget.data,
              );
            } else {
              return Center(child: Text(state.isFailureMessage));
            }
          }
          return Center(child: Text(state.isFailureMessage));
        },
      ),
    );
  }
}
