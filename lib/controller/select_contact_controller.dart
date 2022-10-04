import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/services/select_contact_service.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return selectContactRepository.getContacts();
});
