//
//  RSA_Encryp_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import SwiftUI

struct RSA_Encryp_UI: View {
    @State private var m = ""
    @State private var n = ""
    @State private var p = ""
    @State private var q = ""
    @State private var e = ""
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
                    Text("Public key e")
                    TextField("123", text: $e)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Ciphertext c = \(String(c))")
                        
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
                let cm = BInt(m) ?? 0
                let ce = BInt(e) ?? 0
                if cm != 0 && ce != 0 && cn != 0{
                    c = BIntMath.mod_exp(cm,ce,cn)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct RSA_Encryp_UI_Previews: PreviewProvider {
    static var previews: some View {
        RSA_Encryp_UI()
    }
}


extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
