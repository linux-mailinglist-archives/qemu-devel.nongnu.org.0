Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F3C1A3BCA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 23:17:38 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMeYL-0003jJ-J4
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 17:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jMeWR-00023d-Pq
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 17:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jMeWQ-0005fi-3p
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 17:15:39 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36112)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jMeWP-0005f7-T7
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 17:15:38 -0400
Received: by mail-wr1-x441.google.com with SMTP id k1so13758971wrm.3
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=en3XxeI0kUhj1g+8oDCU8qm2/eo411eCLElDQvibSv4=;
 b=BtY+6NkZh9PztFPJFQVkCw1KsCuP9tB6Y+bYElEu4HoHvspxU6FY3nHsdQI+Q72tmw
 XIvbp0MFW8Ht4+9JAf00flsqFo+E8Tpy3BO/NxrXdU36u1TIUa5tF/GhNI8YYjSnEy6S
 AaHxaXaAUXXW3JfjpVNbxnbjK9trUB0otAVUEqwub1dSTWybW67ybc4W9mNTuyB7IbWq
 XA36fymyQ14hlZlnkw9VDWQTeJkCBXdo6s0v+V6UJN0HCFA7x8nFLsAVBKrz9lcMFzDK
 cSPIvY7TOikXFgnij2FLBXVUvK4vz8XlI4XinRHTTBskKHIaIc6l9qhvpH6DFFd1fKaO
 Oz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=en3XxeI0kUhj1g+8oDCU8qm2/eo411eCLElDQvibSv4=;
 b=RewR8Th6qI0vcgfwtRRcpeG3XoHHixy6d4ABL1h+Yv969ohxcPhHf8d+FsNdUU6vNa
 p2Fn4Ctokls8I/3U8/aTmFyv9ZEU9ObpD5F6c3edltPk8xs2c57nkFFaiAR6SeEvWXQk
 vvXZ9QAKClOvywsFdXmT+2BYK4FHOgntxPWQOr6CIXKm94W9p/mi6TmEHIFYNOBkmHuw
 a7YW2K5BIBGa+CTX6ia4Y8Yw+CMtTusUgshGP7SKVSpaxw7iZ1q/u0Vq+QOEM6OEa97K
 HkwuDbSdVYOW/YWYgZOKDCY6RNkcYOQcjHb2+J3S25RHzvbABAD1qd8SEGbstDKKtu5Q
 nQpg==
X-Gm-Message-State: AGi0PuZJAgbZDWr/xbOuBE2Cqthea+KJ3ZbWGNYtTCkrIbLpjfNXFnwD
 YJ7Udz+1uEUz/Lr+Kh/U8JpCTw==
X-Google-Smtp-Source: APiQypJv4e/QIJNoKFfTKf/JoyzorQCQcXPf2sojqO7HekY6oeLoepihm39qAK3VjqDT7Rn36IRz5w==
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr1152493wrw.101.1586466936785; 
 Thu, 09 Apr 2020 14:15:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v7sm4408633wmg.3.2020.04.09.14.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 14:15:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 656131FF90;
 Thu,  9 Apr 2020 22:15:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/11] linux-user/ppc: Fix padding in mcontext_t for ppc64
Date: Thu,  9 Apr 2020 22:15:22 +0100
Message-Id: <20200409211529.5269-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409211529.5269-1-alex.bennee@linaro.org>
References: <20200409211529.5269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The padding that was added in 95cda4c44ee was added to a union,
and so it had no effect.  This fixes misalignment errors detected
by clang sanitizers for ppc64 and ppc64le.

In addition, only ppc64 allocates space for VSX registers, so do
not save them for ppc32.  The kernel only has references to
CONFIG_SPE in signal_32.c, so do not attempt to save them for ppc64.

