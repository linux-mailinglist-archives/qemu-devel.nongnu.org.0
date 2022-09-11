Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825C5B51F3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:35:37 +0200 (CEST)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWUB-0005IR-9w
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW13-0000qT-2o
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW10-0007Kn-SV
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQZLklxHgqRRgkYl8eBLZxpuBOWeOWDzCxLLmpfeBOE=;
 b=Vs/bwbTkETvvFqauQPMVGz+7UxuMbf4K+xL6bsKM5C7UQ4PfSthgFS7TD2OTZx3Qo09pVH
 9C5qjUrhCMkmxOD0sZxTJ68Dt2UGngP6Q7e5Z498kmFcCx1CZ61AgnQYUjbJj6E7TDoMbs
 ghPa7fwvuzkUhgMMyIb+xSrXOzrjrFg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-ZGHNslfXM2qNYHcvQLfo0Q-1; Sun, 11 Sep 2022 19:05:25 -0400
X-MC-Unique: ZGHNslfXM2qNYHcvQLfo0Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 sb14-20020a1709076d8e00b0073d48a10e10so2314625ejc.16
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gQZLklxHgqRRgkYl8eBLZxpuBOWeOWDzCxLLmpfeBOE=;
 b=PeZBeS29N1xqm6/DPSHBTVTvFmLczTV4wo+1RuTmSo5K2Eyu+ckoJLGxzQMUxe2tdr
 u3L6MZICdqNW7PRssgFJHqnbb5sLE7oPlZ4YzpA6Fb7fx14n1BhsLzE3SFLis/1O8Il3
 jE1x+M/XRmHn0Trdhs75goMhaI5Uz/oSG7g6dk1bfW80Ye/HP427Hl2gyIreVac/papa
 oi7bEZfS/QMli/ZoNTDdQoDoAhTo3nEK6yDaLjyrPZX6hg7hNPI12y9YQTE5lEVYrZ3O
 KYzPgJIRbSOCcUZK1QkdTgbPwHbPibFnHbkQ2IRIqmzKbIji9ktMWLyDXArVm0fA8vvU
 +GiA==
X-Gm-Message-State: ACgBeo3eBld748DkoRdPmoNYk2HsZ2ZiyU3R8zdN8qtn7rMpzES8FsSx
 ZZqAmc/49c5Ilhr5uJwMY8zwQ1vBBNdDSSPUNOunTGVQicybe1KsK+RYth7Zp8FSLqLXKDNPT4T
 78kzfki+2XiYo9v1qA0To7EpImWPhDHF8U2oX8MLyjjaXbcXEicrWMMRLn8wzyGRcn28=
X-Received: by 2002:a05:6402:148e:b0:44e:aa8c:abc5 with SMTP id
 e14-20020a056402148e00b0044eaa8cabc5mr19977482edv.145.1662937523584; 
 Sun, 11 Sep 2022 16:05:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5gqACb6aZFMs0dUXoohAbxP9zs5IEbuVR+hgOh/1LfyWrKgNLEA2Uhb+B0TmNP/oTTImku4w==
X-Received: by 2002:a05:6402:148e:b0:44e:aa8c:abc5 with SMTP id
 e14-20020a056402148e00b0044eaa8cabc5mr19977466edv.145.1662937523082; 
 Sun, 11 Sep 2022 16:05:23 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 x21-20020aa7dad5000000b0044e91d8ccd2sm4648283eds.50.2022.09.11.16.05.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/37] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
Date: Mon, 12 Sep 2022 01:04:00 +0200
Message-Id: <20220911230418.340941-21-pbonzini@redhat.com>
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

These are both MMX and SSE/AVX instructions, except for vmovdqu.  In both
cases the inputs and output is in s->ptr{0,1,2}, so the only difference
between MMX, SSE, and AVX is which helper to call.

PCMPGT, MOVD and MOVQ are implemented using gvec.

The amount of macro magic for generating functions is kept to the minimum.
In particular, the gvec cases are easy enough and have no duplication within
each function, so they are spelled out one by one.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  35 ++++++++
 target/i386/tcg/emit.c.inc       | 148 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   3 +-
 3 files changed, 185 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index b31daecb90..f20587c096 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -142,6 +142,23 @@ static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
     entry->gen = group17_gen[op];
 }
 
+static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    if (s->prefix & PREFIX_REPNZ) {
+        entry->gen = NULL;
+    } else if (s->prefix & PREFIX_REPZ) {
+        /* movdqu */
+        entry->gen = gen_MOVDQ;
+        entry->vex_class = 4;
+        entry->vex_special = X86_VEX_SSEUnaligned;
+    } else {
+        /* MMX movq, movdqa */
+        entry->gen = gen_MOVDQ;
+        entry->vex_class = 1;
+        entry->special = X86_SPECIAL_MMX;
+    }
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
@@ -227,8 +244,26 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 }
 
 static const X86OpEntry opcodes_0F[256] = {
+    [0x60] = X86_OP_ENTRY3(PUNPCKLBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x61] = X86_OP_ENTRY3(PUNPCKLWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x62] = X86_OP_ENTRY3(PUNPCKLDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x63] = X86_OP_ENTRY3(PACKSSWB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x64] = X86_OP_ENTRY3(PCMPGTB,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x65] = X86_OP_ENTRY3(PCMPGTW,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x66] = X86_OP_ENTRY3(PCMPGTD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x67] = X86_OP_ENTRY3(PACKUSWB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
+
+    [0x68] = X86_OP_ENTRY3(PUNPCKHBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x69] = X86_OP_ENTRY3(PUNPCKHWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x6a] = X86_OP_ENTRY3(PUNPCKHDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x6b] = X86_OP_ENTRY3(PACKSSDW,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x6c] = X86_OP_ENTRY3(PUNPCKLQDQ, V,x, H,x, W,x,  vex4 p_66 avx2_256),
+    [0x6d] = X86_OP_ENTRY3(PUNPCKHQDQ, V,x, H,x, W,x,  vex4 p_66 avx2_256),
+    [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
+    [0x6f] = X86_OP_GROUP3(0F6F,       V,x, None,None, W,x, vex5 mmx p_00_66_f3),
 };
 
 static void do_decode_0F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 36b963a0d3..3f89d3cf50 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -212,6 +212,97 @@ static void gen_writeback(DisasContext *s, X86DecodedOp *op)
     }
 }
 
