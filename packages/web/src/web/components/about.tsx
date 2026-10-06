import { Box, Cpu, Terminal } from "lucide-react";
import { Section } from "./section";

const INTERESTS = [
  {
    icon: Cpu,
    title: "Embedded Hardware",
    body: "Microcontroller-driven builds: sensors, actuators and alarms wired, programmed and enclosed.",
  },
  {
    icon: Terminal,
    title: "Assembly-Level Architecture",
    body: "Memory-mapped I/O, interrupts and timers on the PEPE-16 — control at the instruction level.",
  },
  {
    icon: Box,
    title: "3D CAD Modeling",
    body: "Solid Edge part and assembly modeling, enclosure design and printable mechanical chassis.",
  },
];

export function About() {
  return (
    <Section id="about" index="01" title="About">
      <div className="grid gap-12 lg:grid-cols-[1.1fr_0.9fr] lg:gap-16">
        <div className="reveal space-y-5 text-base text-charcoal/80 sm:text-lg">
          <p>
            I&apos;m an Electrical Engineering student at{" "}
            <span className="font-semibold text-charcoal">Instituto Superior Técnico</span>,
            University of Lisbon. My coursework covers circuits, computer architecture and
            programming, and the projects I choose push me down the stack — from C/C++, to assembly
            driving a graphics display, to a soldered sensor inside a chassis I modeled myself.
          </p>
          <p>
            The through-line is{" "}
            <span className="font-semibold text-charcoal">hardware-software integration</span>:
            embedded hardware development with Arduino and the PEPE-16 processor,{" "}
            <span className="font-semibold text-charcoal">assembly-level architecture</span> using
            memory-mapped I/O, interrupts and timers, and{" "}
            <span className="font-semibold text-charcoal">3D CAD modeling</span> in Solid Edge to
            give the electronics a physical body.
          </p>
          <p>
            I like problems where the abstraction ends and the hardware answers back — a false
            positive from a sensor, a timer that fires one cycle late, a part that doesn&apos;t fit
            the printed enclosure. Currently looking for an internship or research position in
            embedded development or hardware design.
          </p>

          <div className="mt-8 flex flex-wrap gap-3 border-t border-charcoal/25 pt-8">
            {[
              "Embedded Systems",
              "Low-Level Programming",
              "Circuit Prototyping",
              "Solid Edge",
              "3D Printing",
            ].map((item) => (
              <span
                key={item}
                className="label-mono border border-charcoal/35 px-3 py-1.5 text-charcoal/75"
              >
                {item}
              </span>
            ))}
          </div>
        </div>

        <div className="space-y-4">
          {INTERESTS.map((item, i) => (
            <article
              key={item.title}
              className="reveal group relative border border-charcoal/25 bg-silver-light/70 p-6 transition-all duration-300 hover:border-amber-fire"
              data-reveal-delay={i * 90}
            >
              <span
                aria-hidden
                className="absolute left-0 top-0 h-full w-1 bg-charcoal transition-colors duration-300 group-hover:bg-amber-fire"
              />
              <div className="flex items-start gap-4 pl-2">
                <span className="flex h-10 w-10 shrink-0 items-center justify-center border border-charcoal/30 text-charcoal transition-colors duration-300 group-hover:border-amber-fire group-hover:text-amber-fire">
                  <item.icon size={18} />
                </span>
                <div>
                  <h3 className="font-display text-lg font-bold uppercase tracking-[0.04em] text-charcoal">
                    {item.title}
                  </h3>
                  <p className="mt-2 text-sm text-charcoal/70">{item.body}</p>
                </div>
              </div>
            </article>
          ))}
        </div>
      </div>
    </Section>
  );
}
