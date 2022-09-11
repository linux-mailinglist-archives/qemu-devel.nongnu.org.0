Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63815B51EC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:29:26 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWOD-0003dh-Ny
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1W-0001VG-Df
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1T-0007Na-Sq
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kO2wRpfBkapFQOkArHuIU88jIMJhfesrSzDONpHHT5g=;
 b=T+aqoD5lKdVfcTRpnOb9pR9br9xH+dygr0XfXjqmb/ERGeKbKvX/CK2CFz/WnJqphLHnDu
 BOmrXvscOboaVh57qNIiFDCD1e/KYMQEyxM1XheEVm3JP4bs9c+WUACuapfxw0dGtumM+3
 TlnaZ4b0JV+2F+7ZWmss1MpQyY5C5sk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-j8sOznFQOLyarvAPkXZBYA-1; Sun, 11 Sep 2022 19:05:53 -0400
X-MC-Unique: j8sOznFQOLyarvAPkXZBYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z2-20020a056402274200b004516734e755so2469868edd.3
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kO2wRpfBkapFQOkArHuIU88jIMJhfesrSzDONpHHT5g=;
 b=7NOlkR0bq8VWwvaWb3SfoR8Bz/DgiP9PjOAc5UNEyVxejGUBtE2GEH8DnbeEHsRb2Q
 jkflXJ9pnH+SObyJq3LdbNRap0SACfBefCjHpNlDE8gCjLBtmqniOhTrzo9FDcXQ7sfL
 CnzP8ojvv8VO/cWgE5dvRLsqCkIj6R2PaJO0kMK3OdOrls8Qn7Gi/8khcnEaQXsi5+aQ
 x5eJXV90N6oU8WSb6uaeXC2TTb3md6+tpiKrYPEk0vhD6ekIYf1AFZCQEK+jd5GSNr2N
 9oQQ67nb2QDYppSKAvDccJz5QHQ20nFWLIwytZEaWG+h5Xfia+UEBKMOoJjkN6W0+yit
 yVmw==
X-Gm-Message-State: ACgBeo2iDIBaeeGa04p8V5tYuyp4FtFjMBh48IAvQ/TzoZkwG8sbknWh
 PtO/R0T27Ex96rmt79a7sQwxVzi7IGYe+JRXezOgEBpa4JawHsE7rUc2sERo8v3iUt03KOiFKCA
 n4sWXzJP8JUTYws97sUjZo8a2PC2wChXwbGKyr9WAGrotl/Xu5eBDwxQlKRfuWaZlCcU=
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr17043186ejr.11.1662937551890; 
 Sun, 11 Sep 2022 16:05:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6tJU72x2sQFhWP3EWkmlqapnrMN9ibEAcPfwzi19ttZT4VW0gG9nXxZw1udh3Qn84iwfnhbQ==
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr17043166ejr.11.1662937551385; 
 Sun, 11 Sep 2022 16:05:51 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a1709061d1100b007303fe58eb2sm3452740ejh.154.2022.09.11.16.05.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/37] target/i386: reimplement 0x0f 0x10-0x17, add AVX
Date: Mon, 12 Sep 2022 01:04:10 +0200
Message-Id: <20220911230418.340941-31-pbonzini@redhat.com>
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

These are mostly moves, and yet are a total pain.  The main issue
is that:

1) some instructions are selected by mod==11 (register operand)
vs. mod=00/01/10 (memory operand)

2) stores to memory are two-operand operations, while the 3-register
and load-from-memory versions operate on the entire contents of the
destination; this makes it easier to separate the gen_* function for
the store case

3) it's inefficient to load into xmm_T0 only to move the value out
again, so the gen_* function for the load case is separated too

The manual also has various mistakes in the operands here, for example
the store case of MOVHPS operates on a 128-bit source (albeit discarding
the bottom 64 bits) and therefore should be Mq,Vdq rather than Mq,Vq.
Likewise for the destination and source of MOVHLPS.

