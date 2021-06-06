//
//  Paillier_Decryp_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import SwiftUI

struct Paillier_Decryp_UI: View {
    @State private var m:BInt = 0
    @State private var p = ""
    @State private var q = ""
    @State private var g = ""
    @State private var n = ""
    @State private var c = ""
    @State private var lambdaStr = ""
    @State private var muStr = ""
    @State private var lambda:BInt = 0
    @State private var mu:BInt = 0
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Ciphertext c")
                    TextField("123", text: $c)
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
                    Text("Private key lambda")
                    TextField("123", text: $lambdaStr)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Private key mu")
                    TextField("123", text: $muStr)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Plaintext: m = \(String(m))")
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal)
            }
            Button("Calculate"){
                let cc = BInt(c) ?? 0
                var cn:BInt = 0
                if n != ""{
                    cn = BInt(n) ?? 0
                }else if q != "" && p != ""{
                    cn = (BInt(p) ?? 0) * (BInt(q) ?? 0)
                }
                if cn != 0 && mu != 0 && lambda != 0 && cc != 0{
                    m = paillierDecryp(n:cn,mu: mu,lambda: lambda,c: cc)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct Paillier_Decryp_UI_Previews: PreviewProvider {
    static var previews: some View {
        Paillier_Decryp_UI()
    }
}
