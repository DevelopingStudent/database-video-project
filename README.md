# Database Video Project

This repository keeps the Database Video project organized in a readable relational structure.

Large source files stay in Google Drive. GitHub stores the structured project data, source links, script relationships, and database schema.

## Main data files

- `data/media_files.csv`: major project files such as the current render, script, and DaVinci project
- `data/scenes.csv`: scene-by-scene breakdown
- `data/script_segments.csv`: narration/script text
- `data/script_sections.csv`: larger logical script sections
- `data/sources.csv`: research sources and direct access locations
- `data/script_citations.csv`: connects script segments to supporting sources
- `data/citations.csv`: connects scenes to supporting sources
- `data/audio_assets.csv`: music and sound effects with source and Drive access information
- `data/video_sources.csv`: identified or general stock-video sources

## Readability rules


IDs are:
- `scene_id` identifies scenes
- `segment_id` identifies script segments
- `source_id` identifies research sources

Standalone tracking IDs that were not used by other tables were removed.

## Storage strategy

Google Drive = actual PDFs, music, sound effects, and other large source files.

GitHub = readable structured data, source links, and schema.

SQLite = optional relational snapshot generated from the structured data.
