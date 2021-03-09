Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC80332F65
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:56:17 +0100 (CET)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiSm-0007qu-JK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg36-0003g4-U8
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:36 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg35-0003tD-9V
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:36 -0500
Received: by mail-ej1-x634.google.com with SMTP id p7so18467421eju.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H2Dg/3xWo/lJhWRHAFHTsEix8OkL3E+jnOBvruDCvb4=;
 b=fxV4h0niEbAoIWX5kC3jEVjMF0cC3xY5RwPK1Hcu4EfSkXhMZpzPXGWydcnN3sZVSb
 db4aMDpqwQQAzqQRhHXVB1HgYindL5z4X84WP09l78KisIj6zozhX1dRYK5UAquYRSDj
 JrLhtjHGO27OKAHjZVjAPEa+g4reWYN1CPg3VlSG2ClOl5owwzc0i4t6/kLnNOEicEVO
 PdPtoRs9jPyOXdrMPv1DdUbjzIOJyt9apD2gpEWSICq0CWuhcIjHtfc25v/GLmuKkK1l
 5zEEFjl4sp+kIN7btafywapHmQbIeO0EfZt1V83GjhIKq5OoeG/XNOa6fxKni93xfu7t
 prlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2Dg/3xWo/lJhWRHAFHTsEix8OkL3E+jnOBvruDCvb4=;
 b=Z6Gb15i9loByvJX0zSZy3otEAgRyoQ6u590nsA41tE6+Z1tRDHt/zt/Wa0YoW5e/Uv
 PhnADV/fQylgHqDPhUd2Ufh9HBIp1+cfp90RQpOL57tJBAzsMFq50LuzKm3wlruEfay2
 DDTSvFIpKWuPQTaE0Pykp0jibSipQFBSPZldX1svNfS/5snBg9F9+u0jj5pdTgncmvz0
 o/azqgJ8lfzh2iVBvEsuKxI1PClPKJG8Ae4Zu9nCj/lw4CjGHv6zTmSt7RjKRxSIq+Lf
 Q1E2/FpnDjA1IJHLLF1HSnx9V4WL7CXYgrUAlcW66l7+bnOOfCTCVqCoBINXEQEyFj6X
 P44A==
X-Gm-Message-State: AOAM533QuvwuVtZYitmve4cvaq1H4UTsvx2sVIq4RAu3h/CHE+vSOCrh
 vuSf9Z9iI9YHAHyL7xRsqV0xiA==
X-Google-Smtp-Source: ABdhPJyZNVT6oZO6TpkUOhay9LtBmDNeN9fXQy5+mUqWvH3Bedar0zEP2B59WSpUtWXBBzFGtl/pvQ==
X-Received: by 2002:a17:906:5e4a:: with SMTP id
 b10mr21435871eju.116.1615310493927; 
 Tue, 09 Mar 2021 09:21:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h10sm9747740edk.17.2021.03.09.09.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:21:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7ED801FF90;
 Tue,  9 Mar 2021 17:21:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 4/4] tests/tcg: add HeapInfo checking to semihosting test
Date: Tue,  9 Mar 2021 17:21:27 +0000
Message-Id: <20210309172127.20470-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309172127.20470-1-alex.bennee@linaro.org>
References: <20210309172127.20470-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: keithp@keithp.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Query the SYS_HEAPINFO semicall and do some basic verification of the
information via libc calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../multiarch/arm-compat-semi/semihosting.c   | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
index b3fd16cd12..5fa3c0a82d 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -8,9 +8,16 @@
  */
 
 #define SYS_WRITE0      0x04
+#define SYS_HEAPINFO    0x16
 #define SYS_REPORTEXC   0x18
 
+#define _GNU_SOURCE  /* asprintf is a GNU extension */
+
 #include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
@@ -21,8 +28,34 @@ int main(int argc, char *argv[argc])
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
+    char *heap_info, *stack_info;
+    void *brk = sbrk(0);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Checking HeapInfo\n");
+
+    memset(&info, 0, sizeof(info));
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    asprintf(&heap_info, "heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+    if (info.heap_base != brk) {
+        sprintf(heap_info, "heap mismatch: %p\n", brk);
+        __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+        return -1;
+    }
+
+    asprintf(&stack_info, "stack: %p -> %p\n", info.stack_base, info.stack_limit);
+    __semi_call(SYS_WRITE0, (uintptr_t) stack_info);
+    free(heap_info);
+    free(stack_info);
 
-    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- 
2.20.1


