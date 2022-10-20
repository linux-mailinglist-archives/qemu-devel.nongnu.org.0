Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6D6060C9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:59:19 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV8S-0007t1-V8
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:59:02 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV6S-0007J7-OI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7k-000538-10
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:13 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7c-00012q-DQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id c24so20097561plo.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bfJ9mjaoh/bzZ7mExDxQS6i2vQ2bw3ZLVkF8JJ2Slok=;
 b=SgJO9CiMq1GWSZbc3Ujiy96VIqYvQaJ/PC4ENpez4/G/7QFvXfI1ZHhuxN/AhsBOI3
 2qV3a2OjG0HZD6gtpYnwIAWfkQqv70wZDNrrfdZDBMcdWanKkjrQtYiDQqO+ERVODCzv
 JxeXOFi7leDNyo5xfq0lgOB5Ddyc/GypScxz7MSZnb205zPz6Ngolmfwp1mBCc8OeYNB
 vofbVr2hSDghtF1t6yyj1CeHsycS2rxY32J0vnW6LYl7FzE77NYW6+f6iLWNFyX4bKpL
 jZPG1gLeatGRhyGMotUknF0UE2xD4Xz/WoAWZaTpfSCPSiJNwAVB5vIeS8L/YpWiVH9X
 TouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bfJ9mjaoh/bzZ7mExDxQS6i2vQ2bw3ZLVkF8JJ2Slok=;
 b=7zub8U9MO2dKGlepnJtkFMFJsGK17btXUxtQbQNJJXZEqhlm/0g90x1hB9P2RsvY3W
 QpX0O71M7c89uymo0uNryQYR7eF6zH7VjK4I96Dsa2jSeMJuEsO0sez7ehJuJZAahfmX
 hnoXhj11MtmOkNnIQiWrizBDm6rB3305U4TcUzT2zRNACdvpSyex248GK8SehkMUDhA7
 LvRBU5xtZmxkKSgDFsJLuDhV5LXHfUEzb19p2KrVXPoy4SElfuHL3t+hIUOt4k/T6qlA
 6LccE2l8qUNUwt+hcZ7OznRBt2AYcFKbCEhfkaIB9QNgAqgDs6dEqrUHhZ7p39tOfWfz
 0t8Q==
X-Gm-Message-State: ACrzQf0JPxUEheQuqjwMgXwxij0nFJuwGajgmbtd4A5QGvAG2R4s8X9C
 JXSa1Ix/scxadpfHFJ1yg6DbShmysYR9SiAZ
X-Google-Smtp-Source: AMsMyM5oIJhpiL7og/+eIU0L3g41dNHVbiHVcqru1d3M3xO5kCBHYCR8hC3RLvBzDx3IJa1Q9ZGv6A==
X-Received: by 2002:a17:90b:2248:b0:210:10dc:a314 with SMTP id
 hk8-20020a17090b224800b0021010dca314mr7858139pjb.15.1666266838790; 
 Thu, 20 Oct 2022 04:53:58 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/31] tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with
 TCG_TARGET_CALL_ARG_I64
Date: Thu, 20 Oct 2022 21:52:26 +1000
Message-Id: <20221020115242.2301066-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

