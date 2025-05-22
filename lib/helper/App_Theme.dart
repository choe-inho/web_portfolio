// 테마 데이터 클래스
import 'package:flutter/material.dart';

import 'App_Colors.dart';

class AppTheme {
  // 텍스트 테마 생성 함수 - 정적 메소드로 변경
  static TextTheme createTextTheme(TextTheme base, Color mainTextColor, Color secondaryTextColor) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(color: mainTextColor, fontWeight: FontWeight.bold),
      displayMedium: base.displayMedium?.copyWith(color: mainTextColor, fontWeight: FontWeight.bold),
      displaySmall: base.displaySmall?.copyWith(color: mainTextColor, fontWeight: FontWeight.bold),
      headlineLarge: base.headlineLarge?.copyWith(color: mainTextColor, fontWeight: FontWeight.bold),
      headlineMedium: base.headlineMedium?.copyWith(color: mainTextColor, fontWeight: FontWeight.w700),
      headlineSmall: base.headlineSmall?.copyWith(color: mainTextColor, fontWeight: FontWeight.w600),
      titleLarge: base.titleLarge?.copyWith(color: mainTextColor, fontWeight: FontWeight.w600),
      titleMedium: base.titleMedium?.copyWith(color: mainTextColor, fontWeight: FontWeight.w600),
      titleSmall: base.titleSmall?.copyWith(color: mainTextColor, fontWeight: FontWeight.w500),
      bodyLarge: base.bodyLarge?.copyWith(color: mainTextColor),
      bodyMedium: base.bodyMedium?.copyWith(color: mainTextColor),
      bodySmall: base.bodySmall?.copyWith(color: secondaryTextColor),
      labelLarge: base.labelLarge?.copyWith(color: mainTextColor, fontWeight: FontWeight.w500),
      labelMedium: base.labelMedium?.copyWith(color: secondaryTextColor),
      labelSmall: base.labelSmall?.copyWith(color: secondaryTextColor),
    );
  }

  // 라이트 테마
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    canvasColor: AppColors.lightBackground,
    fontFamily: 'Pretendard',

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      background: AppColors.lightBackground,
      surface: AppColors.lightSurface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColors.lightText,
      onSurface: AppColors.lightText,
    ),

    // 카드 테마
    cardTheme: CardTheme(
      color: AppColors.lightSurface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // 앱바 테마
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      foregroundColor: AppColors.lightText,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontFamily: 'Pretendard',
        color: AppColors.lightText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // 버튼 테마
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),

    // 아웃라인 버튼 테마
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),

    // 텍스트 버튼 테마
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),

    // 입력 필드 테마
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightDivider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightDivider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: const TextStyle(
        fontFamily: 'Pretendard',
        color: AppColors.lightTextSecondary,
      ),
    ),

    // 분할선 테마
    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
      thickness: 1,
      space: 24,
    ),
  );

  // 다크 테마
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    canvasColor: AppColors.darkBackground,
    fontFamily: 'Pretendard',

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      background: AppColors.darkBackground,
      surface: AppColors.darkSurface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColors.darkText,
      onSurface: AppColors.darkText,
    ),

    // 카드 테마
    cardTheme: CardTheme(
      color: AppColors.darkSurface,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // 앱바 테마
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkText,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontFamily: 'Pretendard',
        color: AppColors.darkText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // 버튼 테마
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),

    // 아웃라인 버튼 테마
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),

    // 텍스트 버튼 테마
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),

    // 입력 필드 테마
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.darkDivider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.darkDivider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: const TextStyle(
        fontFamily: 'Pretendard',
        color: AppColors.darkTextSecondary,
      ),
    ),

    // 분할선 테마
    dividerTheme: const DividerThemeData(
      color: AppColors.darkDivider,
      thickness: 1,
      space: 24,
    ),
  );

  // 테마 데이터 초기화 메소드 (필요 시 후에 텍스트 테마 적용)
  static void initThemes() {
    // 텍스트 테마를 적용합니다
    final lightTextTheme = createTextTheme(
        ThemeData.light().textTheme,
        AppColors.lightText,
        AppColors.lightTextSecondary
    );

    final darkTextTheme = createTextTheme(
        ThemeData.dark().textTheme,
        AppColors.darkText,
        AppColors.darkTextSecondary
    );

    // 이미 정의된 테마에 텍스트 테마를 적용합니다
    // 참고: 이 방식은 빌드 타임에 적용되지는 않지만, 앱 시작 시점에 필요하다면 사용할 수 있습니다
  }
}