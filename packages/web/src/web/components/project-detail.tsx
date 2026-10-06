import { useEffect, useState } from "react";
import { Check, Copy, Terminal, X } from "lucide-react";
import { cn } from "../lib/utils";

export type ProjectDetail = {
  /**
   * How the media is framed: terminal chrome for CLI captures, dark frame for
   * photographs, light frame for CAD renders that sit on a white background.
   */
  mediaKind: "terminal" | "photo" | "render";
  mediaLabel: string;
  shots: { src: string; caption: string; alt: string }[];
  source?: {
    language: string;
    fileName: string;
    code: string;
  };
};

export function ProjectDetailModal({
  open,
  onClose,
  title,
  code,
  detail,
}: {
  open: boolean;
  onClose: () => void;
  title: string;
  code: string;
  detail: ProjectDetail;
}) {
  const [tab, setTab] = useState<"media" | "source">("media");
  const [copied, setCopied] = useState(false);

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

  useEffect(() => {
    if (!copied) return;
    const t = setTimeout(() => setCopied(false), 1800);
    return () => clearTimeout(t);
  }, [copied]);

  if (!open) return null;

  const source = detail.source;
  const lines = source
    ? source.code.replace(/\r\n?/g, "\n").replace(/\s+$/, "").split("\n")
    : [];

  const copy = () => {
    if (!source) return;
    void navigator.clipboard?.writeText(source.code).then(() => setCopied(true));
  };

  const tabs: [("media" | "source"), string][] = [["media", detail.mediaLabel]];
  if (source) tabs.push(["source", source.fileName]);

  return (
    <div className="fixed inset-0 z-[100] flex items-stretch justify-center sm:items-center sm:p-6">
      <button
        type="button"
        aria-label="Close project details"
        onClick={onClose}
        className="absolute inset-0 bg-charcoal/85 backdrop-blur-sm"
      />

      <dialog
        open
        aria-modal="true"
        aria-label={`${title} details`}
        className="relative flex h-full w-full max-w-[1100px] flex-col border border-amber-fire bg-charcoal p-0 text-silver shadow-[0_0_0_1px_rgba(255,140,0,0.25)] sm:h-[88vh]"
      >
        <div className="flex items-start justify-between gap-4 border-b border-silver/15 px-5 py-4 sm:px-7 sm:py-5">
          <div className="min-w-0">
            <span className="label-mono text-amber-fire">{code}</span>
            <h3 className="mt-1.5 truncate font-display text-lg font-bold uppercase tracking-[0.01em] text-silver sm:text-2xl">
              {title}
            </h3>
          </div>
          <button
            type="button"
            aria-label="Close"
            onClick={onClose}
            className="flex h-9 w-9 shrink-0 items-center justify-center border border-silver/30 text-silver/80 transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire"
          >
            <X size={17} />
          </button>
        </div>

        {tabs.length > 1 ? (
          <div className="flex shrink-0 border-b border-silver/15 px-5 sm:px-7">
            {tabs.map(([key, label]) => (
              <button
                key={key}
                type="button"
                onClick={() => setTab(key)}
                className={cn(
                  "label-mono relative -mb-px px-4 py-4 transition-colors duration-200",
                  tab === key ? "text-amber-fire" : "text-silver/55 hover:text-silver",
                )}
              >
                {label}
                <span
                  aria-hidden
                  className={cn(
                    "absolute inset-x-2 bottom-0 h-[2px] origin-left bg-amber-fire transition-transform duration-300",
                    tab === key ? "scale-x-100" : "scale-x-0",
                  )}
                />
              </button>
            ))}
          </div>
        ) : null}

        <div className="min-h-0 flex-1 overflow-y-auto">
          {tab === "media" || !source ? (
            <div className="grid gap-6 p-5 sm:p-7 md:grid-cols-2">
              {detail.shots.map((shot) => (
                <figure key={shot.src} className="flex flex-col">
                  <div
                    className={cn(
                      "relative border border-silver/20",
                      detail.mediaKind === "render" ? "bg-silver-light" : "bg-[#0d0d0d]",
                    )}
                  >
                    {detail.mediaKind === "terminal" ? (
                      <div className="flex items-center gap-2 border-b border-silver/15 px-3 py-2">
                        <Terminal size={13} className="text-amber-fire" />
                        <span className="label-mono text-[10px] text-silver/50">
                          reversi — bash
                        </span>
                      </div>
                    ) : null}
                    <img
                      src={shot.src}
                      alt={shot.alt}
                      loading="lazy"
                      className={cn(
                        "w-full",
                        detail.mediaKind === "photo" && "max-h-[62vh] object-contain",
                        detail.mediaKind === "render" && "max-h-[46vh] object-contain",
                      )}
                      style={
                        detail.mediaKind === "terminal"
                          ? { imageRendering: "pixelated" }
                          : undefined
                      }
                    />
                  </div>
                  <figcaption className="label-mono mt-3 text-silver/60">{shot.caption}</figcaption>
                </figure>
              ))}
            </div>
          ) : (
            <div className="relative">
              <div className="sticky top-0 z-10 flex items-center justify-between border-b border-silver/15 bg-charcoal/95 px-5 py-3 backdrop-blur sm:px-7">
                <span className="label-mono text-silver/50">
                  {source.language} · {lines.length} lines
                </span>
                <button
                  type="button"
                  onClick={copy}
                  className="label-mono flex items-center gap-2 border border-silver/30 px-3 py-2 text-silver/80 transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire"
                >
                  {copied ? <Check size={13} /> : <Copy size={13} />}
                  {copied ? "Copied" : "Copy"}
                </button>
              </div>
              <pre className="overflow-x-auto px-5 py-5 text-[12.5px] leading-[1.7] sm:px-7">
                <code className="block font-mono">
                  {lines.map((line, i) => (
                    // eslint-disable-next-line react/no-array-index-key
                    <span key={i} className="flex">
                      <span className="mr-5 w-8 shrink-0 select-none text-right text-silver/25">
                        {i + 1}
                      </span>
                      <span className="text-silver/85">{line || " "}</span>
                    </span>
                  ))}
                </code>
              </pre>
            </div>
          )}
        </div>
      </dialog>
    </div>
  );
}