VUNPCK?PS and VUNPCK?PD are the same as VUNPCK?DQ and VUNPCK?QDQ,
but encoded as prefixes rather than separate operands.  The helpers
can be reused however.

For MOVSLDUP, MOVSHDUP and MOVDDUP I chose to reimplement them as
helpers.  I named the helper for MOVDDUP "movdldup" in preparation
for possible future introduction of MOVDHDUP and to clarify the
similarity with MOVSLDUP.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h            |   7 ++
 target/i386/ops_sse_header.h     |   3 +
 target/i386/tcg/decode-new.c.inc | 121 ++++++++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 123 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   1 +
 5 files changed, 255 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fbbe82c6e7..52cae7ebe7 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1683,6 +1683,10 @@ void glue(helper_ptest, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     CC_SRC = (zf ? 0 : CC_Z) | (cf ? 0 : CC_C);
 }
 
+#define FMOVSLDUP(i) s->L((i) & ~1)
+#define FMOVSHDUP(i) s->L((i) | 1)
+#define FMOVDLDUP(i) s->Q((i) & ~1)
+
 #define SSE_HELPER_F(name, elem, num, F)                        \
     void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                           \
@@ -1705,6 +1709,9 @@ SSE_HELPER_F(helper_pmovzxbq, Q, 1 << SHIFT, s->B)
 SSE_HELPER_F(helper_pmovzxwd, L, 2 << SHIFT, s->W)
 SSE_HELPER_F(helper_pmovzxwq, Q, 1 << SHIFT, s->W)
 SSE_HELPER_F(helper_pmovzxdq, Q, 1 << SHIFT, s->L)
