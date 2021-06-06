//
//  ElGamal_Encryp_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import SwiftUI

struct ElGamal_Encryp_UI: View {
    @State private var p = ""
    @State private var g = ""
    @State private var y:BInt = 0
    @State private var x = ""
    @State private var r = ""
    @State private var m = ""
    @State private var c1:BInt = 0
    @State private var c2:BInt = 0
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
                    Text("Public key p")
                    TextField("123", text: $p)
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
                    Text("Private key x")
                    TextField("123", text: $x)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Public key: y = \(String(y))\nCiphertext: c1 = \(String(c1))\n\t\t\t c2 = \(String(c2))")
                        
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal)
            }
            Button("计算"){
                let cg = BInt(g) ?? 0
                let cp = BInt(p) ?? 0
                let cx = BInt(x) ?? 0
                let cr = BInt(r) ?? 0
                let cm = BInt(m) ?? 0
                if cg != 0 && cx != 0 && cp != 0 {
                    y = BIntMath.mod_exp(cg,cx,cp)
                    if y != 0 && cr != 0 && cm != 0{
                        (c1,c2) = elGamalEncryp(p: cp,g: cg,y: y,r: cr,m: cm)
                    }
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ElGamal_Encryp_UI_Previews: PreviewProvider {
    static var previews: some View {
        ElGamal_Encryp_UI()
    }
}
