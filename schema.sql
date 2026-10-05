PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS projects (
    project_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS media_files (
    media_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    file_name TEXT NOT NULL,
    media_type TEXT NOT NULL,
    storage_url TEXT,
    duration_seconds REAL,
    version_label TEXT,
    notes TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE IF NOT EXISTS scenes (
    scene_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    scene_number INTEGER,
    title TEXT,
    start_time_seconds REAL,
    end_time_seconds REAL,
    narration TEXT,
    visual_description TEXT,
    purpose TEXT,
    status TEXT DEFAULT 'planned',
    edit_notes TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE IF NOT EXISTS assets (
    asset_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    file_name TEXT,
    asset_type TEXT,
    storage_provider TEXT,
    storage_url TEXT,
    source_origin TEXT,
    license_notes TEXT,
    notes TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE IF NOT EXISTS scene_assets (
    scene_id INTEGER NOT NULL,
    asset_id INTEGER NOT NULL,
    role TEXT,
    timeline_in_seconds REAL,
    timeline_out_seconds REAL,
    PRIMARY KEY (scene_id, asset_id, timeline_in_seconds),
    FOREIGN KEY (scene_id) REFERENCES scenes(scene_id),
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id)
);

CREATE TABLE IF NOT EXISTS sources (
    source_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    source_type TEXT,
    author_or_org TEXT,
    url_or_file_ref TEXT,
    notes TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE IF NOT EXISTS citations (
    citation_id INTEGER PRIMARY KEY,
    scene_id INTEGER,
    source_id INTEGER NOT NULL,
    support_note TEXT,
    FOREIGN KEY (scene_id) REFERENCES scenes(scene_id),
    FOREIGN KEY (source_id) REFERENCES sources(source_id)
);

CREATE TABLE IF NOT EXISTS script_segments (
    segment_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    scene_id INTEGER,
    segment_order INTEGER,
    text TEXT NOT NULL,
    speaker TEXT,
    status TEXT DEFAULT 'draft',
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (scene_id) REFERENCES scenes(scene_id)
);

CREATE TABLE IF NOT EXISTS timeline_events (
    event_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    scene_id INTEGER,
    track_name TEXT,
    clip_name TEXT,
    event_type TEXT,
    timeline_start_seconds REAL,
    timeline_end_seconds REAL,
    source_start_seconds REAL,
    source_end_seconds REAL,
    notes TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (scene_id) REFERENCES scenes(scene_id)
);

CREATE INDEX IF NOT EXISTS idx_scenes_project ON scenes(project_id);
CREATE INDEX IF NOT EXISTS idx_scenes_time ON scenes(start_time_seconds, end_time_seconds);
CREATE INDEX IF NOT EXISTS idx_timeline_scene ON timeline_events(scene_id);
CREATE INDEX IF NOT EXISTS idx_sources_project ON sources(project_id);
