Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8D5FB0D5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:57:37 +0200 (CEST)
Received: from localhost ([::1]:59670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCx6-0001I5-FJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUN-0002Bj-U9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUL-0004WS-9p
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNWVHL6TMxYEEz+B7KNJ7vI5IU34kxSzh+4YMoD4+h0=;
 b=QlMCxOkvfVNAQUAZdWuB5M/snZb1oigSKhbDRgpy7x7x67h6I/2Bjv+/n/S3Fhbzi8OVY3
 Q/gjDaQ/2wy/XuScUxIH2PV+PcM5aodla+h8aRmaCgpMel3vnaogLJ2uDryFMdIsIgyrlP
 HPzwg3yjt5Uxu6q8+e9/aBlXHB3DcGU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-ZTDFiS31O5CDmWPNoHvGHg-1; Tue, 11 Oct 2022 06:27:50 -0400
X-MC-Unique: ZTDFiS31O5CDmWPNoHvGHg-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn33-20020a1709070d2100b00787e6fbcb72so5674062ejc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNWVHL6TMxYEEz+B7KNJ7vI5IU34kxSzh+4YMoD4+h0=;
 b=pdnFToTyuWWiGBpaqijU5LNXSFvmm0mj3rRzfr8WmKx4ucI8MDHkSzxnMuBejf7Yp4
 dMVj4UHltCJ5B5ci3jM5v7b3iYjwNqnXkhgYttbZgyTNutE+K1Z2l3FctbTxP6H22xnK
 TnZu8z2G6wGRaEY8pkxMS9htZAyFljcWJ4vZfsI1zG/JEbypbd/xGApIvSiXcaLCA+/5
 Er0PZsJAwGUaJGd9/wTFMg7wEfr2+on2P9OD3B5I2zELKeIUb9NTCL9AM8K1ZxeBGWCq
 RZPTuqmhq/nSajRHSXJoWEztYkTKxvNuaE6MEDFmPm0/jtNpx88HbaI5JaCvALeQTb09
 owhw==
X-Gm-Message-State: ACrzQf3Y7+TN0RYRYVEPRl2mG1OPoxqv2GzCD1jmTGRLgK4nZ2Pg4Nnj
 rK9iIkH9zRSJJ7mR5++gGVre6xwsHwj+9VYC3A3LFgYPNzSYu6vr5Co9WoJe2GVi2TL+m30xeeZ
 y1Q+kJG5dOBxiQQ4vnLRvbdLRQml2f0HYmLn3An2ZbGdlmCGpe/IcN/VXg2XNVkjeZwM=
X-Received: by 2002:a17:906:9bca:b0:78d:bc5a:9137 with SMTP id
 de10-20020a1709069bca00b0078dbc5a9137mr6660776ejc.25.1665484069108; 
 Tue, 11 Oct 2022 03:27:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+PRyw5W144WvaJTEj/RAugm47U9Oi0msSwt7nQBHM5dD0/T8UT2ll9Mm5Lqda1DuvKo9kpg==
X-Received: by 2002:a17:906:9bca:b0:78d:bc5a:9137 with SMTP id
 de10-20020a1709069bca00b0078dbc5a9137mr6660753ejc.25.1665484068800; 
 Tue, 11 Oct 2022 03:27:48 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170906314f00b00734bfab4d59sm6792335eje.170.2022.10.11.03.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 16/37] target/i386: Create cur_insn_len, cur_insn_len_i32
Date: Tue, 11 Oct 2022 12:26:39 +0200
Message-Id: <20221011102700.319178-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Create common routines for computing the length of the insn.
Use tcg_constant_i32 in the new function, while we're at it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-12-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6b16c0b62c..fe99c4361c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -530,6 +530,16 @@ static void gen_update_eip_next(DisasContext *s)
     gen_jmp_im(s, s->pc - s->cs_base);
 }
 
+static int cur_insn_len(DisasContext *s)
+{
+    return s->pc - s->base.pc_next;
+}
+
+static TCGv_i32 cur_insn_len_i32(DisasContext *s)
+{
+    return tcg_constant_i32(cur_insn_len(s));
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -712,9 +722,6 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
         gen_helper_check_io(cpu_env, port, tcg_constant_i32(1 << ot));
     }
     if (GUEST(s)) {
-        target_ulong cur_eip = s->base.pc_next - s->cs_base;
-        target_ulong next_eip = s->pc - s->cs_base;
-
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
@@ -723,7 +730,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
         svm_flags |= 1 << (SVM_IOIO_SIZE_SHIFT + ot);
         gen_helper_svm_check_io(cpu_env, port,
                                 tcg_constant_i32(svm_flags),
-                                tcg_constant_i32(next_eip - cur_eip));
+                                cur_insn_len_i32(s));
     }
     return true;
 #endif
@@ -2028,7 +2035,7 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
     }
 
     s->pc += num_bytes;
-    if (unlikely(s->pc - s->base.pc_next > X86_MAX_INSN_LENGTH)) {
+    if (unlikely(cur_insn_len(s) > X86_MAX_INSN_LENGTH)) {
         /* If the instruction's 16th byte is on a different page than the 1st, a
          * page fault on the second page wins over the general protection fault
          * caused by the instruction being too long.
@@ -2647,7 +2654,7 @@ static void gen_interrupt(DisasContext *s, int intno)
     gen_update_cc_op(s);
     gen_update_eip_cur(s);
     gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
-                               tcg_constant_i32(s->pc - s->base.pc_next));
+                               cur_insn_len_i32(s));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -7314,7 +7321,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_pause(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7340,7 +7347,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_into(cpu_env, cur_insn_len_i32(s));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
@@ -7499,7 +7506,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_syscall(cpu_env, cur_insn_len_i32(s));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
@@ -7531,7 +7538,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_hlt(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7640,7 +7647,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_mwait(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
@@ -7716,7 +7723,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
-                             tcg_const_i32(s->pc - s->base.pc_next));
+                             cur_insn_len_i32(s));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
             break;
-- 
2.37.3


