Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015A441FAF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:56:01 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbXM-0000iP-CG
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6C-0003o6-Jr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:57 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:40618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5v-0000bK-TQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:56 -0400
Received: by mail-qt1-x833.google.com with SMTP id 19so14949478qtt.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myv+iQtBsawIfO0tfuLs7BJIaq57M/hqyMfjI6iF8H8=;
 b=i7IhrguKzsWmc0ws4tIoi5JDd/Ma1xDyjlHbuDdKiVbVDCx7PdnNEZ6kE6lflOPr5p
 Spt+uHlBUUB15Y7dwOhXhlypOioRKnylsv9pYd939RZzH9wYIf4xzY3n2owd/jv/spLS
 fabJn4AUBRoOckLeLBbqJiBO3IxXPSgB1Ivs1+zybidkk+UhrYbKJQERkReYmAi6S+g+
 E/xna6OApSzyRSN88eBonQCcBC99AFsAC/cYN64Ipdm+9zj0g8Y08shou8YxowtPJ5HW
 tCegtCW28/y9M1F6BSWmyQc9LNf9CkyBzckc3n86NTDhP/BIk0qbQtA3KOopuQG9M/Pb
 FPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myv+iQtBsawIfO0tfuLs7BJIaq57M/hqyMfjI6iF8H8=;
 b=34ThzBESF+gc8JhkTli3eLZ+p43WQs8gnj9Ceb5FOlxQyBWlurt5xhpa8vIQDy5ocV
 PjbDqlgV2O+6nJ29KBB2gEB4ficazV5dbpU0fKs0F5kiCgcQR0fxXhMqXm3ZYaecKMqz
 VbyfiiyRPZy0QiLujXrfJ/CYOC2isgkuhheovMRICAkriHQJiWvoX1ZZMwxdfj4T5oaw
 YMiJt6BgIEQFL3kIkStGLq3yrQTeOTdq6+YgU0Udt4cJhB9PVQX9WYI4EAibdEyZ83rq
 tCPaza0vNFh8s4sXJJG75vmwRbbXjIr5+J1w7a1NiLBR5xGZidce1h82LpI46GW6gJnS
 nZHg==
X-Gm-Message-State: AOAM532Bz+gxMiA2uHRzWgrHTfE+kDjASKmKNtqCCj2CH09Xb+o+6hsb
 lcBilnv52qKhKJvgT8fkKzJeXUwA+Yc5jQ==
X-Google-Smtp-Source: ABdhPJzZrwIa4ZxmiUemDvlpgHwHPLw9TWqmIVrH15usxEIm0EggB71HHxXZ3Wr4/kE37J3ZspP7ww==
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr32209754qtk.255.1635787656122; 
 Mon, 01 Nov 2021 10:27:36 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/60] linux-user/host/alpha: Populate host_signal.h
Date: Mon,  1 Nov 2021 13:26:38 -0400
Message-Id: <20211101172729.23149-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Cc: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/alpha/host-signal.h | 42 +++++++++++++++++++++++++++++
 accel/tcg/user-exec.c               | 31 +--------------------
 2 files changed, 43 insertions(+), 30 deletions(-)
 create mode 100644 linux-user/host/alpha/host-signal.h

diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
new file mode 100644
index 0000000000..e080be412f
--- /dev/null
+++ b/linux-user/host/alpha/host-signal.h
@@ -0,0 +1,42 @@
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
+#ifndef ALPHA_HOST_SIGNAL_H
+#define ALPHA_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.sc_pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t *pc = (uint32_t *)host_signal_pc(uc);
+    uint32_t insn = *pc;
+
+    /* XXX: need kernel patch to get write flag faster */
+    switch (insn >> 26) {
+    case 0x0d: /* stw */
+    case 0x0e: /* stb */
+    case 0x0f: /* stq_u */
+    case 0x24: /* stf */
+    case 0x25: /* stg */
+    case 0x26: /* sts */
+    case 0x27: /* stt */
+    case 0x2c: /* stl */
+    case 0x2d: /* stq */
+    case 0x2e: /* stl_c */
+    case 0x2f: /* stq_c */
+        return true;
+    }
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5a0a65fa46..e9b6eb696f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,36 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__alpha__)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                           void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    uint32_t *pc = uc->uc_mcontext.sc_pc;
-    uint32_t insn = *pc;
-    int is_write = 0;
-
-    /* XXX: need kernel patch to get write flag faster */
-    switch (insn >> 26) {
-    case 0x0d: /* stw */
-    case 0x0e: /* stb */
-    case 0x0f: /* stq_u */
-    case 0x24: /* stf */
-    case 0x25: /* stg */
-    case 0x26: /* sts */
-    case 0x27: /* stt */
-    case 0x2c: /* stl */
-    case 0x2d: /* stq */
-    case 0x2e: /* stl_c */
-    case 0x2f: /* stq_c */
-        is_write = 1;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#elif defined(__sparc__)
+#if defined(__sparc__)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                        void *puc)
-- 
2.25.1


