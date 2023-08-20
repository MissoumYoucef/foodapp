class Food {
  int? id;
  String? name;
  String? price;
  String? image;
  String? description;
  String? location;
  String? timeOfPreparation;
  double? evaluation;
  int? numberOfComments;
  bool? isSpecial;

  Food(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.description,
      this.location,
      this.timeOfPreparation,
      this.evaluation,
      this.numberOfComments,
      this.isSpecial});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    timeOfPreparation = json['time_of_preparation'];
    evaluation = json['evaluation'];
    numberOfComments = json['number_of_comments'];
    isSpecial = json['is_special'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['location'] = location;
    data['time_of_preparation'] = timeOfPreparation;
    data['evaluation'] = evaluation;
    data['number_of_comments'] = numberOfComments;
    data['is_special'] = isSpecial;
    return data;
  }
}