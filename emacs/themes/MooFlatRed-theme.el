(deftheme MooFlatRed
  "Created by Jean-Philippe '0rax' Roemer")

(custom-theme-set-faces
 'MooFlatRed
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :height 113 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#e2e2e5" :background "#202020" :stipple nil :inherit nil))))
 '(cursor ((t (:background "#626262"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:weight bold :foreground "#708090"))))
 '(highlight ((t (:background "#3c414c"))))
 '(region ((t (:foreground "#faf4c6" :background "#3c414c"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 16) (background light)) (:background "yellow")) (((class color) (min-colors 16) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 8)) (:foreground "black" :background "cyan")) (t (:inverse-video t))))
 '(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 '(font-lock-builtin-face ((t (:foreground "#808080"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#606060" :inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#606060"))))
 '(font-lock-constant-face ((t (:foreground "#ca1717"))))
 '(font-lock-doc-face ((t (:foreground "#7e8aa2" :inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((t (:foreground "#ff0000"))))
 '(font-lock-keyword-face ((t (:weight bold :foreground "#808080"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:foreground "#faf4c6" :inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "#606060"))))
 '(font-lock-type-face ((t (:foreground "#7e8aa2"))))
 '(font-lock-variable-name-face ((t (:foreground "#d91414"))))
 '(font-lock-warning-face ((t (:foreground "#ffffff" :background "#ff0000" :inherit (error)))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "#d91414"))))
 '(link-visited ((t (:foreground "violet" :inherit (link)))))
 '(fringe ((t (:foreground "#cfbfad" :background "#232323"))))
 '(header-line ((t (:box nil :foreground "grey90" :background "grey20" :inherit (mode-line)))))
 '(tooltip ((t (:foreground "black" :background "lightyellow" :inherit (variable-pitch)))))
 '(mode-line ((t (:background "#d91414" :foreground "#F0F0F0" :box nil :weight bold))))
 '(mode-line-buffer-id ((t (:foreground "#F0F0F0" :weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((t nil)))
 '(mode-line-inactive ((t (:box nil :background "#121212" :foreground "#f9f9f9"))))
 '(isearch ((t (:weight bold :foreground "#202020" :background "#e2e2e5"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "paleturquoise")) (((class color) (min-colors 88) (background dark)) (:background "paleturquoise4")) (((class color) (min-colors 16)) (:background "turquoise3")) (((class color) (min-colors 8)) (:background "turquoise3")) (t (:underline (:color foreground-color :style line)))))
 '(match ((t (:background "#d91414"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'MooFlatRed)
