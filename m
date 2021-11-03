Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16C444033
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 11:54:25 +0100 (CET)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miDuS-0003Ig-BX
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 06:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miDtP-0002a3-B0
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:53:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miDtM-0000Hb-9v
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:53:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id d5so2929765wrc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ix+wC9e/wF+rQQ5MLhXCnLtKxvMTCuuFrcSPkeI3Ac=;
 b=HOcUDLTdRSjbS+K5WDVsJg2iXDpBcz3F1My0groo5qSRUVAPsK/xYFqcjtbJ3bKwd2
 lGMAQlqvmDj1EkGzTMiwZnznf6XStjgo87TONyH9RXmPeo2gN+KOWqwPilGFEHN4gILE
 2yIC9nzumBB30NnO9bhOy7pxMG99jkBxrajH6jYGfU0nBcHD2OY6OOL3v498jM8DRzbk
 8+f0M2pvigjCqnjthWqlXiqHCX9VeCAz7qcZzlxu8KGrMU3EfuqjjrgDHkeVesenr9Vh
 oCedHNf1bAb1RnHHEG6MTxGPQy4VepWfsuTNUh5OIf+rScizgWyOF8WDD/98pJZfAYv/
 9EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9ix+wC9e/wF+rQQ5MLhXCnLtKxvMTCuuFrcSPkeI3Ac=;
 b=AOtMqoKYJC4skSXgaFIN1VNnBQB6Hzmk18ZnKmSpqvphH878mFGgydLeVAFN72pVjl
 MsCwGqocLFTugyWmusHlSQN0+cCplwnteHrIAjU59Y7lAN103LrfgQynFGSlGSurCY4Q
 IRw7yDu1UcMgZ3/xuxlwWwsHMU0ZYo4xjcX0Asv24eIoODQCVIap+8+rqip/QM6R6Lsj
 M4xXUolSrNCW4FvCk9D2pccSo4q43HQ7W2x/RNKe5hkdSSruxUQx9kBWG/f6bsawp7dr
 /4g28ILkNfHpmVie7xjX31fylPUArhB583UhlaAqrqjOm9zDvLiiEzsiGqopmK1Vb9Zd
 DhtQ==
X-Gm-Message-State: AOAM5328ZY4JPAYXbiGtfohT/P7hqW8PQ3kSmfbUmhnM0xKUuCE7DZEy
 Gnxat1PrclJ7/7zAy1Ll7cvezpyls2M=
X-Google-Smtp-Source: ABdhPJy2YAqXgtVxLFFPB756lA/HMhV43qlmg5gCfKOtIBsyp991F6j+Xb5PjU3RG/IWM9PusC/syg==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr9069880wrs.249.1635936794254; 
 Wed, 03 Nov 2021 03:53:14 -0700 (PDT)
Received: from x1w.. (191.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.191])
 by smtp.gmail.com with ESMTPSA id y6sm1725799wrh.18.2021.11.03.03.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 03:53:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/m68k: Fix typo in SPDX tag
Date: Wed,  3 Nov 2021 11:53:11 +0100
Message-Id: <20211103105311.3399293-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix 'Identifer' -> 'Identifier' typo.

Cc: Laurent Vivier <laurent@vivier.eu>
Fixes: 8c6df16ff60 ("hw/char: add goldfish-tty")
Fixes: 87855593903 ("hw/intc: add goldfish-pic")
Fixes: 2fde99ee312 ("m68k: add an interrupt controller")
Fixes: 0791bc02b8f ("m68k: add a system controller")
Fixes: e1cecdca559 ("m68k: add Virtual M68k Machine")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/char/goldfish_tty.h | 2 +-
 include/hw/intc/goldfish_pic.h | 2 +-
 include/hw/intc/m68k_irqc.h    | 2 +-
 include/hw/misc/virt_ctrl.h    | 2 +-
 hw/char/goldfish_tty.c         | 2 +-
 hw/intc/goldfish_pic.c         | 2 +-
 hw/intc/m68k_irqc.c            | 2 +-
 hw/m68k/virt.c                 | 2 +-
 hw/misc/virt_ctrl.c            | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
index b9dd67362a6..7503d2fa1e1 100644
--- a/include/hw/char/goldfish_tty.h
+++ b/include/hw/char/goldfish_tty.h
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Goldfish TTY
  *
diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
index ad13ab37fc3..e9d552f7968 100644
--- a/include/hw/intc/goldfish_pic.h
+++ b/include/hw/intc/goldfish_pic.h
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Goldfish PIC
  *
diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
index dbcfcfc2e00..ef91f218122 100644
--- a/include/hw/intc/m68k_irqc.h
+++ b/include/hw/intc/m68k_irqc.h
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * QEMU Motorola 680x0 IRQ Controller
  *
diff --git a/include/hw/misc/virt_ctrl.h b/include/hw/misc/virt_ctrl.h
index edfadc46950..25a237e5187 100644
--- a/include/hw/misc/virt_ctrl.h
+++ b/include/hw/misc/virt_ctrl.h
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Virt system Controller
  */
diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
index 8365a187614..20b77885c18 100644
--- a/hw/char/goldfish_tty.c
+++ b/hw/char/goldfish_tty.c
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Goldfish TTY
  *
diff --git a/hw/intc/goldfish_pic.c b/hw/intc/goldfish_pic.c
index e3b43a69f16..dfd53275f69 100644
--- a/hw/intc/goldfish_pic.c
+++ b/hw/intc/goldfish_pic.c
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Goldfish PIC
  *
diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
index 2133d2a698a..0c515e4ecb7 100644
--- a/hw/intc/m68k_irqc.c
+++ b/hw/intc/m68k_irqc.c
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * QEMU Motorola 680x0 IRQ Controller
  *
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 4e8bce5aa6f..edc58fbddae 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * QEMU Vitual M68K Machine
  *
diff --git a/hw/misc/virt_ctrl.c b/hw/misc/virt_ctrl.c
index 3552d7a09ab..e75d1e7e17b 100644
--- a/hw/misc/virt_ctrl.c
+++ b/hw/misc/virt_ctrl.c
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Virt system Controller
  */
-- 
2.31.1


