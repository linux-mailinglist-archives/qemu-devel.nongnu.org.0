Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E125FB0EA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:05:34 +0200 (CEST)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiD4n-0007ZF-5o
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUR-0002CN-2q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUN-0004XP-Fx
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q19lbNDEmiPwPnrz0hHNWPHofwAMVNqazrj/KXWd5rM=;
 b=ZpD2ldSh479n/DvDGfxIDjewJQz62ud3Oijv77yYghpwpcRdZ+UqnKK1GJRH9iw3gGGXtj
 OqNiQ6PAPY5gTIlTOIiFLLeAhvyHrWbewGX2YEIubHqI29NJ5BnfO/WlK1WnCSxD5QU5Wc
 4nnHY1d+6rve7qa7WC1ezMIRq9Pw2bI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-YbW_09sCM2SLt7wGlVXSMw-1; Tue, 11 Oct 2022 06:27:53 -0400
X-MC-Unique: YbW_09sCM2SLt7wGlVXSMw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf25-20020a1709077f1900b0078c02a23da3so5666823ejc.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q19lbNDEmiPwPnrz0hHNWPHofwAMVNqazrj/KXWd5rM=;
 b=NkeIt3THFWh09qTGFpmVTeDmzSBOnrzgfHGUX227uqQp1tGz1ox2GiLq4/HfHjf07N
 159k9foyalivth20SazF9++Rm2/OHA/O+Bdng0/SbUS7BojtBehvG3uH8DaZSOWK2YZi
 xdD3cr5j1Lyp/GzPnOTDRyBMpCMI+7dNH03Zm3XnPmuvu81LPkhlOfrB7n+fw4T0nu43
 BHFMpWqjdqsm20PEnYeAC/ilhnfT0UJ7O2FsxcVkUbUVR0hAQuLtCR3G+vmyRIf85wU1
 nXPKQL3ixblfZnWRPJRQoR4x7amezdUjI6KCNLzqis3yiwW8YxSOF4GFRW0YE2qqNDO4
 /qXQ==
X-Gm-Message-State: ACrzQf2nWNC4tLhnXo+alzrrQGkI6iCkbj9roRQswXcfNtIl6Tqc0nuf
 HdMXU+EngvuWsKUQ+Idvb2q6Cidd90bJLkVhynIT5bozsbBmLotnJvgHVlq8pXdit6KTN/uC3zY
 2pVqi9JAse/7YTxMOx4fNXQfY3LleP3ukMVmta31yKulLRDowIfCKhxR/nhqK5G7RF8A=
X-Received: by 2002:a17:907:6d27:b0:78d:46f6:c59e with SMTP id
 sa39-20020a1709076d2700b0078d46f6c59emr18478683ejc.30.1665484071959; 
 Tue, 11 Oct 2022 03:27:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/lymGIi03TX6IJT/R3xPkej+KHn8pQjjGqgf651KUoIfr6dyGItKwV3m4YdmGfASWkTDzqA==
X-Received: by 2002:a17:907:6d27:b0:78d:46f6:c59e with SMTP id
 sa39-20020a1709076d2700b0078d46f6c59emr18478661ejc.30.1665484071584; 
 Tue, 11 Oct 2022 03:27:51 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 i17-20020aa7c711000000b004575085bf18sm8880727edq.74.2022.10.11.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/37] target/i386: Remove cur_eip,
 next_eip arguments to gen_repz*
Date: Tue, 11 Oct 2022 12:26:40 +0200
Message-Id: <20221011102700.319178-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

All callers pass s->base.pc_next and s->pc, which we can just
as well compute within the functions.  Pull out common helpers
and reduce the amount of code under macros.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-13-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 116 ++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 59 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index fe99c4361c..c8ef9f0356 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -736,7 +736,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
 #endif
 }
 
-static inline void gen_movs(DisasContext *s, MemOp ot)
+static void gen_movs(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -1156,18 +1156,18 @@ static inline void gen_jcc1(DisasContext *s, int b, TCGLabel *l1)
 
 /* XXX: does not work with gdbstub "ice" single step - not a
    serious problem */
-static TCGLabel *gen_jz_ecx_string(DisasContext *s, target_ulong next_eip)
+static TCGLabel *gen_jz_ecx_string(DisasContext *s)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
     gen_op_jnz_ecx(s, s->aflag, l1);
     gen_set_label(l2);
-    gen_jmp_tb(s, next_eip, 1);
+    gen_jmp_tb(s, s->pc - s->cs_base, 1);
     gen_set_label(l1);
     return l2;
 }
 
-static inline void gen_stos(DisasContext *s, MemOp ot)
+static void gen_stos(DisasContext *s, MemOp ot)
 {
     gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
     gen_string_movl_A0_EDI(s);
@@ -1176,7 +1176,7 @@ static inline void gen_stos(DisasContext *s, MemOp ot)
     gen_op_add_reg_T0(s, s->aflag, R_EDI);
 }
 
-static inline void gen_lods(DisasContext *s, MemOp ot)
+static void gen_lods(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -1185,7 +1185,7 @@ static inline void gen_lods(DisasContext *s, MemOp ot)
     gen_op_add_reg_T0(s, s->aflag, R_ESI);
 }
 
