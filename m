Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794D2F7CCD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:37:39 +0100 (CET)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PII-0004DO-6s
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0P0B-0005I8-0A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:55 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0P08-0002Mh-AT
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id o10so1880365wmc.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kYCjAdFXPUkM10wP/gFX4tRyZKG7p65iiW2L3+wBKM=;
 b=L6cjWEy/oBuTSMfycwHxssPlgw4BzuGAEcN2PHtSWIhUO+pADupPAwa0KX6VyWABqb
 ATl+xSJDIMiquGXrcjvTLMvRnym2P0TAVQJcqA5+Xj0vposetN9dVSvBD0ApW+TzoeBC
 IQQ0gaOCtlKdLMRyY3X6+2o34s0ygQIYTrrZpTDCxHbTYX6ZyCArTJl4PoZeMZQaXw0Z
 8OnjXA+Q5aG0yMUmQhvx9DOvqFCeGURaU9bwLE9MfQ8pc8oWeXurM8EhJjRKAorTAf+3
 Uqz71XSorAj7Tp4HWu5qmw4nIDd57VBsnV7Fdupgy68lG+qsn0/f7cVt4SID3FkXRVIM
 Qb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kYCjAdFXPUkM10wP/gFX4tRyZKG7p65iiW2L3+wBKM=;
 b=K690phszN3d0vyXy9UTfRfNoUc+gXXLo6exgl7LXRTa/8qE+F5TknOUxVIt2ADBYLd
 e4WqSC10RHgbDtOSYglmfLWqKZFJgHf47zidG21eEsWg3RG6uJC71Z6GQ8xDf9IqFvwG
 i4Bv47D1RKZlAyDIkq4WBevUkbtijTrvLvjEqUoczFNTrENaFVPUArGPp35fTMH634Kc
 /UFte0Wzlwb3zN0PhNIfsd8PZbmtxnU4qSXd857fZZvyYrk+7JtgGaF7Y+NYOOv0VOH8
 xMcHcyR+Qg+d2mCXzUpaZ5MKloE8A23a+NfDYcxgi/O7Wvmass7mzpmlYqxoQYOo9ar7
 LPqw==
X-Gm-Message-State: AOAM533VXutyGMoT4GCMWsXxBViUlLWdA3S0DEGaetwXmJU4YOsVmtyW
 BJOuDUMNWPmpf8QYVyciQRWkBQ==
X-Google-Smtp-Source: ABdhPJxqpAIVjFbqs+76xt9nGh3ia578fDrhUDcZA8Pnza856agFMVs/+pUZMYaGfQ8phPKETuPr+g==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr8694324wmc.117.1610716730615; 
 Fri, 15 Jan 2021 05:18:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm15222794wrl.95.2021.01.15.05.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:18:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 339CB1FFB3;
 Fri, 15 Jan 2021 13:08:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 28/30] semihosting: Implement SYS_ELAPSED and SYS_TICKFREQ
Date: Fri, 15 Jan 2021 13:08:26 +0000
Message-Id: <20210115130828.23968-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
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
Cc: Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

These are part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210107170717.2098982-8-keithp@keithp.com>
Message-Id: <20210108224256.2321-19-alex.bennee@linaro.org>

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
diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index 5fcb8663c6..3d6604dcdd 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
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


