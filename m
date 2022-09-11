Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F485B51D2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:13:34 +0200 (CEST)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW8r-0004n1-ES
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0D-0000Ez-CQ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0A-0006yS-B9
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwEYZBWmHjd2XtwWa6PPS2NYjgVIiAYmrjnQD3uHZlg=;
 b=eaBxd1kPuNVM8KdfoUC1EsqP0pve6jidxvOOyfk0cWzvLPhTE58rTSWKTuxhrdW+EORyb1
 t7c42AXXI6Ajr1vRTrlN5+wtyFmNGPsORLZp+ikYjQaPPNNlPV68zwtf4a3pnInAQBNcQR
 8YZcchGLEgMNXnQMxEz9FHadkvG+2DU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-nDqyeB52MVyoxDKJ-eZ-sg-1; Sun, 11 Sep 2022 19:04:29 -0400
X-MC-Unique: nDqyeB52MVyoxDKJ-eZ-sg-1
Received: by mail-ej1-f72.google.com with SMTP id
 sg37-20020a170907a42500b0077969e994f2so2297516ejc.9
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nwEYZBWmHjd2XtwWa6PPS2NYjgVIiAYmrjnQD3uHZlg=;
 b=Obpe4QnxepHUmHl+ks07ir5w8SPZCY/fS6t8BIhB0OkNEaCrK1aO59XcfmcyWXzjee
 JOm0ztfJ10jcifd/onIiO+YbNk/sjRTlRIpHqONWG42utSgENUipMt7lrPgj+V4GXG1x
 QGOMey29gASjQvgicsemQ3sZnE/jt0q2sjTwffcW3gHGWRy+2sthOkWmeZshyzp1tl5S
 +ANqr5V5epqss0GHpN3V5hJSq8lzenOVh0uYoJuOJvIBykne7pJLE0KA5UM210SklNgP
 KPuVrIPTtn4rVrn2LlhTYTW0EqIvkmFe8m78Jk+ExvuL7Iy9f5G8876/ZfpRqKJ+6HoR
 HfOg==
X-Gm-Message-State: ACgBeo3Eh4dgFujsoMO3xkmbp1Gt2MEMqBjyWExeaAgN8gZBw8Y2x3lj
 namAr2BRj/llcNsemttXqt7zMtHewYMqo6WdoEHValV8jObr0GFl7ZZFAzgcbDfKopIYQKpfBE7
 FLv8wLkZsrJ4ONemFiMsIja+f+MdAC8gKWWJUkvHAePTm1kJYY7GiKIXRBJV+lrqeO3c=
X-Received: by 2002:a05:6402:11d0:b0:44e:ec42:e0b8 with SMTP id
 j16-20020a05640211d000b0044eec42e0b8mr20161750edw.131.1662937468037; 
 Sun, 11 Sep 2022 16:04:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR51MYqIvdvmNjz+FYo35G+RLoXTcHcU3Kgw+58XdLV8YAUpu47BzBkdkfdxVU0tFkdgch+KIg==
X-Received: by 2002:a05:6402:11d0:b0:44e:ec42:e0b8 with SMTP id
 j16-20020a05640211d000b0044eec42e0b8mr20161740edw.131.1662937467668; 
 Sun, 11 Sep 2022 16:04:27 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a1709064b5500b00776bd41529esm3498165ejv.155.2022.09.11.16.04.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/37] target/i386: make ldo/sto operations consistent with ldq
Date: Mon, 12 Sep 2022 01:03:42 +0200
Message-Id: <20220911230418.340941-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
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

ldq takes a pointer to the first byte to load the 64-bit word in;
ldo takes a pointer to the first byte of the ZMMReg.  Make them
consistent, which will be useful in the new SSE decoder's
load/writeback routines.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 001af76663..9a85010dcd 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2761,28 +2761,29 @@ static inline void gen_ldo_env_A0(DisasContext *s, int offset)
 {
     int mem_index = s->mem_index;
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(0)));
     tcg_gen_addi_tl(s->tmp0, s->A0, 8);
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(1)));
 }
 
 static inline void gen_sto_env_A0(DisasContext *s, int offset)
 {
     int mem_index = s->mem_index;
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
+    offset -= offsetof(ZMMReg, ZMM_Q(0));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(0)));
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
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
@@ -2804,6 +2805,7 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
 }
 
 #define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
+#define XMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg].ZMM_X(0))
 
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
@@ -3317,13 +3319,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, ZMM_OFFSET(reg));
+            gen_sto_env_A0(s, XMM_OFFSET(reg));
             break;
         case 0x3f0: /* lddqu */
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+            gen_ldo_env_A0(s, XMM_OFFSET(reg));
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
@@ -3392,10 +3394,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x26f: /* movdqu xmm, ea */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                gen_ldo_env_A0(s, XMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(rm));
+                gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(rm));
             }
             break;
         case 0x210: /* movss xmm, ea */
@@ -3451,7 +3453,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                gen_ldo_env_A0(s, XMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
@@ -3493,7 +3495,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x216: /* movshdup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                gen_ldo_env_A0(s, XMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
@@ -3587,10 +3589,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x27f: /* movdqu ea, xmm */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, ZMM_OFFSET(reg));
+                gen_sto_env_A0(s, XMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg));
+                gen_op_movo(s, XMM_OFFSET(rm), XMM_OFFSET(reg));
             }
             break;
         case 0x211: /* movss ea, xmm */
@@ -3742,7 +3744,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
+                op2_offset = offsetof(CPUX86State,xmm_t0.ZMM_X(0));
                 gen_ldo_env_A0(s, op2_offset);
             } else {
                 rm = (modrm & 7) | REX_B(s);
@@ -3906,9 +3908,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
 
             if (b1) {
-                op1_offset = ZMM_OFFSET(reg);
+                op1_offset = XMM_OFFSET(reg);
                 if (mod == 3) {
-                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
+                    op2_offset = XMM_OFFSET(rm | REX_B(s));
                 } else {
                     op2_offset = offsetof(CPUX86State,xmm_t0);
                     gen_lea_modrm(env, s, modrm);
@@ -4516,7 +4518,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod == 3) {
                 op2_offset = ZMM_OFFSET(rm | REX_B(s));
             } else {
-                op2_offset = offsetof(CPUX86State, xmm_t0);
+                op2_offset = offsetof(CPUX86State, xmm_t0.ZMM_X(0));
                 gen_lea_modrm(env, s, modrm);
                 gen_ldo_env_A0(s, op2_offset);
             }
@@ -4625,7 +4627,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     break;
                 default:
                     /* 128 bit access */
-                    gen_ldo_env_A0(s, op2_offset);
+                    gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_X(0)));
                     break;
                 }
             } else {
-- 
2.37.2



