//
//  DetailViewController.swift
//  ios101-lab6-flix
//
//  Created by Victoria Nunez on 10/17/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    // Property to store the passed in movie
    var movie: Movie!

    @IBOutlet weak var backdropImage: UIImageView!
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    @IBOutlet weak var movieCaption: UILabel!
    
    
    @IBOutlet weak var movieVoteAvg: UILabel!
    
    
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Configure the labels
        navigationItem.largeTitleDisplayMode = .never

        movieTitle.text = movie.title
        movieCaption.text = movie.overview

        // Unwrap the optional vote average
        if let voteAverage = movie.voteAverage {

            // voteAverage is a Double
            // We can convert it to a string using `\(movie.voteAverage)` (aka *String Interpolation*)
            // inside string quotes (aka: *string literal*)
            movieVoteAvg.text = "Vote Average: \(voteAverage)"
        } else {

            // if vote average is nil, set vote average label text to empty string
            movieVoteAvg.text = ""
        }

        // The `releaseDate` is a `Date` type. We can convert it to a string using a `DateFormatter`.
        // Create a date formatter
        let dateFormatter = DateFormatter()

        // Set the date style for how the date formatter will display the date as a string.
        // You can experiment with other settings like, `.short`, `.long` and `.full`
        dateFormatter.dateStyle = .medium

        // Unwrap the optional release date
        if let releaseDate = movie.releaseDate {

            // Use the the date formatter's `string(from: Date)` method to convert the date to a string
            let releaseDateString = dateFormatter.string(from: releaseDate)
            movieReleaseDate.text = "Release Date: \(releaseDateString)"
        } else {

            // if release date is nil, set release date label text to empty string
            movieReleaseDate.text = ""
        }
        // Do any additional setup after loading the view.
        // MARK: - Configure the image views

        // Unwrap the optional poster path
        if let posterPath = movie.posterPath,

        // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {

            // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
            Nuke.loadImage(with: imageUrl, into: moviePosterImage)
        }

        // Unwrap the optional backdrop path
        if let backdropPath = movie.backdropPath,

        // Create a url by appending the backdrop path to the base url. https://developers.themoviedb.org/3/getting-started/images
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath) {

            // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
            Nuke.loadImage(with: imageUrl, into: backdropImage)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