+SSE_HELPER_F(helper_pmovsldup, L, 2 << SHIFT, FMOVSLDUP)
+SSE_HELPER_F(helper_pmovshdup, L, 2 << SHIFT, FMOVSHDUP)
+SSE_HELPER_F(helper_pmovdldup, Q, 1 << SHIFT, FMOVDLDUP)
 #endif
 
 void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index e188cbd87d..ed51f10eef 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -355,6 +355,9 @@ DEF_HELPER_3(glue(pmovzxbq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxdq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(pmovsldup, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(pmovshdup, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(pmovdldup, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(pmuldq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(packusdw, SUFFIX), void, env, Reg, Reg, Reg)
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index c51b59f721..268ccb886f 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -509,6 +509,117 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = opcodes_0F3A[*b];
 }
 
+/*
+ * There are some mistakes in the operands in the manual, and the load/store/register
+ * cases are easiest to keep separate, so the entries for 10-17 follow simplicity and
+ * efficiency of implementation rather than copying what the manual says.
+ *
+ * In particular:
+ *
+ * 1) "VMOVSS m32, xmm1" and "VMOVSD m64, xmm1" do not support VEX.vvvv != 1111b,
+ * but this is not mentioned in the tables.
+ *
+ * 2) MOVHLPS, MOVHPS, MOVHPD, MOVLPD, MOVLPS read the high quadword of one of their
+ * operands, which must therefore be dq; MOVLPD and MOVLPS also write the high
+ * quadword of the V operand.
+ */
+static void decode_0F10(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F10_reg[4] = {
+        X86_OP_ENTRY3(MOVDQ,   V,x,  None,None, W,x, vex4_unal), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,   V,x,  None,None, W,x, vex4_unal), /* MOVUPD */
+        X86_OP_ENTRY3(VMOVSS,  V,x,  H,x,       W,x, vex4),
+        X86_OP_ENTRY3(VMOVLPx, V,x,  H,x,       W,x, vex4), /* MOVSD */
+    };
+
+    static const X86OpEntry opcodes_0F10_mem[4] = {
+        X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x,  vex4_unal), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x,  vex4_unal), /* MOVUPD */
+        X86_OP_ENTRY3(VMOVSS_ld,  V,x,  H,x,       M,ss, vex4),
+        X86_OP_ENTRY3(VMOVSD_ld,  V,x,  H,x,       M,sd, vex4),
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F10_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F10_mem);
+    }
+}
+
+static void decode_0F11(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F11_reg[4] = {
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPS */
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPD */
+        X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex4),
+        X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex4), /* MOVSD */
+    };
+
+    static const X86OpEntry opcodes_0F11_mem[4] = {
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPS */
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPD */
+        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
+        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD */
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F11_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F11_mem);
+    }
+}
+
+static void decode_0F12(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F12_mem[4] = {
+        /*
+         * Use dq for operand for compatibility with gen_MOVSD and
+         * to allow VEX128 only.
+         */
+        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVLPS */
+        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVLPD */
+        X86_OP_ENTRY3(VMOVSLDUP,  V,x,  None,None, W,x, vex4 cpuid(SSE3)),
+        X86_OP_ENTRY3(VMOVDDUP,   V,x,  None,None, WM,q, vex4 cpuid(SSE3)), /* qq if VEX.256 */
+    };
+    static const X86OpEntry opcodes_0F12_reg[4] = {
+        X86_OP_ENTRY3(VMOVHLPS,  V,dq, H,dq,       U,dq, vex4),
+        X86_OP_ENTRY3(VMOVLPx,   W,x,  H,x,        U,q,  vex4), /* MOVLPD */
+        X86_OP_ENTRY3(VMOVSLDUP, V,x,  None,None,  U,x,  vex4 cpuid(SSE3)),
+        X86_OP_ENTRY3(VMOVDDUP,  V,x,  None,None,  U,x,  vex4 cpuid(SSE3)),
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F12_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F12_mem);
+        if ((s->prefix & PREFIX_REPNZ) && s->vex_l) {
+            entry->s2 = X86_SIZE_qq;
+        }
+    }
+}
+
+static void decode_0F16(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F16_mem[4] = {
+        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,q,       M,q, vex4), /* MOVHPS */
+        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,q,       M,q, vex4), /* MOVHPD */
+        X86_OP_ENTRY3(VMOVSHDUP,  V,x,  None,None, W,x, vex4 cpuid(SSE3)),
+        {},
+    };
+    static const X86OpEntry opcodes_0F16_reg[4] = {
+        X86_OP_ENTRY3(VMOVLHPS,  V,dq, H,q,       U,q, vex4),
+        X86_OP_ENTRY3(VMOVHPx,   V,x,  H,x,       U,x, vex4), /* MOVHPD */
+        X86_OP_ENTRY3(VMOVSHDUP, V,x,  None,None, U,x, vex4 cpuid(SSE3)),
+        {},
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F16_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F16_mem);
+    }
+}
+
 static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
@@ -524,6 +635,16 @@ static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entr
 }
 
 static const X86OpEntry opcodes_0F[256] = {
+    [0x10] = X86_OP_GROUP0(0F10),
+    [0x11] = X86_OP_GROUP0(0F11),
+    [0x12] = X86_OP_GROUP0(0F12),
+    [0x13] = X86_OP_ENTRY3(VMOVLPx_st,  M,q, None,None, V,q,  vex4 p_00_66),
+    [0x14] = X86_OP_ENTRY3(VUNPCKLPx,   V,x, H,x, W,x,        vex4 p_00_66),
+    [0x15] = X86_OP_ENTRY3(VUNPCKHPx,   V,x, H,x, W,x,        vex4 p_00_66),
+    [0x16] = X86_OP_GROUP0(0F16),
+    /* Incorrectly listed as Mq,Vq in the manual */
+    [0x17] = X86_OP_ENTRY3(VMOVHPx_st,  M,q, None,None, V,dq, vex4 p_00_66),
+
     [0x50] = X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_66),
     [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index d1819f3581..2319368cb5 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -326,6 +326,7 @@ static inline void gen_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn
         gen_illegal_opcode(s);
     }
 }
