import '../models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  
  factory AuthService() {
    return _instance;
  }
  
  AuthService._internal();
  
  // Mock kullanıcı verileri
  final List<Map<String, dynamic>> _mockUsers = [
    {
      'id': 1,
      'username': 'deneme',
      'email': 'deneme@mail.com',
      'password': '12345678',
      'token': 'mock_token_1234567890',
      'fullName': 'Deneme Kullanıcı',
      'profilePicture': null,
    },
    {
      'id': 2,
      'username': 'test',
      'email': 'test@mail.com',
      'password': 'test1234',
      'token': 'mock_token_0987654321',
      'fullName': 'Test Kullanıcı',
      'profilePicture': null,
    },
    {
      'id': 3,
      'username': 'admin',
      'email': 'admin@mail.com',
      'password': 'admin123',
      'token': 'mock_token_admin_123456',
      'fullName': 'Admin Kullanıcı',
      'profilePicture': null,
    },
  ];
  
  // Giriş yapma servisi
  Future<User?> login(String username, String password) async {
    // API isteği simülasyonu için gecikme
    await Future.delayed(const Duration(seconds: 1));
    
    // Kullanıcı adı veya e-posta ile eşleşmeyi kontrol et
    final userMatch = _mockUsers.firstWhere(
      (user) => (user['username'] == username || user['email'] == username) && user['password'] == password,
      orElse: () => {},
    );
    
    if (userMatch.isEmpty) {
      return null;
    }
    
    // Kullanıcı bilgilerinden şifreyi çıkar
    final Map<String, dynamic> userInfo = Map.from(userMatch);
    userInfo.remove('password');
    
    return User.fromJson(userInfo);
  }
  
  // Kayıt olma servisi
  Future<User?> register(String username, String email, String password, String fullName) async {
    // API isteği simülasyonu için gecikme
    await Future.delayed(const Duration(seconds: 1));
    
    // Kullanıcı adı veya e-posta kullanılmış mı kontrol et
    final existingUser = _mockUsers.firstWhere(
      (user) => user['username'] == username || user['email'] == email,
      orElse: () => {},
    );
    
    if (existingUser.isNotEmpty) {
      return null; // Kullanıcı zaten var
    }
    
    // Yeni kullanıcı oluştur
    final newUser = {
      'id': _mockUsers.length + 1,
      'username': username,
      'email': email,
      'password': password,
      'token': 'mock_token_new_${DateTime.now().millisecondsSinceEpoch}',
      'fullName': fullName,
      'profilePicture': null,
    };
    
    // Kullanıcıyı listeye ekle (gerçek API'de veritabanına kaydedilir)
    _mockUsers.add(newUser);
    
    // Kullanıcı bilgilerinden şifreyi çıkar
    final Map<String, dynamic> userInfo = Map.from(newUser);
    userInfo.remove('password');
    
    return User.fromJson(userInfo);
  }
} 