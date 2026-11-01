//! Module docs: doc comments should render Nevada italic.
use std::collections::HashMap;

/// A documented struct with a lifetime.
#[derive(Debug, Clone)]
pub struct Song<'a> {
    pub title: &'a str,
    pub plays: u64,
    pub tags: Vec<String>,
}

pub trait Playable {
    fn play(&self) -> Result<(), String>;
}

impl<'a> Playable for Song<'a> {
    fn play(&self) -> Result<(), String> {
        if self.title.is_empty() {
            return Err(format!("untitled: {}", self.plays));
        }
        let mut counts: HashMap<&str, usize> = HashMap::new();
        counts.insert(self.title, 1);
        for (name, count) in &counts {
            println!("{name}: {count}");
        }
        Ok(())
    }
}

fn main() {
    let song = Song { title: "Formation", plays: 42, tags: vec![String::from("beyonce")] };
    match song.play() {
        Ok(()) => println!("played {:?}", song.title),
        Err(e) => eprintln!("error: {e}"),
    }
    let raw = r#"raw "string" here"#;
    let c = 'x';
    let n = 0xFF_u32;
    let _ = (raw, c, n);
}
