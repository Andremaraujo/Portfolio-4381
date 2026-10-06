import { useState } from "react";
import { ArrowUpRight, Check, Linkedin, Loader2, Mail, Send } from "lucide-react";
import { Section } from "./section";
import { useSubmitContact } from "../queries/contact";

const LINKS = [
  {
    label: "Email",
    value: "andremotaraujo@gmail.com",
    href: "mailto:andremotaraujo@gmail.com",
    icon: Mail,
  },
  {
    label: "LinkedIn",
    value: "linkedin.com/in/andremotaraujo",
    href: "https://linkedin.com/in/andremotaraujo",
    icon: Linkedin,
  },
];

const FIELD =
  "w-full border border-silver/25 bg-charcoal-soft px-4 py-3.5 text-sm text-silver placeholder:text-silver/40 transition-colors duration-200 outline-none focus:border-amber-fire";

export function Contact() {
  const submit = useSubmitContact();
  const [form, setForm] = useState({ name: "", email: "", message: "" });
  const [error, setError] = useState<string | null>(null);

  const onSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    if (form.name.trim().length < 2) return setError("Please enter your name.");
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email.trim()))
      return setError("Please enter a valid email address.");
    if (form.message.trim().length < 10)
      return setError("Please write at least 10 characters so I know what you need.");

    submit.mutate(
      { name: form.name.trim(), email: form.email.trim(), message: form.message.trim() },
      {
        onSuccess: () => setForm({ name: "", email: "", message: "" }),
        onError: () => setError("Something went wrong sending the message. Please try again."),
      },
    );
  };

  return (
    <Section id="contact" index="05" title="Contact" dark>
      <div className="grid gap-12 lg:grid-cols-[1fr_0.85fr] lg:gap-16">
        <div className="reveal">
          {submit.isSuccess ? (
            <div className="flex h-full min-h-[320px] flex-col items-start justify-center border border-amber-fire bg-charcoal-soft p-8">
              <span className="flex h-12 w-12 items-center justify-center bg-amber-fire text-charcoal">
                <Check size={22} />
              </span>
              <h3 className="mt-6 font-display text-2xl font-bold uppercase text-silver">
                Message received
              </h3>
              <p className="mt-3 max-w-md text-sm text-silver/75">
                Thanks for reaching out — I&apos;ll get back to you at the address you provided,
                usually within a couple of days.
              </p>
              <button
                type="button"
                onClick={() => submit.reset()}
                className="label-mono mt-8 border border-silver/40 px-5 py-3 text-silver transition-colors duration-200 hover:border-amber-fire hover:text-amber-fire"
              >
                Send another
              </button>
            </div>
          ) : (
            <form onSubmit={onSubmit} noValidate className="space-y-5">
              <div className="grid gap-5 sm:grid-cols-2">
                <div>
                  <label htmlFor="name" className="label-mono mb-2 block text-silver/60">
                    Name
                  </label>
                  <input
                    id="name"
                    name="name"
                    value={form.name}
                    onChange={(e) => setForm({ ...form, name: e.target.value })}
                    aria-label="Name"
                    placeholder="Your name"
                    className={FIELD}
                    autoComplete="name"
                  />
                </div>
                <div>
                  <label htmlFor="email" className="label-mono mb-2 block text-silver/60">
                    Email
                  </label>
                  <input
                    id="email"
                    name="email"
                    type="email"
                    value={form.email}
                    onChange={(e) => setForm({ ...form, email: e.target.value })}
                    aria-label="Email"
                    placeholder="you@company.com"
                    className={FIELD}
                    autoComplete="email"
                  />
                </div>
              </div>

              <div>
                <label htmlFor="message" className="label-mono mb-2 block text-silver/60">
                  Message
                </label>
                <textarea
                  id="message"
                  name="message"
                  rows={6}
                  value={form.message}
                  onChange={(e) => setForm({ ...form, message: e.target.value })}
                  aria-label="Message"
                  placeholder="Tell me about the role, project or collaboration."
                  className={`${FIELD} resize-y`}
                />
              </div>

              {error ? (
                <p className="label-mono border-l-2 border-amber-fire bg-charcoal-soft py-2 pl-3 text-amber-fire">
                  {error}
                </p>
              ) : null}

              <button
                type="submit"
                disabled={submit.isPending}
                className="group inline-flex items-center gap-3 border-2 border-amber-fire bg-amber-fire px-8 py-4 font-display text-sm font-bold uppercase tracking-[0.18em] text-charcoal transition-colors duration-200 hover:bg-charcoal hover:text-amber-fire disabled:cursor-not-allowed disabled:opacity-60"
              >
                {submit.isPending ? (
                  <>
                    <Loader2 size={16} className="animate-spin" />
                    Sending
                  </>
                ) : (
                  <>
                    Send Message
                    <Send size={16} className="transition-transform duration-200 group-hover:translate-x-1" />
                  </>
                )}
              </button>
            </form>
          )}
        </div>

        <div className="reveal" data-reveal-delay="120">
          <p className="text-base text-silver/80">
            Open to internships, research positions and hardware-focused collaborations.
          </p>

          <div className="mt-8 border-t border-silver/20">
            {LINKS.map((link) => (
              <a
                key={link.label}
                href={link.href}
                target={link.href.startsWith("mailto:") ? undefined : "_blank"}
                rel="noreferrer"
                className="group flex items-center justify-between border-b border-silver/20 py-5 transition-colors duration-200 hover:bg-charcoal-soft"
              >
                <span className="flex items-center gap-4">
                  <span className="flex h-9 w-9 items-center justify-center border border-silver/30 text-silver transition-colors duration-200 group-hover:border-amber-fire group-hover:text-amber-fire">
                    <link.icon size={16} />
                  </span>
                  <span>
                    <span className="label-mono block text-silver/50">{link.label}</span>
                    <span className="text-sm text-silver">{link.value}</span>
                  </span>
                </span>
                <ArrowUpRight
                  size={18}
                  className="text-silver/50 transition-all duration-200 group-hover:-translate-y-0.5 group-hover:translate-x-0.5 group-hover:text-amber-fire"
                />
              </a>
            ))}
          </div>
        </div>
      </div>
    </Section>
  );
}

export function Footer() {
  return (
    <footer className="border-t border-silver/20 bg-charcoal px-6 py-8 sm:px-10">
      <div className="mx-auto flex w-full max-w-[1200px] flex-col items-start justify-between gap-4 sm:flex-row sm:items-center">
        <span className="label-mono text-silver/50">
          © {new Date().getFullYear()} André Araújo — Electrical Engineering
        </span>
        <div className="flex items-center gap-4">
          <span className="h-px w-10 bg-amber-fire" />
          <a href="#home" className="label-mono text-silver/60 transition-colors hover:text-amber-fire">
            Back to top
          </a>
        </div>
      </div>
    </footer>
  );
}
