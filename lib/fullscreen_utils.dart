import 'package:web/web.dart' as web;

/// Enter fullscreen mode
void enterFullscreen() {
  web.document.documentElement?.requestFullscreen();
}

/// Exit fullscreen mode
void exitFullscreen() {
  web.document.exitFullscreen();
}

/// Check if currently fullscreen
bool get isFullscreen => web.document.fullscreenElement != null;

/// Toggle fullscreen on/off
void toggleFullscreen() {
  if (isFullscreen) {
    exitFullscreen();
  } else {
    enterFullscreen();
  }
}
