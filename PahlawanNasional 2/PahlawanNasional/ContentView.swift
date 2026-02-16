//
//  ContentView.swift
//  PahlawanNasional
//
//  Created by DTC-02 on 10/02/26.
//

import SwiftUI


struct Pahlawan: Identifiable {
    let id = UUID()
    let nama: String
    let deskripsi: String
    let foto: String
}


let dataPahlawan = [

    Pahlawan(nama: "Ir. Soekarno",
             deskripsi: "Presiden pertama Republik Indonesia yang menjabat pada periode 1945–1967.",
             foto: "soekarno.jpg"),

    Pahlawan(nama: "Moh. Hatta",
             deskripsi: "Tokoh pejuang, negarawan, ekonom, dan Wakil Presiden Indonesia pertama.",
             foto: "mohammadhatta"),

    Pahlawan(nama: "R.A. Kartini",
             deskripsi: "Pelopor kebangkitan perempuan pribumi.",
             foto: "kartnini"),
    
    Pahlawan(nama: "Jenderal Sudirman",
             deskripsi: "Panglima Besar Tentara Nasional Indonesia pertama.",
             foto: "sudirman"),

    Pahlawan(nama: "Ki Hajar Dewantara",
             deskripsi: "Bapak Pendidikan Nasional dan pendiri Taman Siswa.",
             foto: "kihadjar"),

    Pahlawan(nama: "Pangeran Diponegoro",
             deskripsi: "Pemimpin perang Diponegoro melawan pemerintah Hindia Belanda.",
             foto: "diponegoro"),

    Pahlawan(nama: "Cut Nyak Dien",
             deskripsi: "Pahlawan Nasional Indonesia dari Aceh yang berjuang melawan Belanda.",
             foto: "CutNyakDien"),

    Pahlawan(nama: "Pattimura",
             deskripsi: "Pahlawan Nasional Indonesia dari Maluku.",
             foto: "pattimura"),

    Pahlawan(nama: "Bung Tomo",
             deskripsi: "Tokoh penting dalam pertempuran 10 November di Surabaya.",
             foto: "bung tomo"),

    Pahlawan(nama: "Dewi Sartika",
             deskripsi: "Tokoh perintis pendidikan untuk kaum wanita.",
             foto: "dewisartika")
]

struct DetailView: View {
    let pahlawan: Pahlawan
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Image(pahlawan.foto)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                
                Text(pahlawan.nama)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(pahlawan.deskripsi)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detail Pahlawan")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            // FOTO PROFIL
            Image("faisal.jpg")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                .shadow(radius: 7)
            
            Text("Faisal Surya")
                .font(.title)
                .bold()
            
            Text("faisal.surya@dicoding.com")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Profil Saya")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(dataPahlawan) { item in
                NavigationLink(destination: DetailView(pahlawan: item)) {
                    HStack(spacing: 15) {
                        Image(item.foto)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.nama)
                                .font(.headline)
                            Text(item.deskripsi)
                                .font(.caption)
                                .lineLimit(2)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Pahlawan Nasional")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        HStack(spacing: 8) {
                            Text("Faisal")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                            
                            Image("faisal.jpg")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