-static inline void gen_scas(DisasContext *s, MemOp ot)
+static void gen_scas(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     gen_op_ld_v(s, ot, s->T1, s->A0);
@@ -1194,7 +1194,7 @@ static inline void gen_scas(DisasContext *s, MemOp ot)
     gen_op_add_reg_T0(s, s->aflag, R_EDI);
 }
 
-static inline void gen_cmps(DisasContext *s, MemOp ot)
+static void gen_cmps(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     gen_op_ld_v(s, ot, s->T1, s->A0);
@@ -1222,7 +1222,7 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_port, int ot)
     }
 }
 
-static inline void gen_ins(DisasContext *s, MemOp ot)
+static void gen_ins(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     /* Note: we must do this dummy write first to be restartable in
@@ -1238,7 +1238,7 @@ static inline void gen_ins(DisasContext *s, MemOp ot)
     gen_bpt_io(s, s->tmp2_i32, ot);
 }
 
-static inline void gen_outs(DisasContext *s, MemOp ot)
+static void gen_outs(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -1252,42 +1252,49 @@ static inline void gen_outs(DisasContext *s, MemOp ot)
     gen_bpt_io(s, s->tmp2_i32, ot);
 }
 
-/* same method as Valgrind : we generate jumps to current or next
-   instruction */
-#define GEN_REPZ(op)                                                          \
-static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,              \
-                                 target_ulong cur_eip, target_ulong next_eip) \
-{                                                                             \
-    TCGLabel *l2;                                                             \
-    gen_update_cc_op(s);                                                      \
-    l2 = gen_jz_ecx_string(s, next_eip);                                      \
-    gen_ ## op(s, ot);                                                        \
-    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);                                \
-    /* a loop would cause two single step exceptions if ECX = 1               \
-       before rep string_insn */                                              \
-    if (s->repz_opt)                                                          \
-        gen_op_jz_ecx(s, s->aflag, l2);                                       \
-    gen_jmp(s, cur_eip);                                                      \
+/* Generate jumps to current or next instruction */
+static void gen_repz(DisasContext *s, MemOp ot,
+                     void (*fn)(DisasContext *s, MemOp ot))
+{
+    TCGLabel *l2;
+    gen_update_cc_op(s);
+    l2 = gen_jz_ecx_string(s);
+    fn(s, ot);
+    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
+    /*
+     * A loop would cause two single step exceptions if ECX = 1
+     * before rep string_insn
+     */
+    if (s->repz_opt) {
+        gen_op_jz_ecx(s, s->aflag, l2);
+    }
+    gen_jmp(s, s->base.pc_next - s->cs_base);
 }
 
-#define GEN_REPZ2(op)                                                         \
-static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,              \
-                                   target_ulong cur_eip,                      \
-                                   target_ulong next_eip,                     \
-                                   int nz)                                    \
-{                                                                             \
-    TCGLabel *l2;                                                             \
-    gen_update_cc_op(s);                                                      \
-    l2 = gen_jz_ecx_string(s, next_eip);                                      \
-    gen_ ## op(s, ot);                                                        \
-    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);                                \
-    gen_update_cc_op(s);                                                      \
-    gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);                                 \
-    if (s->repz_opt)                                                          \
-        gen_op_jz_ecx(s, s->aflag, l2);                                       \
-    gen_jmp(s, cur_eip);                                                      \
+#define GEN_REPZ(op) \
+    static inline void gen_repz_ ## op(DisasContext *s, MemOp ot) \
+    { gen_repz(s, ot, gen_##op); }
+
+static void gen_repz2(DisasContext *s, MemOp ot, int nz,
+                      void (*fn)(DisasContext *s, MemOp ot))
+{
+    TCGLabel *l2;
+    gen_update_cc_op(s);
+    l2 = gen_jz_ecx_string(s);
+    fn(s, ot);
+    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
+    gen_update_cc_op(s);
+    gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);
+    if (s->repz_opt) {
+        gen_op_jz_ecx(s, s->aflag, l2);
+    }
+    gen_jmp(s, s->base.pc_next - s->cs_base);
 }
 
+#define GEN_REPZ2(op) \
+    static inline void gen_repz_ ## op(DisasContext *s, MemOp ot, int nz) \
+    { gen_repz2(s, ot, nz, gen_##op); }
+
 GEN_REPZ(movs)
 GEN_REPZ(stos)
 GEN_REPZ(lods)
@@ -6623,8 +6630,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa5:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_movs(s, ot);
         } else {
             gen_movs(s, ot);
         }
@@ -6634,8 +6640,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xab:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_stos(s, ot);
         } else {
             gen_stos(s, ot);
         }
@@ -6644,8 +6649,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xad:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_lods(s, ot);
         } else {
             gen_lods(s, ot);
         }
@@ -6654,11 +6658,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xaf:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 1);
+            gen_repz_scas(s, ot, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 0);
+            gen_repz_scas(s, ot, 0);
         } else {
             gen_scas(s, ot);
         }
@@ -6668,11 +6670,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa7:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 1);
+            gen_repz_cmps(s, ot, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 0);
+            gen_repz_cmps(s, ot, 0);
         } else {
             gen_cmps(s, ot);
         }
@@ -6690,8 +6690,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
-                         s->pc - s->cs_base);
+            gen_repz_ins(s, ot);
             /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
@@ -6712,8 +6711,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_outs(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_outs(s, ot);
             /* jump generated by gen_repz_outs */
         } else {
             gen_outs(s, ot);
-- 
2.37.3


