Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD01342D2A
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:51:29 +0100 (CET)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNc0m-0000Nb-Jc
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbnF-00039h-Gz
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:29 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn7-0004Ix-VA
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:29 -0400
Received: by mail-ej1-x62e.google.com with SMTP id w3so14057533ejc.4
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pa/Fiua7g7Vmj4OKm8oDu8MB1fXTUZdi8REKYNbvuPI=;
 b=XMtuW8cHBV5cUVfEQJ/Wly7KUz6KaMk92eQL5pojG+/oC+DyjkSUWlwrRtNqjtg4Vu
 PlXkecM6Zb1VtLOxsfMPyuip6YctedVP9dlRjILlwqztMaxRCRutRrqKWVVAnQ/b1EwY
 lCLRXfdTfz4h/GN1ePLrNrI/PcUrMkzjh3GG0lc2UoO7K3woBPe43ULo49c+Vyg1Bd6Z
 cKkUvfkXsSFgNUmHk/7B1DKZU+TP8KpDF5uD2lCzEFtDkbwKbI+MipVxa2oWy14CmebV
 oFBpdwnV8KWq+1uJi9Cy5txOKs2XBWKkxjXi4R9HQC80GwTM2zcmRZQECHtdX9HH8kxA
 WbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pa/Fiua7g7Vmj4OKm8oDu8MB1fXTUZdi8REKYNbvuPI=;
 b=ipwyDMjPzaVgy5u1YCqN/FLJU+esIKmN9TqE1r9xlXc2Uj96CxZ2CZ+rKBI/qBiXuE
 JleOFfpVV5HQmvmXP1hkY+hwlLBUXTCEF6PhjHgx4mQIxUtRSUGx+GjBIuDP67uq0irw
 ygyTPQE9dl0cdcT9TV7+G0Fu+lPYNo2t8Zh8xjzF9gIB+EgmOzH+Je+EmOr548mQQVBm
 uuRxObDS2RUFN9QRTN8XRArDo62Svr7Y1k7oquaRW9/fTip6W9IiWGhEgXioi6cbryBf
 SzBCji2Bj4YqOkWPhXbPy3+YjhAFfpC46NlWrTzDjDeXRo48AQ8W+FPc3spkDfS+oj00
 BLTw==
X-Gm-Message-State: AOAM531wMXz+szdbtHzHhO/En+wCOG9/NaNJ20CEzgsgSNbMQM0BUAkL
 26nnqqHDwx40q+2KkUxTGVuPQqRnUgwCv35L
X-Google-Smtp-Source: ABdhPJxRmkc2IAjoLIoMMiJI7MfVBKdOyPCw8lhswACsyXUWl6waTS/fINjJ9TWwlwnjq9/kVXaXAA==
X-Received: by 2002:a17:906:1c98:: with SMTP id
 g24mr9843221ejh.51.1616247440703; 
 Sat, 20 Mar 2021 06:37:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z9sm6395566edr.75.2021.03.20.06.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 977571FF98;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/14] tests/tcg: add HeapInfo checking to semihosting test
Date: Sat, 20 Mar 2021 13:37:01 +0000
Message-Id: <20210320133706.21475-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Query the SYS_HEAPINFO semicall and do some basic verification of the
information via libc calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312102029.17017-6-alex.bennee@linaro.org>
---
 .../multiarch/arm-compat-semi/semihosting.c   | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
index b3fd16cd12..8e9cfb578c 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -8,9 +8,13 @@
  */
 
 #define SYS_WRITE0      0x04
+#define SYS_HEAPINFO    0x16
 #define SYS_REPORTEXC   0x18
 
 #include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
@@ -21,8 +25,46 @@ int main(int argc, char *argv[argc])
     uintptr_t exit_block[2] = {0x20026, 0};
     uintptr_t exit_code = (uintptr_t) &exit_block;
 #endif
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info;
+    void *ptr_to_info = (void *) &info;
 
-    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
+    __semi_call(SYS_WRITE0, (uintptr_t) "Checking HeapInfo\n");
+
+    memset(&info, 0, sizeof(info));
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    if (info.heap_base == NULL || info.heap_limit == NULL) {
+        printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
+        exit(1);
+    } else if (info.heap_base != NULL && info.heap_limit != NULL) {
+        /* Error if heap base is above limit */
+        if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
+            printf("heap base %p >= heap_limit %p\n",
+                   info.heap_base, info.heap_limit);
+            exit(2);
+        }
+    }
+
+    if (info.stack_base == NULL) {
+        printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
+        exit(3);
+    } else if (info.stack_base != NULL && info.stack_limit != NULL) {
+        /* Error if stack base is below limit */
+        if ((uintptr_t) info.stack_base < (uintptr_t) info.stack_limit) {
+            printf("stack base %p < stack_limit %p\n",
+                   info.stack_base, info.stack_limit);
+            exit(4);
+        }
+    }
+    printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    printf("stack: %p -> %p\n", info.stack_base, info.stack_limit);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Passed HeapInfo checks");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- 
2.20.1


