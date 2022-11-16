//
//  Error.swift
//  TravelerAPI-StoyBoard
//
//  Created by Marc-Antoine BAR on 2022-11-16.
//

enum NetworkError: Error {
    case BadUrl
    case ErrorNil
    case StatusCode200
    case decoderJSON
}
