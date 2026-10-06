# André Araújo — Engineering Portfolio — Design

Single-page, responsive engineering portfolio for André Araújo (Electrical Engineering student). Web only. Visual direction: minimalist, modern, geometric — sharp 0-radius edges, hairline dividers, blueprint-style grid patterns, structured cards. Focus: low-level systems, hardware-software integration, embedded systems and 3D CAD. Its job: present him credibly to recruiters and professors in one scroll, and collect messages through a working contact form.

## Brand & Colors

Strict three-color palette, declared as CSS variables in `packages/web/src/web/styles.css`.

| Token | Value | Use |
|-------|-------|-----|
| silver (background) | #C4C4C4 | Dominant page canvas |
| silver-light | #D2D2D2 | Card surfaces, subtle elevation on the silver canvas |
| amber (secondary/structural) | #FF8C00 | Frames, borders, geometric accent lines, hover states, structural highlights |
| charcoal (accent) | #212121 | All primary type, headings, CTA fills, dark structural blocks |
| charcoal-70 | rgba(33,33,33,.68) | Secondary/body text on silver |

No other hues. Grid patterns are charcoal at 6–8% alpha; amber never used for long-form text.

## Typography

- **Display**: Archivo — tight tracking, uppercase for headings, weights 600/700/800.
- **Body**: IBM Plex Sans — 400/500, line-height 1.7.
- **Mono**: IBM Plex Mono — section indices (`01 / ABOUT`), tech tags, labels, uppercase + wide tracking.

Loaded from Google Fonts in `packages/web/index.html`.

## Layout

- Fixed top nav: translucent silver with backdrop blur, charcoal type, amber underline on the active/hovered link, 1px charcoal bottom hairline. Mobile: hamburger → full-width geometric panel.
- Sections are full-width bands alternating silver / charcoal, each max-width 1200px inside, separated by hairline dividers and mono section indices in the left gutter.
- Hero: asymmetric two-column (type left, geometric circuit-node motif right), amber corner brackets, blueprint grid background.
- Projects: 2-up card grid (1-up mobile) holding 4 projects. Cards are square-cornered, 1px charcoal border, amber top bar that expands full width on hover, lift + amber border on hover. Project T-01 carries an extra amber-ruled "Engineering Reflection" block.
- Skills: 3 categorized blocks in a 3-up / 2-up / 1-col responsive grid, mono category headers on charcoal strips.
- Contact: split layout — form left, links right, on a charcoal band for contrast.

## Motion

One orchestrated load: staggered fade-up reveals in the hero, then per-section reveal on scroll via IntersectionObserver + CSS transitions. Hover states: amber border/bar growth, charcoal↔amber CTA inversion. No bouncing, no parallax.

## Pages & Sections

- **Web — Home** (`packages/web/src/web/pages/index.tsx`) — the whole site: `#home`, `#about`, `#projects`, `#skills`, `#contact`, with smooth scroll.
- Components in `src/web/components/`: `nav-bar.tsx`, `hero.tsx`, `about.tsx`, `projects.tsx`, `skills.tsx`, `contact.tsx`, `section.tsx` (shared band/heading/reveal primitives).

## Key User Flows

1. Land on hero → click "Explore Projects" → smooth-scrolls to the 4-card projects grid.
2. Read About + Skills → scroll to Contact → fill Name/Email/Message → submit → message is persisted via oRPC and an inline amber confirmation replaces the form.

## Architecture

- **API**: `contact.submit` oRPC procedure (`src/api/routes/contact.ts`), zod-validated, inserts into the `contact_messages` Drizzle table (Turso/SQLite).
- **Frontend**: React + Tailwind 4, `useContactForm` mutation hook in `src/web/queries/contact.ts`, pending/success/error states on the submit button.
