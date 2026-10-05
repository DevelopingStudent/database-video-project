# Source Access

This directory index explains where the actual source material for the Database Video project is stored.

## Course PDFs

Actual copies are stored in the Google Drive folder:

`Google Drive / Database Video Sources / course_material`

Files:
- `databases.pdf`
- `Database vs spreadsheet.pdf`
- `working with a databse.pdf`
- `Database and Location Access.pdf`
- `database structure.pdf`

The corresponding source records are in `data/sources.csv`.

## Audio and Music

Actual copies of the identified audio files are stored in Google Drive:

`Google Drive / Database Video Sources / audio`

The corresponding source-page URLs, creator information, and license records are in `data/audio_assets.csv`.

## Web Research

Web research sources are not copied locally. Their direct URLs are stored in `data/sources.csv`.

## Video Sources

Exact or general stock-video source URLs are stored in `data/video_sources.csv`. The Yahoo opening footage has an exact YouTube URL. Unidentified Pixabay stock footage uses a general Pixabay attribution rather than a fabricated exact asset citation.

## Citation relationships

`data/script_citations.csv` connects script segments to the source IDs in `data/sources.csv`.

`data/citations.csv` connects scenes to source IDs.

This means a citation ID is only the relationship record. The actual source can be found through its `source_id` in `data/sources.csv`, which now includes either a stored-copy location or a direct web URL.
