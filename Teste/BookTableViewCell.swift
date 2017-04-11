//
//  BookTableViewCell.swift
//  TagLivros
//
//  Created by Matheus Frozzi Alberton on 27/12/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit

class BookTableViewCell: UIView {

    @IBOutlet weak var bookCoverImage: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookCurator: UILabel!
    @IBOutlet weak var bookNumPages: UILabel!
    @IBOutlet weak var bookNote: UILabel!
    @IBOutlet weak var bookNumRatings: UIButton!
    @IBOutlet weak var bookUserStars: UIButton!
    
    @IBOutlet weak var bookBGView: UIView!
    @IBOutlet weak var bookBGViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var bookBGViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bookCoverImageTopConstraint: NSLayoutConstraint!

    @IBOutlet weak var bookNewMessagesView: UIView!
    @IBOutlet weak var bookNewMessagesLabel: UILabel!
    @IBOutlet weak var bookNewMessagesViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var shadowView: UIVisualEffectView!
    @IBOutlet weak var blockedViewText: UILabel!
    
    var bookMessagesAux: UIView!

    var indexPath: IndexPath!
    var parentVC: UIViewController! {
        didSet {
            loadCell()
        }
    }
//    var bookHelper: BookHelper!
    
    var selectKitToShare: Bool = false
    
    class func instanceFromNib() -> BookTableViewCell {
        return UINib(nibName: "Book", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BookTableViewCell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.translatesAutoresizingMaskIntoConstraints = true
//        self.autoresizesSubviews = true
//        bookTitleLabel.preferredMaxLayoutWidth = bookTitleLabel.bounds.width
    }

    override func draw(_ rect: CGRect) {
        self.bookBGView.layer.cornerRadius = 17
        self.bookBGView.layer.borderWidth = 1
//        self.bookBGView.layer.borderColor = UIColor(hexa: "#E4E7EF").cgColor
//        self.bookBGView.layer.shadowColor = UIColor(hexa: "#D6D6D6").cgColor
        self.bookBGView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.bookBGView.layer.shadowOpacity = 0.5
        self.bookBGView.layer.shadowRadius = 12.0
        self.bookBGView.layer.shouldRasterize = true
        self.bookBGView.layer.rasterizationScale = UIScreen.main.scale
    }

    func loadCell() {

        if indexPath.row == 0 {
            self.bookNewMessagesView.isHidden = false
            bookNewMessagesViewHeightConstraint.constant = 47
            self.bookNewMessagesLabel.text = "\(3) NOVAS MENSAGENS"
            self.layoutIfNeeded()
        } else if let _ = self.bookNewMessagesView {
            self.bookNewMessagesView.isHidden = true
            bookNewMessagesViewHeightConstraint.constant = 0
            self.layoutIfNeeded()
        }

        if indexPath.row == 2 {
            shadowView.isHidden = false
            self.bringSubview(toFront: shadowView)
        } else {
            shadowView.isHidden = true
            self.sendSubview(toBack: shadowView)
        }

        blockedViewText.text = "LIBERAR TAG\n" + "Março 2017"

        if indexPath.row == 0 {
            self.bookBGViewTopConstraint.constant = 22
        } else {
            self.bookBGViewTopConstraint.constant = 8
        }

        if indexPath.row == 0 {
            self.bookTitleLabel.text = "A Louca da Casa Vermelho e o negro"
            self.bookAuthor.text = "Regina Casé"
            self.bookCurator.text = "Ronaldo Fenomeno Nazario dos Santos"
            self.bookNumPages.text = "3 páginas"
        } else if indexPath.row == 1 {
            self.bookTitleLabel.text = "A camera secreta"
            self.bookAuthor.text = "Pepe"
            self.bookCurator.text = "Ronaldinho gaucho"
            self.bookNumPages.text = "24 páginas"
        } else if indexPath.row == 2 {
            self.bookTitleLabel.text = "Champions League"
            self.bookAuthor.text = "UEFA Euro"
            self.bookCurator.text = "Cristiano Ronaldo Fenomeno"
            self.bookNumPages.text = "60 páginas"
        } else if indexPath.row == 3 {
            self.bookTitleLabel.text = "Teste"
            self.bookAuthor.text = "Regina Casé"
            self.bookCurator.text = "Tteste"
            self.bookNumPages.text = "3 páginas"
        }

        self.bookNumRatings.setTitle("Nenhuma avaliação", for: .normal)
        self.bookNote.text = ""
    }
    
    override func layoutMarginsDidChange() {
        sizeHeaderToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        sizeHeaderToFit()
    }
    
    override func setNeedsLayout() {
//        sizeHeaderToFit()
    }
    
    func sizeHeaderToFit() {
        
//        self.setNeedsLayout()
//        self.layoutIfNeeded()
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        let height = self.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        var frame = self.frame
        frame.size.height = height
//        frame.size.width = width
        self.frame = frame
    }
    
}
