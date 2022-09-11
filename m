Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974915B51E8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:27:04 +0200 (CEST)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWLv-0006Gm-MW
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1H-00019D-PO
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1F-0007Lx-LM
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3NZ7MC0CPDroZn4Uo/o+l3CtgTMCvB3BnxcXynte+4=;
 b=IP38LEUdbDxBkJ7gYRgbp0XmfJEy4KlJm18gJANJvO4bWNKBfLnS4YXqv6dI6PbZaJvP37
 AvHPVc/sRdEWSQNy4Ow52uaRWrmmZjcNDn2h4HH56ErZFJANRDc034+HH5aCKmzi7oZz7P
 Ge4xDHofCUEkpDUHIDaletI9HLTXLVE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-Es3xfaMiOW-CxAfxIR2hhA-1; Sun, 11 Sep 2022 19:05:39 -0400
X-MC-Unique: Es3xfaMiOW-CxAfxIR2hhA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso4955908edd.2
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N3NZ7MC0CPDroZn4Uo/o+l3CtgTMCvB3BnxcXynte+4=;
 b=24XRk69M3XBZB81zgVNpnCP6b2SHAChFZoCRSrg/EudWaE04Jvo1/eJTZv/4vQBJ4Y
 0piAT8lpL8Zq+5m5dIKMr96zBPHsrTn27wokgCYDhz4oLom1Kz15u/Ql3ucB3izFq1+V
 JiM48qfAzBAPgcbw9+zLcFwQOJtechInGgFMRERa5drwJXfTP1oa/diQZ8LmE6mkng5m
 097PUaTid5HOiR0tlKTVD6/jPAdimntfVUboAlwDrTbuu8UBi6SX7mgorTNiDEQ67ipX
 9TsrPtcbrIr0BYVAhaohHZjHp6hqmHWaIRBQbhqDTAJl3gLP4SqoZ4RQnvbRP1caOMvi
 8MYQ==
X-Gm-Message-State: ACgBeo1XhUhTWzLoP/KPC+h6hT5NQNR65ApD+btcB/Ry7ogacpah7qYg
 2frkgkw8Wi7msPMUIB8V/hEvkT7Eb7O5O4/mjG6zhAc+WQRaXdYhr+X34AFMR7DmK3MUfxZkScH
 3uuCshiQx1WsgKjzB4n0Usv30ES+Czogc/+swBtYPLvpVjb5fNrnTBzIQOlrbtVR6XHk=
X-Received: by 2002:a05:6402:2709:b0:451:d665:e787 with SMTP id
 y9-20020a056402270900b00451d665e787mr1701356edd.317.1662937537635; 
 Sun, 11 Sep 2022 16:05:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4TG3wrLMeV5w+Uh9xHH7oxi/9QiI4jgNnl+vMhz7MDB9/L4US/dzga+xeH5kuQSHUBWb1uVQ==
X-Received: by 2002:a05:6402:2709:b0:451:d665:e787 with SMTP id
 y9-20020a056402270900b00451d665e787mr1701329edd.317.1662937537179; 
 Sun, 11 Sep 2022 16:05:37 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906308d00b00742a4debae1sm3539878ejv.6.2022.09.11.16.05.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/37] target/i386: reimplement 0x0f 0xd0-0xd7, 0xe0-0xe7,
 0xf0-0xf7, add AVX
Date: Mon, 12 Sep 2022 01:04:05 +0200
Message-Id: <20220911230418.340941-26-pbonzini@redhat.com>
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

The more complicated ones here are d6-d7, e6-e7, f7.  The others
are trivial.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 39 +++++++++++++
 target/i386/tcg/emit.c.inc       | 99 +++++++++++++++++++++++++++++---
 target/i386/tcg/translate.c      |  4 +-
 3 files changed, 133 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 0e2da85934..e9a9981a7f 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -242,6 +242,18 @@ static void decode_0F7E(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     }
 }
 
+static void decode_0FD6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry movq[4] = {
+        {},
+        X86_OP_ENTRY3(MOVQ,    W,x,  None, None, V,q, vex5),
+        X86_OP_ENTRY3(MOVq_dq, V,dq, None, None, N,q),
+        X86_OP_ENTRY3(MOVq_dq, P,q,  None, None, U,q),
+    };
+
+    *entry = *decode_by_prefix(s, movq);
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
@@ -396,6 +408,33 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP3(0F6F,       W,x, None,None, V,x, vex5 mmx p_00_66_f3),
 
