Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED0F338A27
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:31:38 +0100 (CET)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKf4z-0007vm-Ch
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuX-0000Dx-5l
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:20:49 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuP-0005Ht-6j
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:20:48 -0500
Received: by mail-ej1-x634.google.com with SMTP id jt13so52389824ejb.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04vjAEipaNiQpWFMv2ryUkypG9qXG22abGmmoD11u5Y=;
 b=g+sEHs6JvOdFqzo7teYpgdz5WRwfwTRfG3JTSDqNBCZKP3a+UaYpyEj/LeHRSOKJzO
 5eckSvsG4UpP8KcXfc7cn/xDBNmrJuXFMUKgjNpX9aTmRKHEpH1BsbssGn+3tt7W2UVv
 8ifL4VWXpdCrycMZjH1Xa49nRaKmMJ+FtDD+gGVXr4A2/nQCt7NwL4cp60YF4ULDjBqY
 d3GBpPtPhrhG7O5UrasALB65BwsNuVQh/O4Amx2LCAaHqrW1QKjA/QWtjapxeo7KR9I5
 DAD6Dail61G+3mBnfIO1841aiM+9D4LSi6oVQtbfB6u/YUhIPGasSPd1Uz7L05eWc08T
 /EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04vjAEipaNiQpWFMv2ryUkypG9qXG22abGmmoD11u5Y=;
 b=rqcqGkmuU4B4PTSCCcoiLG7YH8BcYB72s+nnqIfrGHDLMkdaxJHeQ2TTa0wwqdPQar
 Zvimh2mwgYwAfcoZNijJZFuyXYFv6f5F39nvvnuBdQrGenjh6zLi+LRZ6aYCQbgPPc2S
 wzH8y86EY72VPI/MTVBlQpNcKYe8n8gIehHweRtIabfTRKyZytSgZu7wXlmzT4yTvl6F
 dpiHgEGuBAgneOiC7yeVN5pBQpn2tjMEEVBSOr8Srfq2uiE0U8YEih+bsQYMcCwGcRt7
 IoI/9JPDlOWFMjsltDIk0oed8+hvioiC35UFQsENs0Qj8O4A8/FtcHSJFNfHB7gjVE3d
 fwlg==
X-Gm-Message-State: AOAM5315oz9J0BSP514GXCvJR/ZfOUeog2y1/t6uCMMzqbBiJr69G4MO
 KCfDF0zQUYbPrJYqmF4sNrckxg==
X-Google-Smtp-Source: ABdhPJzfiQeHdh9e/L+zDVNXLvro2BAZ2mNp32CC2R6iNeUFt0/LNiocd2wjbRh6cH5GbUXDAgZLjQ==
X-Received: by 2002:a17:906:5498:: with SMTP id
 r24mr7889675ejo.29.1615544438130; 
 Fri, 12 Mar 2021 02:20:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d6sm2530500eje.20.2021.03.12.02.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:20:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28A9B1FF91;
 Fri, 12 Mar 2021 10:20:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v5 5/5] tests/tcg: add HeapInfo checking to semihosting test
Date: Fri, 12 Mar 2021 10:20:29 +0000
Message-Id: <20210312102029.17017-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312102029.17017-1-alex.bennee@linaro.org>
References: <20210312102029.17017-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, keithp@keithp.com,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Query the SYS_HEAPINFO semicall and do some basic verification of the
information via libc calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - drop asnprintf, just mix printf output
  - don't use brk() but do sanity check
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


