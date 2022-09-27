Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B785EBAEF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:47:47 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4Ne-0002BQ-IA
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43D-0001uF-An
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:40 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43B-0000ZJ-0t
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:38 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N7hrw-1pG3eS1tTO-014msx; Tue, 27
 Sep 2022 08:26:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/3] M68k for 7.2 patches
Date: Tue, 27 Sep 2022 08:26:30 +0200
Message-Id: <20220927062633.618677-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gE0yCjTVJLD/EzgYbts+L/u7a4R4kgMFfyx4ZW8MCw14wIsGdN4
 Lr0WJeAbZJGt9X7K/1DsIqm+SJ0/e7TQfBwEDQQk7XaxQSMT8d5A+9lQwtt0kkr1aeSpGsH
 fqYwC4OFcb5pu4wc3lJpB2EkElNm9VS8WYLN+j3w5tCeUq+tgRFDEpdKiFfZ+oYLfjS/NLf
 Alazi0nt+TmGS+5z5+zKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lrg+3eyp0FY=:kPs0IjqLF57TDZYs4Df+t9
 6v72I5lhc+N4lvmzWgTnw53ZrzKjAHuxtLcL8wTdSrr50Ii7xB+ru9WPxMJuRcakG4vUnjXpr
 beuwZBCKCtqHGc1YbDw2OknXgCcrMVbMPe3c8Bs9ftquT344xOGZCt6rrEZXdOT/llZQi+MYz
 2uxYx7E+u7LFJUqzg0arxaAJZQZuFRP4lT5pLD+dhuL16Y0QzWrnjK7D16Mhulo6VwA1F6T9y
 PnK7o0VnlYoD2nJu6Ggyejfy1F84KNUYqSQnRwwC/h//qQ2++bgWyxJ5Q+GxarMW2m+BrAHId
 rw3c4tu3cas57706Pv9SL+J6s52zJ4OC7n8CenB+2jCjfRsrTgLDf2u08G8M4Jm2qPZoNgVrO
 +njpv6AdinCpOdYtJ2kSulOkm/TOHn77vSTehDtp2DoqARWpqt0ypw5tUI+wJqYaadiQo9VnG
 33FO3ngr6xtVGiPQNoh9dv4MT6I3u8yrqPuECC+bR3CviaMx+LjH+J3NNT36M9d7Udhs7aTP+
 KaGOMnTVIJl/8WlypU/q/LNSH0xGg1V0lqaP6fq4xRRMXaBnZnjzZcK9Wl7yUs5MbvS+yBvj0
 XwACaHecsxVe0e40ovguNTlr+geKPHcIBoTUMGy2QO0+V2mDv1HzuphXborA43CRI++p8wdgC
 j+8bINT4sKryH9Zr/FfCIHMXdRokV+OvkOI6yCfTkN74N3lWbZWFsjevsKo/vt3NXdgFcd0Qg
 oodkCURExcaLUHoDc6vE4R8X9ueFjgQe1IlI68MXZA9HaTDgZpWSxsLWaFoWukDHUkJ7gl5Hq
 RrdMBtd
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 99d6b11b5b44d7dd64f4cb1973184e40a4a174f8:

  Merge tag 'pull-target-arm-20220922' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-09-26 13:38:26 -0400)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request

for you to fetch changes up to 2cfa963126fe77fac034a43f986b2bf3e8fe6a4f:

  m68k: align bootinfo strings and data to 4 bytes (2022-09-26 23:37:22 +0200)

----------------------------------------------------------------
M68k pull request 20220927

Align bootinfo tags
fix move from sr

----------------------------------------------------------------

Jason A. Donenfeld (1):
  m68k: align bootinfo strings and data to 4 bytes

Mark Cave-Ayland (2):
  target/m68k: increase size of m68k CPU features from uint32_t to
    uint64_t
  target/m68k: use M68K_FEATURE_MOVEFROMSR_PRIV feature for move_from_sr
    privilege check

 hw/m68k/bootinfo.h      | 10 ++++++----
 target/m68k/cpu.h       |  8 +++++---
 target/m68k/cpu.c       |  9 +++++++--
 target/m68k/translate.c |  2 +-
 4 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.37.3


