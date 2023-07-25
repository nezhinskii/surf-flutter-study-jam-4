import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/ui/utils/app_colors.dart';
import 'package:surf_practice_magic_ball/ui/utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundGradient
      ),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.mainColor,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: ListView(
            children: [
              Text("Внешний цвет шара:",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Color currentColor = context.colors.outerBallColor;
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickersEnabled: const <ColorPickerType, bool>{
                                  ColorPickerType.wheel:true,
                                  ColorPickerType.accent:false,
                                  ColorPickerType.primary:false,
                                },
                                onColorChanged: (Color value) {
                                  currentColor = value;
                                },
                                color: context.colors.outerBallColor,
                              )
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: <Widget>[
                              IconButton(
                                icon: Icon(Icons.check, color: context.colors.mainColor,),
                                onPressed: () {
                                  context.read<AppTheme>().theme = context.read<AppTheme>().theme.copyWith(
                                    extensions: [
                                      context.colors.copyWith(
                                        outerBallColor: currentColor
                                      ),
                                    ]
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: context.colors.outerBallColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
