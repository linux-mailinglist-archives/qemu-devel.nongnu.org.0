Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE3F36CBA8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:29:40 +0200 (CEST)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbTOt-000457-3I
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTMT-0002oL-WF
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:27:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTMS-0008Tm-4T
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:27:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so5338419wmf.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AeVh7vHBr9M4J89rTy7icLCpfwOC8AVr50lKe1Nh3oU=;
 b=LFQqUHW5dTzP1haZPcCWcaP+0lTeSU/PXTInst/h/sW5hVptnmVTYDuGPamO82dgNj
 /JbRf8S/vqIrz4n0ImwD1qrHdbGeu+buoqItDCd6TXt8LNn0KUwRnRGcoZvJ/nW2stjF
 1+PccntJNmYAVUrN1seJ9QmG0LAUxqfeKrhCUNzAgUCbjijsUufDDY6u1aqHCSVLpOHw
 nQtp7oUqlIz5c3eKApi0avsS51bEzqx9QDxc3XK8XBAOJVW6XMSpPNAdMyU5VL9pn066
 6/hHKHZq0i8mAFxSxcy9u4ygkPPhciZoH2cKXY7vfoygyegfizVwZiSAVMQasRXx/aCX
 QTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AeVh7vHBr9M4J89rTy7icLCpfwOC8AVr50lKe1Nh3oU=;
 b=ErXxjweGAXGjub9ituIAI1AoNqz4o7fQPdOQ2vQ9ZcJFWyZBDFDr5Axb4vv8GKRPgP
 VRYTQnZfuondbOKlSnefhldwqDJaepYkK0y7O4XA6/dWalB/9flYFBHFst0jmmD/JxjB
 Z3fMUloUI0uE3s/OX6CT/l3N+pJlJJ4djqYsCfhyX1YQaJApzbAzmSDnAjwXMY9bftBv
 bgVFdiggtLqODs8tCRJUvTBTWx5ZCHmBeiOaVwFHqqIBLg2lSgvayF6hEOIoeZzHF+Dq
 OgFI0GRYKjVNXDyAEtL7MGX9OZcDBraNMvSbb/B2UpiXBvopSmb/qLuDmMjC4R1TDwMk
 6E7g==
X-Gm-Message-State: AOAM532olCs5pLe2Msbzj81fBrM+c152AUKnsZ0jJ+S9Yeh+qY04JBEs
 Ovg7tq7h2zyUJlSqmlgZW/2F/HyyvM1TVw==
X-Google-Smtp-Source: ABdhPJxppGJRk4tsbUrj1A7fP7lFSG0f6FZuU/C1lGyxOALjEEGRL9pUvNBnuVO4mzD0Dh7EmjMJBQ==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr25756666wmq.111.1619551625947; 
 Tue, 27 Apr 2021 12:27:05 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 6sm4623270wmg.9.2021.04.27.12.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 12:27:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/sparc: Allow building the leon3 machine stand-alone
Date: Tue, 27 Apr 2021 21:26:57 +0200
Message-Id: <20210427192658.266933-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210427192658.266933-1-f4bug@amsat.org>
References: <20210427192658.266933-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building only the leon3 machine, we get this link failure:

  /usr/bin/ld: target_sparc_win_helper.c.o: in function `cpu_put_psr':
  target/sparc/win_helper.c:91: undefined reference to `cpu_check_irqs'

This is because cpu_check_irqs() is defined in hw/sparc/sun4m.c,
which is only built if the base sun4m machines are built (with
the CONFIG_SUN4M selector).

Fix by moving cpu_check_irqs() out of hw/sparc/sun4m.c and build
it unconditionally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/irq.c       | 61 ++++++++++++++++++++++++++++++++++++++++++++
 hw/sparc/sun4m.c     | 32 -----------------------
 hw/sparc/meson.build |  1 +
 3 files changed, 62 insertions(+), 32 deletions(-)
 create mode 100644 hw/sparc/irq.c

diff --git a/hw/sparc/irq.c b/hw/sparc/irq.c
new file mode 100644
index 00000000000..e34639f266e
--- /dev/null
+++ b/hw/sparc/irq.c
@@ -0,0 +1,61 @@
+/*
+ * QEMU Sun4m & Sun4d & Sun4c IRQ handling
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "hw/irq.h"
+#include "cpu.h"
+#include "trace.h"
+
+void cpu_check_irqs(CPUSPARCState *env)
+{
+    CPUState *cs;
+
+    /* We should be holding the BQL before we mess with IRQs */
+    g_assert(qemu_mutex_iothread_locked());
+
+    if (env->pil_in && (env->interrupt_index == 0 ||
+                        (env->interrupt_index & ~15) == TT_EXTINT)) {
+        unsigned int i;
+
+        for (i = 15; i > 0; i--) {
+            if (env->pil_in & (1 << i)) {
+                int old_interrupt = env->interrupt_index;
+
+                env->interrupt_index = TT_EXTINT | i;
+                if (old_interrupt != env->interrupt_index) {
+                    cs = env_cpu(env);
+                    trace_sun4m_cpu_interrupt(i);
+                    cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+                }
+                break;
+            }
+        }
+    } else if (!env->pil_in && (env->interrupt_index & ~15) == TT_EXTINT) {
+        cs = env_cpu(env);
+        trace_sun4m_cpu_reset_interrupt(env->interrupt_index & 15);
+        env->interrupt_index = 0;
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 1a00816d9a8..2edf913d945 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -159,38 +159,6 @@ static void nvram_init(Nvram *nvram, uint8_t *macaddr,
     }
 }
 
-void cpu_check_irqs(CPUSPARCState *env)
-{
-    CPUState *cs;
-
-    /* We should be holding the BQL before we mess with IRQs */
-    g_assert(qemu_mutex_iothread_locked());
-
-    if (env->pil_in && (env->interrupt_index == 0 ||
-                        (env->interrupt_index & ~15) == TT_EXTINT)) {
-        unsigned int i;
-
-        for (i = 15; i > 0; i--) {
-            if (env->pil_in & (1 << i)) {
-                int old_interrupt = env->interrupt_index;
-
-                env->interrupt_index = TT_EXTINT | i;
-                if (old_interrupt != env->interrupt_index) {
-                    cs = env_cpu(env);
-                    trace_sun4m_cpu_interrupt(i);
-                    cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-                }
-                break;
-            }
-        }
-    } else if (!env->pil_in && (env->interrupt_index & ~15) == TT_EXTINT) {
-        cs = env_cpu(env);
-        trace_sun4m_cpu_reset_interrupt(env->interrupt_index & 15);
-        env->interrupt_index = 0;
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-    }
-}
-
 static void cpu_kick_irq(SPARCCPU *cpu)
 {
     CPUSPARCState *env = &cpu->env;
diff --git a/hw/sparc/meson.build b/hw/sparc/meson.build
index 19c442c90d9..470159ff659 100644
--- a/hw/sparc/meson.build
+++ b/hw/sparc/meson.build
@@ -1,4 +1,5 @@
 sparc_ss = ss.source_set()
+sparc_ss.add(files('irq.c'))
 sparc_ss.add(when: 'CONFIG_LEON3', if_true: files('leon3.c'))
 sparc_ss.add(when: 'CONFIG_SUN4M', if_true: files('sun4m.c'))
 sparc_ss.add(when: 'CONFIG_SUN4M', if_true: files('sun4m_iommu.c'))
-- 
2.26.3


