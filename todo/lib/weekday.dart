enum WeekDay {
  monday(code: 1, displayName: "월요일"),
  tuesday(code: 2, displayName: "화요일"),
  wednesday(code: 3, displayName: "수요일"),
  thursday(code: 4, displayName: "목요일"),
  friday(code: 5, displayName: "금요일"),
  saturday(code: 6, displayName: "토요일"),
  sunday(code: 7, displayName: "일요일"),
  ;

  final int code;
  final String displayName;

  const WeekDay({
    required this.code,
    required this.displayName,
  });

  static WeekDay fromCode(int code) {
    return WeekDay.values.firstWhere(
      (d) => d.code == code,
      orElse: () => WeekDay.monday,
    );
  }
}
