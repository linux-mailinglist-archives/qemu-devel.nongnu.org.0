Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86FF4B1B59
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:36:48 +0100 (CET)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKrf-00076A-PY
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmu-0003wz-6i
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:52 -0500
Received: from [2607:f8b0:4864:20::42f] (port=45017
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmo-0007KP-7G
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:48 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y8so10759158pfa.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCCF97dQuOIe5HKSPiGIFkUfFA+q0msW14SF5LYunf0=;
 b=BWN3dboWX3ij5q0jDCjU+3qQoppr8h3W2OWuDxVevzqwGEz3axhF61iFi2Lxbng/VR
 wDZDNbQyef8TXzu4sSIoqMmmNRtyoVk3tA7zjEUFOZA+9z7Br6P+NjR1aoCjfxvAz6Iy
 14P4o6jU3Tfp56SurjGus0Tf/xUJX1M01pOUeR+4b3fIzVFsrT94TSX0kCtAoqrUGlV+
 7NNkERiCqkPqNmn9pjomAS71vxkpWxl3iOc11LAAV8RBplRzvcbFDWrGJwLZwgQRLWcQ
 ffTLEAyl7mAw37aYfYMc2AiGYU6MvZZESxYkZZ+tSW5lvKN6ozuy3qSN40En47CncKtH
 01Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCCF97dQuOIe5HKSPiGIFkUfFA+q0msW14SF5LYunf0=;
 b=gNK7KomJg8zBT6pUME5Lc3sA3OXBc9Dp7ks171W4P2AM8Qu/dPnDS4WHH2zWKFUbTm
 Veqw97KmB7hVq2/BGB/4BFdHLQ7fUDRcPC4SNrVEFtCq5UHJjry4kK9a2nuNACcDzIXh
 TPF016cAyoBaJxd0U8pzg3zUeESJpDUurEMicOrNp8fQ/vzsuR1MwRhUpRudSU/TGF2G
 RFx3kHgsOP87j9HJSKkZcd+9BVWx1oc28KIW5Lm+YNHJyH9negSAPr6EMR8DHIOVVPTv
 haZOgvuyzqRGpYHLFwF0f0KB2KJ/1lhY0T5Mawfo4KXgZeAjhXBrn/+t39CpFkgorJXc
 2sLA==
X-Gm-Message-State: AOAM533UorzBKrW7WI4IjyodCkEotJpjNZBgH6gRJQXfGoJN1ljcUHJ1
 BteyW7M1TXpGm3Zl3Hl45zKICtWwPCHcwVjF
X-Google-Smtp-Source: ABdhPJwo3ANOEmJtTdZOiBCDJqHedbaM/TAkERO/3wLqd6oWfKDnB4UhDyOMgGLooLUvvA6tqjeTAw==
X-Received: by 2002:a63:ea54:: with SMTP id l20mr4158736pgk.148.1644543104597; 
 Thu, 10 Feb 2022 17:31:44 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/34] linux-user: Move sparc/host-signal.h to
 sparc64/host-signal.h
Date: Fri, 11 Feb 2022 12:30:29 +1100
Message-Id: <20220211013059.17994-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not support sparc32 as a host, so there's no point in
sparc64 redirecting to sparc.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


