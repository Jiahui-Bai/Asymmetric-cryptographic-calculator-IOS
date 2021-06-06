//
//  ElGamalCalculate.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import Foundation
func elGamalEncryp(p:BInt, g:BInt, y:BInt, r:BInt, m:BInt) -> (BInt,BInt){
    let k = BIntMath.mod_exp(y,r,p)
    let c1 = BIntMath.mod_exp(g,r,p)
    let c2 = (m*k)%p
    return (c1,c2)
}

func elGamalDecryp(p:BInt, x:BInt, c1:BInt, c2:BInt) -> BInt{
    let k = BIntMath.mod_exp(c1,x,p)
    let k2 = BIntMath.mod_reversa(k,p)
    return (k2*c2)%p
}
