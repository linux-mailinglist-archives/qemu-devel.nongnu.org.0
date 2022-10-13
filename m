Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80245FE48C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:52:46 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj68D-0008KK-J0
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62m-0002Sp-0K
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62k-0005BX-4L
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1Qr8/T6Q2NpqQHQJDLdWR/xvdeIlZ+M0wCk1UAdl9w=;
 b=eIxBXlNxXRdrICUh0ezhra+RVi4MC6BQhMwecSuR4Z6JCx8b76VlmrHi2w6WmnXJx6Y23b
 ZrgJVHoifSL0VcKqc0yvE+v7ta9Z3S99oTdhW7FFpCoYyd9KkCobb2iSPjaNjDionsDJEH
 z6VNIgkxAURHNLbhYj37vV7ah9vl8Dk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-BkAU6dinPruTn3X8CvYL8w-1; Thu, 13 Oct 2022 17:47:03 -0400
X-MC-Unique: BkAU6dinPruTn3X8CvYL8w-1
Received: by mail-ed1-f70.google.com with SMTP id
 r16-20020a05640251d000b004599cfb8b95so2314221edd.5
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1Qr8/T6Q2NpqQHQJDLdWR/xvdeIlZ+M0wCk1UAdl9w=;
 b=XD9z87Dp71uHGSfYMLVAXppCb7ET/zNCXgSHpxkdIcujgADunnsCCmUZsGhXFULpvC
 pLHm75zM22C2N24EHdkLpQ82UUrK8DjCdlYWVDgIjQeks2nTwMAUUMZi5Dq9T3RcAjrt
 A2civD79gu8SS6dgSqKmSUli6ekWQGbeLp9to5cLdH6qoPYHo4kIvwXp6ug2S5qJ2bb6
 GwlY9/WHs5NJ4Dmp87UvC9lbmVGJufkUv620xJkvHcUEfMsmSKmlVC22RsJCwdBh3r2U
 aQhP0Pv16dDrmZjN+6ndLVc1mROH2Dg0Z8Bxk1rEdpa4SaB2iuRF3MaO7u4kmcwQMO81
 MOMw==
X-Gm-Message-State: ACrzQf09eg+eBfaofMEpXnHDWmdDjI+M2dRV09SAK2ectdKl9O/wZE1v
 omrRO+i0y7DL3+WlJhRRlmENhc7SZKAHI1a3PQ0DhY7CXQersvGWG7i2jMRBm6w2awJuJ6KLSMZ
 tj0jwDGKvScaxYHPimYfTeV3fjRc+HR3/NDpYs55mk+/mUUC9Tt1mstR9wjzeuJyL0kg=
X-Received: by 2002:a05:6402:1555:b0:458:ed89:24e9 with SMTP id
 p21-20020a056402155500b00458ed8924e9mr1563709edx.55.1665697621699; 
 Thu, 13 Oct 2022 14:47:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FV9uVqs9/7Tsi0HxZdhPfVRRDqUv2p8o69TsEsnNy+uxQa1vi8xwzcOTN+aEcykyeiIPtcg==
X-Received: by 2002:a05:6402:1555:b0:458:ed89:24e9 with SMTP id
 p21-20020a056402155500b00458ed8924e9mr1563698edx.55.1665697621422; 
 Thu, 13 Oct 2022 14:47:01 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a170906191000b0078ae49ad169sm464286eje.91.2022.10.13.14.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 02/35] target/i386: make ldo/sto operations consistent with ldq
Date: Thu, 13 Oct 2022 23:46:18 +0200
Message-Id: <20221013214651.672114-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
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

