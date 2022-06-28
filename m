Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BEF55BE88
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:53:43 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64AQ-0003YC-3E
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Ey-0002Ck-Gk
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:21 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Ew-0008H4-U0
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:20 -0400
Received: by mail-pj1-x102d.google.com with SMTP id l2so10248114pjf.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtCh1R/o+jWczZ2gQY+9f4Xav0T6t+bxgoxTR2mENvU=;
 b=qGMtCKFKQ/U+TbLepNcm1TBMz8/zuUTmR3SAF2lbc1iJTUeLGTXpE2wy4OALtVW6Mx
 eyhWzWzd1NUH6NpMQ37tPTsQJMXkY2B7nfnNKQoI6P6CZ97Cf3JEX0YxC8c9Mrx2Z0i4
 2UvRus1ai+XWCtEl8VDnhgXWundayqjCwWISossbSvscHBKGyyRaMak6osp23xAuLLCG
 jBOi65PcSeA+u7cptt6PjidNudmzEt04mDvSpJyy6L42dZZJBgebfqHVhSv9jlcwwH7r
 Hpz5rJAJ/95j7FYqpnLcajOLN3ccAcjJNnfQ2w//wwmDV8I+NoSaA7VM46PNe7S7BoW/
 70aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtCh1R/o+jWczZ2gQY+9f4Xav0T6t+bxgoxTR2mENvU=;
 b=cxo238cMfIOFyUD/M8yl4KmPLEDs4iVWlXnhL61YmL8/jix95FxqPMXBgu9xyEf0j6
 3zdRYFVGZjc0fWdrBsSZ6Pgw3Hau9Av51gP2vgqwyx7QUZex45sUwp37gYezUMGwAKES
 68QStDInW/uAoCQeTPszrGgST4lrKHn8KjXgrlFXtXZnjnXqHM0QYnfS9UHTuEi4y5Wz
 VmdlfT7TYxSuYtU+HXe7yPtRpDMEgQHc9DTYAKF3vJZNSrjxGkzOfYMgTAzk9CTw6tc0
 CE4Gguvem0nj0DJX9ikWVey/TNs62zHc/U4cb9NFS/VWWrQknjMnAcyuhgaV6EIM9T8A
 k8jw==
X-Gm-Message-State: AJIora/RMNcYx7fwDvdbgMw32/ldSBGi9QOkGxfhxHNojYsk9f4fM78k
 Db+Pqixo2dRvPSkXgSXwWAdlS4z582CD+w==
X-Google-Smtp-Source: AGRyM1s9jqR5olQTeZrctg9q4nfBlP1B4PXSjN+p1eLR9pjovuWOpFXyMFJAbdBJs2slXx17ol8IwQ==
X-Received: by 2002:a17:90b:2251:b0:1ed:29d2:e013 with SMTP id
 hk17-20020a17090b225100b001ed29d2e013mr22800287pjb.223.1656392057628; 
 Mon, 27 Jun 2022 21:54:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/60] semihosting: Move softmmu-uaccess.h functions out of line
Date: Tue, 28 Jun 2022 10:23:07 +0530
Message-Id: <20220628045403.508716-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Rather that static (and not even inline) functions within a
header, move the functions to semihosting/uaccess.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/softmmu-uaccess.h | 42 +++-------------------
 semihosting/uaccess.c                 | 51 +++++++++++++++++++++++++++
 semihosting/meson.build               |  1 +
 3 files changed, 57 insertions(+), 37 deletions(-)
 create mode 100644 semihosting/uaccess.c

diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
index 5246a91570..03300376d3 100644
--- a/include/semihosting/softmmu-uaccess.h
+++ b/include/semihosting/softmmu-uaccess.h
@@ -42,47 +42,15 @@
 
 #define put_user_ual(arg, p) put_user_u32(arg, p)
 
-static void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
-                               target_ulong len, bool copy)
-{
-    void *p = malloc(len);
-    if (p && copy) {
-        if (cpu_memory_rw_debug(env_cpu(env), addr, p, len, 0)) {
-            free(p);
-            p = NULL;
-        }
-    }
-    return p;
-}
+void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+                        target_ulong len, bool copy);
 #define lock_user(type, p, len, copy) softmmu_lock_user(env, p, len, copy)
 
-static char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
-{
-    /* TODO: Make this something that isn't fixed size.  */
-    char *s = malloc(1024);
-    size_t len = 0;
-
-    if (!s) {
-        return NULL;
-    }
-    do {
-        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
-            free(s);
-            return NULL;
-        }
-    } while (s[len++]);
-    return s;
-}
+char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr);
 #define lock_user_string(p) softmmu_lock_user_string(env, p)
 
-static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
-                                target_ulong len)
-{
-    if (len) {
-        cpu_memory_rw_debug(env_cpu(env), addr, p, len, 1);
-    }
-    free(p);
-}
+void softmmu_unlock_user(CPUArchState *env, void *p,
+                         target_ulong addr, target_ulong len);
 #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
 
 #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
new file mode 100644
index 0000000000..0d3b32b75d
--- /dev/null
+++ b/semihosting/uaccess.c
@@ -0,0 +1,51 @@
+/*
+ * Helper routines to provide target memory access for semihosting
+ * syscalls in system emulation mode.
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ *
+ * This code is licensed under the GPL
+ */
+
+#include "qemu/osdep.h"
+#include "semihosting/softmmu-uaccess.h"
+
+void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+                        target_ulong len, bool copy)
+{
+    void *p = malloc(len);
+    if (p && copy) {
+        if (cpu_memory_rw_debug(env_cpu(env), addr, p, len, 0)) {
+            free(p);
+            p = NULL;
+        }
+    }
+    return p;
+}
+
+char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
+{
+    /* TODO: Make this something that isn't fixed size.  */
+    char *s = malloc(1024);
+    size_t len = 0;
+
+    if (!s) {
+        return NULL;
+    }
+    do {
+        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
+            free(s);
+            return NULL;
+        }
+    } while (s[len++]);
+    return s;
+}
+
+void softmmu_unlock_user(CPUArchState *env, void *p,
+                         target_ulong addr, target_ulong len)
+{
+    if (len) {
+        cpu_memory_rw_debug(env_cpu(env), addr, p, len, 1);
+    }
+    free(p);
+}
diff --git a/semihosting/meson.build b/semihosting/meson.build
index 4344e43fb9..10b3b99921 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,6 +1,7 @@
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
+  'uaccess.c',
 ))
 
 specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
-- 
2.34.1


