Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9A127B9F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 14:25:00 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIH5-00018x-BO
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 08:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iiIF2-0007Rv-TB
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:22:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iiIF1-0005P3-1d
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:22:52 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iiIF0-0005Jc-Iy
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:22:50 -0500
Received: by mail-wm1-x342.google.com with SMTP id u2so9218093wmc.3
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 05:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovdoYf7CDyOfpwifeooI731QUTwDX4W14EjWn1WUyGo=;
 b=nUE6pb+O2XFAC6oAOxFwExUDYou7LIo786nSmjUlddRcNzddNEYeFFxianF5IawxwU
 9IuUsKaA5o9JPQ64aTV0rR6Ldko71fXr7D/+Wq26rgG9JxhJr6hFScLjRqxPWYJjHavX
 YlEZkWkK4MGwfroFzlBD/XXxYt85CeZ5/UhSm1JUJthnFDPoosS0drSS72CaOs/tCndz
 vkUb14CtQ57a+YljskAKWVmgn+6QiNzUSFy1/Gzjk3/KRohoxb7YNrrgvcUa2ZDXWCqR
 jlqb0HKyBBBoZOC+Km6IIHViLDgHRV1HVY7tzLgnZLgdJGlmoejgt6diU/S/4+PBK/7U
 OL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovdoYf7CDyOfpwifeooI731QUTwDX4W14EjWn1WUyGo=;
 b=dWpE28FmJKjI72xWjMaVmMwjhq6Ev/ecTzkKS+fiYayOAGQX8y7yderqLG4WymVjee
 BNwAuNy1AlkN2Rx5pzsVkcRE1dxPdhujdfyw7WchPb5cTJVhsFHXtqkcKX2lcxT2AFd/
 60uv7hdHHMuqlAyub1Wi1sUbqILy35kBns9aCopMEESyztzfbW8GaMHSETn3seVH/Z24
 Ukc/NU0e3gDvXErGzflzh0cowe+GHD9h2pulmYunNycXrwnKAL4qTXouVzEGiX0iYIkF
 CwI3m7LLEr3kAYDuSsXlQg9BUFXavFrkzzm20xaaMSo2Y9+MWR542FxcD1oBqKC0n0Ro
 ccDQ==
X-Gm-Message-State: APjAAAVNFRJl6XPhhen7N0W9usqJ9FRaI+fPfn7aZFPhuFZDZ3zGtGPh
 B5q6GL1B/WOyGOsybO2+FXGebQ==
X-Google-Smtp-Source: APXvYqzgEsLHk7u7rRHF4JlGBj4Qdgiz96dtsKDRxiOtOOz/g6qS2KIFeSl6ZXvWBwXYQ+bJ4Caj7A==
X-Received: by 2002:a05:600c:1:: with SMTP id
 g1mr15717810wmc.131.1576848168910; 
 Fri, 20 Dec 2019 05:22:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i11sm9852109wrs.10.2019.12.20.05.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 05:22:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C85C41FF8F;
 Fri, 20 Dec 2019 13:22:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] target/arm: only update pc after semihosting completes
Date: Fri, 20 Dec 2019 13:22:43 +0000
Message-Id: <20191220132246.6759-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220132246.6759-1-alex.bennee@linaro.org>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before we introduce blocking semihosting calls we need to ensure we
can restart the system on semi hosting exception. To be able to do
this the EXCP_SEMIHOST operation should be idempotent until it finally
completes. Practically this means ensureing we only update the pc
after the semihosting call has completed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>
Tested-by: Keith Packard <keithp@keithp.com>
---
 linux-user/aarch64/cpu_loop.c | 1 +
 linux-user/arm/cpu_loop.c     | 1 +
 target/arm/helper.c           | 2 ++
 target/arm/m_helper.c         | 1 +
 target/arm/translate-a64.c    | 2 +-
 target/arm/translate.c        | 6 +++---
 6 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 31c845a70d4..bbe9fefca81 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -130,6 +130,7 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_SEMIHOST:
             env->xregs[0] = do_arm_semihosting(env);
+            env->pc += 4;
             break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 7be40717518..1fae90c6dfc 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -377,6 +377,7 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_SEMIHOST:
             env->regs[0] = do_arm_semihosting(env);
+            env->regs[15] += env->thumb ? 2 : 4;
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b4dc2274c8b..088e2693df8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8602,11 +8602,13 @@ static void handle_semihosting(CPUState *cs)
                       "...handling as semihosting call 0x%" PRIx64 "\n",
                       env->xregs[0]);
         env->xregs[0] = do_arm_semihosting(env);
+        env->pc += 4;
     } else {
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
         env->regs[0] = do_arm_semihosting(env);
+        env->regs[15] += env->thumb ? 2 : 4;
     }
 }
 #endif
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 76de317e6af..33d414a684b 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2185,6 +2185,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
         env->regs[0] = do_arm_semihosting(env);
+        env->regs[15] += env->thumb ? 2 : 4;
         return;
     case EXCP_BKPT:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG, false);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe6295..972c28c3c95 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1937,7 +1937,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
 #endif
-            gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         } else {
             unsupported_encoding(s, insn);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2b6c1f91bf9..5185e08641b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1124,7 +1124,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         return;
     }
 
@@ -8457,7 +8457,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
         !IS_USER(s) &&
 #endif
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -10266,7 +10266,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         !IS_USER(s) &&
 #endif
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
         gen_set_pc_im(s, s->base.pc_next);
         s->svc_imm = a->imm;
-- 
2.20.1


