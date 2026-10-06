import { useCallback, useEffect, useState } from "react";
import { Menu, X } from "lucide-react";
import { cn } from "../lib/utils";
import { useActiveSection } from "../hooks/use-reveal";

const LINKS = [
  { id: "home", label: "Home" },
  { id: "about", label: "About" },
  { id: "projects", label: "Projects" },
  { id: "skills", label: "Skills" },
  { id: "beyond-engineering", label: "Beyond" },
  { id: "contact", label: "Contact" },
];

const IDS = LINKS.map((l) => l.id);

export function NavBar() {
  const [open, setOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const [active, setActive] = useState("home");

  const onActive = useCallback((id: string) => setActive(id), []);
  useActiveSection(IDS, onActive);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 12);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  useEffect(() => {
    document.body.style.overflow = open ? "hidden" : "";
    return () => {
      document.body.style.overflow = "";
    };
  }, [open]);

  return (
    <header
      className={cn(
        "fixed inset-x-0 top-0 z-50 border-b transition-all duration-300",
        scrolled
          ? "border-charcoal/25 bg-silver/90 backdrop-blur-md"
          : "border-transparent bg-silver/60 backdrop-blur-sm",
      )}
    >
      <div className="mx-auto flex h-16 w-full max-w-[1200px] items-center justify-between px-6 sm:px-10 md:h-20">
        <a href="#home" className="group flex items-center gap-3" onClick={() => setOpen(false)}>
          <span className="flex h-9 w-9 items-center justify-center bg-charcoal transition-colors duration-200 group-hover:bg-amber-fire">
            <span className="font-display text-sm font-extrabold text-silver group-hover:text-charcoal">
              AA
            </span>
          </span>
          <span className="label-mono hidden text-charcoal sm:block">André Araújo</span>
        </a>

        <nav className="hidden items-center gap-1 md:flex">
          {LINKS.map((link) => (
            <a
              key={link.id}
              href={`#${link.id}`}
              className={cn(
                "label-mono relative px-4 py-3 text-charcoal/70 transition-colors duration-200 hover:text-charcoal",
                active === link.id && "text-charcoal",
              )}
            >
              {link.label}
              <span
                aria-hidden
                className={cn(
                  "absolute inset-x-3 bottom-1.5 h-[2px] origin-left bg-amber-fire transition-transform duration-300",
                  active === link.id ? "scale-x-100" : "scale-x-0",
                )}
              />
            </a>
          ))}
        </nav>

        <button
          type="button"
          aria-label={open ? "Close menu" : "Open menu"}
          aria-expanded={open}
          onClick={() => setOpen((v) => !v)}
          className="flex h-10 w-10 items-center justify-center border border-charcoal/40 text-charcoal transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire md:hidden"
        >
          {open ? <X size={18} /> : <Menu size={18} />}
        </button>
      </div>

      <div
        className={cn(
          "overflow-hidden border-t border-charcoal/20 bg-silver transition-[max-height] duration-300 md:hidden",
          open ? "max-h-96" : "max-h-0 border-t-0",
        )}
      >
        <nav className="flex flex-col px-6 py-2">
          {LINKS.map((link) => (
            <a
              key={link.id}
              href={`#${link.id}`}
              onClick={() => setOpen(false)}
              className="label-mono flex items-center justify-between border-b border-charcoal/15 py-4 text-charcoal/80 transition-colors duration-200 hover:text-amber-fire"
            >
              {link.label}
              <span className="h-px w-6 bg-amber-fire" />
            </a>
          ))}
        </nav>
      </div>
    </header>
  );
}
