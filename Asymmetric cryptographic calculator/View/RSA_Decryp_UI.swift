//
//  RSA_Decryp_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import SwiftUI

struct RSA_Decryp_UI: View {
    @State private var c = ""
    @State private var n = ""
    @State private var p = ""
    @State private var q = ""
    @State private var d = ""
    @State private var m:BInt = 0
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
                    Text("Private key d")
                    TextField("123", text: $d)
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
                var cn:BInt = 0
                if n != ""{
                    cn = BInt(n) ?? 0
                }else if q != "" && p != ""{
                    cn = (BInt(p) ?? 0) * (BInt(q) ?? 0)
                }
                let cc = BInt(c) ?? 0
                let cd = BInt(d) ?? 0
                if cc != 0 && cd != 0 && cn != 0{
                    m = BIntMath.mod_exp(cc,cd,cn)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct RSA_Decryp_UI_Previews: PreviewProvider {
    static var previews: some View {
        RSA_Decryp_UI()
    }
}
