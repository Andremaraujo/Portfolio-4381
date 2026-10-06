import { useState } from "react";
import { ArrowUpRight } from "lucide-react";
import beyondMarsSource from "../data/beyond-mars.asm?raw";
import reversiSource from "../data/reversi.c?raw";
import { ProjectDetailModal, type ProjectDetail } from "./project-detail";
import { Section, Tag } from "./section";

type Project = {
  code: string;
  domain: string;
  title: string;
  summary: string;
  reflection?: string;
  tech: string[];
  detail?: ProjectDetail;
};

const PROJECTS: Project[] = [
  {
    code: "T-01",
    domain: "Embedded / Hardware",
    title: "Distance Alert System",
    summary:
      "Designed and assembled an Arduino-based physical safety device using an ultrasonic proximity sensor and an acoustic speaker alarm, embedded inside a custom 3D-printed chassis.",
    reflection:
      "The initial prototype evaluated raw physical distance triggers. Real-world testing exposed false positives from non-human objects, so I specified a computer vision pipeline iteration to restrict detection to human presence.",
    tech: ["Arduino", "C++", "Ultrasonic Sensors", "3D Printing", "Prototyping"],
    detail: {
      mediaKind: "photo",
      mediaLabel: "Build photos",
      shots: [
        {
          src: "/images/distance-alert/enclosure.jpg",
          alt: "Closed 3D-printed black enclosure labelled T-01, with the speaker cone at the top and the two ultrasonic transducers exposed at the bottom",
          caption: "Closed chassis — speaker grille, T-01 relief, exposed transducers",
        },
        {
          src: "/images/distance-alert/internals.jpg",
          alt: "Open enclosure showing an Arduino Uno wired to a speaker, an HC-SR04 ultrasonic module and a 9V battery inside the printed tray",
          caption: "Internals — Arduino Uno, HC-SR04, speaker driver and 9V supply",
        },
      ],
    },
  },
  {
    code: "T-02",
    domain: "CAD / Mechanical",
    title: "3D CAD Modeling of a Microwave",
    summary:
      "Fully modeled an entire microwave appliance in Solid Edge, down to the individual structural and mechanical components, then resolved them into a complete constrained assembly.",
    tech: ["Solid Edge", "3D CAD Modeling", "Mechanical Assembly", "Spatial Design"],
    detail: {
      mediaKind: "render",
      mediaLabel: "CAD renders",
      shots: [
        {
          src: "/images/microwave/front.png",
          alt: "Orthographic front view of the fully assembled microwave model showing the door, viewing window and two rotary control dials",
          caption: "Front elevation — full assembly",
        },
        {
          src: "/images/microwave/open-side.png",
          alt: "Isometric cutaway of the microwave with the outer casing pulled away, exposing the magnetron, cooling fan, transformer and control board",
          caption: "Exploded side view — casing removed, internals exposed",
        },
        {
          src: "/images/microwave/door.png",
          alt: "Isolated door subassembly with transparent panel, perforated screen, upper hinge rail and two latch hooks",
          caption: "Door subassembly — hinge rail, latch hooks, screen",
        },
        {
          src: "/images/microwave/glass-plate.png",
          alt: "Glass turntable plate modeled with its roller ring and the three-armed coupler that drives it",
          caption: "Turntable — glass plate, roller ring and drive coupler",
        },
        {
          src: "/images/microwave/cooler-fan.png",
          alt: "Cooling fan part with four-blade impeller mounted on its motor inside the sheet-metal shroud",
          caption: "Cooling fan — impeller, motor and shroud",
        },
        {
          src: "/images/microwave/bell-timer.png",
          alt: "Control panel interior showing the mechanical bell timer, rotary cam stack, terminal tabs and mains inlet block",
          caption: "Control panel interior — bell timer and cam stack",
        },
        {
          src: "/images/microwave/switch-assembly.png",
          alt: "Door latch bracket carrying three microswitches that form the safety interlock chain",
          caption: "Latch bracket — three-microswitch safety interlock",
        },
      ],
    },
  },
  {
    code: "T-03",
    domain: "Software / Systems",
    title: "Reversi Game",
    summary:
      "A console-based implementation of the classic Reversi board game, developed in C. The game features a human player versus an AI opponent, move validation, automatic piece flipping, score tracking, and optional game logging to a file. The AI selects moves based on the number of opponent pieces it can capture.",
    tech: ["C", "CLI Execution", "AI Opponent", "Data Structures", "Game Logic"],
    detail: {
      mediaKind: "terminal",
      mediaLabel: "Screenshots",
      source: { language: "C", fileName: "reversi.c", code: reversiSource },
      shots: [
        {
          src: "/images/reversi/initial-board.png",
          alt: "Reversi initial 8x8 board printed in the terminal with the four starting discs",
          caption: "Initial board state — X to move",
        },
        {
          src: "/images/reversi/ai-play.png",
          alt: "Terminal output showing a human move followed by the AI response and updated piece counts",
          caption: "Human move, AI response and live piece counts",
        },
      ],
    },
  },
  {
    code: "T-04",
    domain: "Assembly / Architecture",
    title: '"Beyond Mars" Assembly Arcade Game',
    summary:
      "Engineered a real-time space navigation game on the PEPE-16 processor simulator: memory-mapped I/O driving a 32 × 64 pixel graphics display, 7-segment LED energy readouts, matrix keypad input, four distinct hardware interrupt timers and pseudo-random generation logic.",
    tech: [
      "PEPE-16 Assembly",
      "Interrupts & Timers",
      "Memory-Mapped I/O",
      "Computer Architecture",
      "Low-Level Programming",
    ],
    detail: {
      mediaKind: "photo",
      mediaLabel: "Game screens",
      source: {
        language: "PEPE-16 Assembly",
        fileName: "beyond-mars.asm",
        code: beyondMarsSource,
      },
      shots: [
        {
          src: "/images/beyond-mars/title-screen.jpg",
          alt: "Beyond Mars title screen showing the planet Mars lit from behind, with the game title and the key prompts for starting and pausing",
          caption: "Title screen — 'C' to launch, 'D' to pause",
        },
        {
          src: "/images/beyond-mars/starfield.jpg",
          alt: "Dense starfield image used as the scrolling background layer behind the pixel display during flight",
          caption: "Flight background layer — starfield behind the pixel display",
        },
        {
          src: "/images/beyond-mars/pause.jpg",
          alt: "Translucent pause overlay dimming the starfield, listing the keypad controls for launching probes, ending the game and resuming",
          caption: "Pause overlay — probe launch keys, end and resume",
        },
        {
          src: "/images/beyond-mars/loss-asteroid.jpg",
          alt: "Loss screen reading PERDESTE after the ship collided with an asteroid and was destroyed",
          caption: "Loss — ship destroyed by asteroid collision",
        },
        {
          src: "/images/beyond-mars/loss-energy.jpg",
          alt: "Loss screen reading PERDESTE after the ship ran out of energy",
          caption: "Loss — energy reserve depleted",
        },
        {
          src: "/images/beyond-mars/quit.jpg",
          alt: "Screen reading DESISTISTE shown after the player pressed the quit key",
          caption: "Player quit — 'D' pressed mid-run",
        },
      ],
    },
  },
];

