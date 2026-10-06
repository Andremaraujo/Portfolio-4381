import { useEffect, useMemo, useRef, useState } from "react";
import { Download, List, X } from "lucide-react";
import { cn } from "../lib/utils";

type Block =
  | { kind: "p" | "math" | "lead" | "note"; text: string }
  | { kind: "prop"; text: string; sub?: string }
  | { kind: "list"; items: string[] };

export type Paper = {
  title: string;
  subtitle: string;
  abstract: Block[];
  sections: { num: string; title: string; blocks: Block[] }[];
};

function Blocks({ blocks }: { blocks: Block[] }) {
  return (
    <>
      {blocks.map((block, i) => {
        if (block.kind === "math") {
          return (
            <p
              key={i}
              className="my-6 overflow-x-auto border-l-2 border-amber-fire bg-charcoal-soft/60 px-5 py-4 font-mono text-[15px] leading-relaxed text-amber-fire"
            >
              {block.text}
            </p>
          );
        }
        if (block.kind === "list") {
          return (
            <ul key={i} className="my-5 space-y-2.5">
              {block.items.map((item) => (
                <li key={item} className="flex items-start gap-3 text-silver/80">
                  <span aria-hidden className="mt-3 h-px w-4 shrink-0 bg-amber-fire" />
                  <span>{item}</span>
                </li>
              ))}
            </ul>
          );
        }
        if (block.kind === "note") {
          return (
            <p
              key={i}
              className="my-5 font-display text-[17px] font-semibold leading-[1.6] text-silver"
            >
              {block.text}
            </p>
          );
        }
        if (block.kind === "prop") {
          return (
            <h4
              key={i}
              className="mt-8 mb-3 font-display text-sm font-bold uppercase tracking-[0.12em] text-amber-fire"
            >
              {block.text}
              {block.sub ? <span className="text-silver/70"> — {block.sub}</span> : null}
            </h4>
          );
        }
        return (
          <p
            key={i}
            className={cn(
              "leading-[1.85] text-silver/80",
              block.kind === "lead" ? "mt-5 mb-1" : "my-4",
            )}
          >
            {block.text}
          </p>
        );
      })}
    </>
  );
}

