//
//  Paillier_Generate_PK_UI.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 6/6/21.
//

import SwiftUI

struct Paillier_Generate_PK_UI: View {
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
                    Text("Public Key g")
                    TextField("123", text: $g)
                        .border(Color.blue,width: 2)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Private Key: lambda = \(String(lambda))\n\t\t\t  mu = \(String(mu))")
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal)
            }
            Button("Calculate"){
                let cp = BInt(p) ?? 0
                let cq = BInt(q) ?? 0
                let cg = BInt(g) ?? 0
                if lambdaStr == "" || muStr == "" {
                    (lambda,mu) = PaillierGeneratPrivateKey(p: cp,q: cq,g: cg)
                }else{
                    lambda = BInt(lambdaStr) ?? 0
                    mu = BInt(muStr) ?? 0
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct Paillier_Generate_PK_UI_Previews: PreviewProvider {
    static var previews: some View {
        Paillier_Generate_PK_UI()
    }
}

