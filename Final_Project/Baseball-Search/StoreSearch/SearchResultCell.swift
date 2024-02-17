
import UIKit

class SearchResultCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var artistNameLabel: UILabel!
  @IBOutlet weak var artworkImageView: UIImageView!
  
  var downloadTask: URLSessionDownloadTask?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // New code below
    let selectedView = UIView(frame: CGRect.zero)
    selectedView.backgroundColor = UIColor(named: "SearchBar")?.withAlphaComponent(0.5)
    selectedBackgroundView = selectedView
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    downloadTask?.cancel()
    downloadTask = nil
  }
  
  // MARK: - Helper Methods
  func configure(for result: SearchResult) {
    nameLabel.text = result.longName
    
    if result.longName!.isEmpty {
      artistNameLabel.text = "Unknown"
      
    } else if result.pos != "P" {
      artistNameLabel.text = String(format: "%@ %@ %@ %@", result.team ?? "", "2023 - AVG:\(result.stats.Hitting?.avg! ?? "")", "HR:\(result.stats.Hitting?.HR! ?? "")", "RBI:\(result.stats.Hitting?.RBI! ?? "")")
      
    }else {
      
      artistNameLabel.text = String(format: "%@ %@ %@ %@", result.team ?? "", "2023 - Wins:\(result.stats.Pitching?.Win! ?? "")", "Loss:\(result.stats.Pitching?.Loss! ?? "")", "StrikeOut:\(result.stats.Pitching?.SO! ?? "")")
    }
    
    artworkImageView.image = UIImage(systemName: "square")
    if let smallURL = URL(string: result.mlbHeadshot) {
      downloadTask = artworkImageView.loadImage(url: smallURL)
    }
  }
  
  
  
  
  func configureTeam(for result: SearchTeamResult) {
    nameLabel.text = result.teamName
    
    artistNameLabel.text = result.teamCity
    
    
    artworkImageView.image = UIImage(systemName: "square")
    if let smallURL = URL(string: result.espnLogo1) {
      downloadTask = artworkImageView.loadImage(url: smallURL)
    }
  }
}
