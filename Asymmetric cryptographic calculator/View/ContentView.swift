//
//  ContentView.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import SwiftUI

let strArr:[String] = ["RSA Encryp","RSA Decryp","RSA Private key Generater","ElGamal Encryp","ElGamal Decryp","Paillier Encryp","Paillier Decryp","Paillier Private key Generater"]
let viewArr:[Any] = [RSA_Encryp_UI.self, RSA_Decryp_UI.self, RSA_Generate_PK_UI.self, ElGamal_Encryp_UI.self, ElGamal_Decryp_UI.self, Paillier_Encryp_UI.self, Paillier_Decryp_UI.self, Paillier_Generate_PK_UI.self]
struct ContentView: View {
    var body: some View {
        NavigationView{
            List(0..<strArr.count) { i in
                NavigationLink(destination:
                                buildView(index: i)) {
                Text(strArr[i])
                }
            }
            .navigationBarTitle("Calculator")
        }
    }
}

func buildView(index: Int) -> AnyView {
        switch viewArr[index].self {
            case is RSA_Encryp_UI.Type: return AnyView(RSA_Encryp_UI())
            case is RSA_Decryp_UI.Type: return AnyView(RSA_Decryp_UI())
            case is RSA_Generate_PK_UI.Type: return AnyView(RSA_Generate_PK_UI())
            case is ElGamal_Encryp_UI.Type: return AnyView(ElGamal_Encryp_UI())
            case is ElGamal_Decryp_UI.Type: return AnyView(RSA_Decryp_UI())
            case is Paillier_Encryp_UI.Type: return AnyView(Paillier_Encryp_UI())
            case is Paillier_Decryp_UI.Type: return AnyView(Paillier_Decryp_UI())
        case is Paillier_Generate_PK_UI.Type: return AnyView(Paillier_Generate_PK_UI())
            default: return AnyView(EmptyView())
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
