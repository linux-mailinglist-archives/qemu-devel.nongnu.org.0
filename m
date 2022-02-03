Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C74A8862
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:12:29 +0100 (CET)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeig-0003Qt-Sm
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZPr7YQ0KCl8S7IBKQFKDEFQ7DLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--valentinghita.bounces.google.com>)
 id 1nFeXH-0007WN-9m
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:00:39 -0500
Received: from [2a00:1450:4864:20::149] (port=35755
 helo=mail-lf1-x149.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZPr7YQ0KCl8S7IBKQFKDEFQ7DLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--valentinghita.bounces.google.com>)
 id 1nFeXE-0000KB-DT
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:00:38 -0500
Received: by mail-lf1-x149.google.com with SMTP id
 c7-20020ac24147000000b0042ac92336d1so1655953lfi.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hlcPZ7SXucwFodQrQPiBEc/tDIQ/hkwYn0I0gTD1PIQ=;
 b=oEjqBRJwGyXfTp9iotik1mjTnMok/fF9l6jRzBcU8Z3w223U3PDy5qMJtowJ9WL6qS
 /kIhrC78pKmYzC0c9vhxoe8yHNd7u2r2dyrGOq4F+LeqhnENfg9nZdJA1QXx8nAxYZAi
 O4IpU/Exs4jyWL+yuq7fOhemGx8j5ynLsVI7lvhKuDEAu9NJE8X3ldoJ7sOoFlo55C7v
 tLGHhvzQ+oazdhrVXX0FmDGelkU2LxkR6FSP5Itp+TG7JlxPycmwg44wameoUA/IhYqg
 Q1COFjpjsua43pViPzT4Tx4dJULBV33cSZNStalXWf+aLYLWRgENHEfDiKeX49wpEOTd
 d6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hlcPZ7SXucwFodQrQPiBEc/tDIQ/hkwYn0I0gTD1PIQ=;
 b=LlIhWjDx/v5wALncBNQ7P6Qib2frMvXtf6LwbJEdJ4T7MisVkfx3xZMnuRwcHpPFxp
 tc8SsVvffglgs1bg11MERPVKxCXOYMn0AEaCc+KsJhJZQnrXe2C4b7zgmgBcuj6h0C9O
 oOkpItf0IQf9TamdziQXb5xttAJ3/H3KCDAOqfzAajQhCBa2QC7Q2tyB/DnN47FIPi2W
 IapHYWB2uYHgUaTOkIQfBqjgHfQzSfKA5F21sPTmnKNiG3sNR1Ypj4kKWEzEyW6+IH70
 zkKzVmo5mhkJ+/nOGw69ofVOqOBxOTbX18QYQtxqDqABMG+fImD5xC+8hEQ9aJUMw8HG
 cHuw==
X-Gm-Message-State: AOAM533t7DqFj44u55sWLM2MgNBEJUgnHUFebsCZGCwD7rrTgEncXDp0
 Amv8PSikO9mUhP/HpZhgloAMR8h8PI5d9vl8Bp9KLP5HkNcaZ7CgTVbcYsQTxzFPJr1uvNnLcpb
 i4r6PTTu0G5nc1Ytysr49Uxa8Mc7LaGagUDnLgHbobYwsDETNXM9Iv4NPZWED5VaBt+uwTwRmz2
 43RRQ=
X-Google-Smtp-Source: ABdhPJy/8G0GGD8SdbKSSTr86yO5UgCSa1yuHHjpxn14FvbxgdON/Z+RQU8pAd5fRy4onh/GhsEfbMjuoD2gtPc/GSqq
X-Received: from valentinghita.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1906])
 (user=valentinghita job=sendgmr) by 2002:a05:6000:1564:: with SMTP id
 4mr24557965wrz.56.1643903588017; Thu, 03 Feb 2022 07:53:08 -0800 (PST)
Date: Thu,  3 Feb 2022 15:53:04 +0000
Message-Id: <20220203155304.2648009-1-valentinghita@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
From: Valentin Ghita <valentinghita@google.com>
To: qemu-devel@nongnu.org
Cc: "=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Valentin Ghita <valentinghita@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::149
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::149;
 envelope-from=3ZPr7YQ0KCl8S7IBKQFKDEFQ7DLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--valentinghita.bounces.google.com;
 helo=mail-lf1-x149.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 03 Feb 2022 11:04:12 -0500
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

The DEBUGEN bit is set by the debugger when it is connected to the
core.  Software can use this bit to check if a debug session is active.

Add a function in gdbstub to check if the debugger is attached to a CPU
and use this information when the DHCSR register is read in armv7m_nvic.

Signed-off-by: Valentin Ghita <valentinghita@google.com>
---
 gdbstub.c              | 10 ++++++++++
 hw/intc/armv7m_nvic.c  |  4 ++++
 include/exec/gdbstub.h |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a038..d4e39db8e7 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3585,6 +3585,16 @@ int gdbserver_start(const char *device)
     return 0;
 }
 
+bool gdb_attached(CPUState *cpu)
+{
+    GDBProcess *process = gdb_get_cpu_process(cpu);
+    if (process != NULL) {
+        return process->attached;
+    }
+
+    return false;
+}
+
 static void register_types(void)
 {
     type_register_static(&char_gdb_type_info);
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 13df002ce4..d6fff94bca 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -21,6 +21,7 @@
 #include "sysemu/runstate.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "exec/memop.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -1510,6 +1511,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         /* We provide minimal-RAS only: RFSR is RAZ/WI */
         return 0;
+    case 0xdf0: /* DHCSR */
+        /* Bit 0: DEBUGEN. */
+        return gdb_attached(CPU(cpu)) ? 1 : 0;
     case 0xf34: /* FPCCR */
         if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
             return 0;
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350d..383f4e5224 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -177,6 +177,12 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
  */
 int gdbserver_start(const char *port_or_device);
 
+/**
+ * gdb_attached: check if GDB is attached to a given CPU.
+ * @cpu: the CPU to check if GDB is attached to.
+ */
+bool gdb_attached(CPUState *cpu);
+
 /**
  * gdb_has_xml:
  * This is an ugly hack to cope with both new and old gdb.
-- 
2.35.0.263.gb82422642f-goog


