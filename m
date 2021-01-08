Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60942EFB75
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:55:02 +0100 (CET)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0er-0000Tr-V0
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cY-0006vF-BV
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:38 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cW-0008In-HD
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so10434336wra.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LkY5m97dX9SF15x7oW2dFPwV0f6ynuCQ5kAKkmn67ro=;
 b=TGT/O+RPCfYhdwC0KPlP/YkB5pQTwoAKS8srOn6UeVPSF48lvTRb265Ai0KktojF5l
 XIyA/lwCgvbSCcQVqFXGi8QeU/4Z23ievb2NWA4m3hbAZf23Kd9Cx6mD5N2/MCpu0rtx
 4aY54s7cGwbzyQ9lYyrNdrScHo3wgMjeJ5OfIfKdUZe/FdQ0YZPHLjeXDeqqDI2xL4DK
 IUGuLHxmqG7wuoZhiIPBo18sx2aJhvCQfjfB+j+cAQ7rnzjbohUqIxqXBPn6ypFrsa+M
 pxkDNa41tQPp+YzKS8eeoyQFY6sROy49kgX8ZrhHLPiHkwF8CgtB0KfkuQ+mes0gKOt+
 NOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkY5m97dX9SF15x7oW2dFPwV0f6ynuCQ5kAKkmn67ro=;
 b=JAwkTz45QRfI41jskylF71H6mUteUfg3MOtI8EK4IEofCJ/Ic+OAl2pSpSj5fiNbw4
 LAKLTiEZxxVmbq+yGCrCrGYGoi3pQWiLIUDjeNcrnpeI2PWXYU5C/mfmt1FQytn3PK7M
 5SYDAMe8YrmwDzO9MNKFPMUi205iX+nOKjtPW968jxAOIzow6lzQl584l9CxBgEFYiPQ
 FNa+FyCqzVttsGh6BVuKyB6AZVsrQ5dsifoRO8HYGFPHZggWyYfsvtzU4IuQtMRtZXYy
 us4v935PfoZz9saGCpBy0FZtH8yw2SNFCyC15OxL0WVPE8ZW7dOID+zDXuSKUROGXSHp
 eBfQ==
X-Gm-Message-State: AOAM531zWKeKOmPVdUupJ2ppoUOK72+tkQCKcw9EgU23Uyl/UtlbXHSg
 OB8UHK2cvOSXBIUCbWWnh+sJyg==
X-Google-Smtp-Source: ABdhPJyoiNbQuESkFnv8vlv+ewChjhEo7rYvvCvdd5bHLi7pz7OaS8Cdwy3q4SVCqgRG8wxbp3JETw==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr5680195wre.408.1610146355111; 
 Fri, 08 Jan 2021 14:52:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j7sm13574125wmb.40.2021.01.08.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:52:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF8CD1FFA5;
 Fri,  8 Jan 2021 22:42:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 18/20] semihosting: Implement SYS_ELAPSED and SYS_TICKFREQ
Date: Fri,  8 Jan 2021 22:42:54 +0000
Message-Id: <20210108224256.2321-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

These are part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210107170717.2098982-8-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/timer.h         |  2 ++
 hw/semihosting/common-semi.c | 16 ++++++++++++++++
 util/qemu-timer-common.c     |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 61296ea980..1678238384 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -808,6 +808,8 @@ static inline int64_t get_clock_realtime(void)
     return tv.tv_sec * 1000000000LL + (tv.tv_usec * 1000);
 }
 
+extern int64_t clock_start;
+
 /* Warning: don't insert tracepoints into these functions, they are
    also used by simpletrace backend and tracepoints would cause
    an infinite recursion! */
diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 5fcb8663c6..3d6604dcdd 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -38,6 +38,7 @@
 #include "hw/semihosting/console.h"
 #include "hw/semihosting/common-semi.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -73,6 +74,8 @@
 #define TARGET_SYS_EXIT        0x18
 #define TARGET_SYS_SYNCCACHE   0x19
 #define TARGET_SYS_EXIT_EXTENDED 0x20
+#define TARGET_SYS_ELAPSED     0x30
+#define TARGET_SYS_TICKFREQ    0x31
 
 /* ADP_Stopped_ApplicationExit is used for exit(0),
  * anything else is implemented as exit(1) */
@@ -837,6 +840,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     uint32_t ret;
     uint32_t len;
     GuestFD *gf;
+    int64_t elapsed;
 
     (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -1246,6 +1250,18 @@ target_ulong do_common_semihosting(CPUState *cs)
         }
         gdb_exit(ret);
         exit(ret);
+    case TARGET_SYS_ELAPSED:
+        elapsed = get_clock() - clock_start;
+        if (sizeof(target_ulong) == 8) {
+            SET_ARG(0, elapsed);
+        } else {
+            SET_ARG(0, (uint32_t) elapsed);
+            SET_ARG(1, (uint32_t) (elapsed >> 32));
+        }
+        return 0;
+    case TARGET_SYS_TICKFREQ:
+        /* qemu always uses nsec */
+        return 1000000000;
     case TARGET_SYS_SYNCCACHE:
         /*
          * Clean the D-cache and invalidate the I-cache for the specified
diff --git a/util/qemu-timer-common.c b/util/qemu-timer-common.c
index baf3317f74..cc1326f726 100644
--- a/util/qemu-timer-common.c
+++ b/util/qemu-timer-common.c
@@ -27,6 +27,8 @@
 /***********************************************************/
 /* real time host monotonic timer */
 
+int64_t clock_start;
+
 #ifdef _WIN32
 
 int64_t clock_freq;
@@ -41,6 +43,7 @@ static void __attribute__((constructor)) init_get_clock(void)
         exit(1);
     }
     clock_freq = freq.QuadPart;
+    clock_start = get_clock();
 }
 
 #else
@@ -55,5 +58,6 @@ static void __attribute__((constructor)) init_get_clock(void)
     if (clock_gettime(CLOCK_MONOTONIC, &ts) == 0) {
         use_rt_clock = 1;
     }
+    clock_start = get_clock();
 }
 #endif
-- 
2.20.1


