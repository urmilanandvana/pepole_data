class PeopleData {
  final dynamic gender;
  final dynamic first;
  final dynamic last;
  final dynamic city;
  final dynamic state;
  final dynamic email;
  final dynamic date;
  final dynamic age;
  final dynamic phone;
  final dynamic large;

  PeopleData({
    required this.gender,
    required this.first,
    required this.last,
    required this.city,
    required this.state,
    required this.email,
    required this.date,
    required this.age,
    required this.phone,
    required this.large,
  });

  factory PeopleData.fromJson({required Map<String, dynamic> json}) {
    return PeopleData(
      gender: json['results'][0]['gender'],
      first: json['results'][0]['name']['first'],
      last: json['results'][0]['name']['last'],
      city: json['results'][0]['location']['city'],
      state: json['results'][0]['location']['state'],
      email: json['results'][0]['email'],
      date: json['results'][0]['dob']['date'],
      age: json['results'][0]['dob']['age'],
      phone: json['results'][0]['phone'],
      large: json['results'][0]['picture']['large'],
    );
  }
}
