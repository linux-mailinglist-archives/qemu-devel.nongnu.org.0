Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8636B347AEF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:41:11 +0100 (CET)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4h4-0001lP-JR
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4X2-0006gK-R2
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wy-0007Sa-6R
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e18so24679172wrt.6
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0CjjwpIsCiA1S6uAh8eizahoCBP1Ilxlznoe0kQyms=;
 b=vOkw/zbLap2x+zA5/zQSlqry+41cNf/WmO62+1zpsjb5uEg3quh91GjMg4hUkwh9I+
 Y0zFb2PzZP3wkp8vJ/AEbuVokmO6QgXN1pwwuERHHxLd36EGd0+v8yN3GuRmjVuddZ6u
 dLKJeYx/oteF1ztyxF5IeYHeiWutJN8JV8uUfKJFiErfWmeGMlkh3jyDnhve0JgAc0p4
 Zc5nt9GVTvlEcWm8wyYAOL18wLKI2FXGaQZaFOxHr5R18X1X7RwEIy13xGGCwpxutqJL
 ZyKDXe7LUtaxqaJqnnGrmyWAV+9iL24dKTpJnrLyTRPY9IWBUvxJTiR7YYSfADfBJKFx
 3iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0CjjwpIsCiA1S6uAh8eizahoCBP1Ilxlznoe0kQyms=;
 b=FUEa0d4xvoZVbAyTOjx0s3VOuxrEwc0MKKtRayi7KtZxWcsP5Z6WaqjmnEgFQFLLUI
 ez+alsd3KLG4bTjbnu7Lcd6RwRYln9AsAWkrK3HuAB9rkUmmBcVku6huX03cszTpT6+L
 FSS5AUb3pF10V4uG4Ad29ilrREp7jH2Q/nDpL9s7opSjRawKqkA+7OIvrJ4Q6mkRLCup
 FV2TT5Tdt+Joj+SxXIaVzNDGQMejw2GA7MVjbuKen5cxte1fEAdgm+9Psd4SYsaLCTDn
 ZX8WFEVJUsJ1PE5NU1okXmWJmKekXZQS1AYtyFLlAoGTopSZ54xNs48zIMzi+297EZyV
 wqUw==
X-Gm-Message-State: AOAM531cZoK74gKAANV0owAnAvRVxf3m37dMhkKT2TEZEi57992iK7Py
 9BX83WZcyfJ0fJVCkENO31wuvw==
X-Google-Smtp-Source: ABdhPJz6Kc9MJ26tDolNB3qypac4bvbw3GJsMladudQdMlM1ZqusPk13Br8aQzBSVOPo0/xHL/ZPGw==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr3716466wru.327.1616596242345; 
 Wed, 24 Mar 2021 07:30:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e6sm3524155wrw.60.2021.03.24.07.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 908671FF98;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/22] tests/tcg: add HeapInfo checking to semihosting test
Date: Wed, 24 Mar 2021 14:30:08 +0000
Message-Id: <20210324143021.8560-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Query the SYS_HEAPINFO semicall and do some basic verification of the
information via libc calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210323165308.15244-10-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
index b3fd16cd12..8627eee3cf 100644
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
@@ -21,8 +25,57 @@ int main(int argc, char *argv[argc])
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
+    }
+
+    /* Error if heap base is above limit */
+    if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
+        printf("heap base %p >= heap_limit %p\n",
+               info.heap_base, info.heap_limit);
+        exit(2);
+    }
+
+    if (info.stack_base == NULL || info.stack_limit) {
+        printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
+        exit(3);
+    }
+
+    /* check our local variables are indeed inside the reported stack */
+    if (ptr_to_info > info.stack_base) {
+        printf("info appears to be above stack: %p > %p\n", ptr_to_info,
+               info.stack_base);
+        exit(4);
+    } else if (ptr_to_info < info.stack_limit) {
+        printf("info appears to be outside stack: %p < %p\n", ptr_to_info,
+               info.stack_limit);
+        exit(5);
+    }
+
+    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
+        printf("info appears to be inside the heap: %p in %p:%p\n",
+               ptr_to_info, info.heap_base, info.heap_limit);
+        exit(6);
+    }
+
+    printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    printf("stack: %p -> %p\n", info.stack_base, info.stack_limit);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Passed HeapInfo checks");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- 
2.20.1


