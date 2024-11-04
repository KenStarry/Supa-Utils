library supa_utils;


import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/models/google_sign_in_response_model.dart';

/// AUTH
part 'core/supa_utils.dart';
part 'auth/login.dart';
part 'auth/sign_up.dart';

/// Database
part 'database/supabase_add.dart';
part 'database/supabase_fetch.dart';
part 'database/supabase_insert.dart';
