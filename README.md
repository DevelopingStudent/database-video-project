# Database Group Project

This repository keeps the Database Group project organized in a readable relational structure.


## Project scope

This project has two connected deliverables for the technology project assignment:

1. A research brief about databases as a technology domain within information systems.
2. A companion video that explains the same topic through the Yahoo breach and the Mother of All Breaches as examples.
3. A database to show a real example of databases and apply the knowledge in a hands on way

The database in this repository is the shared project layer for both deliverables. It organizes the research sources, paper and narration content, scene plan, citations, media references, and audio assets used to develop the final paper and video.

## Paper scope

The research brief covers:

- the role of databases within information systems
- organizational goals and business value
- current research and major trends or challenges
- academic pathways, including a Utah Valley University pathway
- database-related career opportunities, skills, and credentials
- a conclusion and APA-style references

## Video scope

The video translates the database concepts into an accessible narrative. Its current structure covers:

- the Yahoo breach as the opening example
- fields, records, databases, and queries
- concurrent use, scalability, and permissions
- the connection between the Yahoo breach and aggregated breach data
- the Mother of All Breaches and the meaning of large record counts
- why searchable databases are useful and why stolen organized data is dangerous
- a closing summary about scale and access control

## Credits and responsibilities

| Area | People | Responsibility |
|---|---|---|
| Research brief | Brandon and Dulce | Research, writing, academic pathways, careers, and references |
| Video and database | Project lead and Harshith | Video planning, narration structure, database organization, media coordination, and production support |

## Repository contents

- `data/sources.csv`: research sources for the paper and video
- `data/script_segments.csv`: narration segments
- `data/script_sections.csv`: larger narration sections
- `data/scenes.csv`: scene timing and visual plan
- `data/citations.csv`: scene-to-source relationships
- `data/script_citations.csv`: narration-to-source relationships
- `data/media_files.csv`: major project files
- `data/audio_assets.csv`: music and sound effects
- `data/video_sources.csv`: video source references
- `schema.sql`: relational database structure

## Source files

The full paper template and assignment instructions remain the authoritative documents for submission requirements. Large PDFs, media files, and working documents can remain in Google Drive while this repository stores the structured project information and source links.

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


## Storage strategy

Google Drive = actual PDFs, music, sound effects, and other large source files.

GitHub = readable structured data, source links, and schema.

SQLite = optional relational snapshot generated from the structured data.
