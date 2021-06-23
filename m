Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED23B1B93
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:51:37 +0200 (CEST)
Received: from localhost ([::1]:58040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3I0-0005Y6-Uw
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw3Ea-0000EC-As
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:48:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw3EY-0005CA-HF
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:48:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id m3so1681596wms.4
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGa6vECs+n4MFunaX33qznn0819BFDMLBnsgyGX5SyY=;
 b=riUc9i+FiOGeiKSwrzvjlztGq5Ojwduk++apKrajxc2lhOwY1bs6Np7P5Wj29PmN2N
 DgNqQnrZ1P3dawxcwq1v0+IBrPhlUlqggTAkKJFfOvDSDlwT9G4BDDV+B1soST/f23Da
 X9M+apO6aRMNag6RJFm4iTuSwqQ6zZZOS0/IBpgJM1MwzODC9sMSQmHluph/YyTagP/9
 NI+Aikt+cc2yqgPp+gsunsH3uRcpvjxzJRTkuGPam80tlK/qfuoCffTh0mfSfE93mRMS
 IBTVeCNYQur/9OKkR0tKezQ0GWKuIO3SXGqNGo1kG5vHFz47Q8ycdvey1SW/2MtPLoKm
 0kaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGa6vECs+n4MFunaX33qznn0819BFDMLBnsgyGX5SyY=;
 b=HgczdrZhj+0d9FkpsGEqppbkvioddwQVfSE2Gd+Twx/Rv+1wq/+juaJl2oYGFgT/yt
 Sxbqrc7qrmXU/Dojb4iNXOEFZw773O3r60v1yM6Fu0+0Gc66JVBax+2GUm3rFzjteOKb
 g/33yU5s9dLx6yuRwJ7DEEmlPpZSpHRIynxScBUkokx/nDyBiuQRA2x/0MtjGLR4BjxI
 41VXXyZXARL3FpFz/MGhBh8+1bAhXjF6OdhPHZsWznr2PoF8INOMDrMiaUG8HjkTPXEP
 3bZ9BZEaQrSXQyZ6/HRMe7OpKotQf9hk4tm13+ZAIoKwDBdseKR1xjgDxgem+Qgzy9C0
 IsXQ==
X-Gm-Message-State: AOAM532ENj0v5nNysDjzHEer+gPb+sgNz8Wh3TruBWDCbwORzeEndQRU
 onfCzaFKGWDh3Mp2xjGorOmEqQ==
X-Google-Smtp-Source: ABdhPJzTlcHTkAUDsy5MQ547f9TMyRuJKw5YeRMc/9tK0Bh845D72YbvWm0VgvJor8eIa8rXAOhhPQ==
X-Received: by 2002:a05:600c:ada:: with SMTP id
 c26mr11138879wmr.189.1624456081267; 
 Wed, 23 Jun 2021 06:48:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm39675wmq.1.2021.06.23.06.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:47:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34CB91FF8C;
 Wed, 23 Jun 2021 14:47:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Wed, 23 Jun 2021 14:47:56 +0100
Message-Id: <20210623134756.30930-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623134756.30930-1-alex.bennee@linaro.org>
References: <20210623134756.30930-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
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


