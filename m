Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EC5A9230
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:37:27 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfhW-00078v-RU
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewp-0001Hs-99
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewm-00037Z-CP
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiLcyNFadFmE+CsaVrOfMKBIDJnZ/246U5aUFQtItY4=;
 b=bL4JxLcgfLBvyywzhJZ9yxUivixw4FNMz6vt/4jcONK2o7a/+yyjEjqc7KCFsgc/VJpeHW
 58eOPhCp4PHobOmIrFQavVZsPM6BrDOItu28G2tv8CJXpQqD3ADqOdct5l7nkXVaBYcfV9
 9y8lzvqJk3BpH72aEcbe/mG4e0hEX6M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-yy6JMethPSmo3zxwNNLvYA-1; Thu, 01 Sep 2022 03:49:06 -0400
X-MC-Unique: yy6JMethPSmo3zxwNNLvYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h82-20020a1c2155000000b003a64d0510d9so9467779wmh.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jiLcyNFadFmE+CsaVrOfMKBIDJnZ/246U5aUFQtItY4=;
 b=57lp/T1IP35rpTdGHhxHGGLQCAZXODkJHWOa1l08Cgw4cLJ5elHQ54ZIEes8Yz/3KY
 VxKWQ8qnGcAmT2uoQrDiMJOQegZNjd2sW20s0mDg4r+QUeR3IMjE5YlVGNRVwgzpY3KJ
 AFciO/EeQJDShqF2TmfBadzax8v0qYRy0LBZLZd6FpgWjOcYj0tL+MxswSrpFjO+fulI
 YOpUg7SMUh7c6B010qbM1g1AjUzlHNGeklvpMq/5jJLREoHgPJyUgMqUVuzP1YInRYg+
 GytiWEu+lzxShfejVg0BCdfHuSZ/4o9V7wXiEN3NrwSg+rWuI5Hq3vvYT3PM/GDk8KWB
 yipQ==
X-Gm-Message-State: ACgBeo1M4E1ilzm2RC4Z57+MOskWIuWunoKHxGULw1kkGXTbcCKMXvFz
 7vPQH0qizazLlUW/EuUySuTEPg4WayyWRTMecIo5v7MQ5iA1Wo5DVA9MvGKa91PbhbkFyilLxla
 9MfekOES4yNl1LaGQ9qeZlYHkT4uR469qhSTi1/FOrXvBTL0KTxSGGp5wa7pjpcPxLkg=
X-Received: by 2002:a05:6000:1563:b0:222:c70e:b2a5 with SMTP id
 3-20020a056000156300b00222c70eb2a5mr14104040wrz.492.1662018545095; 
 Thu, 01 Sep 2022 00:49:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR72mFg4sv6ofuOvfmMfMhvAMT2gCSWYZ0h+Q9y5yRiIGYTcrKquWaeM7+bbpAyNVkbqNxV+oQ==
X-Received: by 2002:a05:6000:1563:b0:222:c70e:b2a5 with SMTP id
 3-20020a056000156300b00222c70eb2a5mr14104022wrz.492.1662018544754; 
 Thu, 01 Sep 2022 00:49:04 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adff2d2000000b0022542581800sm16257170wrp.45.2022.09.01.00.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 10/23] i386: do not cast gen_helper_* function pointers
Date: Thu,  1 Sep 2022 09:48:29 +0200
Message-Id: <20220901074842.57424-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use a union to store the various possible kinds of function pointers, and
access the correct one based on the flags.

SSEOpHelper_table6 and SSEOpHelper_table7 right now only have one case,
but this would change with AVX's 3- and 4-argument operations.  Use
unions there too, to keep the code more similar for the three tables.

Extracted from a patch by Paul Brook <paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 75 ++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 38 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 16db155c94..c6a9a5b1d4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2784,6 +2784,8 @@ typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
 typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
 typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
+typedef void (*SSEFunc_0_eppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv_ptr reg_c);
 typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv_i32 val);
 typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
@@ -2798,7 +2800,7 @@ typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
 #define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
 
 #define OP(op, flags, a, b, c, d)       \