export function PaperReader({
  open,
  onClose,
  paper,
  downloadHref,
}: {
  open: boolean;
  onClose: () => void;
  paper: Paper;
  downloadHref: string;
}) {
  const scrollRef = useRef<HTMLDivElement>(null);
  const [active, setActive] = useState(paper.sections[0]?.num ?? "");
  const [tocOpen, setTocOpen] = useState(false);

  // Top-level sections only, so the mobile contents list stays scannable.
  const topLevel = useMemo(
    () => paper.sections.filter((s) => !s.num.includes(".")),
    [paper.sections],
  );

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    window.addEventListener("keydown", onKey);
    document.body.style.overflow = "hidden";
    return () => {
      window.removeEventListener("keydown", onKey);
      document.body.style.overflow = "";
    };
  }, [open, onClose]);

  // Highlight whichever section heading last crossed the top of the scroll area.
  useEffect(() => {
    if (!open) return;
    const root = scrollRef.current;
    if (!root) return;
    const onScroll = () => {
      const headings = Array.from(root.querySelectorAll<HTMLElement>("[data-sec]"));
      const top = root.getBoundingClientRect().top + 120;
      let current = headings[0]?.dataset.sec ?? "";
      for (const h of headings) {
        if (h.getBoundingClientRect().top <= top) current = h.dataset.sec ?? current;
      }
      setActive(current);
    };
    root.addEventListener("scroll", onScroll, { passive: true });
    onScroll();
    return () => root.removeEventListener("scroll", onScroll);
  }, [open]);

  if (!open) return null;

  const goTo = (num: string) => {
    const root = scrollRef.current;
    const target = root?.querySelector<HTMLElement>(`[data-sec="${num}"]`);
    if (!root || !target) return;
    root.scrollTo({ top: target.offsetTop - 24, behavior: "smooth" });
    setTocOpen(false);
  };

  return (
    <div className="fixed inset-0 z-[100] flex items-stretch justify-center sm:items-center sm:p-6">
      <button
        type="button"
        aria-label="Close paper"
        onClick={onClose}
        className="absolute inset-0 bg-charcoal/90 backdrop-blur-sm"
      />

      <dialog
        open
        aria-modal="true"
        aria-label={`${paper.title} — full paper`}
        className="relative flex h-full w-full max-w-[1180px] flex-col border border-amber-fire bg-charcoal p-0 text-silver shadow-[0_0_0_1px_rgba(255,140,0,0.25)] sm:h-[90vh]"
      >
        <div className="flex shrink-0 items-start justify-between gap-4 border-b border-silver/15 px-5 py-4 sm:px-7 sm:py-5">
          <div className="min-w-0">
            <span className="label-mono text-amber-fire">Independent theory</span>
            <h3 className="mt-1.5 truncate font-display text-lg font-bold uppercase tracking-[0.01em] sm:text-2xl">
              {paper.title}
            </h3>
            <p className="label-mono mt-1 text-silver/50">{paper.subtitle}</p>
          </div>
          <div className="flex shrink-0 items-center gap-2">
            <a
              href={downloadHref}
              download
              className="label-mono hidden items-center gap-2 border border-silver/30 px-3 py-2 text-silver/80 transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire sm:flex"
            >
              <Download size={13} />
              DOCX
            </a>
            <button
              type="button"
              aria-label="Table of contents"
              aria-expanded={tocOpen}
              onClick={() => setTocOpen((v) => !v)}
              className={cn(
                "flex h-9 w-9 items-center justify-center border transition-colors duration-200 lg:hidden",
                tocOpen
                  ? "border-amber-fire text-amber-fire"
                  : "border-silver/30 text-silver/80 hover:border-amber-fire hover:text-amber-fire",
              )}
            >
              <List size={17} />
            </button>
            <button
              type="button"
              aria-label="Close"
              onClick={onClose}
              className="flex h-9 w-9 items-center justify-center border border-silver/30 text-silver/80 transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire"
            >
              <X size={17} />
            </button>
          </div>
        </div>

        <div className="relative flex min-h-0 flex-1">
          <nav
            aria-label="Paper contents"
            className={cn(
              "shrink-0 overflow-y-auto border-silver/15 bg-charcoal-soft/40",
              "lg:block lg:w-[260px] lg:border-r",
              tocOpen
                ? "absolute inset-x-0 top-0 z-20 block max-h-full border-b bg-charcoal px-2 py-3 lg:static lg:bg-transparent"
                : "hidden",
            )}
          >
            <ol className="p-2">
              {topLevel.map((s) => (
                <li key={s.num}>
                  <button
                    type="button"
                    onClick={() => goTo(s.num)}
                    className={cn(
                      "flex w-full items-baseline gap-2.5 px-3 py-2 text-left text-[13px] leading-snug transition-colors duration-200",
                      active === s.num
                        ? "bg-amber-fire/10 text-amber-fire"
                        : "text-silver/55 hover:text-silver",
                    )}
                  >
                    <span className="label-mono w-5 shrink-0 tabular-nums">{s.num}</span>
                    <span>{s.title}</span>
                  </button>
                </li>
              ))}
            </ol>
          </nav>

          <div ref={scrollRef} className="min-h-0 flex-1 overflow-y-auto">
            <article className="mx-auto max-w-[760px] px-5 py-8 sm:px-8 sm:py-12">
              <h2 className="font-display text-3xl font-extrabold uppercase leading-[1.05] sm:text-4xl">
                {paper.title}
              </h2>
              <p className="mt-3 font-display text-xl text-amber-fire sm:text-2xl">
                {paper.subtitle}
              </p>

              <div className="mt-8 border-l-2 border-amber-fire/50 pl-5">
                <span className="label-mono text-silver/45">Abstract</span>
                <div className="mt-2">
                  <Blocks blocks={paper.abstract} />
                </div>
              </div>

              <a
                href={downloadHref}
                download
                className="label-mono mt-8 inline-flex items-center gap-2 border border-silver/30 px-4 py-3 text-silver/80 transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire sm:hidden"
              >
                <Download size={14} />
                Download DOCX
              </a>

              {paper.sections.map((s) => {
                const sub = s.num.includes(".");
                return (
                  <section key={s.num} className="scroll-mt-6" data-sec={s.num}>
                    <h3
                      className={cn(
                        "flex items-baseline gap-3 border-t border-silver/15 font-display font-bold uppercase tracking-[0.02em]",
                        sub ? "mt-9 pt-6 text-base" : "mt-12 pt-8 text-xl sm:text-2xl",
                      )}
                    >
                      <span className="label-mono shrink-0 text-amber-fire">{s.num}</span>
                      <span>{s.title}</span>
                    </h3>
                    <Blocks blocks={s.blocks} />
                  </section>
                );
              })}

              <p className="label-mono mt-14 border-t border-silver/15 pt-6 text-silver/40">
                André Araújo · speculative framework, not an established physical theory
              </p>
            </article>
          </div>
        </div>
      </dialog>
    </div>
  );
}
