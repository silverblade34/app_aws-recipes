// To parse this JSON data, do
//
//     final loginDto = loginDtoFromJson(jsonString);

import 'dart:convert';

LoginDto loginDtoFromJson(String str) => LoginDto.fromJson(json.decode(str));

String loginDtoToJson(LoginDto data) => json.encode(data.toJson());

class LoginDto {
    int id;
    String usuario;
    String dni;
    String nombres;
    String apellidos;
    DateTime fechacreacion;
    Perfil perfil;
    Base base;
    bool estado;

    LoginDto({
        required this.id,
        required this.usuario,
        required this.dni,
        required this.nombres,
        required this.apellidos,
        required this.fechacreacion,
        required this.perfil,
        required this.base,
        required this.estado,
    });

    factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        id: json["id"],
        usuario: json["usuario"],
        dni: json["dni"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        fechacreacion: DateTime.parse(json["fechacreacion"]),
        perfil: Perfil.fromJson(json["perfil"]),
        base: Base.fromJson(json["base"]),
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "dni": dni,
        "nombres": nombres,
        "apellidos": apellidos,
        "fechacreacion": fechacreacion.toIso8601String(),
        "perfil": perfil.toJson(),
        "base": base.toJson(),
        "estado": estado,
    };
}

class Base {
    int id;
    String nombre;
    dynamic fechacreacion;
    bool estado;
    bool flagapp;

    Base({
        required this.id,
        required this.nombre,
        required this.fechacreacion,
        required this.estado,
        required this.flagapp,
    });

    factory Base.fromJson(Map<String, dynamic> json) => Base(
        id: json["id"],
        nombre: json["nombre"],
        fechacreacion: json["fechacreacion"],
        estado: json["estado"],
        flagapp: json["flagapp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fechacreacion": fechacreacion,
        "estado": estado,
        "flagapp": flagapp,
    };
}

class Perfil {
    int id;
    String nombre;
    DateTime fechacreacion;
    bool sololectura;
    List<dynamic> opcionesmenu;

    Perfil({
        required this.id,
        required this.nombre,
        required this.fechacreacion,
        required this.sololectura,
        required this.opcionesmenu,
    });

    factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
        id: json["id"],
        nombre: json["nombre"],
        fechacreacion: DateTime.parse(json["fechacreacion"]),
        sololectura: json["sololectura"],
        opcionesmenu: List<dynamic>.from(json["opcionesmenu"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fechacreacion": fechacreacion.toIso8601String(),
        "sololectura": sololectura,
        "opcionesmenu": List<dynamic>.from(opcionesmenu.map((x) => x)),
    };
}
