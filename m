Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A774AD2EC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:17:04 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLgN-0000CJ-7H
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:17:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKgI-0007Cp-3e
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:54 -0500
Received: from [2607:f8b0:4864:20::435] (port=41713
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKgG-0000SR-0Q
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:53 -0500
Received: by mail-pf1-x435.google.com with SMTP id i30so17339953pfk.8
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJuLwgpIKS69h636IRXxH6OktXJuo/SfsuMoxMe201g=;
 b=o/HokwXXisnt0GaK7ZBW1ZOX/tBQtAq9JGlorXjLjJUYTHNmT00tsgH2Y0jhfZtNHR
 6henEikK3JHnsbkwGCNUNJxqVSiqj1SEvLYRld0peYz3YliUcDy3vxOKiuyZus7i5gqS
 zU4tI04Jb75YsHmDbe8CI++hlIyDcWSlp3S9ZEi5oAVH6To4nmF93hXd3ElfenZmjA+/
 KC6tHt1ZhW51TSBBoYE79pwm/DW4Oai8zpRbYDS/IfU7n7JrBuW6aH8WJdEHeFLX40DN
 ct+P14c2wBTYqaOFu8M4fjwt/CGRxdSCnpl7/DuEkx6NIjarpyWVz1B05Qjto6EpvGTW
 0+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJuLwgpIKS69h636IRXxH6OktXJuo/SfsuMoxMe201g=;
 b=bHb/t6YU395DfThckp0W8hTbTs8offmzfd7aE2/XoVB347tLG0Sr9nh+bYDy/sDrM4
 eoeDBxX4t5ulww2LJQXBy7wNd/DDvYprfWlHyBnNfpIrBx3r2P+LjhqTOGSwqpz7qsJD
 KIxrEEHrBGVEr1SrI9UC/dCcjO70DcFDt4V/2QyPzwF82CCzQgXC8+/6IRGZF2GLk8TS
 0jgZb0kndIGR1qJ6J4nGLifO+p554SvSbizdr+/F1UYozbz4DF9qiCP2dWvmbhcWl6sY
 dbRZoT5b2cxawxvbE56zhK6ZZRRTFlm0bbXvTgq2sTslkiz/3jmbh8IjJo2tKgqF8W/B
 gGJg==
X-Gm-Message-State: AOAM532TuDqTFyG3ApoPfKTO8YlW1TSZbXaFCwXBuvw9PqRC0O3wWGZb
 SOe1gbzPvhhJ0rk1GcEZG+URXGOSiKHB/A==
X-Google-Smtp-Source: ABdhPJwnIOe32GsQcx+5fCThTua/OSSnk5tX67biI3c+OsSHhLNJmYKkqiSx6c01BKxojSBWbor/nw==
X-Received: by 2002:a63:8ac8:: with SMTP id y191mr1506425pgd.29.1644304370676; 
 Mon, 07 Feb 2022 23:12:50 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id b12sm13908088pfm.154.2022.02.07.23.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:12:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] linux-user: Move sparc/host-signal.h to
 sparc64/host-signal.h
Date: Tue,  8 Feb 2022 18:12:36 +1100
Message-Id: <20220208071237.319844-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071237.319844-1-richard.henderson@linaro.org>
References: <20220208071237.319844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not support sparc32 as a host, so there's no point in
sparc64 redirecting to sparc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/include/host/sparc/host-signal.h   | 71 -------------------
 linux-user/include/host/sparc64/host-signal.h | 64 ++++++++++++++++-
 2 files changed, 63 insertions(+), 72 deletions(-)
 delete mode 100644 linux-user/include/host/sparc/host-signal.h

diff --git a/linux-user/include/host/sparc/host-signal.h b/linux-user/include/host/sparc/host-signal.h
deleted file mode 100644
index 871b6bb269..0000000000
--- a/linux-user/include/host/sparc/host-signal.h
+++ /dev/null
@@ -1,71 +0,0 @@
-/*
- * host-signal.h: signal info dependent on the host architecture
- *
- * Copyright (c) 2003-2005 Fabrice Bellard
- * Copyright (c) 2021 Linaro Limited
- *
- * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef SPARC_HOST_SIGNAL_H
-#define SPARC_HOST_SIGNAL_H
-
-/* FIXME: the third argument to a SA_SIGINFO handler is *not* ucontext_t. */
-typedef ucontext_t host_sigcontext;
-
-static inline uintptr_t host_signal_pc(host_sigcontext *uc)
-{
-#ifdef __arch64__
-    return uc->uc_mcontext.mc_gregs[MC_PC];
-#else
-    return uc->uc_mcontext.gregs[REG_PC];
-#endif
-}
-
-static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
-{
-#ifdef __arch64__
-    uc->uc_mcontext.mc_gregs[MC_PC] = pc;
-#else
-    uc->uc_mcontext.gregs[REG_PC] = pc;
-#endif
-}
-
-static inline void *host_signal_mask(host_sigcontext *uc)
-{
-    return &uc->uc_sigmask;
-}
-
-static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
-{
-    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
-
-    if ((insn >> 30) == 3) {
-        switch ((insn >> 19) & 0x3f) {
-        case 0x05: /* stb */
-        case 0x15: /* stba */
-        case 0x06: /* sth */
-        case 0x16: /* stha */
-        case 0x04: /* st */
-        case 0x14: /* sta */
-        case 0x07: /* std */
-        case 0x17: /* stda */
-        case 0x0e: /* stx */
-        case 0x1e: /* stxa */
-        case 0x24: /* stf */
-        case 0x34: /* stfa */
-        case 0x27: /* stdf */
-        case 0x37: /* stdfa */
-        case 0x26: /* stqf */
-        case 0x36: /* stqfa */
-        case 0x25: /* stfsr */
-        case 0x3c: /* casa */
-        case 0x3e: /* casxa */
-            return true;
-        }
-    }
-    return false;
-}
-
-#endif
diff --git a/linux-user/include/host/sparc64/host-signal.h b/linux-user/include/host/sparc64/host-signal.h
index 1191fe2d40..f8a8a4908d 100644
--- a/linux-user/include/host/sparc64/host-signal.h
+++ b/linux-user/include/host/sparc64/host-signal.h
@@ -1 +1,63 @@
-#include "../sparc/host-signal.h"
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef SPARC64_HOST_SIGNAL_H
+#define SPARC64_HOST_SIGNAL_H
+
+/* FIXME: the third argument to a SA_SIGINFO handler is *not* ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
+{
+    return uc->uc_mcontext.mc_gregs[MC_PC];
+}
+
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.mc_gregs[MC_PC] = pc;
+}
+
+static inline void *host_signal_mask(host_sigcontext *uc)
+{
+    return &uc->uc_sigmask;
+}
+
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
+{
+    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
+
+    if ((insn >> 30) == 3) {
+        switch ((insn >> 19) & 0x3f) {
+        case 0x05: /* stb */
+        case 0x15: /* stba */
+        case 0x06: /* sth */
+        case 0x16: /* stha */
+        case 0x04: /* st */
+        case 0x14: /* sta */
+        case 0x07: /* std */
+        case 0x17: /* stda */
+        case 0x0e: /* stx */
+        case 0x1e: /* stxa */
+        case 0x24: /* stf */
+        case 0x34: /* stfa */
+        case 0x27: /* stdf */
+        case 0x37: /* stdfa */
+        case 0x26: /* stqf */
+        case 0x36: /* stqfa */
+        case 0x25: /* stfsr */
+        case 0x3c: /* casa */
+        case 0x3e: /* casxa */
+            return true;
+        }
+    }
+    return false;
+}
+
+#endif
-- 
2.25.1


