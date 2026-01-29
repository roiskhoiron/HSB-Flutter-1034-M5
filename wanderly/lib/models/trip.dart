class Trip {
  String title;
  String location;
  String date;

  Trip({required this.title, required this.location, required this.date});

  Map<String, dynamic> toJson() {
    return {'title': title, 'location': location, 'date': date};
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      title: json['title'],
      location: json['location'],
      date: json['date'],
    );
  }
}