export function Projects() {
  const [openCode, setOpenCode] = useState<string | null>(null);
  const active = PROJECTS.find((p) => p.code === openCode && p.detail);

  return (
    <Section id="projects" index="02" title="Projects">
      <div className="grid gap-6 md:grid-cols-2">
        {PROJECTS.map((project, i) => (
          <article
            key={project.code}
            className="reveal group relative flex flex-col border border-charcoal/30 bg-silver-light/70 transition-all duration-300 hover:-translate-y-1.5 hover:border-amber-fire hover:shadow-[10px_10px_0_0_rgba(33,33,33,0.16)]"
            data-reveal-delay={i * 100}
          >
            <span
              aria-hidden
              className="absolute left-0 top-0 h-1.5 w-10 bg-charcoal transition-all duration-300 group-hover:w-full group-hover:bg-amber-fire"
            />

            <div className="flex items-center justify-between border-b border-charcoal/20 px-6 pt-8 pb-4">
              <span className="label-mono text-amber-fire">{project.code}</span>
              <span className="label-mono text-charcoal/45">{project.domain}</span>
            </div>

            <div className="flex flex-1 flex-col p-6">
              <h3 className="font-display text-xl font-bold uppercase leading-tight tracking-[0.01em] text-charcoal">
                {project.title}
              </h3>
              <p className="mt-4 text-sm text-charcoal/75">{project.summary}</p>

              {project.reflection ? (
                <div className="mt-5 border-l-2 border-amber-fire bg-silver/60 py-3 pl-4">
                  <span className="label-mono text-charcoal/55">Engineering Reflection</span>
                  <p className="mt-2 text-sm text-charcoal/75">{project.reflection}</p>
                </div>
              ) : null}

              <div className="mt-auto flex flex-wrap gap-2 pt-6">
                {project.tech.map((tech) => (
                  <Tag key={tech}>{tech}</Tag>
                ))}
              </div>

              {project.detail ? (
                <button
                  type="button"
                  onClick={() => setOpenCode(project.code)}
                  aria-label={`View project ${project.code} — ${project.title}`}
                  className="group/cta mt-6 inline-flex items-center justify-between gap-3 border-2 border-charcoal bg-charcoal px-5 py-3.5 font-display text-xs font-bold uppercase tracking-[0.18em] text-silver transition-colors duration-200 hover:border-amber-fire hover:bg-amber-fire hover:text-charcoal"
                >
                  View project
                  <ArrowUpRight
                    size={15}
                    className="transition-transform duration-200 group-hover/cta:translate-x-0.5 group-hover/cta:-translate-y-0.5"
                  />
                </button>
              ) : null}
            </div>
          </article>
        ))}
      </div>

      {active?.detail ? (
        <ProjectDetailModal
          open
          onClose={() => setOpenCode(null)}
          title={active.title}
          code={active.code}
          detail={active.detail}
        />
      ) : null}
    </Section>
  );
}
