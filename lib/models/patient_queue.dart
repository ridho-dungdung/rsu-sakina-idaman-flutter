class PatientQueue {
  int? noRegister;
  String? name;
  String? date;

  PatientQueue({
    this.noRegister,
    this.name,
    this.date,
  });

  factory PatientQueue.fromJson(Map<String, dynamic> json) => PatientQueue(
    noRegister: json["no_registrasi"],
    name: json["name"],
    date: json["date"],
  );
}

var data = [
  {
  "id": 1,
  "no_registrasi": 1,
  "name": "Nurul Auliyah",
  "date": "2025-08-20 23:59:58",
  "file": "",
  "created_at": null,
  "updated_at": null
},
  {
    "id": 2,
    "no_registrasi": 2,
    "name": "Abdul Kodir",
    "date": "2025-08-20 23:59:58",
    "file": "",
    "created_at": null,
    "updated_at": null
  },
  {
    "id": 3,
    "no_registrasi": 3,
    "name": "Muhammad Rizki Rezeki",
    "date": "2025-08-20 00:01:22",
    "file": "",
    "created_at": null,
    "updated_at": null
  },
  {
    "id": 4,
    "no_registrasi": 4,
    "name": "Sri Sulistio Wati",
    "date": "2025-08-20 00:01:22",
    "file": "",
    "created_at": null,
    "updated_at": null
  },
  {
    "id": 5,
    "no_registrasi": 5,
    "name": "Abdul Kholid",
    "date": "2025-08-20 00:02:13",
    "file": "",
    "created_at": null,
    "updated_at": null
  },
  {
    "id": 6,
    "no_registrasi": 6,
    "name": "Luna Lestari",
    "date": "2025-08-20 00:02:13",
    "file": "",
    "created_at": null,
    "updated_at": null
  },
  {
    "id": 7,
    "no_registrasi": 7,
    "name": "Didin Sapu Jagat",
    "date": "2025-08-20 00:03:07",
    "file": "",
    "created_at": null,
    "updated_at": null
  },
  {
    "id": 8,
    "no_registrasi": 8,
    "name": "Ali Maskur",
    "date": "2025-08-20 00:03:07",
    "file": "",
    "created_at": null,
    "updated_at": null
  },
  {
    "id": 9,
    "no_registrasi": 9,
    "name": "Tiara Sari Sejahtera",
    "date": "2025-08-20 00:04:04",
    "file": "",
    "created_at": null,
    "updated_at": null
  }
];