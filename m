Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE539BF8C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:25:43 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEVq-0001JG-Qn
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET3-0000rJ-0g
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpESv-0000Jt-2N
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y7so5556985wrh.7
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUqxN4lb+GfiuAaelODfQHE3gWgKHRBOE5j2GQAObTg=;
 b=con1IPL0H5Citz/LQVNUjQpcsxmgkwNYBNV+VAnRxx2DTqj9xwtk0zKC6/PmD+h/3c
 ko+vjrFDOg2zK6vLv7abojdId7lbwhUELOlt9w6lDUo65VdLyOqDizIxlArxYQUQA/l2
 up+B1Ml8eYmWMEkl1hAYHYjuHmuByNNAghbZIsCh38RViJE3IOl9yuy3hcyKcc+MTU2t
 U0gRXemaHaVoYHqnxO/I6Ye6IvV/XQi4mbNAyu8vnmC74hq7YqD7lraBooglFZLoeHkg
 yIWpaU8LfcWdAjgwOT9g8Abm9h0K0YvyqQ9HsYg//T2CZn8BNHJn9NSpLyGUy4nXloZL
 5opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUqxN4lb+GfiuAaelODfQHE3gWgKHRBOE5j2GQAObTg=;
 b=msL3Ad0CUNcJuoGMq9QV6CRbwKH1hUl7x7mAQu2+4yXH5V1Talt6ySIJF5/87yd9dz
 0a9f/maigvbB9jClx1p1RL2vxHCfDhDVL9BCJ46WKjXJbZYZanQZ6DVUa0fGAvLbzYMQ
 vTMbabUw/NfhgercoxXENpRiRdh+hh7nSCtvFAHvn0Kx5WXs/9A6ARWE4NK7wDdgD9ef
 UcM9TYCNlh4UsZQH8dWI9xYVOBFNFOonGp2eT2aUbG4aSjGkoWJEEyRMBEq6qbsabCv3
 ELgvOaKAIqgVEzBwS15qNSlUw6ihJno+LldD8PRwdp06vWLTV3pmJUHJ2+xVkdk3JF4O
 jPjw==
X-Gm-Message-State: AOAM530KC5F6YkXtbSeNu6dMpBtyx9Aclz8DYaI8moDGYs9BmQaB6cb/
 kOCQErXgQ5JPVnByH3f26IpBRA==
X-Google-Smtp-Source: ABdhPJwVVZPTfbdxtUZSGdoEH7DKywEh2pM/6ZQYYMIlnfl+abPQ4bl+X/NOV0m2NaBH82mpq8SMrw==
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr4752291wrq.253.1622830959561; 
 Fri, 04 Jun 2021 11:22:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y189sm6540544wmy.25.2021.06.04.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7351C1FFAA;
 Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 20/99] target/arm: tcg: move sysemu-only parts of
 debug_helper
Date: Fri,  4 Jun 2021 16:51:53 +0100
Message-Id: <20210604155312.15902-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move sysemu-only parts of debug_helper to sysemu/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/debug_helper.c        | 27 -----------------------
 target/arm/tcg/sysemu/debug_helper.c | 33 ++++++++++++++++++++++++++++
 target/arm/tcg/sysemu/meson.build    |  1 +
 3 files changed, 34 insertions(+), 27 deletions(-)
 create mode 100644 target/arm/tcg/sysemu/debug_helper.c

diff --git a/target/arm/tcg/debug_helper.c b/target/arm/tcg/debug_helper.c
index 2ff72d47d1..66a0915393 100644
--- a/target/arm/tcg/debug_helper.c
+++ b/target/arm/tcg/debug_helper.c
@@ -308,30 +308,3 @@ void arm_debug_excp_handler(CPUState *cs)
                         arm_debug_target_el(env));
     }
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * In BE32 system mode, target memory is stored byteswapped (on a
-     * little-endian host system), and by the time we reach here (via an
-     * opcode helper) the addresses of subword accesses have been adjusted
-     * to account for that, which means that watchpoints will not match.
-     * Undo the adjustment here.
-     */
-    if (arm_sctlr_b(env)) {
-        if (len == 1) {
-            addr ^= 3;
-        } else if (len == 2) {
-            addr ^= 2;
-        }
-    }
-
-    return addr;
-}
-
-#endif
diff --git a/target/arm/tcg/sysemu/debug_helper.c b/target/arm/tcg/sysemu/debug_helper.c
new file mode 100644
index 0000000000..0bce00144f
--- /dev/null
+++ b/target/arm/tcg/sysemu/debug_helper.c
@@ -0,0 +1,33 @@
+/*
+ * ARM debug helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+
+vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * In BE32 system mode, target memory is stored byteswapped (on a
+     * little-endian host system), and by the time we reach here (via an
+     * opcode helper) the addresses of subword accesses have been adjusted
+     * to account for that, which means that watchpoints will not match.
+     * Undo the adjustment here.
+     */
+    if (arm_sctlr_b(env)) {
+        if (len == 1) {
+            addr ^= 3;
+        } else if (len == 2) {
+            addr ^= 2;
+        }
+    }
+
+    return addr;
+}
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 6f014f77ec..1a4d7a0940 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -1,3 +1,4 @@
 arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'debug_helper.c',
   'mte_helper.c',
 ))
-- 
2.20.1


