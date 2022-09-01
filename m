Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5AE5A9F8E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:05:07 +0200 (CEST)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpUw-0001Nu-IW
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosZ-0008L7-BF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosR-00007L-Oo
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8y4hw7LCcErvSdS+ZvnaUckc9XcwWhxtwwZgfJ6Be48=;
 b=ZO5gTDXLN9wU3Iqr8t91q7EBzJooH++gRAQLsPfrSvABWHMxg1vHYcnv8rUwWTLNl2KRBP
 AtY1Un00HWYnRIyvZrpwWS05AuR1txxVKnvO4xVEradgzUUHBkyROPTWJGclrQlorebBH6
 OOTvFjhgeET6Ro8nziOjxNQpsQjiG6Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-k2Q_3aygP4CWHpV1psn_zA-1; Thu, 01 Sep 2022 14:25:10 -0400
X-MC-Unique: k2Q_3aygP4CWHpV1psn_zA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y12-20020a056402358c00b00448898f1c33so7846075edc.7
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8y4hw7LCcErvSdS+ZvnaUckc9XcwWhxtwwZgfJ6Be48=;
 b=pwArwFXKh5z70GPd9QrO3vTjq1OKhcS1X8Swq5at1VR4iGx2DfVtxZwjjBfANXUMqm
 p8X4uFSGih6vmu8Sch1EnE8q95AWXqUQUlXOgxZXXxOMcx36xTQqrnkjVlNwiFFPTXh4
 u7E+AoaNH5C1xjiWwlOdMDhe1qesvbHMCxBy/+LESFDfXJVDH/iK7uumcU+Ys9+RBrha
 EqvJWuZ/IsADtVCWUmeb0PLUAaZi9inM0S6o8o1FwQdJxmILlRA37uiZg2fo+JbzR2wW
 ofLMWrsgLNx/yjzfAD6ucAqG2VldKOWYsKPq+JAVPEyeaeYaNCxRPIsb4quE8JFXWwT3
 GMGw==
X-Gm-Message-State: ACgBeo3VM9jNgG7ZS6i11WG8ZUBq28pLMqeKQrhe4kHf8RePMhCnlOQR
 f27vWO7W9UR58xHDDxzDP60/HYQ+a0tMEm6G+SFcfqty5rD7qC1/A8HKWDbeg8OxNdMus2R8wRR
 h5VgpCUSqh4Ra763QS/0egpzkhb/NP/1ntB1IKSVQEbYG/4Q46LCwcbsnIRBFLefz7/g=
X-Received: by 2002:a05:6402:510e:b0:448:9d4b:c760 with SMTP id
 m14-20020a056402510e00b004489d4bc760mr15096038edd.156.1662056707629; 
 Thu, 01 Sep 2022 11:25:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7xZHLZZVBogylA2eyzzgQxCmYds6cyyT/inret+cPJOoGo79fQyUjoun3KzKpE1tXdKBQRZA==
X-Received: by 2002:a05:6402:510e:b0:448:9d4b:c760 with SMTP id
 m14-20020a056402510e00b004489d4bc760mr15096022edd.156.1662056707347; 
 Thu, 01 Sep 2022 11:25:07 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 lo5-20020a170906fa0500b0073cf8e0355fsm8696769ejb.208.2022.09.01.11.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/39] target/i386: Add ZMM_OFFSET macro
Date: Thu,  1 Sep 2022 20:24:08 +0200
Message-Id: <20220901182429.93533-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Paul Brook <paul@nowt.org>

Add a convenience macro to get the address of an xmm_regs element within
CPUX86State.

This was originally going to be the basis of an implementation that broke
operations into 128 bit chunks. I scrapped that idea, so this is now a purely
cosmetic change. But I think a worthwhile one - it reduces the number of
function calls that need to be split over multiple lines.

No functional changes.

Signed-off-by: Paul Brook <paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220424220204.2493824-9-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 60 +++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 25a2539d59..cba862746b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2777,6 +2777,8 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
 }
 
+#define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
+
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
@@ -3198,13 +3200,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            gen_sto_env_A0(s, ZMM_OFFSET(reg));
             break;
         case 0x3f0: /* lddqu */
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
@@ -3240,15 +3242,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
                 gen_helper_movq_mm_T0_xmm(s->ptr0, s->T0);
             } else
 #endif
             {
                 gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_movl_mm_T0_xmm(s->ptr0, s->tmp2_i32);
             }
@@ -3273,11 +3273,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x26f: /* movdqu xmm, ea */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
-                            offsetof(CPUX86State,xmm_regs[rm]));
+                gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(rm));
             }
             break;
         case 0x210: /* movss xmm, ea */
@@ -3333,7 +3332,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
@@ -3375,7 +3374,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x216: /* movshdup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
@@ -3397,8 +3396,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     goto illegal_op;
                 field_length = x86_ldub_code(env, s) & 0x3F;
                 bit_index = x86_ldub_code(env, s) & 0x3F;
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                    offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
                 if (b1 == 1)
                     gen_helper_extrq_i(cpu_env, s->ptr0,
                                        tcg_const_i32(bit_index),
@@ -3467,11 +3465,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x27f: /* movdqu ea, xmm */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_sto_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
-                            offsetof(CPUX86State,xmm_regs[reg]));
+                gen_op_movo(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg));
             }
             break;
         case 0x211: /* movss ea, xmm */
@@ -3549,7 +3546,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             if (is_xmm) {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             } else {
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
@@ -3560,15 +3557,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x050: /* movmskps */
             rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
             gen_helper_movmskps(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x150: /* movmskpd */
             rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
             gen_helper_movmskpd(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
@@ -3583,7 +3578,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             switch(b >> 8) {
@@ -3600,7 +3595,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x32a: /* cvtsi2sd */
             ot = mo_64_32(s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             if (ot == MO_32) {
                 SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
@@ -3626,7 +3621,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_ldo_env_A0(s, op2_offset);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
             op1_offset = offsetof(CPUX86State,fpregs[reg & 7].mmx);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
@@ -3663,7 +3658,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op2_offset = offsetof(CPUX86State,xmm_t0);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
             if (ot == MO_32) {
@@ -3749,8 +3744,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 goto illegal_op;
             if (b1) {
                 rm = (modrm & 7) | REX_B(s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[rm]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
                 gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             } else {
                 rm = (modrm & 7);
@@ -3782,9 +3776,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 goto illegal_op;
 
             if (b1) {
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+                op1_offset = ZMM_OFFSET(reg);
                 if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
+                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
                 } else {
                     op2_offset = offsetof(CPUX86State,xmm_t0);
                     gen_lea_modrm(env, s, modrm);
@@ -4347,9 +4341,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
 
             if (b1) {
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+                op1_offset = ZMM_OFFSET(reg);
                 if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
+                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
                 } else {
                     op2_offset = offsetof(CPUX86State,xmm_t0);
                     gen_lea_modrm(env, s, modrm);
@@ -4429,7 +4423,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         }
         if (is_xmm) {
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             if (mod != 3) {
                 int sz = 4;
 
@@ -4476,7 +4470,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
         } else {
             op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
-- 
2.37.2



