import { ArrowDownRight } from "lucide-react";
import { Corner } from "./section";

const STATS = [
  { value: "B.Sc.", label: "Electrical Eng." },
  { value: "4", label: "Featured Projects" },
  { value: "IST", label: "Lisbon, Portugal" },
];

export function Hero() {
  return (
    <section
      id="home"
      className="relative flex min-h-[100svh] w-full items-center overflow-hidden bg-silver grid-blueprint px-6 pt-28 pb-16 sm:px-10 md:pt-32"
    >
      {/* structural amber rails */}
      <span
        aria-hidden
        className="absolute left-0 top-1/2 hidden h-40 w-1 -translate-y-1/2 bg-amber-fire md:block"
      />
      <span aria-hidden className="absolute inset-x-0 bottom-0 h-px bg-charcoal/25" />

      <div className="relative mx-auto grid w-full max-w-[1200px] items-center gap-14 lg:grid-cols-[1.15fr_0.85fr]">
        <div>
          <div className="reveal flex items-center gap-4" data-reveal-delay="0">
            <span className="label-mono text-charcoal/60">Portfolio / 2026</span>
            <span className="h-px w-12 bg-amber-fire" />
          </div>

          <h1 className="reveal mt-8 text-[clamp(2.6rem,9vw,5.6rem)] font-extrabold uppercase tracking-[-0.03em] text-charcoal" data-reveal-delay="90">
            André
            <br />
            Araújo
          </h1>

          <div
            className="reveal mt-6 flex flex-wrap items-center gap-x-4 gap-y-2 border-l-2 border-amber-fire pl-4"
            data-reveal-delay="180"
          >
            <span className="font-display text-lg font-semibold uppercase tracking-[0.06em] text-charcoal sm:text-xl">
              Electrical Engineering
            </span>
          </div>

          <div className="reveal mt-10 flex flex-wrap items-center gap-4" data-reveal-delay="260">
            <a
              href="#projects"
              className="group inline-flex items-center gap-3 border-2 border-charcoal bg-charcoal px-8 py-4 font-display text-sm font-bold uppercase tracking-[0.18em] text-silver transition-all duration-200 hover:border-amber-fire hover:bg-amber-fire hover:text-charcoal"
            >
              Explore Projects
              <ArrowDownRight
                size={18}
                className="transition-transform duration-200 group-hover:translate-x-1 group-hover:translate-y-1"
              />
            </a>
            <a
              href="#contact"
              className="inline-flex items-center gap-3 border-2 border-charcoal/40 px-8 py-4 font-display text-sm font-bold uppercase tracking-[0.18em] text-charcoal transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire"
            >
              Get in Touch
            </a>
          </div>

          <dl className="reveal mt-14 grid max-w-xl grid-cols-3 border-t border-charcoal/25" data-reveal-delay="340">
            {STATS.map((stat) => (
              <div key={stat.label} className="border-r border-charcoal/15 py-5 pr-4 last:border-r-0">
                <dt className="label-mono text-charcoal/55">{stat.label}</dt>
                <dd className="mt-1 font-display text-2xl font-bold text-charcoal">{stat.value}</dd>
              </div>
            ))}
          </dl>
        </div>

        {/* geometric circuit motif */}
        <div className="reveal relative hidden aspect-square w-full lg:block" data-reveal-delay="200">
          <Corner position="tl" />
          <Corner position="br" />
          <div className="absolute inset-4 border border-charcoal/30 bg-silver-light/60">
            <svg viewBox="0 0 400 400" className="h-full w-full" aria-hidden focusable="false">
              <g stroke="#212121" strokeWidth="1.4" fill="none" opacity="0.85">
                <path d="M40 80 H160 V200 H280 V320 H360" />
                <path d="M40 200 H100 V320 H200" />
                <path d="M200 40 V120 H320 V240" />
                <rect x="150" y="190" width="20" height="20" />
                <rect x="270" y="310" width="20" height="20" />
                <rect x="90" y="310" width="20" height="20" />
              </g>
              <g stroke="#FF8C00" strokeWidth="2.4" fill="none">
                <path d="M40 80 H160 V200" />
                <path d="M280 320 H360" />
                <circle cx="160" cy="200" r="7" fill="#FF8C00" stroke="none" />
                <circle cx="280" cy="320" r="7" fill="#FF8C00" stroke="none" />
              </g>
              <g fill="#212121">
                <circle cx="40" cy="80" r="4" />
                <circle cx="200" cy="40" r="4" />
                <circle cx="320" cy="240" r="4" />
                <circle cx="200" cy="320" r="4" />
              </g>
            </svg>
          </div>
        </div>
      </div>
    </section>
  );
}
