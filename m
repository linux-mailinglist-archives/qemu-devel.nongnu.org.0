Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD85BEFCE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:09:24 +0200 (CEST)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalQh-0006iI-Lp
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0G-0006Qj-HD
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0E-0002C0-LC
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ainAkqafQKOkldyIRhNwW+LS+KJbF46htGaGpDJrvY=;
 b=a2CklV8EkwQrKbcLv+g3MqWxIOUsfvDgt0jHYDThbmwn7FOMnb/22m9NvbbX+/aIA78W8a
 5jjUaudbLRAHy6pSfPmoZcYYGaAv//lFD5sGcT6bJ2tjfY5RIPQPwl7iYVz++GvL6rDbkh
 2GzLmvNKZVy4tlykl2AOO+91PzaAp3E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-otNiZunnPdWlY1LNk54f3w-1; Tue, 20 Sep 2022 13:25:44 -0400
X-MC-Unique: otNiZunnPdWlY1LNk54f3w-1
Received: by mail-ej1-f70.google.com with SMTP id
 jg32-20020a170907972000b0077ce313a8f0so1781632ejc.15
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4ainAkqafQKOkldyIRhNwW+LS+KJbF46htGaGpDJrvY=;
 b=C3fsPL9fa+cuDT05SEE/zpzaRqam3FefIhJwBMwNV+PWO1qoWW467ZL5g3B+WyBURs
 t86W5V2OEUHO4DUeACfibTniuRLh/JwDsFTivqHWGdiyGXIgJpZtHpN74NaJDhZxj3fx
 PXmJrZd4TBUezMXMimqoyuoVaSP6t24+61e4WXPFnpO/XEIKnnAUB4/hfhw3uPLDvDrA
 WwKWDNL3/NMEgO+bORXwvFvJUKwlM4Afk/atosbrul9WQUy1XU0YO/4ioiaRgi0EhMH/
 OB0TTR25un+D30QB3OiAZyMxKjSOOEyN741NlzfCRoAhMjQkREShsYAVbnl7f/WgN44V
 NGLg==
X-Gm-Message-State: ACrzQf0a8aBbOlX/yGRNnuklwEU0gTk17XjcxrHY342Qu7CYsbVxaacP
 Pex+Iw9YxlRcow85sqRZ/c3s4Pq4MFDSxrcJQrEbS3kOYjBGykAqkfNskAcsXBRZ8RN7m3en4Cu
 7vJ71J6v1JaIp0YRAOnaXi608gRuisMn7QkY+ct8x6gO9QLcuLGgtweR9TBZy1YxPb/Q=
X-Received: by 2002:a17:907:1df1:b0:77a:a670:d807 with SMTP id
 og49-20020a1709071df100b0077aa670d807mr17860667ejc.163.1663694743175; 
 Tue, 20 Sep 2022 10:25:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MNAbeyLkb5Xnl5heJxaNZlOLnMF6OdU0QGJTd3yNZt8YFNQaKmg8pCObEav7xPUE8RVDy6g==
X-Received: by 2002:a17:907:1df1:b0:77a:a670:d807 with SMTP id
 og49-20020a1709071df100b0077aa670d807mr17860650ejc.163.1663694742863; 
 Tue, 20 Sep 2022 10:25:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b0078027e6e92csm181557ejo.84.2022.09.20.10.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 22/37] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
Date: Tue, 20 Sep 2022 19:24:52 +0200
Message-Id: <20220920172507.95568-23-pbonzini@redhat.com>
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

These are a mixed batch, including the first two horizontal
(66 and F2 only) operations, more moves, and SSE4a extract/insert.

Because SSE4a is pretty rare, I chose to leave the helper as they are,
but it is possible to unify them by loading index and length from the
source XMM register and generating deposit or extract TCG ops.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 51 +++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 86 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  1 +
 3 files changed, 138 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 5b753ea329..6220142cdb 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -168,6 +168,50 @@ static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = *decode_by_prefix(s, opcodes_0F6F);
 }
 
+static void decode_0F78(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F78[4] = {
+        {},
+        X86_OP_ENTRY3(EXTRQ_i,       V,x, None,None, I,w,  cpuid(SSE4A)),
+        {},
+        X86_OP_ENTRY3(INSERTQ_i,     V,x, U,x, I,w,        cpuid(SSE4A)),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F78);
+}
+
+static void decode_0F79(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    if (s->prefix & PREFIX_REPNZ) {
+        entry->gen = gen_INSERTQ_r;
+    } else if (s->prefix & PREFIX_DATA) {
+        entry->gen = gen_EXTRQ_r;
+    } else {
+        entry->gen = NULL;
+    };
+}
+
+static void decode_0F7E(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F7E[4] = {
+        X86_OP_ENTRY3(MOVD_from,  E,y, None,None, P,y, vex5 mmx),
+        X86_OP_ENTRY3(MOVD_from,  E,y, None,None, V,y, vex5),
+        X86_OP_ENTRY3(MOVQ,       V,x, None,None, W,q, vex5),  /* wrong dest Vy on SDM! */
+        {},
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F7E);
+}
+
+static void decode_0F7F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F7F[4] = {
+        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex1 mmx), /* movq */
+        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex1), /* movdqa */
+        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex4_unal), /* movdqu */
+        {},
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F7F);
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
@@ -317,6 +361,13 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
     [0x6f] = X86_OP_GROUP0(0F6F),
 
