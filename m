Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4965BEF88
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:00:48 +0200 (CEST)
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalIG-00030i-I6
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah08-0006QQ-Oi
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah02-0002A2-Fq
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvfMevmXrR9/Cf/4Gb7PWDBX+h4Rt+ZSzbLf23Fobh4=;
 b=CHiNmRUwExkViIdv7kGKxCRKVnLPfQt6PyCcRgrLjK0Xdh6t09LlBaR984n1D3TZZ2caig
 BrzkmnfWA1Ngj4csIOjCvkFcTZ4o7vK+HjZU2ZJlNO7tf9BtbSLP+Ppwzqf5xCo+D9R0C8
 zDVPQ6TTN+wW4TFQi2tOC3mCgFCA7aE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-5-h9MWanOI-lQh9b3YlxnA-1; Tue, 20 Sep 2022 13:25:31 -0400
X-MC-Unique: 5-h9MWanOI-lQh9b3YlxnA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h13-20020a056402280d00b004528c8400afso2344288ede.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bvfMevmXrR9/Cf/4Gb7PWDBX+h4Rt+ZSzbLf23Fobh4=;
 b=PFIi8JktjxvlbqwTmGBHGJr8JxCEssRe0FqUTvaxz2GveghpggiNnDAHiem63RSZaW
 rprv3IgV803QcRPG3MAhb7YOt0XFATnelhrfRxh0OqNN50H40p8m1H7svHzZLayd7XhC
 VSE3E+j4lYc1/rOSWsGEMOMMvmZ7eaK7pBshzOfBeOCohm7O9+nYBHquKKzCkD7mt5n2
 HXlWke8IPRQu78K+IfMD3qqZCFl/2PYDT1TdKbBqdrIdXV00svaDTg8PHvcsH0/e5XFL
 vBppVlGAhToK543TWlmIau3jr/Y6LFkF/VewHy4mXVUBCBSNdcesNeyweqqgTryjJ52g
 i15Q==
X-Gm-Message-State: ACrzQf2f7i4t6WhMn7BlySn1TuK3i+zEKry73tysQQQ1exyUn7X7kP5j
 JP7w/2SIgGM6oj7nwaZT2iOEubYR6Ur/3DqzGc/vRa86ClPyZCFHSTJrsklhnofBsSBHRYzy7/W
 Fx6IKWW/hSY7BZaw/2u9RFM1LyCopAtixDVsGhNueJ1/uoA8U0RE1/segmMowyenCL3Q=
X-Received: by 2002:a17:906:5a45:b0:77a:406c:6867 with SMTP id
 my5-20020a1709065a4500b0077a406c6867mr17382252ejc.437.1663694729086; 
 Tue, 20 Sep 2022 10:25:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7v4tKkHsETfNRhJVKbSGBKIsbcyQkDRnmGhbC3eMno9aDQdVpczl4MwgTLmFz6PI30ir/nEg==
X-Received: by 2002:a17:906:5a45:b0:77a:406c:6867 with SMTP id
 my5-20020a1709065a4500b0077a406c6867mr17382204ejc.437.1663694728382; 
 Tue, 20 Sep 2022 10:25:28 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170906344300b00779dc23be62sm151764ejb.120.2022.09.20.10.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 12/37] target/i386: move scalar 0F 38 and 0F 3A instruction
 to new decoder
Date: Tue, 20 Sep 2022 19:24:42 +0200
Message-Id: <20220920172507.95568-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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

Because these are the only VEX instructions that QEMU supports, the
new decoder is entered on the first byte of a valid VEX prefix, and VEX
decoding only needs to be done in decode-new.c.inc.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  59 +++++++
 target/i386/tcg/emit.c.inc       | 258 +++++++++++++++++++++++++++
 target/i386/tcg/translate.c      | 293 +------------------------------
 3 files changed, 321 insertions(+), 289 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 4dc67e6d37..4344bcb40c 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -135,11 +135,69 @@ static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
     return s->modrm;
 }
 
