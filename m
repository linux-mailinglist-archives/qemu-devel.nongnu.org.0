Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B1344AA61
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:15:21 +0100 (CET)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNDs-0001er-C9
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:15:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBX-0006ug-8c; Tue, 09 Nov 2021 04:12:55 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:36319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBU-000575-V9; Tue, 09 Nov 2021 04:12:54 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsqMq-1mQltZ1ZY8-00t8i6; Tue, 09
 Nov 2021 10:12:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] hw/m68k: Fix typo in SPDX tag
Date: Tue,  9 Nov 2021 10:12:34 +0100
Message-Id: <20211109091238.817997-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
References: <20211109091238.817997-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xnaBYYy8qwrAvK2Su32Z4pjRS1OQ0RKrWxcoLe9Hf8U8nFUv8PO
 c1U18RuQsogSjgwcdTbTnV9yWevgmIeWzWwHiITSfUOmVPY3ZqHBbN35F36/GdYr6rwjWxl
 WojkEB522sqzTYMWWSEZDX84A04j/j4Jzb0z4GuNfOb0UhQlLufFtyy0dqijG6eIDr9xogf
 H8cj1CYNsyO95RgKIZ4Ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kXwSE7LBcfY=:8pd7UEthPc0r4mlfLfrB0x
 aqF6+p2uIRls7HN529y0n7EjVdPfVnJBCTjgws8PLphX/Rqq0dOVN3m1maXB4uezQfZIY8jZp
 fucrT2gu/CdsrY43sKnlXYVr+n2m8OU6Z6lbw7cLYS7Z42nyZ6LjZjxjVnfB8IkVA+1bJUlPa
 /vWI+0PMqPLC7AVSEgjtCe5j8AcaOAKL+pJ+aBrfKP0K+rPWR+1tGeMJ+ST/3Hhnjfis9hbGb
 I+2yJ/gFAYDQARrxasCGDCjpJTy8gos2hieXbRIF7gtorEU2Yyy1rnDYO7VgCqM/4R0+rRqZ6
 ejhzNs5eXWtLS931BVkxKItAI7WVMJnYnrjuxo2QKMQ83II7y6QrUTz137p8Gw3MVLzAE9/v/
 BhCCoKM9OLXGWDSAeXxs0r0Q/sS/KomjdEZ91+3fj2NP+MWPNj3lpiaKu9kfsx0Ki5FMgCfWL
 shlNHQfC5/4t0LYrIM9TTaur7RnGEW79m8uhtMHvNFStyW8oGPffTGTnby72TPxGsPVwLj2qV
 o5lFu4qn4EhKyZ4MEG4RA+AD5FXMoYE5K5snP/vvuYqUKHPTODj1tKq8DlLY3ZGNUjiUfnB1c
 yVWWQphZSsalCtuYcXNZ3m12II78rqAFwjBfp8vUPgZ1YWcjwJuXheLqHLv4vNkvgW9bhyfJ1
 Fh4LOtQrVhFmP0gI2I+l9P0U1xHJVwPh/DgHciBKpg5sPJHbneytUY7YofGH74wpiHh0=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix 'Identifer' -> 'Identifier' typo.

Cc: Laurent Vivier <laurent@vivier.eu>
Fixes: 8c6df16ff60 ("hw/char: add goldfish-tty")
Fixes: 87855593903 ("hw/intc: add goldfish-pic")
Fixes: 2fde99ee312 ("m68k: add an interrupt controller")
Fixes: 0791bc02b8f ("m68k: add a system controller")
Fixes: e1cecdca559 ("m68k: add Virtual M68k Machine")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211103105311.3399293-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/char/goldfish_tty.c         | 2 +-
 hw/intc/goldfish_pic.c         | 2 +-
 hw/intc/m68k_irqc.c            | 2 +-
 hw/m68k/virt.c                 | 2 +-
 hw/misc/virt_ctrl.c            | 2 +-
 include/hw/char/goldfish_tty.h | 2 +-
 include/hw/intc/goldfish_pic.h | 2 +-
 include/hw/intc/m68k_irqc.h    | 2 +-
 include/hw/misc/virt_ctrl.h    | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
index 8365a1876145..20b77885c180 100644
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
index e3b43a69f163..dfd53275f692 100644
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
index 2133d2a698ab..0c515e4ecb79 100644
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
index 4e8bce5aa6f7..edc58fbddae4 100644
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
index 3552d7a09abd..e75d1e7e17b3 100644
--- a/hw/misc/virt_ctrl.c
+++ b/hw/misc/virt_ctrl.c
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Virt system Controller
  */
diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
index b9dd67362a68..7503d2fa1e15 100644
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
index ad13ab37fc3e..e9d552f79682 100644
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
index dbcfcfc2e000..ef91f218122e 100644
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
index edfadc469505..25a237e51874 100644
--- a/include/hw/misc/virt_ctrl.h
+++ b/include/hw/misc/virt_ctrl.h
@@ -1,5 +1,5 @@
 /*
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Virt system Controller
  */
-- 
2.31.1


