import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:task_project/data/bloc/path_bloc/path_cubit.dart';
import 'package:task_project/data/core/string_constants.dart';

class StartHomePage extends StatelessWidget {
  const StartHomePage({
    Key? key,
    required this.formKey,
    required this.state,
    required this.context,
    required this.apiTextController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final BuildContext context;
  final PathState state;

  final TextEditingController apiTextController;

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: maxHeight * 0.02, horizontal: maxWidth * 0.1),
        child: Column(
          children: [
            Text(StringConstants.setValidApi),
            SizedBox(height: maxHeight * 0.02),
            Container(
              width: maxWidth * 0.7,
              child: TextFormField(
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  hintText: 'https://',
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: maxHeight * 0.02, horizontal: maxWidth * 0.03),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(maxHeight * 0.015)),
                ),
                controller: apiTextController,
                validator: (value) {
                  if (value!.isEmpty)
                    return StringConstants.emptyFieldValidator;
                  return null;
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: state.isProgress
                    ? LinearProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<PathCubit>()
                                .getPaths(url: apiTextController.text);
                          }
                        },
                        child: Text(StringConstants.startCounting),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
