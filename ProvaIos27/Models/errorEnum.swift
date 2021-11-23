//
//  errorEnum.swift
//  ProvaIos27
//
//  Created by COTEMIG on 14/03/38 ERA1.
//

import Foundation

enum enumErrors: String, Error {
    case badFormat = "The email address is badly formatted."
    case typeMismatch = "Not an array"
    case emailAlreadyInUse = "The email is already in use with another account"
    case userNotFound = "Account not found for the specified user. Please check and try again"
    case userDisabled = "Your account has been disabled. Please contact support."
    case invalidEmail, invalidSender, invalidRecipientEmail = "Please enter a valid email"
    case networkError = "Network error. Please try again."
    case weakPassword = "Your password is too weak. The password must be 6 characters long or more."
    case wrongPassword = "Your password is incorrect. Please try again or use 'Forgot password' to reset your password"
}