+static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86GenFunc group17_gen[8] = {
+        NULL, gen_BLSR, gen_BLSMSK, gen_BLSI,
+    };
+    int op = (get_modrm(s, env) >> 3) & 7;
+    entry->gen = group17_gen[op];
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
 /* five rows for no prefix, 66, F3, F2, 66+F2  */
 static const X86OpEntry opcodes_0F38_F0toFF[16][5] = {
+    [0] = {
+        X86_OP_ENTRY3(MOVBE, G,y, M,y, None,None, cpuid(MOVBE)),
+        X86_OP_ENTRY3(MOVBE, G,w, M,w, None,None, cpuid(MOVBE)),
+        {},
+        X86_OP_ENTRY2(CRC32, G,d, E,b, cpuid(SSE42)),
+        X86_OP_ENTRY2(CRC32, G,d, E,b, cpuid(SSE42)),
+    },
+    [1] = {
+        X86_OP_ENTRY3(MOVBE, M,y, G,y, None,None, cpuid(MOVBE)),
+        X86_OP_ENTRY3(MOVBE, M,w, G,w, None,None, cpuid(MOVBE)),
+        {},
+        X86_OP_ENTRY2(CRC32, G,d, E,y, cpuid(SSE42)),
+        X86_OP_ENTRY2(CRC32, G,d, E,w, cpuid(SSE42)),
+    },
+    [2] = {
+        X86_OP_ENTRY3(ANDN, G,y, B,y, E,y, vex13 cpuid(BMI1)),
+        {},
+        {},
+        {},
+        {},
+    },
+    [3] = {
+        X86_OP_GROUP3(group17, B,y, E,y, None,None, vex13 cpuid(BMI1)),
+        {},
+        {},
+        {},
+        {},
+    },
+    [5] = {
+        X86_OP_ENTRY3(BZHI, G,y, E,y, B,y, vex13 cpuid(BMI1)),
+        {},
+        X86_OP_ENTRY3(PEXT, G,y, B,y, E,y, vex13 cpuid(BMI2)),
+        X86_OP_ENTRY3(PDEP, G,y, B,y, E,y, vex13 cpuid(BMI2)),
+        {},
+    },
+    [6] = {
+        {},
+        X86_OP_ENTRY2(ADCX, G,y, E,y, cpuid(ADX)),
+        X86_OP_ENTRY2(ADOX, G,y, E,y, cpuid(ADX)),
+        X86_OP_ENTRY3(MULX, /* B,y, */ G,y, E,y, 2,y, vex13 cpuid(BMI2)),
+        {},
+    },
+    [7] = {
+        X86_OP_ENTRY3(BEXTR, G,y, E,y, B,y, vex13 cpuid(BMI1)),
+        X86_OP_ENTRY3(SHLX, G,y, E,y, B,y, vex13 cpuid(BMI1)),
+        X86_OP_ENTRY3(SARX, G,y, E,y, B,y, vex13 cpuid(BMI1)),
+        X86_OP_ENTRY3(SHRX, G,y, E,y, B,y, vex13 cpuid(BMI1)),
+        {},
+    },
 };
 
 static void decode_0F38(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
@@ -161,6 +219,7 @@ static void decode_0F38(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 }
 
 static const X86OpEntry opcodes_0F3A[256] = {
+    [0xF0] = X86_OP_ENTRY3(RORX, G,y, E,y, I,b, vex13 cpuid(BMI2) p_f2),
 };
 
 static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0cba106f74..862da3c84a 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -215,3 +215,261 @@ static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv
         g_assert_not_reached();
     }
 }
