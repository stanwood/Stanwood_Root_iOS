//
//  Presenter.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2019 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// Presentable protocol represents a Presentable class in the stanwood architecture
public protocol Presentable {
    
    /// Actionable associatedtype
    associatedtype Actionable
    
    /// Paramaterable associatedtype
    associatedtype Parameterable
    
    /// Viewable associatedtype
    associatedtype Viewable
    
    /// Actionable property
    var actions: Actionable { get set }
    
    /// Parameterable property
    var parameters: Parameterable { get set }
    
    /// Viewable property
    var view: Viewable? { get set }
    
    /**
     Presentable required initialisers
     
     - Parameters:
        - actions: Actionable type
        - parameters: Parameterable type
        - view: Viewable type
     */
    init(actions: Actionable, parameters: Parameterable, view: Viewable)
}

extension Presentable {
    
    static func make(actions: Actionable,
                     parameters: Parameterable,
                     view: Viewable) -> Self {
        let presenter = self.init(actions: actions, parameters: parameters, view: view)
        return presenter
    }
}
