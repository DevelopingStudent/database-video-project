# Database Video Project Database

This starter SQLite database is designed to track the video project without storing large media files inside the database.

Large video/audio/project files should remain in Google Drive. The database stores references to those files and connects them to scenes, script segments, sources, and DaVinci timeline events.

## Main tables

- `projects`: project-level information
- `media_files`: rendered videos, DaVinci exports, audio files, and other major project files
- `scenes`: scene-by-scene breakdown of the finished or working video
- `assets`: B-roll, graphics, music, screenshots, sound effects, etc.
- `scene_assets`: connects assets to scenes
- `sources`: research material and citations
- `citations`: connects sources to scenes
- `script_segments`: narration/script text
- `timeline_events`: exact DaVinci clip/timeline data when XML/EDL/CSV data is available

## Storage strategy

Google Drive = large files and media.
GitHub = database/schema/structured project data.
SQLite = the actual relational project database.