+
+static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
+{
+    TCGv carry_in = NULL;
+    TCGv carry_out = (cc_op == CC_OP_ADCX ? cpu_cc_dst : cpu_cc_src2);
+    TCGv zero;
+
+    if (cc_op == s->cc_op || s->cc_op == CC_OP_ADCOX) {
+        /* Re-use the carry-out from a previous round.  */
+        carry_in = carry_out;
+        cc_op = s->cc_op;
+    } else if (s->cc_op == CC_OP_ADCX || s->cc_op == CC_OP_ADOX) {
+        /* Merge with the carry-out from the opposite instruction.  */
+        cc_op = CC_OP_ADCOX;
+    }
+
+    /* If we don't have a carry-in, get it out of EFLAGS.  */
+    if (!carry_in) {
+        if (s->cc_op != CC_OP_ADCX && s->cc_op != CC_OP_ADOX) {
+            gen_compute_eflags(s);
+        }
+        carry_in = s->tmp0;
+        tcg_gen_extract_tl(carry_in, cpu_cc_src,
+            ctz32(cc_op == CC_OP_ADCX ? CC_C : CC_O), 1);
+    }
+
+    switch (ot) {
+#ifdef TARGET_X86_64
+    case MO_32:
+        /* If TL is 64-bit just do everything in 64-bit arithmetic.  */
+        tcg_gen_add_i64(s->T0, s->T0, s->T1);
+        tcg_gen_add_i64(s->T0, s->T0, carry_in);
+        tcg_gen_shri_i64(carry_out, s->T0, 32);
+        break;
+#endif
+    default:
+        zero = tcg_constant_tl(0);
+        tcg_gen_add2_tl(s->T0, carry_out, s->T0, zero, carry_in, zero);
+        tcg_gen_add2_tl(s->T0, carry_out, s->T0, carry_out, s->T1, zero);
+        break;
+    }
+    set_cc_op(s, cc_op);
+}
+
+static void gen_ADCX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_ADCOX(s, env, decode->op[0].ot, CC_OP_ADCX);
+}
+
+static void gen_ADOX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_ADCOX(s, env, decode->op[0].ot, CC_OP_ADOX);
+}
+
+static void gen_ANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+
+    tcg_gen_andc_tl(s->T0, s->T1, s->T0);
+    gen_op_update1_cc(s);
+    set_cc_op(s, CC_OP_LOGICB + ot);
+}
+
+static void gen_BEXTR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    TCGv bound, zero;
+
+    /*
+     * Extract START, and shift the operand.
+     * Shifts larger than operand size get zeros.
+     */
+    tcg_gen_ext8u_tl(s->A0, s->T1);
+    tcg_gen_shr_tl(s->T0, s->T0, s->A0);
+
+    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    zero = tcg_constant_tl(0);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->T0, s->A0, bound, s->T0, zero);
+
+    /*
+     * Extract the LEN into a mask.  Lengths larger than
+     * operand size get all ones.
+     */
+    tcg_gen_extract_tl(s->A0, s->T1, 8, 8);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound, s->A0, bound);
+
+    tcg_gen_movi_tl(s->T1, 1);
+    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
+    tcg_gen_subi_tl(s->T1, s->T1, 1);
+    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+
+    gen_op_update1_cc(s);
+    set_cc_op(s, CC_OP_LOGICB + ot);
+}
+
+static void gen_BLSI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+
+    tcg_gen_neg_tl(s->T1, s->T0);
+    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+    tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+    set_cc_op(s, CC_OP_BMILGB + ot);
+}
+
+static void gen_BLSMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+
+    tcg_gen_subi_tl(s->T1, s->T0, 1);
+    tcg_gen_xor_tl(s->T0, s->T0, s->T1);
+    tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+    set_cc_op(s, CC_OP_BMILGB + ot);
+}
+
+static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+
+    tcg_gen_subi_tl(s->T1, s->T0, 1);
+    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+    tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+    set_cc_op(s, CC_OP_BMILGB + ot);
+}
+
+static void gen_BZHI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    TCGv bound;
+
+    tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
+    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+
+    /*
+     * Note that since we're using BMILG (in order to get O
+     * cleared) we need to store the inverse into C.
+     */
+    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src, s->T1, bound);
+    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1, bound, bound, s->T1);
+
+    tcg_gen_movi_tl(s->A0, -1);
+    tcg_gen_shl_tl(s->A0, s->A0, s->T1);
+    tcg_gen_andc_tl(s->T0, s->T0, s->A0);
+
+    gen_op_update1_cc(s);
+    set_cc_op(s, CC_OP_BMILGB + ot);
+}
+
+static void gen_CRC32(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[2].ot;
+
+    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+    gen_helper_crc32(s->T0, s->tmp2_i32, s->T1, tcg_constant_i32(8 << ot));
+}
+
+static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+
+    /* M operand type does not load/store */
+    if (decode->e.op0 == X86_TYPE_M) {
+        tcg_gen_qemu_st_tl(s->T0, s->A0, s->mem_index, ot | MO_BE);
+    } else {
+        tcg_gen_qemu_ld_tl(s->T0, s->A0, s->mem_index, ot | MO_BE);
+    }
+}
+
+static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+
+    /* low part of result in VEX.vvvv, high in MODRM */
+    switch (ot) {
+    default:
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+        tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
+                          s->tmp2_i32, s->tmp3_i32);
+        tcg_gen_extu_i32_tl(cpu_regs[s->vex_v], s->tmp2_i32);
+        tcg_gen_extu_i32_tl(s->T0, s->tmp3_i32);
+        break;
+#ifdef TARGET_X86_64
+    case MO_64:
+        tcg_gen_mulu2_i64(cpu_regs[s->vex_v], s->T0, s->T0, s->T1);
+        break;
+#endif
+    }
+
+}
+
+static void gen_PDEP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[1].ot;
+    if (ot < MO_64) {
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+    }
+    gen_helper_pdep(s->T0, s->T0, s->T1);
+}
+
+static void gen_PEXT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[1].ot;
+    if (ot < MO_64) {
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+    }
+    gen_helper_pext(s->T0, s->T0, s->T1);
+}
+
+static void gen_RORX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    int b = decode->immediate;
+
+    if (ot == MO_64) {
+        tcg_gen_rotri_tl(s->T0, s->T0, b & 63);
+    } else {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        tcg_gen_rotri_i32(s->tmp2_i32, s->tmp2_i32, b & 31);
+        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+    }
+}
+
+static void gen_SARX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    int mask;
+
+    mask = ot == MO_64 ? 63 : 31;
+    tcg_gen_andi_tl(s->T1, s->T1, mask);
+    if (ot != MO_64) {
+        tcg_gen_ext32s_tl(s->T0, s->T0);
+    }
+    tcg_gen_sar_tl(s->T0, s->T0, s->T1);
+}
+
+static void gen_SHLX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    int mask;
+
+    mask = ot == MO_64 ? 63 : 31;
+    tcg_gen_andi_tl(s->T1, s->T1, mask);
+    tcg_gen_shl_tl(s->T0, s->T0, s->T1);
+}
+
+static void gen_SHRX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    int mask;
+
+    mask = ot == MO_64 ? 63 : 31;
+    tcg_gen_andi_tl(s->T1, s->T1, mask);
+    if (ot != MO_64) {
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+    }
+    tcg_gen_shr_tl(s->T0, s->T0, s->T1);
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aeda520f35..cc2e6f0906 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4130,151 +4130,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                        s->mem_index, ot | MO_BE);
                 }
                 break;
