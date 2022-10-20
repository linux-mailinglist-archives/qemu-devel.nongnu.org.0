Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22936062D1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:19:19 +0200 (CEST)
Received: from localhost ([::1]:54430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWOD-0003Kl-Bz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:19:17 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWCv-0004m2-Ef
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU80-0005SH-E8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7v-00015X-7n
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:24 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3203188pjq.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YGsCYh6gVTl3bqvlZ0jCo6VaST2bfwHMB4a99eqK23U=;
 b=SO8LhE8BDEXbKqCyG1hGNhAsgM3A9dGAjIPNxNeCGsvZsSE6wLfPwZBmTPMdIB29XP
 uWvlOjOUs0nn3vbLyk0mLjkEQsbUSenP9qshC5B0QmVu7HzlzSG/sPjguF8gzzCQMBDS
 uyMG9mxMNULIEbxbCUX4DJDoBYX90MN0ZN1aLcqA8FvpDxH/+T5cVcTdqidvoPt0CUQt
 Wj17fvyhjW3Dg9oPEBdYc4/XG2xJBWuGGbaCgyhtLhz7M4ZIz+RVRm5V8W0c0PogeB8i
 Vulq73l2XZjubSdgheFJwj/hjBQyZHgoZwfsYWqNXzz45ekMgXggKnWXo9SqHLgax2ye
 G1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGsCYh6gVTl3bqvlZ0jCo6VaST2bfwHMB4a99eqK23U=;
 b=gszxm56xz4R2V7ZW2Tjx07x3TD/5YVPZ2UDc9qqe1aKlquUCLRn/sFqI9eebK02nJA
 qxF5vy9NaJsWMj9HaOI4xbO1D//1UUef4xwf2kaxsgHCyi52ZK7hRgpgAs5TDgeWNPSc
 inZb0M0Y6d1xZ8UryG8br7FGLzqImjhBiyuGcMbIdLooxywYB0DAypCsxosh4p6ZaHO5
 nStJuUm+QI97SnnDz8IDRn321eCtXn//Lu6gL5ZIvAcBtoqWLspGQOD6DCyZ/RHuWxef
 r7Yn3uqghUBg4OjbF3SiuDhoXC1Jlspa5RubeX8YqeNv35+X6b2XmH4Yg6FHAI3kwRYm
 2/9w==
X-Gm-Message-State: ACrzQf3kXXTl6FfA7hRRK3DIInNRD1XUPlH1/z4Alse/5+yJZY3T+c22
 Ia1GK2OMDU0RP21OrNfGLi+0xNgIxMAYOMEg
X-Google-Smtp-Source: AMsMyM7/t0fXaPZ2M1l/lg01d53ro3uLHWEC1xJsNTT+lsGtV+s0LT3SEODEcuaAXF40xVqpkiOqdA==
X-Received: by 2002:a17:902:a412:b0:185:43a2:3d16 with SMTP id
 p18-20020a170902a41200b0018543a23d16mr13833877plq.146.1666266857053; 
 Thu, 20 Oct 2022 04:54:17 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/31] tcg: Define TCG_TYPE_I128 and related helper macros
Date: Thu, 20 Oct 2022 21:52:32 +1000
Message-Id: <20221020115242.2301066-22-richard.henderson@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Begin staging in support for TCGv_i128 with Int128.
Define the type enumerator, the typedef, and the
helper-head.h macros.

This cannot yet be used, because you can't allocate
temporaries of this new type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h |  7 +++++++
 include/tcg/tcg.h          | 28 ++++++++++++++--------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index e242fed46e..9753df8e80 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -26,6 +26,7 @@
 #define dh_alias_int i32
 #define dh_alias_i64 i64
 #define dh_alias_s64 i64
+#define dh_alias_i128 i128
 #define dh_alias_f16 i32
 #define dh_alias_f32 i32
 #define dh_alias_f64 i64
@@ -40,6 +41,7 @@
 #define dh_ctype_int int
 #define dh_ctype_i64 uint64_t
 #define dh_ctype_s64 int64_t
+#define dh_ctype_i128 Int128
 #define dh_ctype_f16 uint32_t
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
@@ -71,6 +73,7 @@
 #define dh_retvar_decl0_noreturn void
 #define dh_retvar_decl0_i32 TCGv_i32 retval
 #define dh_retvar_decl0_i64 TCGv_i64 retval
