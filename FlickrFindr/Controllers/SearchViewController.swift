//
//  ViewController.swift
//  FlickrFindr
//
//  Created by Alberto Plata on 5/26/18.
//  Copyright © 2018 Alberto Plata. All rights reserved.
//

import UIKit
import UILoadControl

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var loadControl: UILoadControl?
    var page: Int = 1
    var photoData: [Photo]?
    let searchService = SearchService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.loadControl = UILoadControl(target: self, action: #selector(loadMore(_:)))
    }
    
    @objc func loadMore(_ sender: AnyObject) {
        
        page += 1
        fetchPhotos()
    }
    
    @objc func fetchPhotos() {
        
        if doesSearchBarHaveText() {
            searchService.fetchPhotos(for: searchBar.text!, page: page) { [weak self] (result, error) in
                self?.collectionView.loadControl?.endLoading()
                if let result = result, let photos = result.photo {
                    if let page = result.page, page > 1 {
                        self?.photoData! += photos
                    } else {
                        self?.photoData = photos
                    }
                    self?.collectionView.reloadData()
                }
                else if let error = error {
                    print("Error fetching photo data: \(error)")
                    self?.showError(error, completion: nil)
                }
            }
        }
        else {
            self.collectionView.loadControl?.endLoading()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        fetchPhotos()
        finishSearch()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        finishSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        page = 1
        
        // Let user finish typing for half second before making request.
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        self.perform(#selector(fetchPhotos), with: nil, afterDelay: 0.5)
    }
    
    private func finishSearch() {
        
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    private func doesSearchBarHaveText() -> Bool {
        
        return searchBar.text != nil && !searchBar.text!.isEmpty
    }
}

extension SearchViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.loadControl?.update()
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCollectionViewCell
        cell.photo = photoData![indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthAndHeight = view.frame.size.width * 0.31
        return CGSize(width: widthAndHeight, height: widthAndHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SearchCollectionViewCell
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ImageVC") as! ImageViewController
        viewController.selectedImage = cell.searchImageView.image
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
