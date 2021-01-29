Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A3308E5D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:26:23 +0100 (CET)
Received: from localhost ([::1]:51658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aLW-0007hV-UB
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6b-0006at-QY
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:57 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6Z-00087e-MI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:57 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s15so5884689plr.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2Oa3ZEH5uoUGxC8/0DNuxe42IEbkJmpNsi7nZchOrE=;
 b=eHGJoA5RBXxhpS4Fhh6ZZv5vijSCYeU29U6XUaqZ5g7GmIHSznue3LAbOkAk7ygQ3v
 pEBPZls0Ejm5995NzAxAT6C4FhiLZJRq5OOdc0sP+JShM2nEtYax4vb6eLNjJt9NwReX
 JJlF9c4SPCwCtMc4cxXbtFiRsRVSz5pO3TmD2MD1GfA2+Wd0dth1rEGBO0saoWd72Rt3
 c9WWxjD1BZfhJlTick+0dKHSIuP2uTHSsMjdledbhdHiF6Z70rsgQrh2pYmBHMMK1egZ
 M5HNbIUSMmrEoAO9wuKVdZLPUxMhPmT8fHtqC4+XjwwubOiDw/LXSL8B0NthRiI1d8k+
 3I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2Oa3ZEH5uoUGxC8/0DNuxe42IEbkJmpNsi7nZchOrE=;
 b=uI1P3ltQP5mi7ujCBZ4Px5qdIqcj2iI0k/eb/tWNINKr+C9dFV+ntg1Zx7h7qJ3u8K
 naguwrxCcmOStZUS+FDFWwAZ2RQ+9Y4FQMiNMjWdzIhhFeKgaNriCTcRrnstDPR/NFae
 NY2Ih9lXcEv68w3HUHjWNiZ03P9NQWUZJDAMWebVHUP+uOd37iCCcXCKRZNLYcx3yqZh
 BU8gUpLMrUYmFoAPVf3v0wcLD4ZoNtnrYat5xUSWSKyWUCF5U2fE5aISMtg0K6z+c4li
 sfJ4aZEq9x3X50dTvk03PsKhGdAPXDZBGwydZiSCiXMDUhU0Zx9g+gJHKjdQIJGswNi9
 Pgyw==
X-Gm-Message-State: AOAM530XI2Ayb4qfwTZ+jwF3VBG39s5dCOfwFUw5IkvoaSChTlpLU1/D
 yFrBoeRXrHl/h4KiPwZGWzdeRaAuZeX/YU6J
X-Google-Smtp-Source: ABdhPJyzDF70Q762Jm/e7r7yAQNWWxNoulWHRase4lmIGS8ur3ff37SNMu0mkt/ZZt28VryRUlgHHA==
X-Received: by 2002:a17:90b:180d:: with SMTP id
 lw13mr6040907pjb.94.1611951054512; 
 Fri, 29 Jan 2021 12:10:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/24] tcg: Remove TCG_TARGET_CON_STR_H
Date: Fri, 29 Jan 2021 10:10:18 -1000
Message-Id: <20210129201028.787853-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All backends have now been converted to tcg-target-con-str.h,
so we can remove the fallback code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
 tcg/tcg.c                | 16 ----------------
 10 files changed, 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 4fc20b58ec..5ec30dba25 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,6 +155,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_STR_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 16336cd545..8d1fee6327 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -142,6 +142,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 77693e13ea..b693d3692d 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,6 +235,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index d850200855..c2c32fb38f 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -207,6 +207,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
-#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 40ed4b82dd..d1339afc66 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,6 +185,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index daf3ef7b5c..727c8df418 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,6 +171,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index c43d6aba84..641464eea4 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,6 +159,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 5185b00524..f66f5d07dc 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -168,6 +168,5 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index ab832aecc3..bb784e018e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -207,6 +207,4 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     /* no need to flush icache explicitly */
 }
 
-#define TCG_TARGET_CON_STR_H
-
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8cfa28ed84..39bcdff8dc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -103,10 +103,6 @@ static void tcg_register_jit_int(const void *buf, size_t size,
     __attribute__((unused));
 
 /* Forward declarations for functions declared and used in tcg-target.c.inc. */
-#ifndef TCG_TARGET_CON_STR_H
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type);
-#endif
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
@@ -2464,7 +2460,6 @@ static void process_op_defs(TCGContext *s)
                     ct_str++;
                     break;
 
-#ifdef TCG_TARGET_CON_STR_H
                 /* Include all of the target-specific constraints. */
 
 #undef CONST
@@ -2480,17 +2475,6 @@ static void process_op_defs(TCGContext *s)
                 default:
                     /* Typo in TCGTargetOpDef constraint. */
                     g_assert_not_reached();
-#else
-                default:
-                    {
-                        TCGType type = (def->flags & TCG_OPF_64BIT
-                                        ? TCG_TYPE_I64 : TCG_TYPE_I32);
-                        ct_str = target_parse_constraint(&def->args_ct[i],
-                                                         ct_str, type);
-                        /* Typo in TCGTargetOpDef constraint. */
-                        tcg_debug_assert(ct_str != NULL);
-                    }
-#endif
                 }
             }
         }
-- 
2.25.1


