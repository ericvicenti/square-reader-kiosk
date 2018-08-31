//
//  OPaymentManager.swift
//  kiosk
//
//  Created by Eric Vicenti on 8/31/18.
//

import Foundation
import SquareReaderSDK

@objc(OPaymentManager)
class OPaymentManager: NSObject {
  
  public weak var delegate: SQRDCheckoutControllerDelegate?

  @objc(getPermissions:)
  func getPermissions(callback: RCTResponseSenderBlock) -> Void {
    NSLog("permission check!")
    callback([42])
  }

  @objc(getPayment:description:)
  func getPayment(amount: NSNumber, description: String) -> Void {
    let money = SQRDMoney(amount: amount.intValue)
    let checkoutParameters = SQRDCheckoutParameters(amountMoney: money)
    checkoutParameters.note = description
    checkoutParameters.alwaysRequireSignature = false
    checkoutParameters.skipReceipt = true
    
    // Create a checkout controller
    let checkoutController = SQRDCheckoutController(parameters: checkoutParameters, delegate: self as! SQRDCheckoutControllerDelegate)

    
    NSLog("hello, %@ %@", description, amount)
  }
  
  @objc
  func constantsToExport() -> [String: Any]! {
//        return ["nativeSupportVersion": 0, "squareCheckoutControllerVersion": SQRDCheckoutController.version()]
        return ["nativeSupportVersion": 0]
  }
  
  @objc static
  func requiresMainQueueSetup() -> Bool {
    return true
  }
}
