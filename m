Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B870235997D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:41:33 +0200 (CEST)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnds-0003xE-Pt
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZH-00080B-24
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:47 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZE-0002kK-Tg
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id w3so7634871ejc.4
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T+4ADdhkVIxyjAgrjisa3QyFRFD4Jv4USEQdTNaJS5Q=;
 b=W2X8XMNDESoAQWNNcDFUt1MgIH/TxfqP1Y6eOfjXtlWD5oUCyJnPgrMiHTkmKLX0lg
 rXRG47oWaTn4bu7Y9sActP/lBS2cXAgpzHNUK+IWj41P7xf10pQ3Keodoqfmc9MKj1M9
 RUpRtdOpTQvJCzTl0Xh67/CVS74TOv5Y540nq7gqUP9L1lKuyhFQPp7vuvqj0C17a3Gq
 +7ESkvw/ijmSzMwMKRSZHon8gwKat9UOBAV1HiiyT7NQn9yVo0u4cxybCoM2iY41xi9E
 aLEWdRuDCg8SOGgTMJ10H5kXwkpQ1SeglcOoVLxrGnirgX/yWsBgtkxB7/hBIPR37CLP
 F+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T+4ADdhkVIxyjAgrjisa3QyFRFD4Jv4USEQdTNaJS5Q=;
 b=VuOE9AW/zUm5ylQ+WSDjPOL32aZIYdhdB2vOy2e2Ft5TZqStHQPSz74YuYJXd12b6h
 88jMsHn1UV/75P0PmcNNzGY6IHDbGNxcxGJwBpDJhc0VKJvCmDMLi1V2ifFHwlO3EjEv
 i4lcn97DtWNgSmqFfB07wPT1BTRfouRmNk5F7ZaQivbGhxLqWDAvUungY+czrGLOI4CZ
 uyGRTlKpvYov9kIXcqHRCZKJfjHyUfZ+kBnqxYSMuLpdWdCYfRHcUlH9Iuk6EG6z9C3u
 HI0rpVnhekQZ0lSy5RA6OAsYqVcnMILHbi5CilvMVMFZ1h6wCDU5MlBWb/A14T51X0RD
 n3wA==
X-Gm-Message-State: AOAM53042giqypnWQlnlKvCfglJsyn3nKqpyhSNtQO2HagPJDT+oy2Kd
 zh7c+/+sY2Nd/HqXIbEmKXoT7C55VlUhRg==
X-Google-Smtp-Source: ABdhPJwLF+rmA11f92HSpvmo0LOqtUCTjFF7xwH1c8BFH65iCN2HyyHYlYfeizKX9yn5QHQBqJ5FEA==
X-Received: by 2002:a17:906:49c1:: with SMTP id
 w1mr15582105ejv.178.1617961001554; 
 Fri, 09 Apr 2021 02:36:41 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id bh14sm940837ejb.104.2021.04.09.02.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:36:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 v2 3/6] target/mips/cp0_timer: Add ns_to_count()
 helper
Date: Fri,  9 Apr 2021 11:36:20 +0200
Message-Id: <20210409093623.2402750-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409093623.2402750-1-f4bug@amsat.org>
References: <20210409093623.2402750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor ns_to_count() out to simplify a bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cp0_timer.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/mips/cp0_timer.c b/target/mips/cp0_timer.c
index 70de95d338f..73355b44b15 100644
--- a/target/mips/cp0_timer.c
+++ b/target/mips/cp0_timer.c
@@ -27,6 +27,11 @@
 #include "sysemu/kvm.h"
 #include "internal.h"
 
+static uint32_t ns_to_count(CPUMIPSState *env, uint64_t ns)
+{
+    return ns / env->cp0_count_ns;
+}
+
 /* MIPS R4K timer */
 static void cpu_mips_timer_update(CPUMIPSState *env)
 {
@@ -34,8 +39,7 @@ static void cpu_mips_timer_update(CPUMIPSState *env)
     uint32_t wait;
 
     now_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    wait = env->CP0_Compare - env->CP0_Count -
-           (uint32_t)(now_ns / env->cp0_count_ns);
+    wait = env->CP0_Compare - env->CP0_Count - ns_to_count(env, now_ns);
     next_ns = now_ns + (uint64_t)wait * env->cp0_count_ns;
     timer_mod(env->timer, next_ns);
 }
@@ -64,7 +68,7 @@ uint32_t cpu_mips_get_count(CPUMIPSState *env)
             cpu_mips_timer_expire(env);
         }
 
-        return env->CP0_Count + (uint32_t)(now_ns / env->cp0_count_ns);
+        return env->CP0_Count + ns_to_count(env, now_ns);
     }
 }
 
@@ -79,9 +83,8 @@ void cpu_mips_store_count(CPUMIPSState *env, uint32_t count)
         env->CP0_Count = count;
     } else {
         /* Store new count register */
-        env->CP0_Count = count -
-               (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-                          env->cp0_count_ns);
+        env->CP0_Count = count - ns_to_count(env,
+                                             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         /* Update timer timer */
         cpu_mips_timer_update(env);
     }
@@ -107,8 +110,7 @@ void cpu_mips_start_count(CPUMIPSState *env)
 void cpu_mips_stop_count(CPUMIPSState *env)
 {
     /* Store the current value */
-    env->CP0_Count += (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-                                 env->cp0_count_ns);
+    env->CP0_Count += ns_to_count(env, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
 }
 
 static void mips_timer_cb(void *opaque)
-- 
2.26.3


