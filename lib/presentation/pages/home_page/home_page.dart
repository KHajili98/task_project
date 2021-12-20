import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/data/bloc/path_bloc/path_cubit.dart';
import 'package:task_project/data/core/string_constants.dart';
import 'package:task_project/data/models/request/post_path_model.dart';
import 'package:task_project/presentation/global_widgets/show_snacks.dart';
import 'package:task_project/presentation/pages/result_page/list_of_result_page.dart';

import 'calculation_of_paths.dart';
import 'widgets/calculation_progress_widget.dart';
import 'widgets/start_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<PostPathModel> data = [];
  Stream<double>? counterStream;

  @override
  void initState() {
    super.initState();
    //! CALCULATION TAKES APPROXIMATELLY 10 MILLISECONDS, controlling of circular progres only based of for 2 exanple fields....
    counterStream = Stream<double>.periodic(
        Duration(milliseconds: 50), (x) => (x / 100).toDouble()).take(101);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.titleOfHome),
      ),
      body: BlocConsumer<PathCubit, PathState>(
        listener: (context, state) {
          if (state.isPostSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<PathCubit>(),
                  child: ListOfResultPage(
                    data: data,
                  ),
                ),
              ),
            );
            showSuccessMessage(context, StringConstants.trueCalculation);
          } else if (state.isFailure) {
            showFailureMessage(context, state.isFailureMessage);
          } else if (state.isPostFailure) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<PathCubit>(),
                  child: ListOfResultPage(
                    data: data,
                  ),
                ),
              ),
            );
            showFailureMessage(context, state.isFailureMessage);
          } else if (state.isSuccess) {
            final stopwatch = Stopwatch()..start();
            state.path!.data!.forEach((element) {
              calculatePaths(element, data);
            });
            print(
                ' CALCULATION executed in ${stopwatch.elapsed.inMilliseconds} MILLISECONS');
            showSuccessMessage(context, StringConstants.fetchedSuccesfully);
          }
        },
        builder: (context, state) {
          if (state.isPostProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isSuccess) {
            return StreamBuilder(
                stream: counterStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return CalculationProgressWidget(
                      context: context,
                      apiTextController: apiTextController,
                      data: data,
                      snapshot: snapshot,
                    );
                  return SizedBox.shrink();
                });
          }
          return StartHomePage(
              context: context,
              state: state,
              formKey: formKey,
              apiTextController: apiTextController);
        },
      ),
    );
  }
}
