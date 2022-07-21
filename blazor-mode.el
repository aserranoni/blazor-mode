;;; blazor-mode.el --- A Simple polymode for editingg .razor files
;;; -*- lexical-binding: t; -*-
;; Copyright (C) 2022 Ariel Serranoni
;;
;; Author: Ariel Serranoni <arielserranoni@gmail.com>
;; Maintainer: Ariel Serranoni <arielserranoni@gmail.com>
;; Created: June 30, 2022
;; Modified: June 30, 2022
;; Version: 0.0.1
;; Keywords: convenience languages tools
;; Homepage: https://github.com/aserranoni/blazor-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;; A simple polymode for editing .razor files
;;
;;
;;; Code:

(require 'polymode)
(require 'csharp-mode)

(define-hostmode blazor-mode-hostmode
  :mode 'html-mode)

(define-innermode blazor-mode-csharp-innermode
  :mode 'csharp-mode
  :head-matcher "@code ?{"
  :tail-matcher "\t}"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode blazor-mode
  :hostmode 'blazor-mode-hostmode
  :innermodes '(blazor-mode-csharp-innermode))

(add-to-list 'auto-mode-alist '("\\.razor\\'" . blazor-mode))

(provide 'blazor-mode)
;;; blazor-mode.el ends here
