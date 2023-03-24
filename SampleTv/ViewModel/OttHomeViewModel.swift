//
//  OttHomeViewModel.swift
//  SampleTv
//
//  Created by @karthi on 23/03/23.
//

// MARK: - Class OttHomeViewModel

class OttHomeViewModel: BaseViewModel {
    
    public var trendingMovies = [ "trend1",
                                  "trend2",
                                  "trend3",
                                  "trend4",
                                  "trend5",
                                  "trend6",
                                  "trend7",
                                  "trend8",
                                  "trend9",
                                  "trend10" ]
    
    public var popularMovies = [ "movie1",
                                  "movie2",
                                  "movie3",
                                  "movie4",
                                  "movie5",
                                  "movie6",
                                  "movie7",
                                  "movie8",
                                  "movie9",
                                  "movie10" ]
    
    public var popularShows = [   "show1",
                                  "show2",
                                  "show3",
                                  "show4",
                                  "show5",
                                  "show6",
                                  "show7",
                                  "show8",
                                  "show9",
                                  "show10" ]
    
    public var mp3List = [
        MP3Model(songThumpImageName: "leo", songName: "Bloody Sweet", artistName: "Anirudh", albumName: "Leo"),
        MP3Model(songThumpImageName: "mic1", songName: "Baby Be Mine", artistName: "Micheal Jackson", albumName: "Thriller"),
        MP3Model(songThumpImageName: "mic2", songName: "Beat It", artistName: "Micheal Jackson", albumName: "Thriller"),
        MP3Model(songThumpImageName: "mic3", songName: "Billie Jean", artistName: "Micheal Jackson", albumName: "Thriller")
    ]
}