+static inline int sse_vec_len(DisasContext *s, X86DecodedInsn *decode)
+{
+    if (decode->e.special == X86_SPECIAL_MMX &&
+        !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
+        return 8;
+    }
+    return s->vex_l ? 32 : 16;
+}
+
+static void gen_store_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode, int src_ofs)
+{
+    MemOp ot = decode->op[0].ot;
+    int vec_len = sse_vec_len(s, decode);
+
+    if (!decode->op[0].has_ea) {
+        tcg_gen_gvec_mov(MO_64, decode->op[0].offset, src_ofs, vec_len, vec_len);
+        return;
+    }
+
+    switch (ot) {
+    case MO_64:
+        gen_stq_env_A0(s, src_ofs);
+        break;
+    case MO_128:
+        gen_sto_env_A0(s, src_ofs);
+        break;
+    case MO_256:
+        gen_sty_env_A0(s, src_ofs);
+        break;
+    default:
+        abort();
+    }
+}
+
+/*
+ * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
+ * 66 = vp* Vx, Hx, Wx
+ *
+ * These are really the same encoding, because 1) V is the same as P when VEX.V
+ * is not present 2) P and Q are the same as H and W apart from MM/XMM
+ */
+static inline void gen_binary_int_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                      SSEFunc_0_eppp mmx, SSEFunc_0_eppp xmm, SSEFunc_0_eppp ymm)
+{
+    assert (!!mmx == !!(decode->e.special == X86_SPECIAL_MMX));
+
+    if (mmx && (s->prefix & PREFIX_VEX) && !(s->prefix & PREFIX_DATA)) {
+        /* VEX encoding is not applicable to MMX instructions.  */
+        gen_illegal_opcode(s);
+        return;
+    }
+    if (!(s->prefix & PREFIX_DATA)) {
+        mmx(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+    } else if (!s->vex_l) {
+        xmm(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+    } else {
+        ymm(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+    }
+}
+
+#define BINARY_INT_MMX(uname, lname)                                               \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_binary_int_sse(s, env, decode,                                             \
+                          gen_helper_##lname##_mmx,                                \
+                          gen_helper_##lname##_xmm,                                \
+                          gen_helper_##lname##_ymm);                               \
+}
+BINARY_INT_MMX(PUNPCKLBW,  punpcklbw)
+BINARY_INT_MMX(PUNPCKLWD,  punpcklwd)
+BINARY_INT_MMX(PUNPCKLDQ,  punpckldq)
+BINARY_INT_MMX(PACKSSWB,   packsswb)
+BINARY_INT_MMX(PACKUSWB,   packuswb)
+BINARY_INT_MMX(PUNPCKHBW,  punpckhbw)
+BINARY_INT_MMX(PUNPCKHWD,  punpckhwd)
+BINARY_INT_MMX(PUNPCKHDQ,  punpckhdq)
+BINARY_INT_MMX(PACKSSDW,   packssdw)
+
+/* Instructions with no MMX equivalent.  */
+#define BINARY_INT_SSE(uname, lname)                                               \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_binary_int_sse(s, env, decode,                                             \
+                          NULL,                                                    \
+                          gen_helper_##lname##_xmm,                                \
+                          gen_helper_##lname##_ymm);                               \
+}
+
+BINARY_INT_SSE(PUNPCKLQDQ, punpcklqdq)
+BINARY_INT_SSE(PUNPCKHQDQ, punpckhqdq)
+
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
     TCGv carry_in = NULL;
@@ -382,6 +473,36 @@ static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_MOVD_to(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[2].ot;
+    int vec_len = sse_vec_len(s, decode);
+    int lo_ofs = decode->op[0].offset
+        - xmm_offset(decode->op[0].ot)
+        + xmm_offset(ot);
+
+    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+
+    switch (ot) {
+    case MO_32:
+#ifdef TARGET_X86_64
+        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+        tcg_gen_st_i32(s->tmp3_i32, cpu_env, lo_ofs);
+        break;
+    case MO_64:
+#endif
+        tcg_gen_st_tl(s->T1, cpu_env, lo_ofs);
+        break;
+    default:
+        abort();
+    }
+}
+
+static void gen_MOVDQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_store_sse(s, env, decode, decode->op[2].offset);
+}
+
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -405,6 +526,33 @@ static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 
 }
 
+static void gen_PCMPGTB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_cmp(TCG_COND_GT, MO_8,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PCMPGTW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_cmp(TCG_COND_GT, MO_16,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PCMPGTD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_cmp(TCG_COND_GT, MO_32,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
 static void gen_PDEP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[1].ot;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e147a95c5f..cf18e12d38 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -23,6 +23,7 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
@@ -4665,7 +4666,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifndef CONFIG_USER_ONLY
         use_new &= b <= limit;
 #endif
-        if (use_new && 0) {
+        if (use_new && (b >= 0x160 && b <= 0x16f)) {
             return disas_insn_new(s, cpu, b + 0x100);
         }
         break;
-- 
2.37.2



