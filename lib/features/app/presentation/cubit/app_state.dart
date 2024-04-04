abstract class AppState {
  const AppState();
}

class AppInitState extends AppState {}

class GalleryLoadingState extends AppState {}

class GallerySuccessState extends AppState {}

class GalleryErrorState extends AppState {}

class PickImageState extends AppState {}

class UploadLoadingState extends AppState {}

class UploadSuccessState extends AppState {}

class UploadErrorState extends AppState {}
