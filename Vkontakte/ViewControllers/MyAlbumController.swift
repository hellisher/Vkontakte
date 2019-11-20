//
//  AlbumController.swift
//  Vkontakte
//
//  Created by Валерий Эль-Хатиб on 21.10.2019.
//  Copyright © 2019 EVM Corporation. All rights reserved.
//

import UIKit
import RealmSwift

class MyAlbumController: UICollectionViewController {
    
    var userPhotos = [UserPhoto]()
    var api = GetVKAPI()
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        let photos = realm.objects(UserPhoto.self)
        self.token = photos.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let results):
                print(results)
            case let .update(results, deletions, insertions, modifications):
                print(results, deletions, insertions, modifications)
            case .error(let error):
                print(error)
            }
            print("User's album data has changed")
        }
        
        api.loadUserPhotosData() { [weak self] in
            DispatchQueue.main.async {
                self?.userPhotos = Database.shared.loadUserPhotosData()
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyAlbumCell", for: indexPath) as! MyAlbumCell
//        let userPhoto = userPhotos[indexPath.row]
//        cell.userPhotos = userPhoto
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
