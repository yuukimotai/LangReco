//
//  Words+CoreDataProperties.swift
//  LangReco
//
//  Created by 茂田井雄輝 on 2022/11/26.
//
//

import Foundation
import CoreData


extension Words {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Words> {
        return NSFetchRequest<Words>(entityName: "Words")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var englishWord: String?
    @NSManaged public var japaneseWord: String?

}

extension Words : Identifiable {

}
