import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxDouble flexibleSpaceMaxHeight = RxDouble(0.0);
  final RxBool isExpanded = true.obs;
  var selectedDate = ''.obs;
  late User CurrentUser;
  late var DataDoc;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    _getCurrentUser();
  }
  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    CurrentUser = user!;
    String email=user.email.toString();

    DocumentReference CurrentUserReference = FirebaseFirestore.instance.collection('users').doc(email);
    DataDoc = await CurrentUserReference.get();

    update();
  }
  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    flexibleSpaceMaxHeight.value = scrollController.hasClients
        ? scrollController.position.maxScrollExtent -
        scrollController.offset +
        kToolbarHeight
        : 0.0;
    isExpanded.value = scrollController.offset <= kToolbarHeight;
  }

  Future<void> selectDate(BuildContext context,DateTime Date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate.value = picked.toString();
    }
  }
}