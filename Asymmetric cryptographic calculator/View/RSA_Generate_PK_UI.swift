//
//  RSA_Generate_PK_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 6/6/21.
//

import SwiftUI

struct RSA_Generate_PK_UI: View {
    @State private var n = ""
    @State private var p = ""
    @State private var q = ""
    @State private var e = ""
    @State private var d:BInt = 0
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
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
                    Text("Public key e")
                    TextField("123", text: $e)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Private key d = \(String(d))")
                        
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
                let ce = BInt(e) ?? 0
                if ce != 0 && cn != 0{
                    d = BIntMath.mod_reversa(ce,cn)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct RSA_Generate_PK_UI_Previews: PreviewProvider {
    static var previews: some View {
        RSA_Generate_PK_UI()
    }
}
