class Flags {
  final String png;
  final String svg;
  final String alt;

  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      png: json['png'],
      svg: json['svg'],
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
      'alt': alt,
    };
  }
}
