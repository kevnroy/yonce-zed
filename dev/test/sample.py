"""Module docstring: should render as comment.doc."""
from __future__ import annotations

import re
from dataclasses import dataclass, field
from typing import Iterable

PATTERN = re.compile(r"^(?P<name>[a-z]+)-(?P<num>\d{2,})#?$")

@dataclass
class Track:
    """A single track."""
    name: str
    plays: int = 0
    tags: list[str] = field(default_factory=list)

    def score(self) -> float:
        if not self.plays:
            return 0.0
        return self.plays / (1 + len(self.tags))

def top(tracks: Iterable[Track], limit: int = 3) -> list[Track]:
    ranked = sorted(tracks, key=lambda t: t.score(), reverse=True)
    return ranked[:limit]

if __name__ == "__main__":
    sample = [Track("formation", 10, ["beyonce"]), Track("halo")]
    print([f"{t.name}: {t.score():.2f}" for t in top(sample)])
