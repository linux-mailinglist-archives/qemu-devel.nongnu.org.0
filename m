Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C95BEF3D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:37:32 +0200 (CEST)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakvr-0006kd-Ay
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzp-0006Ja-EK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzm-00022T-Gz
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18z5vF7zZEAhYiakuZ5NSGXaQJ0lYrU3mqUdyfIIYa4=;
 b=F87vfb4UPiurq6AgoTroURfloV0vBE47TIX8MbM2Sxu0NbU7j62y8dFaN5YBYYk63Aefhx
 y5/Ct+Yy4aEeGZE5r/BFWejAtjiCKzDG6dKrnB85yKzo4o7B8e6pPDV31/KVkfEDpzq6Av
 WRPhLMVSmeb6itv/WNJKPxz+HG+FJQI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-43j1AU_rNe2iPtyLfT9q9w-1; Tue, 20 Sep 2022 13:25:14 -0400
X-MC-Unique: 43j1AU_rNe2iPtyLfT9q9w-1
Received: by mail-ej1-f70.google.com with SMTP id
 sb32-20020a1709076da000b0077faea20701so1777090ejc.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=18z5vF7zZEAhYiakuZ5NSGXaQJ0lYrU3mqUdyfIIYa4=;
 b=tZpy1AVSivV9fQEti/bISrczzS8e9p8f1lgdHjtpCMVoGWWNFGguPcrU4bXlHFEuIm
 /G7D9qO4syfmzPSRESUGX25PYMbY0FAqSd8oIriWkfjyT6RPrwq3qdUNYiLx1a2FP64T
 FoLf8sQgkna4g5tnMC7TzKZHOyROwE9kYD916g5DxIfxoCcs8fA/xUZkZ0WBkvcn9t5W
 SllUy/rwW+9bqWm0iEnCNjDRwaV0sA0redSb6GOtDbWnXZMbXaCPXy+ALH+ecSUcl965
 WPfyqsCBxn6IwezZKNM54W4lfOhw9NpIr9roTj3RtJBU2k+Yzl8DcVHhMjKiBPoS3goi
 I5qQ==
X-Gm-Message-State: ACrzQf1aWUzBJJT+/+FgCOMKmK2NDPzZbosYU8/vs+AGaIfa3RBk2BvW
 t4j4Hyvs+izCaBauyGVZeJzkL9qSc7MHACLlar3HTBDHD7dGmoGmOR02hxSzvlfA9kgj0HYO5Gp
 xEwnzBnOcPjm6X1bmrC0RUJ43eGsUfoC9dF/Y6yP67+i2tLjtq1eoAunsfAxwdz95HRA=
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id
 g12-20020a056402428c00b0044082597a2bmr20578276edc.329.1663694713204; 
 Tue, 20 Sep 2022 10:25:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5F8p9se+aE17/voopZugN2PLS2HevN4jQLpd9okvj82bBh26EvNRCf6mpQdzRrLSJCsdMPzg==
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id
 g12-20020a056402428c00b0044082597a2bmr20578242edc.329.1663694712790; 
 Tue, 20 Sep 2022 10:25:12 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t17-20020aa7db11000000b00453a49ea65bsm154699eds.86.2022.09.20.10.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 02/37] target/i386: make ldo/sto operations consistent with
 ldq
Date: Tue, 20 Sep 2022 19:24:32 +0200
Message-Id: <20220920172507.95568-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 43 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b25109ea24..6802c5a96d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2762,29 +2762,29 @@ static inline void gen_ldo_env_A0(DisasContext *s, int offset, bool align)
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
@@ -2806,6 +2806,7 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
 }
 
 #define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
+#define XMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg].ZMM_X(0))
 
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
@@ -3319,13 +3320,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3394,12 +3395,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3455,7 +3456,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg), true);
+                gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
@@ -3497,7 +3498,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x216: /* movshdup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg), true);
+                gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
@@ -3601,12 +3602,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -3758,7 +3759,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
+                op2_offset = offsetof(CPUX86State, xmm_t0.ZMM_X(0));
                 /* FIXME: should be 64-bit access if b1 == 0.  */
                 gen_ldo_env_A0(s, op2_offset, !!b1);
             } else {
@@ -3950,10 +3951,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -4535,7 +4536,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 op2_offset = offsetof(CPUX86State, xmm_t0);
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, op2_offset, true);
+                gen_ldo_env_A0(s, op2_offset + offsetof(ZMMReg, ZMM_X(0)), true);
             }
 
             val = x86_ldub_code(env, s);
@@ -4642,7 +4643,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     break;
                 default:
                     /* 128 bit access */
-                    gen_ldo_env_A0(s, op2_offset, true);
+                    gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_X(0)), true);
                     break;
                 }
             } else {
-- 
2.37.2


