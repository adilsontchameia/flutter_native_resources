import 'package:share_plus/share_plus.dart';

class SharePlugin {
  static void shareLink(String link, String subject) async {
    await Share.share(link, subject: subject);
  }
}
