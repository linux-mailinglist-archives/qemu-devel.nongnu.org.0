Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB002E18F2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:31:06 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxfs-0001hf-Po
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxER-0008Vg-Gh
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:44 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEJ-0000Ra-U4
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:43 -0500
Received: by mail-pl1-x634.google.com with SMTP id v3so8579979plz.13
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nk60H3yRhOTIra88/cLIs2xseWbxfALm0i3pKXgYJOM=;
 b=CJ1TSbySDLhtl/YbmGtWQfFNI9ZnElrA0jkVVcP1qZ9CDt6rrXkkB4CtWYDh8jI4b2
 JSbzQnGMZMgK3PxOLxzmC04Ywzo5z7/Td+y85iFUGcgNlhebGN0GyLis5hc4VXbWYwho
 J3uR2/OXtBLNGsmp3lHvUMP4z//5lH1cg+3hxk0c46/ogBDW0H3cSc7Qw8HUg7Jt1HfK
 42pOOq87CyvZQ0+EKJ8Nuwek+D3PHiYGxwvUQMJU1YeyttLLw2lML10lFIfyUlracgLX
 CjNJJjCETimU7BB3wnL9SSIofM33Aqm9XLPlbFd9dWPgVCd7wB+SaEWKY7DCtmG8XoKx
 UqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nk60H3yRhOTIra88/cLIs2xseWbxfALm0i3pKXgYJOM=;
 b=YJdsiPtATwcy9UY1jii4PgphoU3PyacRIKdgnI7NzXdNRGaRzbxMKZ3JHDO/PW/ea6
 KFn56gp2W/fIGZjPmpRxMuOT3r56qFgzt4zpL2XkzmfJk9pfv8Wq4xWzYN23pNuvIP72
 L8Srp1qm4eJz5Lp9Hl8i1mj7+m0qbIPlMThMVCt72P8hNp2P6w9NofEVbmtPkOxM5KnD
 yChU3dxr9Kx6uHGkFbqMT0dfAg2jHJjXsEF3BBnYTtoJy1DUCvVM52MTd0wz/CmLTfRx
 Xgnb+Zrwn02uyCwUIqxkM3QErNuR11dCnlRkEGOCyDwYB7YfA8UT/G11OLLfIZLRx4Ze
 kA/A==
X-Gm-Message-State: AOAM5314/RnjVgZ3lXKQWX1nEMefgaxh/c+fQDRnB1Ft/m3NUwpb/vH8
 jZReb/tK+g4QUMg0UqYp/QYRT1b3In2mug==
X-Google-Smtp-Source: ABdhPJzk8m1ussJ2yCNVl5DAVV0C2AfGUhfDfUF4aJfB2vM4jX6NzJnWbwU8Hhjuevb4VIMy0KfZPg==
X-Received: by 2002:a17:90b:4d0e:: with SMTP id
 mw14mr25494265pjb.92.1608703352954; 
 Tue, 22 Dec 2020 22:02:32 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/22] tcg: Remove TCG_TARGET_CONSET_H
Date: Tue, 22 Dec 2020 22:02:04 -0800
Message-Id: <20201223060204.576856-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All backends have now been converted to tcg-target-conset.h,
so we can remove the fallback code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h |  1 -
 tcg/arm/tcg-target.h     |  1 -
 tcg/i386/tcg-target.h    |  1 -
 tcg/mips/tcg-target.h    |  1 -
 tcg/ppc/tcg-target.h     |  1 -
 tcg/riscv/tcg-target.h   |  1 -
 tcg/s390/tcg-target.h    |  1 -
 tcg/sparc/tcg-target.h   |  1 -
 tcg/tci/tcg-target.h     |  2 --
 tcg/tcg.c                | 13 -------------
 10 files changed, 23 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index a81f6dadf9..663dd0b95e 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -159,6 +159,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSET_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 918f09239a..17e771374d 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -146,6 +146,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 74a2566900..abd4ac7fc0 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,6 +235,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 688d691cda..c6b091d849 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -217,6 +217,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
-#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index c958faffb7..be10363956 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,6 +185,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index a357962e01..032439d806 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -175,6 +175,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 78277a8d07..63c8797bd3 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -162,6 +162,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 1304c225b1..633841ebf2 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -179,6 +179,5 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 42b84a0e87..8c1c1d265d 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -210,6 +210,4 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
     /* no need to flush icache explicitly */
 }
 
-#define TCG_TARGET_CONSET_H
-
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c58d728ca5..dd5b045d88 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -68,11 +68,7 @@
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
 static void tcg_target_init(TCGContext *s);
-#ifdef TCG_TARGET_CONSET_H
 static int tcg_target_op_def(TCGOpcode);
-#else
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode);
-#endif
 static void tcg_target_qemu_prologue(TCGContext *s);
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend);
@@ -344,7 +340,6 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
-#ifdef TCG_TARGET_CONSET_H
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
@@ -457,8 +452,6 @@ static const TCGTargetOpDef constraint_sets[] = {
 #define C_O2_I4(O1, O2, I1, I2, I3, I4) \
     C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4)
 
-#endif /* TCG_TARGET_CONSET_H */
-
 #include "tcg-target.c.inc"
 
 /* compare a pointer @ptr and a tb_tc @s */
@@ -2367,16 +2360,10 @@ static void process_op_defs(TCGContext *s)
             continue;
         }
 
-#ifdef TCG_TARGET_CONSET_H
         i = tcg_target_op_def(op);
         /* Missing TCGTargetOpDef entry. */
         tcg_debug_assert(i >= 0 && i < ARRAY_SIZE(constraint_sets));
         tdefs = &constraint_sets[i];
-#else
-        tdefs = tcg_target_op_def(op);
-        /* Missing TCGTargetOpDef entry. */
-        tcg_debug_assert(tdefs != NULL);
-#endif
 
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
-- 
2.25.1


