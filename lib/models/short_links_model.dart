class ShortLinks {
  final int? id;
  final String original_link;
  final String short_link;
  final DateTime time;

  ShortLinks({
    this.id,
    required this.original_link,
    required this.short_link,
    required this.time,
  });
  ShortLinks copy({
    int? id,
    String? original_link,
    String? short_link,
    DateTime? time,
  }) =>
      ShortLinks(
          id: id ?? this.id,
          original_link: original_link ?? this.original_link,
          short_link: short_link ?? this.short_link,
          time: time ?? this.time);

  static ShortLinks fromJson(Map<String, Object?> json) => ShortLinks(
        id: json['id'] as int?,
        original_link: json['original_link'] as String,
        short_link: json['short_link'] as String,
        time: DateTime.parse(json['time'] as String),
      );
  Map<String, Object?> toJson() => {
        'id': id,
        'original_link': original_link,
        'short_link': short_link,
        'time': time.toIso8601String(),
      };
}