ldq takes a pointer to the first byte to load the 64-bit word in;
ldo takes a pointer to the first byte of the ZMMReg.  Make them
consistent, which will be useful in the new SSE decoder's
load/writeback routines.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 43 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 279a3ae999..41ee9450db 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2868,29 +2868,29 @@ static inline void gen_ldo_env_A0(DisasContext *s, int offset, bool align)
     int mem_index = s->mem_index;
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index,
                         MO_LEUQ | (align ? MO_ALIGN_16 : 0));
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(0)));
     tcg_gen_addi_tl(s->tmp0, s->A0, 8);
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(1)));
 }
 
 static inline void gen_sto_env_A0(DisasContext *s, int offset, bool align)
 {
     int mem_index = s->mem_index;
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(0)));
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index,
                         MO_LEUQ | (align ? MO_ALIGN_16 : 0));
     tcg_gen_addi_tl(s->tmp0, s->A0, 8);
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(1)));
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
 }
 
 static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
 {
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(0)));
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(0)));
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(1)));
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(XMMReg, XMM_Q(0)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(XMMReg, XMM_Q(0)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(XMMReg, XMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(XMMReg, XMM_Q(1)));
 }
 
 static inline void gen_op_movq(DisasContext *s, int d_offset, int s_offset)
@@ -2912,6 +2912,7 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
 }
 
 #define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
+#define XMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg].ZMM_X(0))
 
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
@@ -3424,13 +3425,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, ZMM_OFFSET(reg), true);
+            gen_sto_env_A0(s, XMM_OFFSET(reg), true);
             break;
         case 0x3f0: /* lddqu */
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, ZMM_OFFSET(reg), false);
+            gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
@@ -3499,12 +3500,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         case 0x26f: /* movdqu xmm, ea */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg),
+                gen_ldo_env_A0(s, XMM_OFFSET(reg),
                                /* movaps, movapd, movdqa */
                                b == 0x028 || b == 0x128 || b == 0x16f);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(rm));
+                gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(rm));
             }
             break;
         case 0x210: /* movss xmm, ea */
@@ -3560,7 +3561,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg), true);
+                gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
@@ -3602,7 +3603,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         case 0x216: /* movshdup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg), true);
+                gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
@@ -3706,12 +3707,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         case 0x27f: /* movdqu ea, xmm */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, ZMM_OFFSET(reg),
+                gen_sto_env_A0(s, XMM_OFFSET(reg),
                                /* movaps, movapd, movdqa */
                                b == 0x029 || b == 0x129 || b == 0x17f);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg));
+                gen_op_movo(s, XMM_OFFSET(rm), XMM_OFFSET(reg));
             }
             break;
         case 0x211: /* movss ea, xmm */
@@ -3863,7 +3864,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
+                op2_offset = offsetof(CPUX86State, xmm_t0.ZMM_X(0));
                 /* FIXME: should be 64-bit access if b1 == 0.  */
                 gen_ldo_env_A0(s, op2_offset, !!b1);
             } else {
@@ -4055,10 +4056,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
                                         offsetof(ZMMReg, ZMM_W(0)));
                         break;
                     case 0x2a:            /* movntdqa */
-                        gen_ldo_env_A0(s, op1_offset, true);
+                        gen_ldo_env_A0(s, op1_offset + offsetof(ZMMReg, ZMM_X(0)), true);
                         return;
                     default:
-                        gen_ldo_env_A0(s, op2_offset, true);
+                        gen_ldo_env_A0(s, op2_offset + offsetof(ZMMReg, ZMM_X(0)), true);
                     }
                 }
                 if (!op6->fn[b1].op1) {
@@ -4640,7 +4641,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
             } else {
                 op2_offset = offsetof(CPUX86State, xmm_t0);
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, op2_offset, true);
+                gen_ldo_env_A0(s, op2_offset + offsetof(ZMMReg, ZMM_X(0)), true);
             }
 
             val = x86_ldub_code(env, s);
@@ -4747,7 +4748,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
                     break;
                 default:
                     /* 128 bit access */
-                    gen_ldo_env_A0(s, op2_offset, true);
+                    gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_X(0)), true);
                     break;
                 }
             } else {
-- 
2.37.3


