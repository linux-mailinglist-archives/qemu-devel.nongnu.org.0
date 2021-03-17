Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03533F551
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:19:24 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYtH-0005dJ-DZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCr-0005Nh-IR
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:33 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:33297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCk-0007K4-Ch
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:33 -0400
Received: by mail-oi1-x22a.google.com with SMTP id d16so32888061oic.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMGXmrjjBijTVozb/SNcJosQWc4OplVY9EwbvL5eB0U=;
 b=bkKIBKuUedhLcTT96Th/DToy5Jm/Zd1d6i6ooOGgRajkXLoZyEacwMLWR6Xlt8Jmc5
 n6DC7Td/4wwqELayE9CAI6d80aXfSz+lleiFjYS7YbrztBTWVU29aMCYxvWNhyNaueGh
 fbsn3VfNIP5AiHUpWIEQpLlKkKWMr0Naq7ByBMScsvyJvLOVcu1tMmcQ5aFxDV09qgbL
 QSxS6k6IMMSTLOceRBD+naCZAJFoz0DFV+ZpkBbK/sqLmLz0mVaf60l1Y0+dqznqoTRF
 U69qczkrRyU14AYw8NKycxtbm9L04al5waadNGiMpqMMn95bQtd/rXqfklPxZWpPz4hN
 5QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMGXmrjjBijTVozb/SNcJosQWc4OplVY9EwbvL5eB0U=;
 b=c37IkJiDsDZvJdQuxJplG/XMSak5E09Zr59HWVkNBghZpLR1LKrxNnFb1rSn8OVXyc
 Io+mafc1+uzu7vZDXril5WicCKXLjuGPJbZgKiZ7eiBo/CpeK7havYmc777ui9hjseWT
 4OGb61dwbrZHb+jNd/X5INOsoZjzzy7p3UHZHJkj2Qh8sfc6bdUQbcW3aBtV52x3c2K8
 BjC8IFV02R2eoFMK4RgoNXPTEGrmIzT00JeGlpwxmT31D8bOTNNja3Gbkhkjc8hINXlE
 kPXLTXAr5tlvCyvgunTw6Gog4hGA2CKVU0vj9KWDfDxxA/ZC/WP+pASSkKZSBsCUXbWK
 pSSg==
X-Gm-Message-State: AOAM530aiGGPrZpc+YZVHHY9Mojmi5UHbFdxfKITFo7p3LEdsNGCSD9g
 AZI9RGQh+7ESNngj/4cMgG8UU9vITkvt4FtK
X-Google-Smtp-Source: ABdhPJzqX3UPGkovYFkOxP9RbPsQPH0bnHyLO8ArbqOOS703vvVeZfnx4GEK6h4bT7KXgh+f+hvqCg==
X-Received: by 2002:aca:ad57:: with SMTP id w84mr3266618oie.100.1615995324373; 
 Wed, 17 Mar 2021 08:35:24 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/38] tcg: Fix prototypes for tcg_out_vec_op and tcg_out_op
Date: Wed, 17 Mar 2021 09:34:44 -0600
Message-Id: <20210317153444.310566-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: peter.maydell@linaro.org, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

There are two different versions of prototype for tcg_out_op and
tcg_out_vec_op functions:

1) using const TCGArg *args and const int *const_args arguments
2) using const TCGArg args[TCG_MAX_OP_ARGS] and const int
   const_args[TCG_MAX_OP_ARGS] aguments.

This duality causes warnings on GCC 11 and prevents build using
--enable-werror.  As second version provides more information,
unify functions prototypes to this variant.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Message-Id: <20210312121418.139093-1-mrezanin@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                    | 19 +++++++++++--------
 tcg/aarch64/tcg-target.c.inc |  3 ++-
 tcg/i386/tcg-target.c.inc    |  6 ++++--
 tcg/mips/tcg-target.c.inc    |  3 ++-
 tcg/ppc/tcg-target.c.inc     |  8 +++++---
 tcg/riscv/tcg-target.c.inc   |  3 ++-
 tcg/s390/tcg-target.c.inc    |  3 ++-
 tcg/tci/tcg-target.c.inc     |  5 +++--
 8 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2991112829..de91bb6e9e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -107,8 +107,9 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
-static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
-                       const int *const_args);
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS]);
 #if TCG_TARGET_MAYBE_vec
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg dst, TCGReg src);
@@ -116,9 +117,10 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, TCGReg base, intptr_t offset);
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, int64_t arg);
-static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
-                           unsigned vece, const TCGArg *args,
-                           const int *const_args);
+static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
+                           unsigned vecl, unsigned vece,
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS]);
 #else
 static inline bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                                    TCGReg dst, TCGReg src)
@@ -135,9 +137,10 @@ static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
 {
     g_assert_not_reached();
 }
-static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
-                                  unsigned vece, const TCGArg *args,
-                                  const int *const_args)
+static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
+                                  unsigned vecl, unsigned vece,
+                                  const TCGArg args[TCG_MAX_OP_ARGS],
+                                  const int const_args[TCG_MAX_OP_ARGS])
 {
     g_assert_not_reached();
 }
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fcaa5aface..f07ba98aa4 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2286,7 +2286,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     static const AArch64Insn cmp_vec_insn[16] = {
         [TCG_COND_EQ] = I3616_CMEQ,
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 40326c2806..415c5c0796 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2177,7 +2177,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 }
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                              const TCGArg *args, const int *const_args)
+                              const TCGArg args[TCG_MAX_OP_ARGS],
+                              const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
     int c, const_a2, vexop, rexw = 0;
@@ -2613,7 +2614,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     static int const add_insn[4] = {
         OPC_PADDB, OPC_PADDW, OPC_PADDD, OPC_PADDQ
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index ab55f3109b..8738a3a581 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1651,7 +1651,8 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
 }
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                              const TCGArg *args, const int *const_args)
+                              const TCGArg args[TCG_MAX_OP_ARGS],
+                              const int const_args[TCG_MAX_OP_ARGS])
 {
     MIPSInsn i1, i2;
     TCGArg a0, a1, a2;
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 4377d15d62..838ccfa42d 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2319,8 +2319,9 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out32(s, BCLR | BO_ALWAYS);
 }
 
-static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
-                       const int *const_args)
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
     int c;
@@ -3115,7 +3116,8 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     static const uint32_t
         add_op[4] = { VADDUBM, VADDUHM, VADDUWM, VADDUDM },
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index e700c52067..ef43147040 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1212,7 +1212,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 static const tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                       const TCGArg *args, const int *const_args)
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 695d7ee652..af8dfe81ac 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1705,7 +1705,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
         case glue(glue(INDEX_op_,x),_i64)
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                const TCGArg *args, const int *const_args)
+                              const TCGArg args[TCG_MAX_OP_ARGS],
+                              const int const_args[TCG_MAX_OP_ARGS])
 {
     S390Opcode op, op2;
     TCGArg a0, a1, a2;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 7e7b9fed44..ee6cdfec71 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -613,8 +613,9 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 # define CASE_64(x)
 #endif
 
-static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
-                       const int *const_args)
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     switch (opc) {
     case INDEX_op_exit_tb:
-- 
2.25.1


