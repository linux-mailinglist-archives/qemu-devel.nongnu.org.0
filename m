Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBA3A8707
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:01:18 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCRB-00046B-2V
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltCOA-00012N-JK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltCO8-000169-Gl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:10 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso24447wms.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGa6vECs+n4MFunaX33qznn0819BFDMLBnsgyGX5SyY=;
 b=AHmIuI75QUeVwk45SFwdkpk3d7NH8BoUB55fl1Nm4msNfu8nBuNKEiQMNRMH7yL5p0
 3awMfV3VCidU2IqrLScyGlWVr5neYAxdSSYZIKLI/WuKNl5vlSpgCK7MC3II0snmotAF
 D7mjSfvdid/mfEc45Q9a6mwcT9OmDzAI50CAX67U7sXri2GCpysD59Ia9784ExTb71LY
 6sVxGX9tQmxJFKET2BBG53RHzXy3H65mstnMshmadkOKEBg/+bCmzMZy32MWlkLSTaTq
 VXq0v+Ckr9peSPwOpPz2R9+vD5hgeNx20SFr50Nku7QlxBCJJ/sglcYJNmubgd1aDvRQ
 yBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGa6vECs+n4MFunaX33qznn0819BFDMLBnsgyGX5SyY=;
 b=tUfddypk+qTMtLgoUvWN9upzo7bU3qekEaesTVl5JZxERnkpeWAxT1dxOrkbgW1313
 iia1j8UHeyqTIii6MY2z4IJ46Wyh6yBD5jt5gqBtzZiJzRTWWEG4pXkGLwBGaYeJfmko
 3KW/JIfIXfOXHVb7ENCQo0lXe/cCtoW2ZTAXWkr9/U0H72dJE0UzrSrRBsHj4awIlgQs
 8YcUfaC17QHA2rD+5gwHthklaLU1xYBW7EndyidWcn6wAkhqucJpxHYiKMa71I22YQgx
 Xwa6J3FhaAAegPYJmhgQ9uB/z9oKf2MA/+BPQzRtc4qAfGzK6p+DUzSVWcjtLmTvgjDX
 5+vQ==
X-Gm-Message-State: AOAM532GMMJjMH1GqeCuVZSBUUIlQCLh3QnnMZCZ2l2suDFIjHwnwzCV
 3LHfRt8CkG45NZ9BGt+0DUItx0r8yL893Q==
X-Google-Smtp-Source: ABdhPJwMDVrnTiGutMY43T9Npf00mkG9IDGAlTN4JBVxFii1tzJ+VAS+NtVxEms0OjaxBNxaRNOhxQ==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr6449591wmc.1.1623776283946;
 Tue, 15 Jun 2021 09:58:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q5sm20162320wrm.15.2021.06.15.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:58:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB38B1FF8C;
 Tue, 15 Jun 2021 17:58:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Tue, 15 Jun 2021 17:58:00 +0100
Message-Id: <20210615165800.23265-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615165800.23265-1-alex.bennee@linaro.org>
References: <20210615165800.23265-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to check our new SYS_HEAPINFO implementation generates
sane values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/system/semiheap.c
new file mode 100644
index 0000000000..d5613dca59
--- /dev/null
+++ b/tests/tcg/aarch64/system/semiheap.c
@@ -0,0 +1,74 @@
+/*
+ * Semihosting System HEAPINFO Test
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <inttypes.h>
+#include <stddef.h>
+#include <minilib.h>
+
+#define SYS_HEAPINFO    0x16
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+
+    return t;
+}
+
+int main(int argc, char *argv[argc])
+{
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info;
+    void *ptr_to_info = (void *) &info;
+
+    ml_printf("Semihosting Heap Info Test\n");
+
+    /* memset(&info, 0, sizeof(info)); */
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    if (info.heap_base == NULL || info.heap_limit == NULL) {
+        ml_printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
+        return -1;
+    }
+
+    /* Error if heap base is above limit */
+    if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
+        ml_printf("heap base %p >= heap_limit %p\n",
+               info.heap_base, info.heap_limit);
+        return -2;
+    }
+
+    if (info.stack_base == NULL) {
+        ml_printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
+        return -3;
+    }
+
+    /*
+     * We don't check our local variables are inside the reported
+     * stack because the runtime may select a different stack area (as
+     * our boot.S code does). However we can check we don't clash with
+     * the heap.
+     */
+    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
+        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
+               ptr_to_info, info.heap_base, info.heap_limit);
+        return -4;
+    }
+
+    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
+    ml_printf("Passed HeapInfo checks\n");
+    return 0;
+}
-- 
2.20.1


