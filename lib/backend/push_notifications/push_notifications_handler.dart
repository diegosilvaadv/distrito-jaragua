import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../login/login_widget.dart';
import '../../create_your_profile/create_your_profile_widget.dart';
import '../../forgot_password/forgot_password_widget.dart';
import '../../create_post/create_post_widget.dart';
import '../../post_details/post_details_widget.dart';
import '../../edit_user_profile/edit_user_profile_widget.dart';
import '../../change_password/change_password_widget.dart';
import '../../view_profile_page_other/view_profile_page_other_widget.dart';
import '../../chat_page/chat_page_widget.dart';
import '../../add_chat_users/add_chat_users_widget.dart';
import '../../create_group_chat/create_group_chat_widget.dart';
import '../../page_jaragua/page_jaragua_widget.dart';
import '../../esc_pregadores_jaragua/esc_pregadores_jaragua_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/_Ame_o_seu_proximo_como_a_si_mesmo[b]._Nao_existe_mandamento_maior_do_que_estes._Marcos_12-29.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'login': (data) async => LoginWidget(),
  'createYourProfile': (data) async => CreateYourProfileWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'social': (data) async => NavBarPage(initialPage: 'SocialWidget'),
  'createPost': (data) async => CreatePostWidget(),
  'postDetails': (data) async => PostDetailsWidget(
        postReference: getParameter(data, 'postReference'),
        userRecord: await getDocumentParameter(
            data, 'userRecord', UsersRecord.serializer),
      ),
  'editUserProfile': (data) async => EditUserProfileWidget(),
  'changePassword': (data) async => ChangePasswordWidget(),
  'viewProfilePageOther': (data) async => ViewProfilePageOtherWidget(
        userDetails: await getDocumentParameter(
            data, 'userDetails', UsersRecord.serializer),
      ),
  'chatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'allChatsPage': (data) async => NavBarPage(initialPage: 'AllChatsPageWidget'),
  'addChatUsers': (data) async => AddChatUsersWidget(
        chat: await getDocumentParameter(data, 'chat', ChatsRecord.serializer),
      ),
  'createGroupChat': (data) async => CreateGroupChatWidget(),
  'igrejas': (data) async => NavBarPage(initialPage: 'IgrejasWidget'),
  'page_jaragua': (data) async => PageJaraguaWidget(),
  'esc_pregadores_jaragua': (data) async => EscPregadoresJaraguaWidget(),
  'ProfilePage': (data) async => NavBarPage(initialPage: 'ProfilePageWidget'),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}