+
 #define FP_SSE(uname, lname)                                                       \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -344,6 +345,20 @@ FP_SSE(VMIN, min)
 FP_SSE(VDIV, div)
 FP_SSE(VMAX, max)
 
+#define FP_UNPACK_SSE(uname, lname)                                                \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    /* PS maps to the DQ integer instruction, PD maps to QDQ.  */                  \
+    gen_fp_sse(s, env, decode,                                                     \
+               gen_helper_##lname##qdq_xmm,                                        \
+               gen_helper_##lname##dq_xmm,                                         \
+               gen_helper_##lname##qdq_ymm,                                        \
+               gen_helper_##lname##dq_ymm,                                         \
+               NULL, NULL);                                                        \
+}
+FP_UNPACK_SSE(VUNPCKLPx, punpckl)
+FP_UNPACK_SSE(VUNPCKHPx, punpckh)
+
 /*
  * 00 = v*ps Vps, Wpd
  * f3 = v*ss Vss, Wps
@@ -619,6 +634,10 @@ UNARY_INT_SSE(VPMOVZXWD,    pmovzxwd)
 UNARY_INT_SSE(VPMOVZXWQ,    pmovzxwq)
 UNARY_INT_SSE(VPMOVZXDQ,    pmovzxdq)
 
+UNARY_INT_SSE(VMOVSLDUP,     pmovsldup)
+UNARY_INT_SSE(VMOVSHDUP,     pmovshdup)
+UNARY_INT_SSE(VMOVDDUP,      pmovdldup)
+
 #define UNARY_CMP_SSE(uname, lname)                                                \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -1981,6 +2000,110 @@ static void gen_VMASKMOVPS_st(DisasContext *s, CPUX86State *env, X86DecodedInsn
     gen_maskmov(s, env, decode, gen_helper_vpmaskmovd_st_xmm, gen_helper_vpmaskmovd_st_ymm);
 }
 
+static void gen_VMOVHPx_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    }
+    gen_ldq_env_A0(s, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+}
+
+static void gen_VMOVHPx_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_stq_env_A0(s, decode->op[2].offset + offsetof(XMMReg, XMM_Q(1)));
+}
+
+static void gen_VMOVHPx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    }
+    if (decode->op[0].offset != decode->op[2].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(1)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+    }
+}
+
+static void gen_VMOVHLPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(1)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+    }
+}
+
+static void gen_VMOVLHPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(0)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    }
+}
+
+static void gen_VMOVLPx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(0)));
+    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+}
+
+static void gen_VMOVLPx_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_64);
+    tcg_gen_st_i64(s->tmp1_i64, s->ptr0, offsetof(ZMMReg, ZMM_Q(0)));
+}
+
+static void gen_VMOVLPx_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, s->ptr2, offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_64);
+}
+
+static void gen_VMOVSD_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv zero = tcg_const_i64(0);
+
+    tcg_gen_st_i64(zero, s->ptr0, offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_64);
+    tcg_gen_st_i64(s->tmp1_i64, s->ptr0, offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_temp_free_i64(zero);
+}
+
+sL(0)));
+}
+
+static void gen_VMOVSS_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0, s->mem_index, MO_32);
+    tcg_gen_st_i32(s->tmp2_i32, s->ptr0, offsetof(ZMMReg, ZMM_L(0)));
+}
+
+static void gen_VMOVSS_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i32(s->tmp2_i32, s->ptr2, offsetof(ZMMReg, ZMM_L(0)));
+    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0, s->mem_index, MO_32);
+}
+
 static void gen_VPMASKMOV_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     if (s->rex_w) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 468867afcf..bb5f74140c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4668,6 +4668,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
+             (b >= 0x110 && b <= 0x117) ||
              (b >= 0x150 && b <= 0x17f) ||
              b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
-- 
2.37.2



