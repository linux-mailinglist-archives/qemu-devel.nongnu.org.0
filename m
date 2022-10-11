Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6A5FB17F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:32:03 +0200 (CEST)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDUQ-0002C2-Kf
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUg-0002Zz-Nm
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUe-0004bT-M3
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ote6W2AaAueogA+kCN16Qi/cdYSCsB0VLtYcDEY5NYo=;
 b=ELi4SbmyPd+ezDGH4EqQTfsaJhBeAou9ec6FtJMf9A74qUeKVKfDb6rTWXoz5G9OsY3ud5
 63NMPjpi+Hxb91KFeBTg887qmF5hCRj1b8mOI2xtDszYl9u4Jd0CmVAikZOg9ZzObvhm/h
 QzxcN3U9oS0doY72F51ucOG4TfwXH4A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-D5aM4FIrMwWCpPs0Q_Czag-1; Tue, 11 Oct 2022 06:28:11 -0400
X-MC-Unique: D5aM4FIrMwWCpPs0Q_Czag-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr29-20020a1709073f9d00b0078333782c48so5666850ejc.10
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ote6W2AaAueogA+kCN16Qi/cdYSCsB0VLtYcDEY5NYo=;
 b=eh85QKhPzkEc1Z2GtprLvTByMV2Ks5q6A4lWoSRzxstdU7vnxv21gz7nFe6VQ+PJMO
 56ukNwHwmPZWfpkl71hxoicB+MJXYAtbQ3jqInpz85kNVS+oCWlFYW2Uopce9sdUBzP7
 Vyh1T3GyuvrEgwtZbB8QvZ2SwDtJ6wgzB1zk5ZlDKvY/quqpwpFIuwL11cwIdaJrfoAP
 DbslAwwfo5d/96axtlhnN8XKiLzGgA2uoNZZAQzrUveVDZgzzFefMwiO8nXbiH4l4dff
 +AvXRRKQS9CG9We+BauCaRKm5OZqfxGEYccekuLfwzOG/hofsKyJYNlzhLbSHqaU8B5c
 HWUg==
X-Gm-Message-State: ACrzQf1ORSFoEeuArZjJ6c//fZE3hl54nu+Rq9jp3lAFwX6Jrj695YR2
 XgB5/0ZPr3wc75tpeQ1YjClXhSj8/6VUTyz8jQV13iay8LI8ha04GxNY9KGzeNlrBwg6K15R0FY
 NJmlsp4wlFRYRwp2aXGlnDurhgX99vFU5aAIfKIhToWQCcIwDUoCLVeRM1OAPdTDbW+U=
X-Received: by 2002:a05:6402:3408:b0:43c:2dd3:d86b with SMTP id
 k8-20020a056402340800b0043c2dd3d86bmr22405179edc.108.1665484089243; 
 Tue, 11 Oct 2022 03:28:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vsO5GCs68gNsznCCi8R9O3TXrbFt95hXrP/Y/1aO06ICmuSAXNHrgN9MZrKOq/Ol33NtyxQ==
X-Received: by 2002:a05:6402:3408:b0:43c:2dd3:d86b with SMTP id
 k8-20020a056402340800b0043c2dd3d86bmr22405162edc.108.1665484088940; 
 Tue, 11 Oct 2022 03:28:08 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 bm22-20020a0564020b1600b0044f21c69608sm8779170edb.10.2022.10.11.03.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 23/37] target/i386: Use gen_jmp_rel for loop, repz, jecxz insns
Date: Tue, 11 Oct 2022 12:26:46 +0200
Message-Id: <20221011102700.319178-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
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

From: Richard Henderson <richard.henderson@linaro.org>

With gen_jmp_rel, we may chain to the next tb instead of merely
writing to eip and exiting.  For repz, subtract cur_insn_len to
restart the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-19-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ba1bd7c707..434a6ad6cd 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -224,9 +224,9 @@ STUB_HELPER(wrmsr, TCGv_env env)
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
-static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
+static void gen_jmp_rel_csize(DisasContext *s, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
 static void gen_exception_gpf(DisasContext *s);
 
@@ -1185,7 +1185,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s)
     TCGLabel *l2 = gen_new_label();
     gen_op_jnz_ecx(s, s->aflag, l1);
     gen_set_label(l2);
-    gen_jmp_tb(s, s->pc - s->cs_base, 1);
+    gen_jmp_rel_csize(s, 0, 1);
     gen_set_label(l1);
     return l2;
 }
@@ -1288,7 +1288,7 @@ static void gen_repz(DisasContext *s, MemOp ot,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ(op) \
@@ -1308,7 +1308,7 @@ static void gen_repz2(DisasContext *s, MemOp ot, int nz,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ2(op) \
@@ -2793,6 +2793,7 @@ static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
     }
 }
 
+/* Jump to eip+diff, truncating the result to OT. */
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
 {
     target_ulong dest = s->pc - s->cs_base + diff;
@@ -2808,9 +2809,11 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_jmp_tb(s, dest, tb_num);
 }
 
-static void gen_jmp(DisasContext *s, target_ulong eip)
+/* Jump to eip+diff, truncating to the current code size. */
+static void gen_jmp_rel_csize(DisasContext *s, int diff, int tb_num)
 {
-    gen_jmp_tb(s, eip, 0);
+    /* CODE64 ignores the OT argument, so we need not consider it. */
+    gen_jmp_rel(s, CODE32(s) ? MO_32 : MO_16, diff, tb_num);
 }
 
 static inline void gen_ldq_env_A0(DisasContext *s, int offset)
@@ -7404,24 +7407,18 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe2: /* loop */
     case 0xe3: /* jecxz */
         {
-            TCGLabel *l1, *l2, *l3;
-
-            tval = (int8_t)insn_get(env, s, MO_8);
-            tval += s->pc - s->cs_base;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            }
+            TCGLabel *l1, *l2;
+            int diff = (int8_t)insn_get(env, s, MO_8);
 
             l1 = gen_new_label();
             l2 = gen_new_label();
-            l3 = gen_new_label();
             gen_update_cc_op(s);
             b &= 3;
             switch(b) {
             case 0: /* loopnz */
             case 1: /* loopz */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jz_ecx(s, s->aflag, l3);
+                gen_op_jz_ecx(s, s->aflag, l2);
                 gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
                 break;
             case 2: /* loop */
@@ -7434,14 +7431,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
 
-            gen_set_label(l3);
-            gen_update_eip_next(s);
-            tcg_gen_br(l2);
+            gen_set_label(l2);
+            gen_jmp_rel_csize(s, 0, 1);
 
             gen_set_label(l1);
-            gen_jmp_im(s, tval);
-            gen_set_label(l2);
-            s->base.is_jmp = DISAS_EOB_ONLY;
+            gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x130: /* wrmsr */
-- 
2.37.3


