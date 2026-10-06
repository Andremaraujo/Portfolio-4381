import { useState } from "react";
import { ArrowUpRight, Infinity as InfinityIcon, Sigma, Timer } from "lucide-react";
import { Section, Tag } from "./section";
import { PaperReader, type Paper } from "./paper-reader";
import tireTheory from "../data/tire-theory.json";

const PAPER = tireTheory as Paper;
const DOCX = "/Recursive-Temporal-Reshaping-Tire-Theory.docx";

const PILLARS = [
  {
    icon: Timer,
    title: "Recurrence without repetition",
    text: "Each cycle inherits the state of the one before it, so a process can return to the same structure without ever returning to the same condition.",
  },
  {
    icon: Sigma,
    title: "A formal state recurrence",
    text: "The argument is carried by an explicit recurrence, Sₙ₊₁ = F(Sₙ, Δₙ), and by propositions stated precisely enough to be attacked.",
  },
  {
    icon: InfinityIcon,
    title: "One invariant boundary",
    text: "The Ultimate Beginning is not a state, an attractor or a destination — only the transition where one cycle ends and the next begins. Everything else may be reshaped.",
  },
];

export function BeyondEngineering() {
  const [open, setOpen] = useState(false);

  return (
    <Section id="beyond-engineering" index="04" title="Beyond Engineering">
      <div className="grid gap-10 lg:grid-cols-[1.05fr_0.95fr] lg:gap-16">
        <div className="reveal">
          <p className="max-w-xl text-base text-charcoal/80 sm:text-lg">
            Engineering taught me to write down a system before arguing about it. I apply the same
            discipline outside the curriculum: when a question about time stopped letting go of me,
            I wrote the framework out in full — definitions, a state recurrence, twelve numbered
            propositions, and an explicit list of what the theory does not claim.
          </p>
          <p className="mt-5 max-w-xl text-base text-charcoal/80 sm:text-lg">
            It is speculative work, and it says so. What matters to me is that it is{" "}
            <span className="font-semibold text-charcoal">structured</span> — stated clearly enough
            that someone can find the weak point.
          </p>

          <div className="mt-10 space-y-5 border-t border-charcoal/25 pt-8">
            {PILLARS.map((pillar) => (
              <div key={pillar.title} className="flex items-start gap-4">
                <span className="flex h-10 w-10 shrink-0 items-center justify-center border border-charcoal/30 text-charcoal">
                  <pillar.icon size={17} strokeWidth={1.75} />
                </span>
                <div>
                  <h4 className="font-display text-sm font-bold uppercase tracking-[0.1em] text-charcoal">
                    {pillar.title}
                  </h4>
                  <p className="mt-1.5 text-sm text-charcoal/70">{pillar.text}</p>
                </div>
              </div>
            ))}
          </div>
        </div>

        <article className="reveal group relative flex flex-col border border-charcoal/30 bg-charcoal text-silver transition-all duration-300 hover:-translate-y-1.5 hover:border-amber-fire hover:shadow-[10px_10px_0_0_rgba(33,33,33,0.18)]">
          <span
            aria-hidden
            className="absolute left-0 top-0 h-1.5 w-10 bg-amber-fire transition-all duration-300 group-hover:w-full"
          />

          <div className="flex items-center justify-between border-b border-silver/15 px-6 pt-8 pb-4">
            <span className="label-mono text-amber-fire">P-01</span>
            <span className="label-mono text-silver/45">Theoretical Physics · Philosophy</span>
          </div>

          <div className="flex flex-1 flex-col p-6 sm:p-7">
            <h3 className="font-display text-2xl font-bold uppercase leading-tight tracking-[0.01em] sm:text-3xl">
              {PAPER.title}
            </h3>
            <p className="mt-2 font-display text-lg text-amber-fire">{PAPER.subtitle}</p>

            <p className="mt-5 text-sm leading-relaxed text-silver/75">
              An independently written framework proposing that temporal evolution is recursive
              rather than strictly linear — that reality may pass repeatedly through similar
              structural configurations while never reproducing an identical state, each iteration
              inheriting and transforming the one before it.
            </p>

            <div className="mt-6 grid grid-cols-3 gap-px border border-silver/15 bg-silver/15">
              {[
                { value: "27", label: "Sections" },
                { value: "12", label: "Propositions" },
                { value: "Solo", label: "Authored" },
              ].map((stat) => (
                <div key={stat.label} className="bg-charcoal px-3 py-4 text-center">
                  <div className="font-display text-xl font-extrabold text-silver">
                    {stat.value}
                  </div>
                  <div className="label-mono mt-1 text-silver/45">{stat.label}</div>
                </div>
              ))}
            </div>

            <div className="mt-6 flex flex-wrap gap-2">
              {["Recursive time", "Dynamical systems", "Entropy", "Causality"].map((tag) => (
                <span
                  key={tag}
                  className="label-mono border border-silver/25 px-2.5 py-1 text-silver/70 transition-colors duration-200 group-hover:border-amber-fire/60"
                >
                  {tag}
                </span>
              ))}
            </div>

            <button
              type="button"
              onClick={() => setOpen(true)}
              aria-label={`Read the full paper — ${PAPER.title}: ${PAPER.subtitle}`}
              className="group/cta mt-7 inline-flex items-center justify-between gap-3 border-2 border-amber-fire bg-amber-fire px-5 py-3.5 font-display text-xs font-bold uppercase tracking-[0.18em] text-charcoal transition-colors duration-200 hover:bg-transparent hover:text-amber-fire"
            >
              Read the full paper
              <ArrowUpRight
                size={15}
                className="transition-transform duration-200 group-hover/cta:translate-x-0.5 group-hover/cta:-translate-y-0.5"
              />
            </button>

            <p className="label-mono mt-4 text-silver/40">
              Speculative framework · not an established physical theory
            </p>
          </div>
        </article>
      </div>

      <div className="reveal mt-12 flex flex-wrap items-center gap-3 border-t border-charcoal/25 pt-8">
        <span className="label-mono text-charcoal/50">Also reading</span>
        {["Dynamical systems", "Cosmology", "Philosophy of time", "Information theory"].map(
          (item) => (
            <Tag key={item}>{item}</Tag>
          ),
        )}
      </div>

      <PaperReader
        open={open}
        onClose={() => setOpen(false)}
        paper={PAPER}
        downloadHref={DOCX}
      />
    </Section>
  );
}
