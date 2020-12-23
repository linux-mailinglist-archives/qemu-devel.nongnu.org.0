Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D42E18E0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:24:50 +0100 (CET)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxZp-000320-1n
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEL-0008Sb-5Z
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:37 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE8-0000Nv-2k
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:36 -0500
Received: by mail-pl1-x62e.google.com with SMTP id be12so8604907plb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V4vB0rW5AGYTUzpH9bZPj6pKd188ROq1dP7ocy5w9zA=;
 b=GE+Gwgyj6oY0a61WS22zqwLII2E100SUH248bc2UY910kYxqqkC0kHVmbu++okZfSu
 WYSieScYT58mWCKbbJGiCoWIHE5EYzkxvwYqfn8R9GqVVPdnm8PPV1TDDK7gT78Z8o1y
 bQ0j/FTTWyX+Qn363sSKstlEqogiM3O32epFpiJQrj2+uoxRKtouPvjVIcDlrfxMVdj7
 KKNldjyPkNI4dRrgMXKHHoedbik/wYRpO80b7uzu4ZWzSaFet7x8vAi4WaIiZPoEJLoo
 8aQ/1CqRQDoAj5/dNwimTWDph0PRRcPC2cKpCcvbBeSpPn/wCyLa8EOSFmqFyRTaaEOi
 1DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4vB0rW5AGYTUzpH9bZPj6pKd188ROq1dP7ocy5w9zA=;
 b=q+lwRThBk8EpttuJtNpWUh4nLVNJtJ0kWuOQP0I5DKm0qmbJPig4Y2Qv9ptVvypoyT
 LB0uN9c1E20+lpxTnFZtt4PUF8G8fsqHVSORMs9oG6Mr3kYDSGAdI+PUdeqCDCqy8QXv
 1qOWmto7w3x/qoWNYlp4Tk5X5FN3YFC4R/s6o7Qelvv2g6HJCEHOmuxm3MAarnGsHdcB
 9JB6Cb5YbqKI11A2MdfSsjBYgwdWXF7aytXSb3hU8OtAutyoFwCEyezOyd/VmZHu0qW+
 iVQa7kpR06tZrKit3NNiQu/HAFf4vnnAVNvXadvonbkWRzaaqATH1zTWMaIN9SOy39yk
 uF8A==
X-Gm-Message-State: AOAM532+oeJB9Bv++Dgc2oEmJYTuo8ItzCj8rXn2xOHvU7AHx7IsYV2c
 L8xVs7+ny5qWeLLYvYzU76uMQPle2QvA6w==
X-Google-Smtp-Source: ABdhPJyAMk2vNGozQ27HnaPF9SIhV5vwxlHSYOnAbQxHnfQFWkLFOQXo5s3ITxrScU/Of5pdK+Ul8Q==
X-Received: by 2002:a17:90a:67ce:: with SMTP id
 g14mr25600413pjm.33.1608703340644; 
 Tue, 22 Dec 2020 22:02:20 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/22] tcg: Remove TCG_TARGET_CONSTR_H
Date: Tue, 22 Dec 2020 22:01:54 -0800
Message-Id: <20201223060204.576856-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

All backends have now been converted to tcg-target-constr.h,
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
 tcg/tcg.c                | 16 ----------------
 10 files changed, 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index ca7af5a589..663dd0b95e 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -159,6 +159,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSTR_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 6f058d6d9b..17e771374d 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -146,6 +146,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7c405e166d..abd4ac7fc0 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,6 +235,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index f4a79bcad1..c6b091d849 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -217,6 +217,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
-#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 78d3470f3c..be10363956 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,6 +185,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index ff8ff43a46..032439d806 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -175,6 +175,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 3aff3cc572..63c8797bd3 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -162,6 +162,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index bfee6191b3..633841ebf2 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -179,6 +179,5 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index cd3dee51bb..8c1c1d265d 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -210,6 +210,4 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
     /* no need to flush icache explicitly */
 }
 
-#define TCG_TARGET_CONSTR_H
-
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f5b53d739e..2bde926315 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -102,10 +102,6 @@ static void tcg_register_jit_int(void *buf, size_t size,
     __attribute__((unused));
 
 /* Forward declarations for functions declared and used in tcg-target.c.inc. */
-#ifndef TCG_TARGET_CONSTR_H
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type);
-#endif
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
@@ -2288,7 +2284,6 @@ static void process_op_defs(TCGContext *s)
                     ct_str++;
                     break;
 
-#ifdef TCG_TARGET_CONSTR_H
                 /* Include all of the target-specific constraints. */
 
 #undef CONST
@@ -2304,17 +2299,6 @@ static void process_op_defs(TCGContext *s)
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