+    [0xd0] = X86_OP_ENTRY3(VADDSUB,   V,x, H,x, W,x,        vex2 cpuid(SSE3) p_66_f2),
+    [0xd1] = X86_OP_ENTRY3(PSRLW_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd2] = X86_OP_ENTRY3(PSRLD_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd3] = X86_OP_ENTRY3(PSRLQ_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd4] = X86_OP_ENTRY3(PADDQ,     V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd5] = X86_OP_ENTRY3(PMULLW,    V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd6] = X86_OP_GROUP0(0FD6),
+    [0xd7] = X86_OP_ENTRY3(PMOVMSKB,  G,d, None,None, U,x,  vex7 mmx avx2_256 p_00_66), /* MOVNTQ/MOVNTDQ */
+
+    [0xe0] = X86_OP_ENTRY3(PAVGB,     V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe1] = X86_OP_ENTRY3(PSRAW_r,   V,x, H,x, W,x,        vex7 mmx avx2_256 p_00_66),
+    [0xe2] = X86_OP_ENTRY3(PSRAD_r,   V,x, H,x, W,x,        vex7 mmx avx2_256 p_00_66),
+    [0xe3] = X86_OP_ENTRY3(PAVGW,     V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe4] = X86_OP_ENTRY3(PMULHUW,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe5] = X86_OP_ENTRY3(PMULHW,    V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe6] = X86_OP_ENTRY2(VCVTpd_dq, V,x, W,x,             vex2 p_66_f3_f2),
+    [0xe7] = X86_OP_ENTRY3(MOVDQ,     W,x, None,None, V,x,  vex1 mmx p_00_66), /* MOVNTQ/MOVNTDQ */
+
+    [0xf0] = X86_OP_ENTRY3(LDDQU,    V,x, None,None, M,x,   vex4_unal cpuid(SSE3) p_f2),
+    [0xf1] = X86_OP_ENTRY3(PSLLW_r,  V,x, H,x, W,x,         vex7 mmx avx2_256 p_00_66),
+    [0xf2] = X86_OP_ENTRY3(PSLLD_r,  V,x, H,x, W,x,         vex7 mmx avx2_256 p_00_66),
+    [0xf3] = X86_OP_ENTRY3(PSLLQ_r,  V,x, H,x, W,x,         vex7 mmx avx2_256 p_00_66),
+    [0xf4] = X86_OP_ENTRY3(PMULUDQ,  V,x, H,x, W,x,         vex4 mmx avx2_256 p_00_66),
+    [0xf5] = X86_OP_ENTRY3(PMADDWD,  V,x, H,x, W,x,         vex4 mmx avx2_256 p_00_66),
+    [0xf6] = X86_OP_ENTRY3(PSADBW,   V,x, H,x, W,x,         vex4 mmx avx2_256 p_00_66),
+    [0xf7] = X86_OP_ENTRY3(MASKMOV,  None,None, V,dq, U,dq, vex4_unal avx2_256 mmx p_00_66),
+
     /* Incorrectly missing from 2-17 */
     [0xd8] = X86_OP_ENTRY3(PSUBUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0xd9] = X86_OP_ENTRY3(PSUBUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index fb01035d06..c90f933093 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -403,6 +403,7 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 }
 HORIZONTAL_FP_SSE(VHADD, hadd)
 HORIZONTAL_FP_SSE(VHSUB, hsub)
