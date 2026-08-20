# decidim-b4m — gem overrides

_Generated 2026-08-20. Currently on Decidim **0.31.4**._

This app patches files that live inside the decidim gems. `spec/lib/overrides_spec.rb` stores an MD5 of each upstream original, so the suite fails the moment upstream changes one — that is the signal that a local copy has drifted from the version it was forked from.

**18 guarded file(s).**

## Views (1)

Full copies of gem templates. Re-copy the 0.31 version and re-apply the local change.

| package | file | recorded checksum |
|---|---|---|
| `decidim-core` | `/app/views/layouts/decidim/footer/_mini.html.erb` | `c67cc97d…` |

## Locale files (17)

Translation files carried locally. Usually re-sync from upstream and keep the local keys.

| package | file | recorded checksum |
|---|---|---|
| `decidim-accountability` | `/config/locales/sr-CS.yml` | `84747bbb…` |
| `decidim-admin` | `/config/locales/sr-CS.yml` | `98918b97…` |
| `decidim-assemblies` | `/config/locales/sr-CS.yml` | `db86c7d2…` |
| `decidim-blogs` | `/config/locales/sr-CS.yml` | `4648c80b…` |
| `decidim-budgets` | `/config/locales/sr-CS.yml` | `67da89fa…` |
| `decidim-comments` | `/config/locales/sr-CS.yml` | `989ae03d…` |
| `decidim-core` | `/config/locales/sr-CS.yml` | `de5d95a0…` |
| `decidim-debates` | `/config/locales/sr-CS.yml` | `4648c80b…` |
| `decidim-dev` | `/config/locales/sr-CS.yml` | `4648c80b…` |
| `decidim-forms` | `/config/locales/sr-CS.yml` | `4648c80b…` |
| `decidim-meetings` | `/config/locales/sr-CS.yml` | `6aba80d1…` |
| `decidim-pages` | `/config/locales/sr-CS.yml` | `4648c80b…` |
| `decidim-proposals` | `/config/locales/sr-CS.yml` | `a1dc178e…` |
| `decidim-sortitions` | `/config/locales/sr-CS.yml` | `4648c80b…` |
| `decidim-surveys` | `/config/locales/sr-CS.yml` | `4648c80b…` |
| `decidim-system` | `/config/locales/sr-CS.yml` | `1455fe8c…` |
| `decidim-templates` | `/config/locales/sr-CS.yml` | `4648c80b…` |

## For the 0.31 upgrade

Every guarded file has to be checked against 0.31. Three outcomes:

- **Upstream unchanged** — only the checksum needs re-recording.
- **Upstream renamed** — update the path in the spec as well (0.31 renames Answer→Response across forms/surveys).
- **Upstream changed** — diff 0.30.x→0.31.4 and re-apply the local customisation.

Compare with:

```console
gh api repos/decidim/decidim/contents/<package><file>?ref=v0.30.9 -q .sha
gh api repos/decidim/decidim/contents/<package><file>?ref=v0.31.4 -q .sha
```

Same sha = category 1. 404 on the 0.31 side = category 2.

Conventions worth following (from [decidim-barcelona](https://github.com/AjuntamentdeBarcelona/decidim-barcelona) `.agent/skills/decidim-overrides/SKILL.md`):

- `.include` when the concern **adds** methods, `.prepend` when it **replaces** them, so `super` still reaches upstream.
- decidim_awesome applies Deface overrides by virtual path, so they compose on top of app-level view copies — if a copied view renders differently than it reads, check for a Deface override before hunting a bug.
