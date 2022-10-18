Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66364602D9D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:06 +0200 (CEST)
Received: from localhost ([::1]:57366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6Z-0005JO-Gx
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhI-0003T0-4p
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhF-000575-SX
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oc1sRBtOXv+SeliZwXtm5zuza9PKebWIQDt4DQiKTqU=;
 b=TSvrOi3POU7jYCw5o3fVUWww1J5Lxgl/1/xTAtxE7NcsgIRnAPfHNO9+0sxrcyvhOOEYWu
 hU0hvbkbjuPQgPYoNxiG7ksZeCWSKQBY3rc/YTlIaYQr65ljUUC326UVXSmLivQ1PEvHu6
 cVtPcxxwIv58Ly4ACqO/oTecs1KYPZs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-E_FxTZmZNyOC3CHAt78oHw-1; Tue, 18 Oct 2022 09:31:51 -0400
X-MC-Unique: E_FxTZmZNyOC3CHAt78oHw-1
Received: by mail-ed1-f70.google.com with SMTP id
 w20-20020a05640234d400b0045d0d1afe8eso10131771edc.15
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oc1sRBtOXv+SeliZwXtm5zuza9PKebWIQDt4DQiKTqU=;
 b=dFRcXB9TWHwU9enqKIi9oeEcgeCRPVZGsFe4Div+Yxwyxan91pFyWQo2dTCcPK/A70
 HkDXLodR4IlrIJWlhQCQMBSIjXF1ysS9HmZQLMC48qOcZaRhwoiB0enKZB2HUbqBQgdo
 Xff0jpww1PRjk8WpmlBUvg2RRdmLvloqL+4Gwv24kDi8Z32YudIzSimLEv22PpB31BS1
 P3LdmDeU4rdbJvJYG80p7eLwhdW5W1QM+5k2EE/JsDsLE14hoEmC2MO84dG4L10ONUZ3
 NbJDiACLKfjSAfHlK5Nw9mIMJZf1vwl94pLXN9Rq3R37XIzNAt6LVO41F+F7i9MMTsu1
 0sUA==
X-Gm-Message-State: ACrzQf2FHnf19fbQwcvKGlYY+cAbeJJHVDjCLE6X8iTXnQie6UOeFpBv
 CoWWnH8licVETkoSaXZRNvNg5ZaaaP3TTaoJnFJl4tAXXNd6UpHkqcQQDiUNIx4AU/wsgpvA40V
 nONR1u3VayF5oBvUnT1yi1XcX0YcfIfiPSmumqQDOiTk4o+dOL21pM18YfWym1tqWogU=
X-Received: by 2002:a17:906:4786:b0:78d:b793:5bf6 with SMTP id
 cw6-20020a170906478600b0078db7935bf6mr2491001ejc.222.1666099909914; 
 Tue, 18 Oct 2022 06:31:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jWRco2K4gCJzTdieuZbQnRiKEVysH68L1BOcqfQBIWTjosTRdc2IXzy4N9CGltvlzSb9Ppw==
X-Received: by 2002:a17:906:4786:b0:78d:b793:5bf6 with SMTP id
 cw6-20020a170906478600b0078db7935bf6mr2490973ejc.222.1666099909534; 
 Tue, 18 Oct 2022 06:31:49 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 kw8-20020a170907770800b007821f4bc328sm7701156ejc.178.2022.10.18.06.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 19/53] target/i386: make ldo/sto operations consistent with ldq
Date: Tue, 18 Oct 2022 15:30:08 +0200
Message-Id: <20221018133042.856368-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 75ca99084e..1b96201685 100644
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


