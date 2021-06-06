//
//  PaillierCalculate.swift
//  Asymmetric cryptographic calculator
//
//  Created by Huey Bai on 5/6/21.
//

import Foundation

func paillierEncryp(n:BInt, g:BInt, m:BInt, r:BInt) -> BInt {
    return (pow(g, m)*pow(r, n)) % (n*n)
}

func paillierDecryp(n:BInt, mu:BInt, lambda:BInt, c:BInt) -> BInt {
    return ((((BIntMath.mod_exp(c, lambda, n*n))-1)/n) * mu) % n
}

func PaillierGeneratPrivateKey(p:BInt, q:BInt, g:BInt) -> (BInt,BInt){
    let lambda:BInt = BIntMath.lcm(p-1, q-1)
    let n = p * q
    let k = (BIntMath.mod_exp(g, lambda, n*n)-1)/n
    let mu = BIntMath.mod_reversa(k, n)
    return (lambda,mu)
}