-
-            case 0x0f2: /* andn Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                tcg_gen_andc_tl(s->T0, s->T0, cpu_regs[s->vex_v]);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                gen_op_update1_cc(s);
-                set_cc_op(s, CC_OP_LOGICB + ot);
-                break;
-
-            case 0x0f7: /* bextr Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                {
-                    TCGv bound, zero;
-
-                    gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                    /* Extract START, and shift the operand.
-                       Shifts larger than operand size get zeros.  */
-                    tcg_gen_ext8u_tl(s->A0, cpu_regs[s->vex_v]);
-                    tcg_gen_shr_tl(s->T0, s->T0, s->A0);
-
-                    bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
-                    zero = tcg_const_tl(0);
-                    tcg_gen_movcond_tl(TCG_COND_LEU, s->T0, s->A0, bound,
-                                       s->T0, zero);
-                    tcg_temp_free(zero);
-
-                    /* Extract the LEN into a mask.  Lengths larger than
-                       operand size get all ones.  */
-                    tcg_gen_extract_tl(s->A0, cpu_regs[s->vex_v], 8, 8);
-                    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound,
-                                       s->A0, bound);
-                    tcg_temp_free(bound);
-                    tcg_gen_movi_tl(s->T1, 1);
-                    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
-                    tcg_gen_subi_tl(s->T1, s->T1, 1);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-
-                    gen_op_mov_reg_v(s, ot, reg, s->T0);
-                    gen_op_update1_cc(s);
-                    set_cc_op(s, CC_OP_LOGICB + ot);
-                }
-                break;
-
-            case 0x0f5: /* bzhi Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
-                {
-                    TCGv bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
-                    /* Note that since we're using BMILG (in order to get O
-                       cleared) we need to store the inverse into C.  */
-                    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src,
-                                       s->T1, bound);
-                    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1,
-                                       bound, bound, s->T1);
-                    tcg_temp_free(bound);
-                }
-                tcg_gen_movi_tl(s->A0, -1);
-                tcg_gen_shl_tl(s->A0, s->A0, s->T1);
-                tcg_gen_andc_tl(s->T0, s->T0, s->A0);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                gen_op_update1_cc(s);
-                set_cc_op(s, CC_OP_BMILGB + ot);
-                break;
-
-            case 0x3f6: /* mulx By, Gy, rdx, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                switch (ot) {
-                default:
-                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                    tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EDX]);
-                    tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
-                                      s->tmp2_i32, s->tmp3_i32);
-                    tcg_gen_extu_i32_tl(cpu_regs[s->vex_v], s->tmp2_i32);
-                    tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp3_i32);
-                    break;
-#ifdef TARGET_X86_64
-                case MO_64:
-                    tcg_gen_mulu2_i64(s->T0, s->T1,
-                                      s->T0, cpu_regs[R_EDX]);
-                    tcg_gen_mov_i64(cpu_regs[s->vex_v], s->T0);
-                    tcg_gen_mov_i64(cpu_regs[reg], s->T1);
-                    break;
-#endif
-                }
-                break;
-
-            case 0x3f5: /* pdep Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the source operand, we
-                   automatically handle zero-extending the result.  */
-                if (ot == MO_64) {
-                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
-                } else {
-                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
-                }
-                gen_helper_pdep(cpu_regs[reg], s->T1, s->T0);
-                break;
-
-            case 0x2f5: /* pext Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the source operand, we
-                   automatically handle zero-extending the result.  */
-                if (ot == MO_64) {
-                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
-                } else {
-                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
-                }
-                gen_helper_pext(cpu_regs[reg], s->T1, s->T0);
-                break;
-
             case 0x1f6: /* adcx Gy, Ey */
             case 0x2f6: /* adox Gy, Ey */
                 CHECK_NO_VEX(s);