-    {flags, {a, b, c, d} }
+    {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d} } }
 
 #define MMX_OP(x) OP(op1, SSE_OPF_MMX, \
         gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL)
@@ -2809,9 +2811,15 @@ typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
 #define SSE_OP(sname, dname, op, flags) OP(op, flags, \
         gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL)
 
+typedef union SSEFuncs {
+    SSEFunc_0_epp op1;
+    SSEFunc_0_ppi op1i;
+    SSEFunc_0_eppt op1t;
+} SSEFuncs;
+
 struct SSEOpHelper_table1 {
     int flags;
-    SSEFunc_0_epp op[4];
+    SSEFuncs fn[4];
 };
 
 #define SSE_3DNOW { SSE_OPF_3DNOW }
@@ -2867,8 +2875,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x5f] = SSE_FOP(max),
 
     [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
-    [0xc6] = OP(dummy, SSE_OPF_SHUF, (SSEFunc_0_epp)gen_helper_shufps_xmm,
-                (SSEFunc_0_epp)gen_helper_shufpd_xmm, NULL, NULL),
+    [0xc6] = SSE_OP(shufps, shufpd, op1i, SSE_OPF_SHUF),
 
     /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
     [0x38] = SSE_SPECIAL,
@@ -2894,10 +2901,8 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x6e] = SSE_SPECIAL, /* movd mm, ea */
     [0x6f] = SSE_SPECIAL, /* movq, movdqa, , movqdu */
     [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX,
-            (SSEFunc_0_epp)gen_helper_pshufw_mmx,
-            (SSEFunc_0_epp)gen_helper_pshufd_xmm,
-            (SSEFunc_0_epp)gen_helper_pshufhw_xmm,
-            (SSEFunc_0_epp)gen_helper_pshuflw_xmm),
+            gen_helper_pshufw_mmx, gen_helper_pshufd_xmm,
+            gen_helper_pshufhw_xmm, gen_helper_pshuflw_xmm),
     [0x71] = SSE_SPECIAL, /* shiftw */
     [0x72] = SSE_SPECIAL, /* shiftd */
     [0x73] = SSE_SPECIAL, /* shiftq */
@@ -2959,8 +2964,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xf5] = MMX_OP(pmaddwd),
     [0xf6] = MMX_OP(psadbw),
     [0xf7] = OP(op1t, SSE_OPF_MMX,
-                (SSEFunc_0_epp)gen_helper_maskmov_mmx,
-                (SSEFunc_0_epp)gen_helper_maskmov_xmm, NULL, NULL),
+                gen_helper_maskmov_mmx, gen_helper_maskmov_xmm, NULL, NULL),
     [0xf8] = MMX_OP(psubb),
     [0xf9] = MMX_OP(psubw),
     [0xfa] = MMX_OP(psubl),
@@ -3057,17 +3061,19 @@ static const SSEFunc_0_epp sse_op_table5[256] = {
     [0xb6] = gen_helper_movq, /* pfrcpit2 */
     [0xb7] = gen_helper_pmulhrw_mmx,
     [0xbb] = gen_helper_pswapd,
-    [0xbf] = gen_helper_pavgb_mmx /* pavgusb */
+    [0xbf] = gen_helper_pavgb_mmx,
 };
 
 struct SSEOpHelper_table6 {
-    SSEFunc_0_epp op[2];
+    SSEFuncs fn[2];
     uint32_t ext_mask;
     int flags;
 };
 
 struct SSEOpHelper_table7 {
-    SSEFunc_0_eppi op[2];
+    union {
+        SSEFunc_0_eppi op1;
+    } fn[2];
     uint32_t ext_mask;
     int flags;
 };
