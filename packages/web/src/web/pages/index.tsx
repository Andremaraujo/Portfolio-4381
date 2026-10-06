import { useEffect } from "react";
import { NavBar } from "../components/nav-bar";
import { Hero } from "../components/hero";
import { About } from "../components/about";
import { Projects } from "../components/projects";
import { Skills } from "../components/skills";
import { BeyondEngineering } from "../components/beyond-engineering";
import { Contact, Footer } from "../components/contact";
import { useReveal } from "../hooks/use-reveal";

function Index() {
  useReveal();

  // Reveal the hero immediately on load rather than waiting for a scroll event.
  useEffect(() => {
    const hero = document.getElementById("home");
    if (!hero) return;
    for (const el of Array.from(hero.querySelectorAll<HTMLElement>(".reveal"))) {
      const delay = Number(el.dataset.revealDelay ?? 0);
      window.setTimeout(() => el.classList.add("is-visible"), delay + 60);
    }
  }, []);

  return (
    <div className="min-h-screen bg-silver">
      <NavBar />
      <main>
        <Hero />
        <About />
        <Projects />
        <Skills />
        <BeyondEngineering />
        <Contact />
      </main>
      <Footer />
    </div>
  );
}

export default Index;
