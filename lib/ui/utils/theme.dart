import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/ui/utils/app_colors.dart';

class AppTheme extends ChangeNotifier{
  late ThemeData _theme;
  AppTheme(){
    _theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
            bodySmall: TextStyle(
              color: Color.fromARGB(255, 114, 114, 114),
              fontSize: 15,
            ),
            bodyLarge: TextStyle(
              color: Color.fromARGB(255, 134, 250, 255),
              fontSize: 24,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )
        ),
        extensions: <ThemeExtension<dynamic>>[
          ThemeColors(
              mainColor: AppColors.mainColor,
              outerBallColor: AppColors.outerBallColor,
              mediumLayerBallColor: AppColors.mediumLayerBallColor,
              innerBallColor: AppColors.innerBallColor,
              backgroundGradient: AppColors.backgroundGradient,
              starColors: AppColors.starColors
          ),
        ]
    );
  }

  ThemeData get theme => _theme;

  set theme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
    print("AAAAAAAAAAA");
  }
}

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color mainColor;
  final Color outerBallColor;
  final Color mediumLayerBallColor;
  final Color innerBallColor;
  final Gradient backgroundGradient;
  final List<Color> starColors;

  ThemeColors({
    required this.mainColor,
    required this.outerBallColor,
    required this.mediumLayerBallColor,
    required this.innerBallColor,
    required this.backgroundGradient,
    required this.starColors,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? mainColor,
    Color? outerBallColor,
    Color? mediumLayerBallColor,
    Color? innerBallColor,
    Gradient? backgroundGradient,
    List<Color>? starColors
  }) {
    return ThemeColors(
      mainColor: mainColor ?? this.mainColor,
      outerBallColor: outerBallColor ?? this.outerBallColor,
      mediumLayerBallColor: mediumLayerBallColor ?? this.mediumLayerBallColor,
      innerBallColor: innerBallColor ?? this.innerBallColor,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      starColors: starColors ?? this.starColors
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(covariant ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors){
      return this;
    }
    return ThemeColors(
        mainColor: Color.lerp(mainColor, other.mainColor, t)!,
        outerBallColor: Color.lerp(outerBallColor, other.outerBallColor, t)!,
        mediumLayerBallColor: Color.lerp(mediumLayerBallColor, other.mediumLayerBallColor, t)!,
        innerBallColor: Color.lerp(innerBallColor, other.innerBallColor, t)!,
        backgroundGradient: Gradient.lerp(backgroundGradient, other.backgroundGradient, t)!,
        starColors: starColors
    );
  }
}

extension BuildContextThemeColors on BuildContext {
  ThemeColors get colors => Theme.of(this).extension<ThemeColors>()!;
}