+HORIZONTAL_FP_SSE(VADDSUB, addsub)
 
 /*
  * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
@@ -462,6 +463,24 @@ BINARY_INT_MMX(PADDSB, paddsb)
 BINARY_INT_MMX(PADDSW, paddsw)
 BINARY_INT_MMX(PMAXSW, pmaxsw)
 
+BINARY_INT_MMX(PAVGB,   pavgb)
+BINARY_INT_MMX(PAVGW,   pavgw)
+BINARY_INT_MMX(PMADDWD, pmaddwd)
+BINARY_INT_MMX(PMULHUW, pmulhuw)
+BINARY_INT_MMX(PMULHW,  pmulhw)
+BINARY_INT_MMX(PMULLW,  pmullw)
+BINARY_INT_MMX(PMULUDQ, pmuludq)
+BINARY_INT_MMX(PSADBW,  psadbw)
+
+BINARY_INT_MMX(PSLLW_r, psllw)
+BINARY_INT_MMX(PSLLD_r, pslld)
+BINARY_INT_MMX(PSLLQ_r, psllq)
+BINARY_INT_MMX(PSRLW_r, psrlw)
+BINARY_INT_MMX(PSRLD_r, psrld)
+BINARY_INT_MMX(PSRLQ_r, psrlq)
+BINARY_INT_MMX(PSRAW_r, psraw)
+BINARY_INT_MMX(PSRAD_r, psrad)
+
 /* Instructions with no MMX equivalent.  */
 #define BINARY_INT_SSE(uname, lname)                                               \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -680,6 +699,24 @@ static void gen_EMMS_VZERO(DisasContext *s, CPUX86State *env, X86DecodedInsn *de
     }
 }
 
+static void gen_LDDQU(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_load_sse(s, s->T0, decode->op[0].ot, decode->op[0].offset);
+}
+
+static void gen_MASKMOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
+    gen_extu(s->aflag, s->A0);
+    gen_add_A0_ds_seg(s);
+
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_maskmov_xmm(cpu_env, s->ptr1, s->ptr2, s->A0);
+    } else {
+        gen_helper_maskmov_mmx(cpu_env, s->ptr1, s->ptr2, s->A0);
+    }
+}
+
 static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -756,14 +793,26 @@ static void gen_MOVMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
 
 static void gen_MOVQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
-    int vec_len = sse_vec_len(s, decode);
-    int lo_ofs = decode->op[0].offset
-        - xmm_offset(decode->op[0].ot)
-        + xmm_offset(MO_64);
-
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset);
-    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);
+
+    if (decode->op[0].has_ea) {
+        gen_op_st_v(s, MO_64, s->tmp1_i64, s->A0);
+    } else {
+        int vec_len = sse_vec_len(s, decode);
+        int lo_ofs = decode->op[0].offset
+            - xmm_offset(decode->op[0].ot)
+            + xmm_offset(MO_64);
+
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);
+    }
+}
+
+static void gen_MOVq_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    /* Otherwise the same as any other movq.  */
+    return gen_MOVQ(s, env, decode);
 }
 
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -816,6 +865,15 @@ static void gen_PADDD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
                      decode->op[2].offset, vec_len, vec_len);
 }
 
+static void gen_PADDQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_add(MO_64,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
 static void gen_PAND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = sse_vec_len(s, decode);
@@ -906,6 +964,16 @@ static void gen_PEXT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_pext(s->T0, s->T0, s->T1);
 }
 
+static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr2);
+    } else {
+        gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, s->ptr2);
+    }
+    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+}
+
 static void gen_POR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = sse_vec_len(s, decode);
@@ -1202,6 +1270,23 @@ static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
                      gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
 }
 
+static void gen_VCVTpd_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    SSEFunc_0_epp fn = NULL;
+    switch (sse_prefix(s)) {
+    case 0x66:
+        fn = s->vex_l ? gen_helper_cvttpd2dq_ymm : gen_helper_cvttpd2dq_xmm;
+        break;
+    case 0xf3:
+        fn = s->vex_l ? gen_helper_cvtdq2pd_ymm : gen_helper_cvtdq2pd_xmm;
+        break;
+    case 0xf2:
+        fn = s->vex_l ? gen_helper_cvtpd2dq_ymm : gen_helper_cvtpd2dq_xmm;
+        break;
+    }
+    fn(cpu_env, s->ptr0, s->ptr2);
+}
+
 static void gen_VCVTps_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     SSEFunc_0_epp fn = NULL;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 45287dfea2..d15e988891 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4668,8 +4668,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             ((b >= 0x150 && b <= 0x17f) ||
-             (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
-            return disas_insn_new(s, cpu, b + 0x100);
+             (b >= 0x1d0 && b <= 0x1ff))) {
+            return disas_insn_new(s, cpu, b);
         }
         break;
     case 0xf3:
-- 
2.37.2



