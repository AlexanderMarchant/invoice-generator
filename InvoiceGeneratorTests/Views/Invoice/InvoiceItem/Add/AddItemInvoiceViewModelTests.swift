//
//  AddItemInvoiceViewModelTests.swift
//  InvoiceGeneratorTests
//
//  Created by Alex Marchant on 25/11/2022.
//

import XCTest
import Mockingbird
@testable import InvoiceGenerator

final class AddItemInvoiceViewModelTests: XCTestCase {
    
    func testQuantityPrompt_Invalid() throws {
        // Arrange
        let quantity = ""
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        
        // Act
        let prompt = viewModel.quantityPrompt
        
        // Assert
        XCTAssertEqual(NSLocalizedString("Enter a whole number greater than 0", comment: "Enter a whole number greater than 0"), prompt)
    }
    
    func testQuantityPrompt_Valid() throws {
        // Arrange
        let quantity = "10"
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        
        // Act
        let prompt = viewModel.quantityPrompt
        
        // Assert
        XCTAssertEqual("", prompt)
    }
    
    func testNamePrompt_Invalid() throws {
        // Arrange
        let name = ""
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.name = name
        
        // Act
        let prompt = viewModel.namePrompt
        
        // Assert
        XCTAssertEqual(NSLocalizedString("Enter a name", comment: "Enter a name"), prompt)
    }
    
    func testNamePrompt_Valid() throws {
        // Arrange
        let name = "Test"
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.name = name
        
        // Act
        let prompt = viewModel.namePrompt
        
        // Assert
        XCTAssertEqual("", prompt)
    }
    
    func testPricePrompt_Invalid() throws {
        // Arrange
        let price = "Ten"
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.price = price
        
        // Act
        let prompt = viewModel.pricePrompt
        
        // Assert
        XCTAssertEqual(NSLocalizedString("Enter a number greater than or equal to 0", comment: "Enter a number greater than or equal to 0"), prompt)
    }
    
    func testPricePrompt_Valid() throws {
        // Arrange
        let price = "19.98"
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.price = price
        
        // Act
        let prompt = viewModel.pricePrompt
        
        // Assert
        XCTAssertEqual("", prompt)
    }
    
    func testCreateItem_InvalidQuantity_IsNotInteger() throws {
        // Arrange
        let quantity = "Ten"
        let name = "Test"
        let price = "19.98"
        let description = ""
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertNil(viewModel.item)
        XCTAssertFalse(viewModel.showSuccessAlert)
        
        XCTAssertEqual(NSLocalizedString("Enter a whole number greater than 0", comment: "Enter a whole number greater than 0"), viewModel.quantityPrompt)
    }
    
    func testCreateItem_InvalidQuantity_Is0() throws {
        // Arrange
        let quantity = "0"
        let name = "Test"
        let price = "19.98"
        let description = ""
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertNil(viewModel.item)
        XCTAssertFalse(viewModel.showSuccessAlert)
        
        XCTAssertEqual(NSLocalizedString("Enter a whole number greater than 0", comment: "Enter a whole number greater than 0"), viewModel.quantityPrompt)
    }
    
    func testCreateItem_InvalidName() throws {
        // Arrange
        let quantity = "10"
        let name = ""
        let price = "19.98"
        let description = ""
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertNil(viewModel.item)
        XCTAssertFalse(viewModel.showSuccessAlert)
        
        XCTAssertEqual(NSLocalizedString("Enter a name", comment: "Enter a name"), viewModel.namePrompt)
    }
    
    func testCreateItem_InvalidPrice_IsNotDouble() throws {
        // Arrange
        let quantity = "10"
        let name = "Test"
        let price = "Ten"
        let description = ""
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertNil(viewModel.item)
        XCTAssertFalse(viewModel.showSuccessAlert)
        
        XCTAssertEqual(NSLocalizedString("Enter a number greater than or equal to 0", comment: "Enter a number greater than or equal to 0"), viewModel.pricePrompt)
    }
    
    func testCreateItem_InvalidPrice_IsLessThan0() throws {
        // Arrange
        let quantity = "10"
        let name = "Test"
        let price = "-10"
        let description = ""
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertNil(viewModel.item)
        XCTAssertFalse(viewModel.showSuccessAlert)
        
        XCTAssertEqual(NSLocalizedString("Enter a number greater than or equal to 0", comment: "Enter a number greater than or equal to 0"), viewModel.pricePrompt)
    }
    
    func testCreateItem_InvalidPrice_Success_Desscription_IsNil() throws {
        // Arrange
        let quantity = "10"
        let name = "Test"
        let price = "19.98"
        let description = ""
        
        let expectedQuantity = 10
        let expectedPrice = 19.98
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertEqual(expectedQuantity, viewModel.item?.quantity)
        XCTAssertEqual(name, viewModel.item?.name)
        XCTAssertEqual(expectedPrice, viewModel.item?.price)
        XCTAssertNil(viewModel.item?.description)
        
        XCTAssertTrue(viewModel.showSuccessAlert)
    }
    
    func testCreateItem_InvalidPrice_Success_Desscription_NotNil() throws {
        // Arrange
        let quantity = "10"
        let name = "Test"
        let price = "19.98"
        let description = "Testing"
        
        let expectedQuantity = 10
        let expectedPrice = 19.98
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertEqual(expectedQuantity, viewModel.item?.quantity)
        XCTAssertEqual(name, viewModel.item?.name)
        XCTAssertEqual(expectedPrice, viewModel.item?.price)
        XCTAssertEqual(description, viewModel.item?.description)
        
        XCTAssertTrue(viewModel.showSuccessAlert)
    }
    
    func testCreateItem_InvalidPrice_Success_Price_Is0() throws {
        // Arrange
        let quantity = "10"
        let name = "Test"
        let price = "0"
        let description = "Testing"
        
        let expectedQuantity = 10
        let expectedPrice: Double = 0
        
        let viewModel = AddInvoiceItemView.ViewModel()
        
        viewModel.quantity = quantity
        viewModel.name = name
        viewModel.price = price
        viewModel.description = description
        
        // Act
        viewModel.createItem()
        
        // Assert
        XCTAssertEqual(expectedQuantity, viewModel.item?.quantity)
        XCTAssertEqual(name, viewModel.item?.name)
        XCTAssertEqual(expectedPrice, viewModel.item?.price)
        XCTAssertEqual(description, viewModel.item?.description)
        
        XCTAssertTrue(viewModel.showSuccessAlert)
    }
}
