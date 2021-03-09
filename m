Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE7332872
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:22:49 +0100 (CET)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdG4-0005cR-Fw
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdB8-0001SU-4x
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:42 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdB2-0001kS-IL
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:41 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so15945769wrz.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H2Dg/3xWo/lJhWRHAFHTsEix8OkL3E+jnOBvruDCvb4=;
 b=zcVJQeh11ElxEEP2NEQY6o+fNY8R5wSXDGT2s5+SYVoGgnlwGYtmvkrTk5GhjGxdUH
 su5feLN+xebiZNIehZi6kfqoK0ciq2QKT27HWHnqfEWkwc9zFT0ITOyl6cYR1J7G3NL0
 S75gF/OnPbvF8jb1yYZ3hhUt65m0r3kTT77KvQyPRbYOemxKWo3PQfFlfwbkyyr2DOoA
 ryrob9Y9tAx4uugxRUAadZcsSJF+kmZTpWbTtHqpM9BpYfkwiBEoTDQXsBhMlDNjzNhs
 963Dh06VRpLdm+F1H8Tjqso8EzNubcGmSHV1hxfyBAzMeA9ylV1sk0W+6ukbrB8isjF+
 31xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2Dg/3xWo/lJhWRHAFHTsEix8OkL3E+jnOBvruDCvb4=;
 b=rBDvFmze07cNBVA+Y8NujuNJm4dGElbRGerjpS5OjukKSqlR5Vlrm8CbHbSxQGNuzo
 +zXtFxz2RcMtzSbFSAk07vVmLfc1mXwePKl7AqmxA3YjrMg0JPmCw6vWaAss3N/3W17B
 NxfAZvljELMpxv4tzD7garEsf5swgkF+uQilhMH4Nzk7JHAoIiUjKaR+bOOnuasaHF8m
 mguRAcuavHUmzi+QGYaJERWzk1Uc7QjcJ5cMe9/vo9MuDRCt6cuwE4zlQMaekFKP31jN
 NXuxgBxysonOoo6aOiqSbaB5ufiR/A9KSIXEeQNGRilrA9z3w+4m6+t2wbLm95HKrGba
 Es8Q==
X-Gm-Message-State: AOAM531HAzJBnlcqSAwVBcXXAXVYWGl6gcYiv9+aeJhEU1lXFa/Jyoo2
 g8aC8OqK0pz8TQyTtJJ5pBjAqw==
X-Google-Smtp-Source: ABdhPJzUPmxcoTJSn2rIgs2VqgHrZqsLbgULjbEnV6fHU3tEmbUwJIVCDhAclvy/H6IpL17DO8F7Xw==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr27984166wrx.96.1615299455271; 
 Tue, 09 Mar 2021 06:17:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s9sm4462706wmh.31.2021.03.09.06.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:17:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70E421FF90;
 Tue,  9 Mar 2021 14:17:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 4/4] tests/tcg: add HeapInfo checking to semihosting test
Date: Tue,  9 Mar 2021 14:17:27 +0000
Message-Id: <20210309141727.12522-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309141727.12522-1-alex.bennee@linaro.org>
References: <20210309141727.12522-1-alex.bennee@linaro.org>
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


