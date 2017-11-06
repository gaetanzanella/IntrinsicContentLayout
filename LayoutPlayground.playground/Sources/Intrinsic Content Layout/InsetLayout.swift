//
//  InsetLayout.swift
//  IntrinsicLayoutContent
//
//  Created by Gaétan Zanella on 24/08/2017.
//
//

import UIKit

public struct InsetLayout : IntrinsicContentLayout {
    public let content: IntrinsicContentLayout
    public let insets: UIEdgeInsets

    public init(content: IntrinsicContentLayout, insets: UIEdgeInsets) {
        self.content = content
        self.insets = insets
    }

    public func layout(in rect: CGRect) {
        let origin = rect.origin.movedTo(insets.left, insets.top)
        let size = rect.size.shrinked(by: insets)
        let contentRect = CGRect(origin: origin, size: size)
        content.layout(in: contentRect)
    }

    public func intrinsicSizeThatFits(_ size: CGSize) -> CGSize {
        return content.intrinsicSizeThatFits(size.shrinked(by: insets)).extended(by: insets)
    }
}
