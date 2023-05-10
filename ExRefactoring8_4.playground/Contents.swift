import UIKit

// before
struct TelephoneNumber {
    var areaCode: String
    var number: String
    
    init(areaCode: String, number: String) {
        self.areaCode = areaCode
        self.number = number
    }
}

struct Person {
    var telephoneNumber: TelephoneNumber
    
    var officeAreaCode: String {
        get { telephoneNumber.areaCode }
        set { telephoneNumber.areaCode = newValue }
    }
    
    var officeNumber: String {
        get { telephoneNumber.number }
        set { telephoneNumber.number = newValue }
    }
}

// after
struct Refactor_TelephoneNumber {
    // 1. 불변성 프로퍼티로 변경 (var -> let)
    let areaCode: String
    let number: String
    
    init(areaCode: String, number: String) {
        self.areaCode = areaCode
        self.number = number
    }
}

struct Refactor_Person {
    var telephoneNumber: Refactor_TelephoneNumber
    
    // 2-1. setter안에 필드를 변경하는게 아닌 새로 객체를 만들도록 변경
    var officeAreaCode: String {
        get { telephoneNumber.areaCode }
        set { telephoneNumber = .init(areaCode: telephoneNumber.areaCode, number: newValue) }
    }
    
    // 2-2. setter안에 필드를 변경하는게 아닌 새로 객체를 만들도록 변경
    var officeNumber: String {
        get { telephoneNumber.number }
        set { telephoneNumber = .init(areaCode: newValue, number: telephoneNumber.number) }
    }
}

