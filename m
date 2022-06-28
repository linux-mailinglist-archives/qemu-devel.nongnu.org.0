Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18E455BE8A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:56:16 +0200 (CEST)
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64Ct-0006hK-QX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Es-00028p-Io
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:15 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Eq-0008Fs-TZ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso11520430pjk.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hL15phHiFTEeYUryTllbE9QTsXahphlhPjpE5IcwyII=;
 b=ObaKWAu++fvAwBnmA9sCc/E7V3/ILjNLMnBfEWlh+RPBOqz2rLfOpnO7EIs8cb3vta
 vLd0TE9nqaI9rO1hV4jP7M+a10rPe6tVXWDb0PZpjcpyhMklLrIMBvOiZXZXG3qmV6rj
 L96jSlab4MHHZbgh10gAS7MfINWKNTjAjiw3uHLR27TZ9t6qAZ37PGfEBusF1ZpCvNJZ
 ZokBonRn0UqQKA0sw2RtsWdkhkYoC8VgNNvatexjqnOfsbAXIWQXfsS7gveTLPAh3V7x
 4gRRLlFyVd2xCux581nHBmfCQMftsE/7fkStliwzWmJpFUjXzQjg7HRwhTIQYkxKT3MS
 He/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hL15phHiFTEeYUryTllbE9QTsXahphlhPjpE5IcwyII=;
 b=z7gBXdPw2TFXb3Lqm5HSQhfKnjtHvcJ+00BINw8XuvupBatxg0b1aAI0GjklYwfV5G
 iwu2ejrRhTm/qpw2kmdVDd2dPj7WXjrHpA1oMLDu076rbWRH/kNddg2fqwpjIH/Jzud7
 QV906CydW8xe+z+ptGCYOWQfIFuOGpCMzcy/wHpUVetJUB6kV1tnkepUHYhwKtZ4nACV
 Vqn31X9L0j4vplUnDGLxUB+AoNKvbUVISei+MfB8WxhdV3Qp8LXQbbgwtsle7aZCd1/E
 dsiLsMreL+pTSeJtvVEd9tf1aZeBexPtfBb60rRFTRMutvsAho9xUdkzwdYCyMeaPkbi
 b0vQ==
X-Gm-Message-State: AJIora8vsMBk3uCzQJHhKlN+E3xbMf96CY/bfHeZ1ZCXE+PnKron94+w
 8dfocODmSpqR1aYbWP3cyN2yziwaqWHwFw==
X-Google-Smtp-Source: AGRyM1uk/S44p/tLXuoy81uOg71HfjNsrAnSQMT0O82pPMtDXrN82D3tH2NT5AcHXqj3mW7jW1xcXQ==
X-Received: by 2002:a17:902:d4c8:b0:16a:480b:b79c with SMTP id
 o8-20020a170902d4c800b0016a480bb79cmr3065266plg.15.1656392050939; 
 Mon, 27 Jun 2022 21:54:10 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/60] semihosting: Move exec/softmmu-semi.h to
 semihosting/softmmu-uaccess.h
Date: Tue, 28 Jun 2022 10:23:04 +0530
Message-Id: <20220628045403.508716-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

We have a subdirectory for semihosting; move this file out of exec.
Rename to emphasize the contents are a replacement for the functions
in linux-user/bsd-user uaccess.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../{exec/softmmu-semi.h => semihosting/softmmu-uaccess.h}  | 6 +++---
 semihosting/arm-compat-semi.c                               | 2 +-
 target/m68k/m68k-semi.c                                     | 2 +-
 target/mips/tcg/sysemu/mips-semi.c                          | 2 +-
 target/nios2/nios2-semi.c                                   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename include/{exec/softmmu-semi.h => semihosting/softmmu-uaccess.h} (95%)

diff --git a/include/exec/softmmu-semi.h b/include/semihosting/softmmu-uaccess.h
similarity index 95%
rename from include/exec/softmmu-semi.h
rename to include/semihosting/softmmu-uaccess.h
index fbcae88f4b..e69e3c8548 100644
--- a/include/exec/softmmu-semi.h
+++ b/include/semihosting/softmmu-uaccess.h
@@ -7,8 +7,8 @@
  * This code is licensed under the GPL
  */
 
-#ifndef SOFTMMU_SEMI_H
-#define SOFTMMU_SEMI_H
+#ifndef SEMIHOSTING_SOFTMMU_UACCESS_H
+#define SEMIHOSTING_SOFTMMU_UACCESS_H
 
 #include "cpu.h"
 
@@ -98,4 +98,4 @@ static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
 }
 #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
 
-#endif
+#endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index b6ddaf863a..1033e751ef 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -370,7 +370,7 @@ static GuestFD *get_guestfd(int guestfd)
 #ifndef CONFIG_USER_ONLY
 static target_ulong syscall_err;
 
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #endif
 
 static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 37343d47e2..a31db38fc3 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -25,7 +25,7 @@
 #include "qemu.h"
 #define SEMIHOSTING_HEAP_SIZE (128 * 1024 * 1024)
 #else
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
 #endif
 #include "qemu/log.h"
diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index b4a383ae90..6d6296e709 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index ec88474a73..373e6b9436 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -28,7 +28,7 @@
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #else
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #endif
 #include "qemu/log.h"
 
-- 
2.34.1


