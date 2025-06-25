class ProfileModel {
  String firstName;
  String lastName;
  String email;
  String gender;

  ProfileModel({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.gender = "",
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
    );
  }
}