For 32-bit hosts when TCG_TARGET_CALL_ALIGN_ARGS was set, use
TCG_CALL_ARG_EVEN.  For 64-bit hosts, TCG_TARGET_CALL_ALIGN_ARGS
was silently ignored, so always use TCG_CALL_ARG_NORMAL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.h         |  2 +-
 tcg/i386/tcg-target.h        |  1 +
 tcg/loongarch64/tcg-target.h |  2 +-
 tcg/mips/tcg-target.h        |  3 ++-
 tcg/riscv/tcg-target.h       |  2 +-
 tcg/s390x/tcg-target.h       |  1 +
 tcg/sparc64/tcg-target.h     |  1 +
 tcg/tci/tcg-target.h         |  5 +++++
 tcg/tcg.c                    |  6 ++++--
 tcg/ppc/tcg-target.c.inc     | 21 ++++++++-------------
 11 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index e145d50fef..d9dd777caa 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -51,8 +51,8 @@ typedef enum {
 /* used for function call generation */
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
-#define TCG_TARGET_CALL_ALIGN_ARGS      1
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 56c1ac4586..09dd0550aa 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -88,8 +88,8 @@ extern bool use_neon_instructions;
 
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
-#define TCG_TARGET_CALL_ALIGN_ARGS	1
 #define TCG_TARGET_CALL_STACK_OFFSET	0
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
 
 /* optional instructions */
 #define TCG_TARGET_HAS_ext8s_i32        1
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 00fcbe297d..42628a2791 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -98,6 +98,7 @@ typedef enum {
 #else
 #define TCG_TARGET_CALL_STACK_OFFSET 0
 #endif
+#define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 
 extern bool have_bmi1;
 extern bool have_popcnt;
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index d58a6162f2..584cac3dc2 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -88,8 +88,8 @@ typedef enum {
 /* used for function call generation */
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
-#define TCG_TARGET_CALL_ALIGN_ARGS      1
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 7669213175..bb7312aed4 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -83,10 +83,11 @@ typedef enum {
 #define TCG_TARGET_STACK_ALIGN        16
 #if _MIPS_SIM == _ABIO32
 # define TCG_TARGET_CALL_STACK_OFFSET 16
+# define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_EVEN
 #else
 # define TCG_TARGET_CALL_STACK_OFFSET 0
+# define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 #endif
-#define TCG_TARGET_CALL_ALIGN_ARGS    1
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 11c9b3e4f4..0b2171ebf0 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -81,8 +81,8 @@ typedef enum {
 /* used for function call generation */
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
-#define TCG_TARGET_CALL_ALIGN_ARGS      1
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 23e2063667..7e86791ff6 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -166,6 +166,7 @@ extern uint64_t s390_facilities[3];
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_RET_NORMAL
 
 #define TCG_TARGET_EXTEND_ARGS 1
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 8655acdbe5..44ac164b31 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -72,6 +72,7 @@ typedef enum {
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
 #define TCG_TARGET_EXTEND_ARGS 1
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 #if defined(__VIS__) && __VIS__ >= 0x300
 #define use_vis3_instructions  1
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index ceb36c4f7a..e11c293906 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -158,6 +158,11 @@ typedef enum {
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
+#if TCG_TARGET_REG_BITS == 32
+# define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
+#else
+# define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
+#endif
 
 #define HAVE_TCG_QEMU_TB_EXEC
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c1b9010b55..41052869cb 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1541,9 +1541,11 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
          * for passing off to ffi_call.
          */
         want_align = true;
-#elif defined(TCG_TARGET_CALL_ALIGN_ARGS)
+#else
         /* Some targets want aligned 64 bit args */
-        want_align = is_64bit;
+        if (is_64bit) {
+            want_align = TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN;
+        }
 #endif
 
         if (TCG_TARGET_REG_BITS < 64 && want_align && (real_args & 1)) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e3dba47697..d1d6a40c6c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -45,7 +45,9 @@
 #endif 
 
 #ifdef _CALL_SYSV
-# define TCG_TARGET_CALL_ALIGN_ARGS   1
+# define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_EVEN
+#else
+# define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
 #endif
 
 /* For some memory operations, we need a scratch that isn't R0.  For the AIX
@@ -2202,9 +2204,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     lo = lb->addrlo_reg;
     hi = lb->addrhi_reg;
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-        arg |= 1;
-#endif
+        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
     } else {
@@ -2250,9 +2250,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     lo = lb->addrlo_reg;
     hi = lb->addrhi_reg;
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-        arg |= 1;
-#endif
+        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
     } else {
@@ -2266,9 +2264,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     if (TCG_TARGET_REG_BITS == 32) {
         switch (s_bits) {
         case MO_64:
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-            arg |= 1;
-#endif
+            arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
             tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
             /* FALLTHRU */
         case MO_32:
@@ -2324,9 +2320,8 @@ static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         TCGReg arg = TCG_REG_R4;
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-        arg |= 1;
-#endif
+
+        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
         if (l->addrlo_reg != arg) {
             tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
             tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-- 
2.34.1