@@ -4354,73 +4209,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 break;
 
-            case 0x1f7: /* shlx Gy, Ey, By */
-            case 0x2f7: /* sarx Gy, Ey, By */
-            case 0x3f7: /* shrx Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                if (ot == MO_64) {
-                    tcg_gen_andi_tl(s->T1, cpu_regs[s->vex_v], 63);
-                } else {
-                    tcg_gen_andi_tl(s->T1, cpu_regs[s->vex_v], 31);
-                }
-                if (b == 0x1f7) {
-                    tcg_gen_shl_tl(s->T0, s->T0, s->T1);
-                } else if (b == 0x2f7) {
-                    if (ot != MO_64) {
-                        tcg_gen_ext32s_tl(s->T0, s->T0);
-                    }
-                    tcg_gen_sar_tl(s->T0, s->T0, s->T1);
-                } else {
-                    if (ot != MO_64) {
-                        tcg_gen_ext32u_tl(s->T0, s->T0);
-                    }
-                    tcg_gen_shr_tl(s->T0, s->T0, s->T1);
-                }
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            case 0x0f3:
-            case 0x1f3:
-            case 0x2f3:
-            case 0x3f3: /* Group 17 */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-
-                tcg_gen_mov_tl(cpu_cc_src, s->T0);
-                switch (reg & 7) {
-                case 1: /* blsr By,Ey */
-                    tcg_gen_subi_tl(s->T1, s->T0, 1);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-                    break;
-                case 2: /* blsmsk By,Ey */
-                    tcg_gen_subi_tl(s->T1, s->T0, 1);
-                    tcg_gen_xor_tl(s->T0, s->T0, s->T1);
-                    break;
-                case 3: /* blsi By, Ey */
-                    tcg_gen_neg_tl(s->T1, s->T0);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-                    break;
-                default:
-                    goto unknown_op;
-                }
-                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-                gen_op_mov_reg_v(s, ot, s->vex_v, s->T0);
-                set_cc_op(s, CC_OP_BMILGB + ot);
-                break;
-
-            default:
-                goto unknown_op;
             }
             break;
 
