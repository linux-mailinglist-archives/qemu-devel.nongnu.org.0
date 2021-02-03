Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54FB30D17A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:27:02 +0100 (CET)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77sj-0003Nm-Tq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iS-0007rL-K6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:24 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iL-000139-2T
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:24 -0500
Received: by mail-pf1-x42c.google.com with SMTP id t29so15648929pfg.11
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2Oa3ZEH5uoUGxC8/0DNuxe42IEbkJmpNsi7nZchOrE=;
 b=kILcXuRjuak26iqgPiC0O0DV9iTx9EO052ipqGvhj0CHhptheWIeZ0/T3n+EbFABNb
 1cu7wsrLerA6GZuWbRiAC9EKjsHCxheCXRnTRXw/7hrnsdETutlpXOMfPPFwzcn77ill
 RzuVXhGPGknK00YIuLtvqLQndCZ6Zu5KDQHC95hFTsPLUeO4klAHNePh7C4GgSicJNCR
 mXEmUHEiRHjlJGEI5L9M4eyiw9lvtFh2E1qQxnVbiQ7GcHTVxju1PwkWETqQ8+tFzMH0
 WpnDs3S18i+D407EU/5nqiVQbhab9wXOa3x359YTTLFuYXwKMekQnUSvU457dygs0Umu
 uFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2Oa3ZEH5uoUGxC8/0DNuxe42IEbkJmpNsi7nZchOrE=;
 b=DQNK6Z/GSEdL2nOi+J0e5u7ZpH6SR7SeaRObz7bJbNqeGFk8BwujC2TtoRKrzU9orR
 bsnBnT+F1IeWNZyn3XSkclmsj/ggTDonIdoV3p675iEs6F3wO0aoZEIQ+GiGlud+GUuC
 EVAUcJxbP4FamOC89UL7ihwv2rrZL4WExdmGGgPikVL4W5sUak3Fh6uwzBjy7SfsLEwH
 OAM4AYxoW5vturhhZQ2vpkVVS3RfXXzPb3dfmlqzoQUvb4O0pnvOItN6yTvtNnW2leUd
 hWDcswdUna0ZwHjIL9m+V4DcbupG//HcReYnxGobQxGpc0GnjHwCt3XAIQlc6j7KT1R+
 06+A==
X-Gm-Message-State: AOAM532fBMSmDruXaoQrCS9gYEGGZFduhd2erVBvklNibnGQunP+lSg/
 UiVgL8WJT9j/8t68dSDJTM44GNznvrxPXRsO
X-Google-Smtp-Source: ABdhPJxOp41JgCOjacrB2KNX+7L04fuYEiA/c+vCEb+864ry4I/u8ScETlpQ4cfJzsqKejfl1JmsYA==
X-Received: by 2002:a62:8f96:0:b029:1b7:75a9:a8b7 with SMTP id
 n144-20020a628f960000b02901b775a9a8b7mr957979pfd.28.1612318575272; 
 Tue, 02 Feb 2021 18:16:15 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] tcg: Remove TCG_TARGET_CON_STR_H
Date: Tue,  2 Feb 2021 16:15:40 -1000
Message-Id: <20210203021550.375058-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>
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


