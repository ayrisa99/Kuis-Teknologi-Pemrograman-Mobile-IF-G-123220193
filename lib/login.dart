import 'package:flutter/material.dart';
import 'package:kuisif_g/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variabel untuk mengatur visibilitas password
  bool _isPasswordVisible = false;

  // GlobalKey untuk validasi form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controller untuk input username dan password
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, // Menggunakan form key untuk validasi
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            constraints: const BoxConstraints(
              maxWidth: 350,
            ), // Lebar maksimum container
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Menyesuaikan ukuran kolom
                children: [
                  // Logo UPN
                  Image.asset('image/upnLogo.png'),
                  const SizedBox(height: 16),

                  // Judul Login
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text("Login Untuk Mengakses Lebih Banyak Fitur"),
                  const SizedBox(height: 16),

                  // Input Username
                  TextFormField(
                    controller: _username, // Menghubungkan dengan controller
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username Harus Diisi"; // Validasi jika kosong
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person_outline), // Ikon username
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Input Password
                  TextFormField(
                    controller: _password, // Menghubungkan dengan controller
                    obscureText:
                        !_isPasswordVisible, // Menyembunyikan teks password
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Harus Diisi'; // Validasi jika kosong
                      }
                      if (value.length < 4) {
                        return 'Password minimal 4 karakter'; // Validasi panjang password
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ), // Ikon password
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons
                                  .visibility, // Ikon mata untuk toggle password
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible =
                                !_isPasswordVisible; // Mengubah status visibilitas password
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tombol Login
                  SizedBox(
                    width: double.infinity, // Tombol penuh lebar
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Warna tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // Membuat tombol rounded
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Cek username dan password
                          if (_username.text == "fulan" &&
                              _password.text == "fulan") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login Berhasil'),
                                backgroundColor:
                                    Colors.green, // Warna notifikasi sukses
                              ),
                            );

                            //Navigasi ke halaman Home setelah login berhasil
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => Home(username: _username.text),
                              ),
                            );
                          } else {
                            // Menampilkan pesan error jika login gagal
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Username atau password salah'),
                                backgroundColor:
                                    Colors.red, // Warna notifikasi error
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
