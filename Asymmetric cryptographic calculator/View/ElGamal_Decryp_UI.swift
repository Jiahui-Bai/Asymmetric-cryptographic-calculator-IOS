//
//  ElGamal_Decryp_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import SwiftUI

struct ElGamal_Decryp_UI: View {
    @State private var p = ""
    @State private var x = ""
    @State private var m:BInt = 0
    @State private var c1 = ""
    @State private var c2 = ""
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Ciphertext 1 c1")
                    TextField("123", text: $c1)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Ciphertext c2")
                    TextField("123", text: $c2)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Public key p")
                    TextField("123", text: $p)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Private key x")
                    TextField("123", text: $x)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Plaintext：m = \(String(m))")
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal)
            }
            Button("Calculate"){
                let cc1 = BInt(c1) ?? 0
                let cc2 = BInt(c2) ?? 0
                let cp = BInt(p) ?? 0
                let cx = BInt(x) ?? 0
                if cp != 0 && cx != 0 && cc1 != 0 && cc2 != 0{
                    m = elGamalDecryp(p:cp,x:cx,c1:cc1,c2:cc2)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ElGamal_Decryp_UI_Previews: PreviewProvider {
    static var previews: some View {
        ElGamal_Decryp_UI()
    }
}
