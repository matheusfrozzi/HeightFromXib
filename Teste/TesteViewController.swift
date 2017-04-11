//
//  TesteViewController.swift
//  TagLivros
//
//  Created by Matheus Frozzi Alberton on 10/04/17.
//  Copyright © 2017 flockr. All rights reserved.
//

import UIKit

class TesteViewController: UIView {
    
    @IBOutlet weak var labelTeste: UILabel!

    class func instanceFromNib() -> TesteViewController {
        return Bundle.main.loadNibNamed("Teste", owner: self, options: nil)![0] as! TesteViewController
    }

    override func layoutMarginsDidChange() {
//        sizeHeaderToFit()
    }

    override func awakeFromNib() {
//        self.autoresizesSubviews = true
    }
    
    override func layoutSubviews() {
        sizeHeaderToFit()
    }
    
//    override func setNeedsLayout() {
//        sizeHeaderToFit()
//    }

    func sizeHeaderToFit() {
        
//        self.setNeedsLayout()
//        self.layoutIfNeeded()
        
        let height = self.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
//    func heightAfterAutoLayoutPassAndRenderingWithBlock:(UICollectionViewCellAutoLayoutRenderBlock)block {
//    return [self heightAfterAutoLayoutPassAndRenderingWithBlock:block
//    collectionViewWidth:CGRectGetWidth([[UIScreen mainScreen] bounds])];
//    }
    
    func calc(width: CGFloat) -> CGFloat {
        self.setNeedsUpdateConstraints()
        self.updateConstraintsIfNeeded()
        
        self.bounds = CGRect(x: 0, y: 0, width: width, height: self.bounds.height)

        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        let height = self.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        
        return height
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
