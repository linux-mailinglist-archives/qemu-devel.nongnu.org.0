Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD25FB14A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:16:59 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDFq-0008Hu-PN
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUv-0002pN-Ot
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUm-0004dM-TK
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrWqTWcEMDRoPxbx50bbd53b/m9uxh55LIU7TOsyOQ0=;
 b=CQprChcJHL8k7MijvTM5NkWfQAHYMbtmNjvAEjTom/Noczz+fRTR5umNOZ3sBAjrXfD12f
 8wMCaLHRKzxDOksLwP6ziCdwox6RwK9nyvPOtu25gCownd3DiRzaS2Aku8/ZUDY8uvhEKk
 JzF+yenK736vGnsvdlvPDdpABgIiDlk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-NW0DE9wqPh-gxBFGaOCLxA-1; Tue, 11 Oct 2022 06:28:19 -0400
X-MC-Unique: NW0DE9wqPh-gxBFGaOCLxA-1
Received: by mail-ed1-f70.google.com with SMTP id
 q17-20020a056402519100b00459a2e5adbcso10914248edd.16
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LrWqTWcEMDRoPxbx50bbd53b/m9uxh55LIU7TOsyOQ0=;
 b=StYvUW/OqolnqTQprGIT7nIfptBStw+DLnuX2+j13hPWEgDsBlbdIE3dfNwW61l4Cj
 8rlXD9wlQjxaAELDsysn8PmYopakbJRtnuX/l8306KjB3zvEhjqiigPgoL0BYAgE+5c8
 l6fwwxv35PQYpIdjSLaQv2BkYTuc9zoG+aPt0N08z3rsDsOykfHq1ckgC3QxQWIK5K7u
 cpkva61mfemC0Uo4jMq0VHyrRasr8Mn4Ts3S88cGdzG3+kMN9SuM4gQ+ZXZISnpnwvM/
 nj2gsLgXxPR8uE55+acApPmCS8TMhx78EhJNcQEHnNO3XHEqvSgrlv7Vznm513l/tmQP
 Lmag==
X-Gm-Message-State: ACrzQf12zTGXWiaVKsGQc88do671TmE4tIIIAIpg0cE3rJYtfNNBFRtd
 s2spHUTlBfeboO27MDgYEjOgwkpkqViwEgo6OVp/mvhH+DUHzp0bfAPql3ykfzDCvdkMiYnReaO
 onyWz8ALc/ZrZs4PaYDaXR5KGkuF9iJlkDzoaNFmWiVCISXWNCBLiw6G6yH6PQl5jA0M=
X-Received: by 2002:a05:6402:298b:b0:44f:20a:2db2 with SMTP id
 eq11-20020a056402298b00b0044f020a2db2mr22596140edb.138.1665484097440; 
 Tue, 11 Oct 2022 03:28:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WbSO/9CC72oSORUXdrJapEjErhG2QFA44Q4GW/4LRi5xEzET8rDzYBv4wgImq01tMghTFxA==
X-Received: by 2002:a05:6402:298b:b0:44f:20a:2db2 with SMTP id
 eq11-20020a056402298b00b0044f020a2db2mr22596119edb.138.1665484097049; 
 Tue, 11 Oct 2022 03:28:17 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7c302000000b00459cf672a65sm8907660edq.71.2022.10.11.03.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 26/37] target/i386: Remove MemOp argument to gen_op_j*_ecx
Date: Tue, 11 Oct 2022 12:26:49 +0200
Message-Id: <20221011102700.319178-27-pbonzini@redhat.com>
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

These functions are always passed aflag, so we might as well
read it from DisasContext directly.  While we're at it, use
a common subroutine for these two functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-22-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index cf23ae6e5e..9294f12f66 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -676,20 +676,21 @@ static void gen_exts(MemOp ot, TCGv reg)
     gen_ext_tl(reg, reg, ot, true);
 }
 
-static inline
-void gen_op_jnz_ecx(DisasContext *s, MemOp size, TCGLabel *label1)
+static void gen_op_j_ecx(DisasContext *s, TCGCond cond, TCGLabel *label1)
 {
     tcg_gen_mov_tl(s->tmp0, cpu_regs[R_ECX]);
-    gen_extu(size, s->tmp0);
-    tcg_gen_brcondi_tl(TCG_COND_NE, s->tmp0, 0, label1);
+    gen_extu(s->aflag, s->tmp0);
+    tcg_gen_brcondi_tl(cond, s->tmp0, 0, label1);
 }
 
-static inline
-void gen_op_jz_ecx(DisasContext *s, MemOp size, TCGLabel *label1)
+static inline void gen_op_jz_ecx(DisasContext *s, TCGLabel *label1)
 {
-    tcg_gen_mov_tl(s->tmp0, cpu_regs[R_ECX]);
-    gen_extu(size, s->tmp0);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, s->tmp0, 0, label1);
+    gen_op_j_ecx(s, TCG_COND_EQ, label1);
+}
+
+static inline void gen_op_jnz_ecx(DisasContext *s, TCGLabel *label1)
+{
+    gen_op_j_ecx(s, TCG_COND_NE, label1);
 }
 
 static void gen_helper_in_func(MemOp ot, TCGv v, TCGv_i32 n)
@@ -1183,7 +1184,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    gen_op_jnz_ecx(s, s->aflag, l1);
+    gen_op_jnz_ecx(s, l1);
     gen_set_label(l2);
     gen_jmp_rel_csize(s, 0, 1);
     gen_set_label(l1);
@@ -1286,7 +1287,7 @@ static void gen_repz(DisasContext *s, MemOp ot,
      * before rep string_insn
      */
     if (s->repz_opt) {
-        gen_op_jz_ecx(s, s->aflag, l2);
+        gen_op_jz_ecx(s, l2);
     }
     gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
@@ -1306,7 +1307,7 @@ static void gen_repz2(DisasContext *s, MemOp ot, int nz,
     gen_update_cc_op(s);
     gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);
     if (s->repz_opt) {
-        gen_op_jz_ecx(s, s->aflag, l2);
+        gen_op_jz_ecx(s, l2);
     }
     gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
@@ -7397,16 +7398,16 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             case 0: /* loopnz */
             case 1: /* loopz */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jz_ecx(s, s->aflag, l2);
+                gen_op_jz_ecx(s, l2);
                 gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
                 break;
             case 2: /* loop */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jnz_ecx(s, s->aflag, l1);
+                gen_op_jnz_ecx(s, l1);
                 break;
             default:
             case 3: /* jcxz */
-                gen_op_jz_ecx(s, s->aflag, l1);
+                gen_op_jz_ecx(s, l1);
                 break;
             }
 
-- 
2.37.3


