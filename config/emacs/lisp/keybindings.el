(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(windmove-default-keybindings)

(use-package general
  :config
  (general-create-definer james/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (james/leader-keys
    "t" '(:ignore t :which-key "toggles")))

(defun james/evil-hook ()
  ())

(use-package key-chord)
(use-package evil
  :demand t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  :hook (evil-mode . james/evil-hook)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-global-set-key 'motion "j" 'evil-next-line)
  (evil-global-set-key 'motion "k" 'evil-previous-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))
(evil-mode)
(setq key-chord-two-keys-delay 0.1)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package hydra)
