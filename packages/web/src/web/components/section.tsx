import type { ReactNode } from "react";
import { cn } from "../lib/utils";

export function Section({
  id,
  index,
  title,
  kicker,
  dark = false,
  className,
  children,
}: {
  id: string;
  index: string;
  title: string;
  kicker?: string;
  dark?: boolean;
  className?: string;
  children: ReactNode;
}) {
  return (
    <section
      id={id}
      className={cn(
        "relative w-full border-t px-6 py-20 sm:px-10 md:py-28",
        dark
          ? "border-charcoal bg-charcoal text-silver grid-blueprint-dark"
          : "border-charcoal/25 bg-silver text-charcoal",
        className,
      )}
    >
      <div className="relative mx-auto w-full max-w-[1200px]">
        <header className={cn("reveal", kicker ? "mb-12 md:mb-16" : "mb-8 md:mb-10")}>
          <div className="flex items-center gap-4">
            <span className="label-mono text-amber-fire">{index}</span>
            <span className={cn("h-px w-10", dark ? "bg-amber-fire" : "bg-charcoal/40")} />
            <span className={cn("label-mono", dark ? "text-silver/70" : "text-charcoal/60")}>
              {title}
            </span>
          </div>
          {kicker ? (
            <h2 className="mt-6 max-w-3xl whitespace-pre-line text-4xl font-extrabold uppercase sm:text-5xl md:text-6xl">
              {kicker}
            </h2>
          ) : null}
        </header>
        {children}
      </div>
    </section>
  );
}

export function Corner({
  position,
  dark = false,
}: {
  position: "tl" | "tr" | "bl" | "br";
  dark?: boolean;
}) {
  const base = "pointer-events-none absolute h-8 w-8 border-amber-fire";
  const map = {
    tl: "left-0 top-0 border-l-2 border-t-2",
    tr: "right-0 top-0 border-r-2 border-t-2",
    bl: "left-0 bottom-0 border-b-2 border-l-2",
    br: "right-0 bottom-0 border-b-2 border-r-2",
  } as const;
  return <span aria-hidden className={cn(base, map[position], dark && "opacity-90")} />;
}

export function Tag({ children }: { children: ReactNode }) {
  return (
    <span className="label-mono border border-charcoal/35 bg-silver px-2.5 py-1 text-charcoal/80 transition-colors duration-200 group-hover:border-amber-fire group-hover:text-charcoal">
      {children}
    </span>
  );
}
