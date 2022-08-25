Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC95A1C75
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:34:04 +0200 (CEST)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLQJ-000274-M1
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7S-0007t1-5o
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7Q-0002jU-7Y
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FB59XRn/4rhbAc9MXwLjZSTAewawaN9JxBrC3G+b+YA=;
 b=V+PiOZnsabIB0EWdMM5tXuh1iXtOhi7tQlOlk11jZtzqG8jWKdGjaRDiocCyfhxX9OKRx5
 o32+RlESTjnFT9CEbtMJwG5IByFiFzOhDpFzqP0WWFdEAqkK4hEmF/BXxH6+UIm6UGlLHX
 osOL+nmkGmoPezA0kfTQGwGvkvk47xg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-OKC8--P-Ocq1IwHyVdNA7A-1; Thu, 25 Aug 2022 18:14:22 -0400
X-MC-Unique: OKC8--P-Ocq1IwHyVdNA7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a5bff0df8dso3114256wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FB59XRn/4rhbAc9MXwLjZSTAewawaN9JxBrC3G+b+YA=;
 b=LQjUadw9tGS+twE96nF76c5PaxuTMuJHhNKXn62hJlSN/uZqTG7CM+Qx8VwyEBW6+1
 O3kczrfHlPRgRQcTwods5F6fYcsya+oRZhvR1Zky9Kb+7SbZt0gIXOg/MVTU9v/LquCu
 xC2lVLB1czb5q0Hg5O3ZiSoacemfn5rTcLr7Hc1Gi5nAQcOy9BdJ/ErIm6NUWhMe6TjT
 SP8Pd+0PbLxNWlbNkj4gkkifRv+C52WtdyhZbTL+o3CeR1vO4MiOHM7Mrk5mNjcvilkX
 Wm+w5ECpZd/A2kBO0RY7S4DTtwHRYKlkGqvmhZHqCgGezDGFbp9h6z3PtAQCpQ3zXNOE
 AFmg==
X-Gm-Message-State: ACgBeo0cg54h3s+r5JgR3wnOMKkMdo3y9IJndYUSPYVUeCG4JTQ+fHmy
 EXrGQTQq1nmA60TUZ/tIS1wmThrEa5OBDreIQxcWlur2xFrGOrg8LZrTMYiG0JAz/8RIsAGpEZJ
 60tvxMhEJeVuIJXGi3vxI4OHm7br/fBHeoPk4fFNkfthBbnJ/I9Aa0PzlgP/kFiYmDdg=
X-Received: by 2002:a5d:68c9:0:b0:225:330b:2d0 with SMTP id
 p9-20020a5d68c9000000b00225330b02d0mr3118175wrw.243.1661465661397; 
 Thu, 25 Aug 2022 15:14:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5IDBgpGLb+oNbKyvRSHscpiy8dFPFamsD1Sc5J9F8u5xX668PUMI9ODViJetjiKMhUmFu2iA==
X-Received: by 2002:a5d:68c9:0:b0:225:330b:2d0 with SMTP id
 p9-20020a5d68c9000000b00225330b02d0mr3118162wrw.243.1661465661093; 
 Thu, 25 Aug 2022 15:14:21 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b002252cb35184sm324503wrf.25.2022.08.25.15.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 05/18] i386: Add ZMM_OFFSET macro
Date: Fri, 26 Aug 2022 00:13:58 +0200
Message-Id: <20220825221411.35122-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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
index a51a5daff9..57e2f8acdb 100644
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
@@ -3286,13 +3288,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3329,15 +3331,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3363,11 +3363,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3421,7 +3420,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
@@ -3463,7 +3462,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x216: /* movshdup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
@@ -3486,8 +3485,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     goto illegal_op;
                 field_length = x86_ldub_code(env, s) & 0x3F;
                 bit_index = x86_ldub_code(env, s) & 0x3F;
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                    offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
                 if (b1 == 1)
                     gen_helper_extrq_i(cpu_env, s->ptr0,
                                        tcg_const_i32(bit_index),
@@ -3558,11 +3556,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3641,7 +3638,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             if (is_xmm) {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             } else {
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
@@ -3652,15 +3649,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3676,7 +3671,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             switch(b >> 8) {
@@ -3693,7 +3688,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x32a: /* cvtsi2sd */
             ot = mo_64_32(s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             if (ot == MO_32) {
                 SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
@@ -3720,7 +3715,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_ldo_env_A0(s, op2_offset);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
             op1_offset = offsetof(CPUX86State,fpregs[reg & 7].mmx);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
@@ -3757,7 +3752,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op2_offset = offsetof(CPUX86State,xmm_t0);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
             if (ot == MO_32) {
@@ -3846,8 +3841,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 goto illegal_op;
             if (b1) {
                 rm = (modrm & 7) | REX_B(s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[rm]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
                 gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             } else {
                 CHECK_NO_VEX(s);
@@ -3881,9 +3875,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -4459,9 +4453,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -4545,7 +4539,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         }
         if (is_xmm) {
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             if (mod != 3) {
                 int sz = 4;
 
@@ -4592,7 +4586,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
         } else {
             CHECK_NO_VEX(s);
-- 
2.37.1



