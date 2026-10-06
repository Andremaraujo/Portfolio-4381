import { Section } from "./section";

const CATEGORIES = [
  {
    index: "A",
    title: "Hardware & Microcontrollers",
    items: [
      "Arduino",
      "PEPE-16 architecture",
      "Circuit prototyping",
      "Memory-mapped I/O",
      "Timers & interrupts",
    ],
  },
  {
    index: "B",
    title: "Programming",
    items: ["C", "Assembly (PEPE-16)", "C++"],
  },
  {
    index: "C",
    title: "CAD & Design",
    items: ["Solid Edge 3D modeling", "Enclosure design"],
  },
];

export function Skills() {
  return (
    <Section id="skills" index="03" title="Skills" dark>
      <div className="grid gap-px border border-silver/20 bg-silver/20 sm:grid-cols-2 lg:grid-cols-3">
        {CATEGORIES.map((cat, i) => (
          <div
            key={cat.title}
            className="reveal group relative bg-charcoal p-7 transition-colors duration-300 hover:bg-charcoal-soft"
            data-reveal-delay={i * 90}
          >
            <div className="flex items-center gap-3">
              <span className="flex h-8 w-8 shrink-0 items-center justify-center bg-amber-fire font-display text-sm font-bold text-charcoal">
                {cat.index}
              </span>
              <h3 className="font-display text-base font-bold uppercase tracking-[0.1em] text-silver">
                {cat.title}
              </h3>
            </div>

            <ul className="mt-6 space-y-3">
              {cat.items.map((item) => (
                <li key={item} className="flex items-start gap-3 text-sm text-silver/80">
                  <span aria-hidden className="mt-2.5 h-px w-4 shrink-0 bg-amber-fire" />
                  {item}
                </li>
              ))}
            </ul>

            <span
              aria-hidden
              className="pointer-events-none absolute bottom-0 right-0 h-8 w-8 border-b-2 border-r-2 border-amber-fire opacity-0 transition-opacity duration-300 group-hover:opacity-100"
            />
          </div>
        ))}
      </div>
    </Section>
  );
}
