class PhotosModel{
  String PhotoName;
  String imgSrc;

  PhotosModel(
  {
    required this.PhotoName,
    required this.imgSrc
  }
  );
  static PhotosModel fromAPI2App (Map<String ,dynamic> photoMap)
  {
    return PhotosModel(PhotoName: photoMap["alt"], imgSrc: (photoMap["src"])["portrait"]);
  }
}