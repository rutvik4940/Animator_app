class PlanetModel {
  String? name, description, image, distance_sun;
  double? gravity;

  PlanetModel(
      {this.name,
      this.description,
      this.image,
      this.distance_sun,
      this.gravity});

  factory PlanetModel.mapToModel(Map m1)
  {
    return (PlanetModel(name:m1['name'],image:m1['image'],description:m1['description'],distance_sun:m1['distance_sun'],gravity:m1['gravity']));
  }
}
