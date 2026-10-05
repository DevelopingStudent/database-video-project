PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS media_files (
    file_name TEXT PRIMARY KEY,
    media_type TEXT NOT NULL,
    version_label TEXT,
    duration_seconds REAL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS scenes (
    scene_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    start_time_seconds REAL,
    end_time_seconds REAL,
    narration_scope TEXT,
    visual_description TEXT,
    purpose TEXT,
    status TEXT DEFAULT 'planned'
);

CREATE TABLE IF NOT EXISTS sources (
    source_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    source_type TEXT,
    author_or_org TEXT,
    url_or_file_ref TEXT,
    stored_copy TEXT,
    access_reference TEXT,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS script_segments (
    segment_id INTEGER PRIMARY KEY,
    scene_id INTEGER,
    text TEXT NOT NULL,
    speaker TEXT,
    status TEXT DEFAULT 'draft',
    FOREIGN KEY (scene_id) REFERENCES scenes(scene_id)
);

CREATE TABLE IF NOT EXISTS citations (
    scene_id INTEGER NOT NULL,
    source_id INTEGER NOT NULL,
    support_note TEXT,
    PRIMARY KEY (scene_id, source_id),
    FOREIGN KEY (scene_id) REFERENCES scenes(scene_id),
    FOREIGN KEY (source_id) REFERENCES sources(source_id)
);

CREATE TABLE IF NOT EXISTS script_sections (
    title TEXT PRIMARY KEY,
    start_segment_id INTEGER NOT NULL,
    end_segment_id INTEGER NOT NULL,
    purpose TEXT,
    status TEXT DEFAULT 'current',
    FOREIGN KEY (start_segment_id) REFERENCES script_segments(segment_id),
    FOREIGN KEY (end_segment_id) REFERENCES script_segments(segment_id)
);

CREATE TABLE IF NOT EXISTS script_citations (
    segment_id INTEGER NOT NULL,
    source_id INTEGER NOT NULL,
    support_note TEXT,
    PRIMARY KEY (segment_id, source_id),
    FOREIGN KEY (segment_id) REFERENCES script_segments(segment_id),
    FOREIGN KEY (source_id) REFERENCES sources(source_id)
);

CREATE TABLE IF NOT EXISTS audio_assets (
    file_name TEXT PRIMARY KEY,
    asset_type TEXT,
    source_site TEXT,
    source_title TEXT,
    creator_or_owner TEXT,
    source_url TEXT,
    license TEXT,
    stored_copy TEXT,
    access_reference TEXT,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS video_sources (
    title TEXT PRIMARY KEY,
    source_type TEXT,
    source_url TEXT,
    notes TEXT
);

CREATE INDEX IF NOT EXISTS idx_scenes_time
ON scenes(start_time_seconds, end_time_seconds);

CREATE INDEX IF NOT EXISTS idx_script_segments_scene
ON script_segments(scene_id);

CREATE INDEX IF NOT EXISTS idx_script_citations_source
ON script_citations(source_id);
