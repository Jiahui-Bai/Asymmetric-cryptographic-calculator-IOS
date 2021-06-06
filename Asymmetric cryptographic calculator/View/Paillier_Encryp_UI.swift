//
//  Paillier_Encryp_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import SwiftUI

struct Paillier_Encryp_UI: View {
    @State private var m = ""
    @State private var r = ""
    @State private var p = ""
    @State private var q = ""
    @State private var g = ""
    @State private var n = ""
    @State private var c:BInt = 0
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Plaintext m")
                    TextField("123", text: $m)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Prime number p")
                    TextField("123", text: $p)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Prime number q")
                    TextField("123", text: $q)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Public key n")
                    TextField("123", text: $n)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Public key g")
                    TextField("123", text: $g)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Random number r")
                    TextField("123", text: $r)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Ciphertext: c = \(String(c))")
                        
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal)
            }
            Button("Calculate"){
                var cn:BInt = 0
                if n != ""{
                    cn = BInt(n) ?? 0
                }else if q != "" && p != ""{
                    cn = (BInt(p) ?? 0) * (BInt(q) ?? 0)
                }
                let cg = BInt(g) ?? 0
                let cm = BInt(m) ?? 0
                let cr = BInt(r) ?? 0
                if cn != 0 && cg != 0 && cm != 0 && cr != 0{
                    c = paillierEncryp(n: cn, g: cg, m: cm, r: cr)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct Paillier_Encryp_UI_Previews: PreviewProvider {
    static var previews: some View {
        Paillier_Encryp_UI()
    }
}
