library(arrow)
library(dplyr)
audio_features <- read.csv("/projects/bckj/Team2/data/Spotify/audio_features.csv")
sp_track <- read.csv("/projects/bckj/Team2/data/Spotify/sp_track.csv")
bp_track <- read.csv("/projects/bckj/Team2/data/Spotify/bp_track.csv")
bp_genre <- read.csv("/projects/bckj/Team2/data/Spotify/bp_genre.csv")

sp_track <- sp_track[, !(colnames(sp_track) %in% c("duration_ms","updated_on","preview_url"))]
bp_track <- bp_track[, !(colnames(bp_track) %in% c("duration_ms","updated_on","track_id","release_id"))]
bp_genre <- bp_genre[, !(colnames(bp_genre) %in% c("updated_on"))]

df <- merge(audio_features, sp_track, by = "isrc")
df <- merge(df , bp_track, by = "isrc")
df <- merge(df , bp_genre, by = "genre_id")

write_parquet(df,  sink = "/scratch/projects/bckj/Team2/data/parquet")
 

