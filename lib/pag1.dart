import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _mostrarSenha = false;

  void _login() {
    String usuario = _usuarioController.text.trim();
    String senha = _senhaController.text.trim();

    if (usuario == 'vero' && senha == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => TelaCadastro(nomeUsuario: usuario)),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text("Invalido", style: TextStyle(color: Colors.orange)),
          content: const Text("Usuário ou senha incorretos.", style: TextStyle(color: Colors.orange)),
          actions: [
            TextButton(
              child: const Text("OK", style: TextStyle(color: Colors.orange), ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.orange),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.orange),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.yellowAccent, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 50, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _usuarioController,
              cursorColor: Colors.orange,
              style: const TextStyle(color: Colors.orange),
              decoration: _inputDecoration("Usuário"),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _senhaController,
              cursorColor: Colors.orange,
              obscureText: !_mostrarSenha,
              style: const TextStyle(color: Colors.orange),
              decoration: _inputDecoration("Senha").copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    _mostrarSenha ? Icons.visibility : Icons.visibility_off,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() {
                      _mostrarSenha = !_mostrarSenha;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 60),
           ElevatedButton(
  onPressed: _login,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange, 
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  ),
  child: Text(
    "Entrar",
    style: const TextStyle(
      color: Colors.black, 
      fontWeight: FontWeight.bold,
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}

// TELA DE CADASTRO

class TelaCadastro extends StatefulWidget {
  final String nomeUsuario;

  const TelaCadastro({super.key, required this.nomeUsuario});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _nome = TextEditingController();
  final _endereco = TextEditingController();
  final _curso = TextEditingController();
  final _cidade = TextEditingController();
  final _pais = TextEditingController();

  void _salvarDados() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text("Informações Salvas", style: TextStyle(color: Colors.orange)),
        content: Text(
          "Nome: ${_nome.text}\n"
          "Endereço: ${_endereco.text}\n"
          "Curso: ${_curso.text}\n"
          "Cidade: ${_cidade.text}\n"
          "País: ${_pais.text}",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            child: const Text("Fechar", style: TextStyle(color: Colors.orange)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _campoTexto(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        cursorColor: Colors.orange,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.orange),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Color.fromARGB(255, 206, 159, 88)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Colors.orange, width: 2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Cadastro"),
        backgroundColor: Colors.orange,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Bem-vindo, ${widget.nomeUsuario}!",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            _campoTexto("Nome", _nome),
            _campoTexto("Endereço", _endereco),
            _campoTexto("Curso", _curso),
            _campoTexto("Cidade", _cidade),
            _campoTexto("País", _pais),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: _salvarDados,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: const Text("Salvar", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar ao login", style: TextStyle(color: Colors.orangeAccent)) ,
            ),
          ],
        ),
      ),
    );
  }
}
