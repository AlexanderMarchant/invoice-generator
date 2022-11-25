//
//  String+AsDoubleFormatTests.swift
//  InvoiceGeneratorTests
//
//  Created by Alex Marchant on 25/11/2022.
//

import XCTest

final class String_AsDoubleFormatTests: XCTestCase {
    
    func testEmpty() throws {
        // Arrange
        let price = ""
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testSingleCharacter_Letter() throws {
        // Arrange
        let price = "A"
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testSingleCharacter_Special() throws {
        // Arrange
        let price = "!"
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testSingleCharacter_Number() throws {
        // Arrange
        let price = "1"
        let expectedPrice = "1"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testSingleCharacter_Period() throws {
        // Arrange
        let price = "."
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_OnlyLetters() throws {
        // Arrange
        let price = "Alex"
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_OnlySpecials() throws {
        // Arrange
        let price = "!@£$"
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_OnlyNumbers() throws {
        // Arrange
        let price = "1998"
        let expectedPrice = "1998"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_OnlyPeriods() throws {
        // Arrange
        let price = "...."
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_LettersAndSpecials() throws {
        // Arrange
        let price = "LA$%jkjkj!@£$FASD"
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_LettersAndNumbers() throws {
        // Arrange
        let price = "A23LFa35234"
        let expectedPrice = "2335234"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_LettersAndPeriods() throws {
        // Arrange
        let price = "A.Fjk.prea."
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_StartingNumberAndPeriod() throws {
        // Arrange
        let price = "1."
        let expectedPrice = "1."
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_StartingNumberAndPeriods() throws {
        // Arrange
        let price = "1...."
        let expectedPrice = "1."
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_StartingPeriodAndNumbers() throws {
        // Arrange
        let price = ".1382143219"
        let expectedPrice = "0.13"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_PeriodAndNumber() throws {
        // Arrange
        let price = ".1"
        let expectedPrice = "0.1"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_MixOfNumbersAndPeriods() throws {
        // Arrange
        let price = "1234.567.425.1"
        let expectedPrice = "1234.56"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_LettersAndSpecialsAndNumbers() throws {
        // Arrange
        let price = "AB@£!342F@123fsaT^$@$4£@"
        let expectedPrice = "3421234"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_LettersAndSpecialsAndPeriods() throws {
        // Arrange
        let price = "FAS!@£.£fdsajfk.FASF!£!$@"
        let expectedPrice = ""
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }
    
    func testManyCharacters_LettersAndSpecialsAndNumbersAndPeriods() throws {
        // Arrange
        let price = "FA1234S!@£.£fds5ajfk.FASF!7£!$@"
        let expectedPrice = "1234.5"
        
        // Act
        let returnedPrice = price.asDoubleFormat()
        
        // Assert
        XCTAssertEqual(expectedPrice, returnedPrice)
    }

}
