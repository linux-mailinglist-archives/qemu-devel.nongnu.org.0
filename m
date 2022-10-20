Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497E6061F8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:40:36 +0200 (CEST)
Received: from localhost ([::1]:57006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVmh-00038Z-I8
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:40:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV8x-0004nm-Hz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8N-0005av-UE
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8F-00019O-OQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 g8-20020a17090a128800b0020c79f987ceso3204913pja.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UqQl2SYlZKmYjNxkIXtDWOTOpu/l/Xpoo55PWkQGicA=;
 b=nsL5lIJG3o5BPDVt3zsJ0eI+ot4w62Y3rzTEPGrJB3/hartw+LIFsWjW00PtWXjpBS
 Pe7klQBUfTr5fkz62JsvtZDMxJM5fiZBb1+kyXOZZxeM5Zv1YWygyFr+YXcbcOL0aAmQ
 Cn/5CIMwJNi3Hk59RO64IkTZOQCkCvUJbzDlPm8kyAP9cxOdVRY8UhwpA30qGXx7XFOs
 9IBCtFzePIhe1jYHjO8XNadYmPmijDhlqF/y93oUCLKzJXcmJHoMTtkgHt4wJlmC/7I9
 juPbQyDxXyzDD4cHOeMmuuYifk9BEIp6Aln8ovlX6I6GVuw+UekL51kpGLNlHiqf4jI5
 iNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UqQl2SYlZKmYjNxkIXtDWOTOpu/l/Xpoo55PWkQGicA=;
 b=wEbjU349YFTt75JfVrtOpLfkVRUAQzEYef5hXIs37SUbDKGhfSBck9II26QwM0vAU9
 CwK9KLIRt5CGsT7CjBjP9SIKnjH+6wATyg2hrgyRj9Bxwklm6bD8kMRGl6tVMRdgdI21
 Nj3vG2+SpaO11D3MhxIforPEMLzZ8rc9k1NxhEWv1yt5b0XFAhxFghL0fF9ggh741kt6
 ZWe5ZMwy4ieqcWYXa4gn1x7N1oBMsL9s1SKe/8+mnMR0bPniYAEe1GIbJGqFq/8gqpWe
 C18jRY+4UyfX5ioFFFmufGMnUO4wWDvHs1pZL/x9CHNK5cdvSwEMPAR4VNEnUdkrGDyP
 aosw==
X-Gm-Message-State: ACrzQf2JiqdOeD4P5WX7um40LnSPixlppZJD1VSBFMlHYQa8KOPagdqU
 zAeHfxlDDwcKPelPcF0Uh0XnhHhlkUbuKPJC
X-Google-Smtp-Source: AMsMyM5xn4g1/9JEQC47dKkm7QhNOJF5Pp68kIQ7i63n17D8yjx8svMmDSbiT9B7g/SrRtIr0T/97g==
X-Received: by 2002:a17:90b:38c7:b0:211:8e5e:9a72 with SMTP id
 nn7-20020a17090b38c700b002118e5e9a72mr4339638pjb.154.1666266877797; 
 Thu, 20 Oct 2022 04:54:37 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/31] tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Thu, 20 Oct 2022 21:52:40 +1000