+#define dh_retval_decl0_i128 TCGv_i128 retval
 #define dh_retvar_decl0_ptr TCGv_ptr retval
 #define dh_retvar_decl0(t) glue(dh_retvar_decl0_, dh_alias(t))
 
@@ -78,6 +81,7 @@
 #define dh_retvar_decl_noreturn
 #define dh_retvar_decl_i32 TCGv_i32 retval,
 #define dh_retvar_decl_i64 TCGv_i64 retval,
+#define dh_retvar_decl_i128 TCGv_i128 retval,
 #define dh_retvar_decl_ptr TCGv_ptr retval,
 #define dh_retvar_decl(t) glue(dh_retvar_decl_, dh_alias(t))
 
@@ -85,6 +89,7 @@
 #define dh_retvar_noreturn NULL
 #define dh_retvar_i32 tcgv_i32_temp(retval)
 #define dh_retvar_i64 tcgv_i64_temp(retval)
+#define dh_retvar_i128 tcgv_i128_temp(retval)
 #define dh_retvar_ptr tcgv_ptr_temp(retval)
 #define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
 
@@ -95,6 +100,7 @@
 #define dh_typecode_i64 4
 #define dh_typecode_s64 5
 #define dh_typecode_ptr 6
+#define dh_typecode_i128 7
 #define dh_typecode_int dh_typecode_s32
 #define dh_typecode_f16 dh_typecode_i32
 #define dh_typecode_f32 dh_typecode_i32
@@ -104,6 +110,7 @@
 
 #define dh_callflag_i32  0
 #define dh_callflag_i64  0
+#define dh_callflag_i128 0
 #define dh_callflag_ptr  0
 #define dh_callflag_void 0
 #define dh_callflag_noreturn TCG_CALL_NO_RETURN
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index c342396260..e80c78b2e8 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -38,18 +38,15 @@
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
 
-#if HOST_LONG_BITS == 32
 #define MAX_OPC_PARAM_PER_ARG 2
-#else
-#define MAX_OPC_PARAM_PER_ARG 1
-#endif
 #define MAX_OPC_PARAM_IARGS 7
 #define MAX_OPC_PARAM_OARGS 1
 #define MAX_OPC_PARAM_ARGS (MAX_OPC_PARAM_IARGS + MAX_OPC_PARAM_OARGS)
 
-/* A Call op needs up to 4 + 2N parameters on 32-bit archs,
- * and up to 4 + N parameters on 64-bit archs
- * (N = number of input arguments + output arguments).  */
+/*
+ * A Call op needs up to 4 + 2N parameters.
+ * (N = number of input arguments + output arguments).
+ */
 #define MAX_OPC_PARAM (4 + (MAX_OPC_PARAM_PER_ARG * MAX_OPC_PARAM_ARGS))
 
 #define CPU_TEMP_BUF_NLONGS 128
@@ -289,6 +286,7 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
+    TCG_TYPE_I128,
 
     TCG_TYPE_V64,
     TCG_TYPE_V128,
@@ -364,13 +362,14 @@ typedef tcg_target_ulong TCGArg;
    in tcg/README. Target CPU front-end code uses these types to deal
    with TCG variables as it emits TCG code via the tcg_gen_* functions.
    They come in several flavours:
-    * TCGv_i32 : 32 bit integer type
-    * TCGv_i64 : 64 bit integer type
-    * TCGv_ptr : a host pointer type
-    * TCGv_vec : a host vector type; the exact size is not exposed
-                 to the CPU front-end code.
-    * TCGv : an integer type the same size as target_ulong
-             (an alias for either TCGv_i32 or TCGv_i64)
+    * TCGv_i32  : 32 bit integer type
+    * TCGv_i64  : 64 bit integer type
+    * TCGv_i128 : 128 bit integer type
+    * TCGv_ptr  : a host pointer type
+    * TCGv_vec  : a host vector type; the exact size is not exposed
+                  to the CPU front-end code.
+    * TCGv      : an integer type the same size as target_ulong
+                  (an alias for either TCGv_i32 or TCGv_i64)
    The compiler's type checking will complain if you mix them
    up and pass the wrong sized TCGv to a function.
 
@@ -390,6 +389,7 @@ typedef tcg_target_ulong TCGArg;
 
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
+typedef struct TCGv_i128_d *TCGv_i128;
 typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
-- 
2.34.1