+    [0x78] = X86_OP_GROUP0(0F78),
+    [0x79] = X86_OP_GROUP2(0F79,       V,x, U,x,       cpuid(SSE4A)),
+    [0x7c] = X86_OP_ENTRY3(VHADD,      V,x, H,x, W,x,  vex2 cpuid(SSE3) p_66_f2),
+    [0x7d] = X86_OP_ENTRY3(VHSUB,      V,x, H,x, W,x,  vex2 cpuid(SSE3) p_66_f2),
+    [0x7e] = X86_OP_GROUP0(0F7E),
+    [0x7f] = X86_OP_GROUP0(0F7F),
+
     /* Incorrectly missing from 2-17 */
     [0xd8] = X86_OP_ENTRY3(PSUBUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0xd9] = X86_OP_ENTRY3(PSUBUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 58b2fd7a2a..140a621abf 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -443,6 +443,30 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 UNARY_FP32_SSE(VRSQRT, rsqrt)
 UNARY_FP32_SSE(VRCP, rcp)
 
+/*
+ * 66 = v*pd Vpd, Hpd, Wpd
+ * f2 = v*ps Vps, Hps, Wps
+ */
+static inline void gen_horizontal_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                         SSEFunc_0_eppp pd_xmm, SSEFunc_0_eppp ps_xmm,
+                                         SSEFunc_0_eppp pd_ymm, SSEFunc_0_eppp ps_ymm)
+{
+    SSEFunc_0_eppp ps, pd, fn;
+    ps = s->vex_l ? ps_ymm : ps_xmm;
+    pd = s->vex_l ? pd_ymm : pd_xmm;
+    fn = s->prefix & PREFIX_DATA ? pd : ps;
+    fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+}
+#define HORIZONTAL_FP_SSE(uname, lname)                                            \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_horizontal_fp_sse(s, env, decode,                                          \
+                          gen_helper_##lname##pd_xmm, gen_helper_##lname##ps_xmm,  \
+                          gen_helper_##lname##pd_ymm, gen_helper_##lname##ps_ymm); \
+}
+HORIZONTAL_FP_SSE(VHADD, hadd)
+HORIZONTAL_FP_SSE(VHSUB, hsub)
+
 #define BINARY_INT_GVEC(uname, func, ...)                                          \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -716,6 +740,32 @@ static void gen_CRC32(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_crc32(s->T0, s->tmp2_i32, s->T1, tcg_constant_i32(8 << ot));
 }
 
+static void gen_EXTRQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 length = tcg_constant_i32(decode->immediate & 63);
+    TCGv_i32 index = tcg_constant_i32((decode->immediate >> 8) & 63);
+
+    gen_helper_extrq_i(cpu_env, OP_PTR0, index, length);
+}
+
+static void gen_EXTRQ_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_extrq_r(cpu_env, OP_PTR0, OP_PTR2);
+}
+
+static void gen_INSERTQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 length = tcg_constant_i32(decode->immediate & 63);
+    TCGv_i32 index = tcg_constant_i32((decode->immediate >> 8) & 63);
+
+    gen_helper_insertq_i(cpu_env, OP_PTR0, OP_PTR1, index, length);
+}
+
+static void gen_INSERTQ_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_insertq_r(cpu_env, OP_PTR0, OP_PTR2);
+}
+
 static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -728,6 +778,24 @@ static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_MOVD_from(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[2].ot;
+
+    switch (ot) {
+    case MO_32:
+#ifdef TARGET_X86_64
+        tcg_gen_ld32u_tl(s->T0, cpu_env, decode->op[2].offset);
+        break;
+    case MO_64:
+#endif
+        tcg_gen_ld_tl(s->T0, cpu_env, decode->op[2].offset);
+        break;
+    default:
+        abort();
+    }
+}
+
 static void gen_MOVD_to(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[2].ot;
@@ -766,6 +834,24 @@ static void gen_MOVMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
     tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
 }
 
+static void gen_MOVQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+    int lo_ofs = vector_elem_offset(&decode->op[0], MO_64, 0);
+
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset);
+    /*
+     * tcg_gen_gvec_dup_i64(MO_64, op0.offset, 8, vec_len, s->tmp1_64) would
+     * seem to work, but it does not on big-endian platforms; the cleared parts
+     * are always at higher addresses, but cross-endian emulation inverts the
+     * byte order so that the cleared parts need to be at *lower* addresses.
+     * Because oprsz is 8, we see this here even for SSE; but more in general,
+     * it disqualifies using oprsz < maxsz to emulate VEX128.
+     */
+    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);
+}
+
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 95172c30d0..4404440d87 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4696,6 +4696,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             ((b >= 0x150 && b <= 0x16f) ||
+             (b >= 0x178 && b <= 0x17f) ||
              (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.2


