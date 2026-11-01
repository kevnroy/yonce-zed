import { useMemo, useState } from "react";

interface Track {
  id: number;
  title: string;
  explicit?: boolean;
}

type Playlist = Track[];

const DEFAULT_VOLUME = 0.8;

export function Player({ tracks }: { tracks: Playlist }) {
  const [index, setIndex] = useState(0);
  const current = tracks[index];
  const label = useMemo(
    () => `${current?.title ?? "Untitled"} (${index + 1}/${tracks.length})`,
    [current, index, tracks.length],
  );

  return (
    <section className="player" data-testid="player" data-volume={DEFAULT_VOLUME}>
      <h1>{label}</h1>
      {tracks.map((track, i) => (
        <button key={track.id} aria-label={`Play ${track.title}`} onClick={() => setIndex(i)}>
          {track.explicit ? "Explicit" : "Clean"} — {/^\d+$/.test(track.title) ? "numeric" : "text"}
        </button>
      ))}
    </section>
  );
}