@@ -4636,37 +4424,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
 
-        case 0x33a:
-            /* Various integer extensions at 0f 3a f[0-f].  */
-            b = modrm | (b1 << 8);
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-
-            switch (b) {
-            case 0x3f0: /* rorx Gy,Ey, Ib */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                b = x86_ldub_code(env, s);
-                if (ot == MO_64) {
-                    tcg_gen_rotri_tl(s->T0, s->T0, b & 63);
-                } else {
-                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                    tcg_gen_rotri_i32(s->tmp2_i32, s->tmp2_i32, b & 31);
-                    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-                }
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            default:
-                goto unknown_op;
-            }
-            break;
-
         default:
         unknown_op:
             gen_unknown_opcode(env, s);
@@ -4905,59 +4662,17 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0xc5: /* 2-byte VEX */
     case 0xc4: /* 3-byte VEX */
-        use_new = false;
-        /* VEX prefixes cannot be used except in 32-bit mode.
-           Otherwise the instruction is LES or LDS.  */
         if (CODE32(s) && !VM86(s)) {
-            static const int pp_prefix[4] = {
-                0, PREFIX_DATA, PREFIX_REPZ, PREFIX_REPNZ
-            };
-            int vex3, vex2 = x86_ldub_code(env, s);
+            int vex2 = x86_ldub_code(env, s);
+            s->pc--; /* rewind the advance_pc() x86_ldub_code() did */
 
             if (!CODE64(s) && (vex2 & 0xc0) != 0xc0) {
                 /* 4.1.4.6: In 32-bit mode, bits [7:6] must be 11b,
                    otherwise the instruction is LES or LDS.  */
-                s->pc--; /* rewind the advance_pc() x86_ldub_code() did */
                 break;
             }
-
-            /* 4.1.1-4.1.3: No preceding lock, 66, f2, f3, or rex prefixes. */
-            if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ
-                            | PREFIX_LOCK | PREFIX_DATA | PREFIX_REX)) {
-                goto illegal_op;
-            }
-#ifdef TARGET_X86_64
-            s->rex_r = (~vex2 >> 4) & 8;
-#endif
-            if (b == 0xc5) {
-                /* 2-byte VEX prefix: RVVVVlpp, implied 0f leading opcode byte */
-                vex3 = vex2;
-                b = x86_ldub_code(env, s) | 0x100;
-            } else {
-                /* 3-byte VEX prefix: RXBmmmmm wVVVVlpp */
-                vex3 = x86_ldub_code(env, s);
-#ifdef TARGET_X86_64
-                s->rex_x = (~vex2 >> 3) & 8;
-                s->rex_b = (~vex2 >> 2) & 8;
-                s->rex_w = (vex3 >> 7) & 1;
-#endif
-                switch (vex2 & 0x1f) {
-                case 0x01: /* Implied 0f leading opcode bytes.  */
-                    b = x86_ldub_code(env, s) | 0x100;
-                    break;
-                case 0x02: /* Implied 0f 38 leading opcode bytes.  */
-                    b = 0x138;
-                    break;
-                case 0x03: /* Implied 0f 3a leading opcode bytes.  */
-                    b = 0x13a;
-                    break;
-                default:   /* Reserved for future use.  */
-                    goto unknown_op;
-                }
-            }
-            s->vex_v = (~vex3 >> 3) & 0xf;
-            s->vex_l = (vex3 >> 2) & 1;
-            prefixes |= pp_prefix[vex3 & 3] | PREFIX_VEX;
+            disas_insn_new(s, cpu, b);
+            return s->pc;
         }
         break;
     }
-- 
2.37.2