Message-Id: <20221020115242.2301066-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Fill in the parameters for the host ABI for Int128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 ++
 tcg/arm/tcg-target.h         |  2 ++
 tcg/i386/tcg-target.h        | 10 ++++++++++
 tcg/loongarch64/tcg-target.h |  2 ++
 tcg/mips/tcg-target.h        |  2 ++
 tcg/riscv/tcg-target.h       |  2 ++
 tcg/s390x/tcg-target.h       |  2 ++
 tcg/sparc64/tcg-target.h     |  2 ++
 tcg/tcg.c                    | 29 ++++++++++++++++++++++++-----
 tcg/i386/tcg-target.c.inc    | 25 +++++++++++++++++++++++++
 tcg/ppc/tcg-target.c.inc     |  3 +++
 11 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 413a5410c5..0dff5807f6 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -54,6 +54,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index b7843d2d54..6613d3d791 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -91,6 +91,8 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_CALL_STACK_OFFSET	0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
 
 /* optional instructions */
 #define TCG_TARGET_HAS_ext8s_i32        1
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7edb7f1d9a..9e0e82d80a 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -100,6 +100,16 @@ typedef enum {
 #endif
 #define TCG_TARGET_CALL_ARG_I32      TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
+#if defined(_WIN64)
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_BY_REF
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_BY_VEC
+#elif TCG_TARGET_REG_BITS == 64
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_NORMAL
+#else
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_BY_REF
+#endif
 
 extern bool have_bmi1;
 extern bool have_popcnt;
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 74fbb22dfd..54e3478355 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -91,6 +91,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 15721c3e42..b235cba8ba 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -89,6 +89,8 @@ typedef enum {
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 #endif
 #define TCG_TARGET_CALL_ARG_I32       TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128      TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128      TCG_CALL_RET_NORMAL
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 6f3b142317..5a514cfe89 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -84,6 +84,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index db5665c375..9a3856f0b3 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -168,6 +168,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_RET_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_BY_REF
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
 
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 0044ac8d78..53cfa843da 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -73,6 +73,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 #if defined(__VIS__) && __VIS__ >= 0x300
 #define use_vis3_instructions  1
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2c7eece27f..352175afcd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -548,6 +548,22 @@ static GHashTable *helper_table;
 #ifdef CONFIG_TCG_INTERPRETER
 static ffi_type *typecode_to_ffi(int argmask)
 {
+    /*
+     * libffi does not support __int128_t, so we have forced Int128
+     * to use the structure definition instead of the builtin type.
+     */
+    static ffi_type *ffi_type_i128_elements[3] = {
+        &ffi_type_uint64,
+        &ffi_type_uint64,
+        NULL
+    };
+    static ffi_type ffi_type_i128 = {
+        .size = 16,
+        .alignment = __alignof__(Int128),
+        .type = FFI_TYPE_STRUCT,
+        .elements = ffi_type_i128_elements,
+    };
+
     switch (argmask) {
     case dh_typecode_void:
         return &ffi_type_void;
@@ -561,6 +577,8 @@ static ffi_type *typecode_to_ffi(int argmask)
         return &ffi_type_sint64;
     case dh_typecode_ptr:
         return &ffi_type_pointer;
+    case dh_typecode_i128:
+        return &ffi_type_i128;
     }
     g_assert_not_reached();
 }
@@ -742,12 +760,13 @@ static void init_call_layout(TCGHelperInfo *info)
         break;
     case dh_typecode_i128:
         /*
-         * No matter the call return method, we must have all of
-         * the temp subindexes in the call for liveness.
+         * For 32-bit hosts, do not split out individual temps.
+         * For 64-bit hosts, we need to add both temps for liveness
+         * no matter the backend calling convention.
          */
         info->nr_out = TCG_TARGET_REG_BITS == 32 ? 1 : 2;
-        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
-        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
+        info->out_kind = TCG_TARGET_CALL_RET_I128;
+        switch (TCG_TARGET_CALL_RET_I128) {
         case TCG_CALL_RET_NORMAL:
             if (TCG_TARGET_REG_BITS == 32) {
                 info->out_kind = TCG_CALL_RET_NORMAL_4;
@@ -809,7 +828,7 @@ static void init_call_layout(TCGHelperInfo *info)
             break;
         case dh_typecode_i128:
             type = TCG_TYPE_I128;
-            kind = TCG_CALL_ARG_NORMAL; /* TODO */
+            kind = TCG_TARGET_CALL_ARG_I128;
             break;
         default:
             g_assert_not_reached();
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3b4b66c224..fd55089ac9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1697,6 +1697,31 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
                          const TCGHelperInfo *info)
 {
     tcg_out_branch(s, 1, dest);
+
+    switch (info->out_kind) {
+    case TCG_CALL_RET_NORMAL:
+#ifdef _WIN64
+    case TCG_CALL_RET_BY_VEC:
+#endif
+        break;
+#if TCG_TARGET_REG_BITS == 32 && !defined(_WIN32)
+    case TCG_CALL_RET_BY_REF:
+        /*
+         * The sysv i386 abi for struct return places a reference as the
+         * first argument of the stack, and pops that argument with
+         * the return statement.  Since we want to retain the aligned
+         * stack pointer for the callee, we do not want to actually
+         * push that argument before the call but rely on the normal
+         * store to the stack slot.  But we do need to compensate
+         * for the pop to return to steady state.
+         * Pushing a garbage value back onto the stack is quickest.
+         */
+        tcg_out_push(s, TCG_REG_EAX);
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static void tcg_out_jmp(TCGContext *s, const tcg_insn_unit *dest)
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 781ecfe161..e86d4a5e78 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -54,6 +54,9 @@
 #else
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
 #endif
+/* Note sysv arg alignment applies only to 2-word types, not more. */
+#define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
 
 /* For some memory operations, we need a scratch that isn't R0.  For the AIX
    calling convention, we can re-use the TOC register since we'll be reloading
-- 
2.34.1


