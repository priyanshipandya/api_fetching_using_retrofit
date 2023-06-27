import '../screens/delete_page.dart';
import '../screens/get_page.dart';
import '../screens/patch_patch.dart';
import '../screens/post_page.dart';
import '../screens/put_page.dart';

Map navigation = {
  "Get" : const GetRequestpage(),
  "Post" : const PostRequestpage(),
  "Put" : const PutRequestpage(),
  "Patch" : const PatchRequestpagee(),
  "Delete" : const DeleteRequestpage(),
  // "Multiple Request" : const MultipleRequestpage(),
  // "Download" : const Downloadpage(),
  // "TimeOut" : const TimeOutPage(),
  // "Upload" : const UploadFile(),
  // "Interceptors" : const InterceptorPage(),
};