Fixes: 95cda4c44ee
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/ppc/signal.c | 69 +++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 40 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index ecd99736b7e..20a02c197cb 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -35,12 +35,26 @@ struct target_mcontext {
     target_ulong mc_gregs[48];
     /* Includes fpscr.  */
     uint64_t mc_fregs[33];
+
 #if defined(TARGET_PPC64)
     /* Pointer to the vector regs */
     target_ulong v_regs;
+    /*
+     * On ppc64, this mcontext structure is naturally *unaligned*,
+     * or rather it is aligned on a 8 bytes boundary but not on
+     * a 16 byte boundary.  This pad fixes it up.  This is why we
+     * cannot use ppc_avr_t, which would force alignment.  This is
+     * also why the vector regs are referenced in the ABI by the
+     * v_regs pointer above so any amount of padding can be added here.
+     */
+    target_ulong pad;
+    /* VSCR and VRSAVE are saved separately.  Also reserve space for VSX. */
+    struct {
+        uint64_t altivec[34 + 16][2];
+    } mc_vregs;
 #else
     target_ulong mc_pad[2];
-#endif
+
     /* We need to handle Altivec and SPE at the same time, which no
        kernel needs to do.  Fortunately, the kernel defines this bit to
        be Altivec-register-large all the time, rather than trying to
@@ -48,32 +62,14 @@ struct target_mcontext {
     union {
         /* SPE vector registers.  One extra for SPEFSCR.  */
         uint32_t spe[33];
-        /* Altivec vector registers.  The packing of VSCR and VRSAVE
-           varies depending on whether we're PPC64 or not: PPC64 splits
-           them apart; PPC32 stuffs them together.
-           We also need to account for the VSX registers on PPC64
-        */
-#if defined(TARGET_PPC64)
-#define QEMU_NVRREG (34 + 16)
-        /* On ppc64, this mcontext structure is naturally *unaligned*,
-         * or rather it is aligned on a 8 bytes boundary but not on
-         * a 16 bytes one. This pad fixes it up. This is also why the
-         * vector regs are referenced by the v_regs pointer above so
-         * any amount of padding can be added here
-         */
-        target_ulong pad;
-#else
-        /* On ppc32, we are already aligned to 16 bytes */
-#define QEMU_NVRREG 33
-#endif
-        /* We cannot use ppc_avr_t here as we do *not* want the implied
-         * 16-bytes alignment that would result from it. This would have
-         * the effect of making the whole struct target_mcontext aligned
-         * which breaks the layout of struct target_ucontext on ppc64.
+        /*
+         * Altivec vector registers.  One extra for VRSAVE.
+         * On ppc32, we are already aligned to 16 bytes.  We could
+         * use ppc_avr_t, but choose to share the same type as ppc64.
          */
-        uint64_t altivec[QEMU_NVRREG][2];
-#undef QEMU_NVRREG
+        uint64_t altivec[33][2];
     } mc_vregs;
+#endif
 };
 
 /* See arch/powerpc/include/asm/sigcontext.h.  */
@@ -278,6 +274,7 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
         __put_user((uint32_t)env->spr[SPR_VRSAVE], vrsave);
     }
 
+#if defined(TARGET_PPC64)
     /* Save VSX second halves */
     if (env->insns_flags2 & PPC2_VSX) {
         uint64_t *vsregs = (uint64_t *)&frame->mc_vregs.altivec[34];
@@ -286,6 +283,7 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
             __put_user(*vsrl, &vsregs[i]);
         }
     }
+#endif
 
     /* Save floating point registers.  */
     if (env->insns_flags & PPC_FLOAT) {
@@ -296,22 +294,18 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
         __put_user((uint64_t) env->fpscr, &frame->mc_fregs[32]);
     }
 
+#if !defined(TARGET_PPC64)
     /* Save SPE registers.  The kernel only saves the high half.  */
     if (env->insns_flags & PPC_SPE) {
-#if defined(TARGET_PPC64)
-        for (i = 0; i < ARRAY_SIZE(env->gpr); i++) {
-            __put_user(env->gpr[i] >> 32, &frame->mc_vregs.spe[i]);
-        }
-#else
         for (i = 0; i < ARRAY_SIZE(env->gprh); i++) {
             __put_user(env->gprh[i], &frame->mc_vregs.spe[i]);
         }
-#endif
         /* Set MSR_SPE in the saved MSR value to indicate that
            frame->mc_vregs contains valid data.  */
         msr |= MSR_SPE;
         __put_user(env->spe_fscr, &frame->mc_vregs.spe[32]);
     }
+#endif
 
     /* Store MSR.  */
     __put_user(msr, &frame->mc_gregs[TARGET_PT_MSR]);
@@ -392,6 +386,7 @@ static void restore_user_regs(CPUPPCState *env,
         __get_user(env->spr[SPR_VRSAVE], vrsave);
     }
 
+#if defined(TARGET_PPC64)
     /* Restore VSX second halves */
     if (env->insns_flags2 & PPC2_VSX) {
         uint64_t *vsregs = (uint64_t *)&frame->mc_vregs.altivec[34];
@@ -400,6 +395,7 @@ static void restore_user_regs(CPUPPCState *env,
             __get_user(*vsrl, &vsregs[i]);
         }
     }
+#endif
 
     /* Restore floating point registers.  */
     if (env->insns_flags & PPC_FLOAT) {
@@ -412,22 +408,15 @@ static void restore_user_regs(CPUPPCState *env,
         env->fpscr = (uint32_t) fpscr;
     }
 
+#if !defined(TARGET_PPC64)
     /* Save SPE registers.  The kernel only saves the high half.  */
     if (env->insns_flags & PPC_SPE) {
-#if defined(TARGET_PPC64)
-        for (i = 0; i < ARRAY_SIZE(env->gpr); i++) {
-            uint32_t hi;
-
-            __get_user(hi, &frame->mc_vregs.spe[i]);
-            env->gpr[i] = ((uint64_t)hi << 32) | ((uint32_t) env->gpr[i]);
-        }
-#else
         for (i = 0; i < ARRAY_SIZE(env->gprh); i++) {
             __get_user(env->gprh[i], &frame->mc_vregs.spe[i]);
         }
-#endif
         __get_user(env->spe_fscr, &frame->mc_vregs.spe[32]);
     }
+#endif
 }
 
 #if !defined(TARGET_PPC64)
-- 
2.20.1


