# FlutterImageWidget

The `FlutterImageWidget` is a versatile Flutter widget designed for displaying different types of images in a Flutter application.

## Features:

- **Image Sources**:
  - Supports various sources of images, including network images, local image files, SVG images, and assets.

- **Customization**:
  - Allows customization of image dimensions (height and width).
  - Supports setting a custom background color for the image.

- **Placeholder Image**:
  - Provides a customizable placeholder image that is displayed while the main image is loading.

- **Interactivity**:
  - Allows for onTap functionality, making the image interactive when provided with a callback function.

- **Border Radius**:
  - Supports applying a border radius to the image, allowing for rounded corners.

- **Borders**:
  - Enables the addition of borders around the image, providing further visual customization.

- **Alignment**:
  - Supports alignment of the image within its parent widget, allowing for precise positioning.

- **Error Handling**:
  - Handles cases where the image source fails to load by displaying the specified placeholder image.

- **Optimized Network Image Loading**:
  - Utilizes the `CachedNetworkImage` package to efficiently load and cache network images for improved performance.

- **SVG Image Support**:
  - Renders SVG images using the `SvgPicture.asset` method, allowing for vector-based graphics.

- **File Picker Support**:
  - Displays images from file paths using the `Image.file` widget, facilitating the inclusion of local images.

- **Code Cleanliness**:
  - Follows best practices for clean and organized code, enhancing readability and maintainability.

- **Flexibility**:
  - Designed to be flexible and adaptable to various use cases, providing a seamless experience for developers.

- **Sized Containers**:
  - Utilizes `Container` widgets to manage the height and width of the images.

- **Conditional Rendering**:
  - Employs conditional checks to determine which type of image to render based on the provided parameters.

- **Fallback Behavior**:
  - Provides a fallback behavior (a `SizedBox`) in case none of the specified image sources are available.

Overall, the `FlutterImageWidget` offers a comprehensive solution for handling and displaying images in a Flutter application, catering to a wide range of image sources and customization preferences. Its clean code structure and thoughtful design make it a valuable asset for developers seeking a flexible image rendering solution.


```dart
class WithAssets extends StatelessWidget {
  const WithAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          FlutterImageWidget(
            height: 100,
            width: 100,
            imageAssetPath: ImageConstant.imageNotFound,
            radius: BorderRadius.circular(20),
          ),
      ),
    );
  }
}



class WithUrl extends StatelessWidget {
  const WithUrl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          FlutterImageWidget(
            height: 100,
            width: 100,
            url: "set_image_url_here",
            radius: BorderRadius.circular(20),

          ),
      ),
    );
  }
}