@@ -3075,7 +3081,8 @@ struct SSEOpHelper_table7 {
 #define gen_helper_special_xmm NULL
 
 #define OP(name, op, flags, ext, mmx_name) \
-    {{mmx_name, gen_helper_ ## name ## _xmm}, CPUID_EXT_ ## ext, flags}
+    {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm} }, \
+        CPUID_EXT_ ## ext, flags}
 #define BINARY_OP_MMX(name, ext) \
     OP(name, op1, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
 #define BINARY_OP(name, ext, flags) \
@@ -3185,11 +3192,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     int b1, op1_offset, op2_offset, is_xmm, val;
     int modrm, mod, rm, reg;
     int sse_op_flags;
+    SSEFuncs sse_op_fn;
     const struct SSEOpHelper_table6 *op6;
     const struct SSEOpHelper_table7 *op7;
-    SSEFunc_0_epp sse_fn_epp;
-    SSEFunc_0_ppi sse_fn_ppi;
-    SSEFunc_0_eppt sse_fn_eppt;
     MemOp ot;
 
     b &= 0xff;
@@ -3202,9 +3207,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     else
         b1 = 0;
     sse_op_flags = sse_op_table1[b].flags;
-    sse_fn_epp = sse_op_table1[b].op[b1];
+    sse_op_fn = sse_op_table1[b].fn[b1];
     if ((sse_op_flags & (SSE_OPF_SPECIAL | SSE_OPF_3DNOW)) == 0
-            && !sse_fn_epp) {
+            && !sse_op_fn.op1) {
         goto unknown_op;
     }
     if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
@@ -3618,9 +3623,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op1_offset = offsetof(CPUX86State,mmx_t0);
             }
             assert(b1 < 2);
-            sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
+            SSEFunc_0_epp fn = sse_op_table2[((b - 1) & 3) * 8 +
                                        (((modrm >> 3)) & 7)][b1];
-            if (!sse_fn_epp) {
+            if (!fn) {
                 goto unknown_op;
             }
             if (is_xmm) {
@@ -3632,7 +3637,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op1_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            fn(cpu_env, s->ptr0, s->ptr1);
             break;
         case 0x050: /* movmskps */
             rm = (modrm & 7) | REX_B(s);
@@ -3889,12 +3894,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         gen_ldo_env_A0(s, op2_offset);
                     }
                 }
-                if (!op6->op[b1]) {
+                if (!op6->fn[b1].op1) {
                     goto illegal_op;
                 }
                 tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
                 tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                op6->op[b1](cpu_env, s->ptr0, s->ptr1);
+                op6->fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
             } else {
                 if ((op6->flags & SSE_OPF_MMX) == 0) {
                     goto unknown_op;
@@ -3909,7 +3914,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
                 tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                op6->op[0](cpu_env, s->ptr0, s->ptr1);
+                op6->fn[0].op1(cpu_env, s->ptr0, s->ptr1);
             }
 
             if (op6->flags & SSE_OPF_CMP) {
@@ -4450,8 +4455,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* We only actually have one MMX instuction (palignr) */
                 assert(b == 0x0f);
 
-                op7->op[0](cpu_env, s->ptr0, s->ptr1,
-                           tcg_const_i32(val));
+                op7->fn[0].op1(cpu_env, s->ptr0, s->ptr1,
+                               tcg_const_i32(val));
                 break;
             }
 
@@ -4477,7 +4482,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            op7->op[b1](cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            op7->fn[b1].op1(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
             if (op7->flags & SSE_OPF_CMP) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
@@ -4603,9 +4608,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
         if (sse_op_flags & SSE_OPF_SHUF) {
             val = x86_ldub_code(env, s);
-            /* XXX: introduce a new table? */
-            sse_fn_ppi = (SSEFunc_0_ppi)sse_fn_epp;
-            sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
+            sse_op_fn.op1i(s->ptr0, s->ptr1, tcg_const_i32(val));
         } else if (b == 0xf7) {
             /* maskmov : we must prepare A0 */
             if (mod != 3) {
@@ -4614,17 +4617,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
-
-            /* XXX: introduce a new table? */
-            sse_fn_eppt = (SSEFunc_0_eppt)sse_fn_epp;
-            sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
+            sse_op_fn.op1t(cpu_env, s->ptr0, s->ptr1, s->A0);
         } else if (b == 0xc2) {
             /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
             val = x86_ldub_code(env, s) & 7;
-            sse_fn_epp = sse_op_table4[val][b1];
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            sse_op_table4[val][b1](cpu_env, s->ptr0, s->ptr1);
         } else {
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            sse_op_fn.op1(cpu_env, s->ptr0, s->ptr1);
         }
 
         if (sse_op_flags & SSE_OPF_CMP) {
-- 
2.37.1



