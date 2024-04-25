class ResponseBook {
  int? status;
  String? message;
  List<DataBook>? data;

  ResponseBook({this.status, this.message, this.data});

  ResponseBook.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(DataBook.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataBook {
  int? id;
  int? kategoriId; // Ubah tipe data dari String? menjadi int?
  String? judul;
  String? penulis;
  String? penerbit;
  String? gambar;
  int? tahunTerbit; // Ubah tipe data dari String? menjadi int?
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  DataBook({
    this.id,
    this.kategoriId,
    this.judul,
    this.penulis,
    this.penerbit,
    this.gambar,
    this.tahunTerbit,
    this.createdAt,
    this.updatedAt,
    this.kategori,
  });

  DataBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    gambar = json['gambar'];
    tahunTerbit = json['tahun_terbit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kategori_id'] = this.kategoriId;
    data['judul'] = this.judul;
    data['penulis'] = this.penulis;
    data['penerbit'] = this.penerbit;
    data['gambar'] = this.gambar;
    data['tahun_terbit'] = this.tahunTerbit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.kategori != null) {
      data['kategori'] = this.kategori!.toJson();
    }
    return data;
  }
}

class Kategori {
  int? id;
  String? nama;

  Kategori({
    this.id,
    this.nama,
  });

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    return data;
  }
}
