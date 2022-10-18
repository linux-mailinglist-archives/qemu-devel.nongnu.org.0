Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D260602EA6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:37:55 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknj7-0001Ez-AO
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiu-0005DR-C3
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmil-0005Rk-S1
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666100003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2tUGOXuI0TyN5MG0uj5kKIsjD0MT6rNQlPHoQhF8uI=;
 b=KDNbdpa79ObxtmqB+ViuMHmXDK68YdF+rLPJ3HBzf6RdNgYXz6fgpSxSqXEMaQUm0r7R6P
 /BI3ZME9/wM/A/L96itBcv/xAT8ek37N/DbU4K4celg7TyGWp1bRW4OpcKeQCJkUmMFzXT
 UTIFOMlp1FnTdr88oCC3fWYDBg5TKSw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-ATNEBcAwME2Umcjm2NCqGg-1; Tue, 18 Oct 2022 09:33:17 -0400
X-MC-Unique: ATNEBcAwME2Umcjm2NCqGg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso11498680edb.3
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2tUGOXuI0TyN5MG0uj5kKIsjD0MT6rNQlPHoQhF8uI=;
 b=VDSkkjQTEpTCYFdkyJ7I3UX7l80MF+ZfGqCpADhjTz+ont0NWfDFCJcW3yCPnhYOwH
 choFdqpFuRItwfnZ+gwrHQDfcSJvILk48bhQvFxh3uMvc4Evm4tkk2i+mJvR1eRAdv0n
 BihqXObHLhVYxzfgXE/bnHhlWnxyH3CqhMYC8N+idmZcg0gl6YHrZi/vV4ymC8cauOUL
 HRa2hVy7v1aPAWuqw8QA4j/xaenyKau2bxIsTSRQiJyGMmWRSRng8dohL3ZD3a8Dzp5f
 CTrfi4WCQwGa8PdC8pzCbTbivfdUrMWjWyhh7Jwv9Dxp5nf1H1wQ7H+UfDZNv6iZHvGO
 IfLA==
X-Gm-Message-State: ACrzQf39KRdiIWCZn+1NLLKC40+0+w7MetEQl1QwWtjjnrgmuWLUbBVZ
 DGylI02gT/2Oe14VT19jPe12SevPHtbT1cj86okrZ/p5L25wT+FZLKOutSa5yYEpa+BAqn+y2Uh
 njsqIo6BO7vqzih/msnkoctz8dgGiLXqJVeiATG/UXDGANqr4Iv4Ekca/rB0/BARVm5c=
X-Received: by 2002:a05:6402:26cf:b0:45d:48d7:928e with SMTP id
 x15-20020a05640226cf00b0045d48d7928emr2544288edd.275.1666099988857; 
 Tue, 18 Oct 2022 06:33:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Xqa5eMU2i6Qf5FT3NvPuiSKDW+MTFG7pFV8tll6OjK/XNuQQZ7UsY88ulXPf7pt6VfR1KeQ==
X-Received: by 2002:a05:6402:26cf:b0:45d:48d7:928e with SMTP id
 x15-20020a05640226cf00b0045d48d7928emr2544218edd.275.1666099987937; 
 Tue, 18 Oct 2022 06:33:07 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b0078ddb518a90sm7433716ejt.223.2022.10.18.06.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 44/53] target/i386: reimplement 0x0f 0x38, add AVX
Date: Tue, 18 Oct 2022 15:30:33 +0200
Message-Id: <20221018133042.856368-45-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

There are several special cases here:

1) extending moves have different widths for the helpers vs. for the
memory loads, and the width for memory loads depends on VEX.L too.
This is represented by X86_SPECIAL_AVXExtMov.

2) some instructions, such as variable-width shifts, select the vector element
size via REX.W.

3) VSIB instructions (VGATHERxPy, VPGATHERxy) are also part of this group,
and they have (among other things) two output operands.

3) the macros for 4-operand blends (which are under 0x0f 0x3a) have to be
extended to support 2-operand blends.  The 2-operand variant actually
came a few years earlier, but it is clearer to implement them in the
opposite order.

X86_TYPE_WM, introduced earlier for unaligned loads, is reused for helpers
that accept a Reg* but have a M argument.

These three-byte opcodes also include AVX new instructions, for which
the helpers were originally implemented by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h            | 188 +++++++++++++++++++++++++++-
 target/i386/ops_sse_header.h     |  19 +++
 target/i386/tcg/decode-new.c.inc | 112 ++++++++++++++++-
 target/i386/tcg/decode-new.h     |   6 +
 target/i386/tcg/emit.c.inc       | 205 ++++++++++++++++++++++++++++++-
 target/i386/tcg/translate.c      |   2 +-
 6 files changed, 524 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index cb8909adcf..e3cc6948dd 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2382,6 +2382,36 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #endif
 
 #if SHIFT >= 1
+void glue(helper_vpermilpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint64_t r0, r1;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        r0 = v->Q(i + ((s->Q(i) >> 1) & 1));
+        r1 = v->Q(i + ((s->Q(i+1) >> 1) & 1));
+        d->Q(i) = r0;
+        d->Q(i+1) = r1;
+    }
+}
+
+void glue(helper_vpermilps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint32_t r0, r1, r2, r3;
+    int i;
+
+    for (i = 0; i < 2 << SHIFT; i += 4) {
+        r0 = v->L(i + (s->L(i) & 3));
+        r1 = v->L(i + (s->L(i+1) & 3));
+        r2 = v->L(i + (s->L(i+2) & 3));
+        r3 = v->L(i + (s->L(i+3) & 3));
+        d->L(i) = r0;
+        d->L(i+1) = r1;
+        d->L(i+2) = r2;
+        d->L(i+3) = r3;
+    }
+}
+
 void glue(helper_vpermilpd_imm, SUFFIX)(Reg *d, Reg *s, uint32_t order)
 {
     uint64_t r0, r1;
@@ -2414,6 +2444,150 @@ void glue(helper_vpermilps_imm, SUFFIX)(Reg *d, Reg *s, uint32_t order)
     }
 }
 
+#if SHIFT == 1
+#define FPSRLVD(x, c) (c < 32 ? ((x) >> c) : 0)
+#define FPSRLVQ(x, c) (c < 64 ? ((x) >> c) : 0)
+#define FPSRAVD(x, c) ((int32_t)(x) >> (c < 32 ? c : 31))
+#define FPSRAVQ(x, c) ((int64_t)(x) >> (c < 64 ? c : 63))
+#define FPSLLVD(x, c) (c < 32 ? ((x) << c) : 0)
+#define FPSLLVQ(x, c) (c < 64 ? ((x) << c) : 0)
+#endif
+
+SSE_HELPER_L(helper_vpsrlvd, FPSRLVD)
+SSE_HELPER_L(helper_vpsravd, FPSRAVD)
+SSE_HELPER_L(helper_vpsllvd, FPSLLVD)
+
+SSE_HELPER_Q(helper_vpsrlvq, FPSRLVQ)
+SSE_HELPER_Q(helper_vpsravq, FPSRAVQ)
+SSE_HELPER_Q(helper_vpsllvq, FPSLLVQ)
+
+void glue(helper_vtestps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint32_t zf = 0, cf = 0;
+    int i;
+
+    for (i = 0; i < 2 << SHIFT; i++) {
+        zf |= (s->L(i) &  d->L(i));
+        cf |= (s->L(i) & ~d->L(i));
+    }
+    CC_SRC = ((zf >> 31) ? 0 : CC_Z) | ((cf >> 31) ? 0 : CC_C);
+}
+
+void glue(helper_vtestpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint64_t zf = 0, cf = 0;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i++) {
+        zf |= (s->Q(i) &  d->Q(i));
+        cf |= (s->Q(i) & ~d->Q(i));
+    }
+    CC_SRC = ((zf >> 63) ? 0 : CC_Z) | ((cf >> 63) ? 0 : CC_C);
+}
+
+void glue(helper_vpmaskmovd_st, SUFFIX)(CPUX86State *env,
+                                        Reg *v, Reg *s, target_ulong a0)
+{
+    int i;
+
+    for (i = 0; i < (2 << SHIFT); i++) {
+        if (v->L(i) >> 31) {
+            cpu_stl_data_ra(env, a0 + i * 4, s->L(i), GETPC());
+        }
+    }
+}
+
+void glue(helper_vpmaskmovq_st, SUFFIX)(CPUX86State *env,
+                                        Reg *v, Reg *s, target_ulong a0)
+{
+    int i;
+
+    for (i = 0; i < (1 << SHIFT); i++) {
+        if (v->Q(i) >> 63) {
+            cpu_stq_data_ra(env, a0 + i * 8, s->Q(i), GETPC());
+        }
+    }
+}
+
+void glue(helper_vpmaskmovd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    int i;
+
+    for (i = 0; i < (2 << SHIFT); i++) {
+        d->L(i) = (v->L(i) >> 31) ? s->L(i) : 0;
+    }
+}
+
+void glue(helper_vpmaskmovq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    int i;
+
+    for (i = 0; i < (1 << SHIFT); i++) {
+        d->Q(i) = (v->Q(i) >> 63) ? s->Q(i) : 0;
+    }
+}
+
+void glue(helper_vpgatherdd, SUFFIX)(CPUX86State *env,
+        Reg *d, Reg *v, Reg *s, target_ulong a0, unsigned scale)
+{
+    int i;
+    for (i = 0; i < (2 << SHIFT); i++) {
+        if (v->L(i) >> 31) {
+            target_ulong addr = a0
+                + ((target_ulong)(int32_t)s->L(i) << scale);
+            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());
+        }
+        v->L(i) = 0;
+    }
+}
+
+void glue(helper_vpgatherdq, SUFFIX)(CPUX86State *env,
+        Reg *d, Reg *v, Reg *s, target_ulong a0, unsigned scale)
+{
+    int i;
+    for (i = 0; i < (1 << SHIFT); i++) {
+        if (v->Q(i) >> 63) {
+            target_ulong addr = a0
+                + ((target_ulong)(int32_t)s->L(i) << scale);
+            d->Q(i) = cpu_ldq_data_ra(env, addr, GETPC());
+        }
+        v->Q(i) = 0;
+    }
+}
+
+void glue(helper_vpgatherqd, SUFFIX)(CPUX86State *env,
+        Reg *d, Reg *v, Reg *s, target_ulong a0, unsigned scale)
+{
+    int i;
+    for (i = 0; i < (1 << SHIFT); i++) {
+        if (v->L(i) >> 31) {
+            target_ulong addr = a0
+                + ((target_ulong)(int64_t)s->Q(i) << scale);
+            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());
+        }
+        v->L(i) = 0;
+    }
+    for (i /= 2; i < 1 << SHIFT; i++) {
+        d->Q(i) = 0;
+        v->Q(i) = 0;
+    }
+}
+
+void glue(helper_vpgatherqq, SUFFIX)(CPUX86State *env,
+        Reg *d, Reg *v, Reg *s, target_ulong a0, unsigned scale)
+{
+    int i;
+    for (i = 0; i < (1 << SHIFT); i++) {
+        if (v->Q(i) >> 63) {
+            target_ulong addr = a0
+                + ((target_ulong)(int64_t)s->Q(i) << scale);
+            d->Q(i) = cpu_ldq_data_ra(env, addr, GETPC());
+        }
+        v->Q(i) = 0;
+    }
+}
+#endif
+
 #if SHIFT >= 2
 void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
 {
@@ -2473,7 +2647,19 @@ void helper_vpermq_ymm(Reg *d, Reg *s, uint32_t order)
     d->Q(2) = r2;
     d->Q(3) = r3;
 }
-#endif
+
+void helper_vpermd_ymm(Reg *d, Reg *v, Reg *s)
+{
+    uint32_t r[8];
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        r[i] = s->L(v->L(i) & 7);
+    }
+    for (i = 0; i < 8; i++) {
+        d->L(i) = r[i];
+    }
+}
 #endif
 
 #undef SSE_HELPER_S
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 1afc4ff6a1..dd8dcebc23 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -413,9 +413,28 @@ DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 
 /* AVX helpers */
 #if SHIFT >= 1
+DEF_HELPER_4(glue(vpermilpd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpermilps, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_3(glue(vpermilpd_imm, SUFFIX), void, Reg, Reg, i32)
 DEF_HELPER_3(glue(vpermilps_imm, SUFFIX), void, Reg, Reg, i32)
+DEF_HELPER_4(glue(vpsrlvd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsravd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsllvd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsrlvq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsravq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsllvq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_3(glue(vtestps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vtestpd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(vpmaskmovd_st, SUFFIX), void, env, Reg, Reg, tl)
+DEF_HELPER_4(glue(vpmaskmovq_st, SUFFIX), void, env, Reg, Reg, tl)
+DEF_HELPER_4(glue(vpmaskmovd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpmaskmovq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_6(glue(vpgatherdd, SUFFIX), void, env, Reg, Reg, Reg, tl, i32)
+DEF_HELPER_6(glue(vpgatherdq, SUFFIX), void, env, Reg, Reg, Reg, tl, i32)
+DEF_HELPER_6(glue(vpgatherqd, SUFFIX), void, env, Reg, Reg, Reg, tl, i32)
+DEF_HELPER_6(glue(vpgatherqq, SUFFIX), void, env, Reg, Reg, Reg, tl, i32)
 #if SHIFT == 2
+DEF_HELPER_3(vpermd_ymm, void, Reg, Reg, Reg)
 DEF_HELPER_4(vpermdq_ymm, void, Reg, Reg, Reg, i32)
 DEF_HELPER_3(vpermq_ymm, void, Reg, Reg, i32)
 #endif
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 3330085b3e..e148edd819 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -92,6 +92,7 @@
 #define mmx .special = X86_SPECIAL_MMX,
 #define zext0 .special = X86_SPECIAL_ZExtOp0,
 #define zext2 .special = X86_SPECIAL_ZExtOp2,
+#define avx_movx .special = X86_SPECIAL_AVXExtMov,
 
 #define vex1 .vex_class = 1,
 #define vex1_rep3 .vex_class = 1, .vex_special = X86_VEX_REPScalar,
@@ -302,6 +303,105 @@ static void decode_0FD6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 }
 
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
+    [0x00] = X86_OP_ENTRY3(PSHUFB,    V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x01] = X86_OP_ENTRY3(PHADDW,    V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x02] = X86_OP_ENTRY3(PHADDD,    V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x03] = X86_OP_ENTRY3(PHADDSW,   V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x04] = X86_OP_ENTRY3(PMADDUBSW, V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x05] = X86_OP_ENTRY3(PHSUBW,    V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x06] = X86_OP_ENTRY3(PHSUBD,    V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x07] = X86_OP_ENTRY3(PHSUBSW,   V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+
+    [0x10] = X86_OP_ENTRY2(PBLENDVB,  V,x,         W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x14] = X86_OP_ENTRY2(BLENDVPS,  V,x,         W,x,  vex4 cpuid(SSE41) p_66),
+    [0x15] = X86_OP_ENTRY2(BLENDVPD,  V,x,         W,x,  vex4 cpuid(SSE41) p_66),
+    /* Listed incorrectly as type 4 */
+    [0x16] = X86_OP_ENTRY3(VPERMD,    V,qq, H,qq,      W,qq,  vex6 cpuid(AVX2) p_66),
+    [0x17] = X86_OP_ENTRY3(VPTEST,    None,None, V,x,  W,x,   vex4 cpuid(SSE41) p_66),
+
+    /*
+     * Source operand listed as Mq/Ux and similar in the manual; incorrectly listed
+     * as 128-bit only in 2-17.
+     */
+    [0x20] = X86_OP_ENTRY3(VPMOVSXBW, V,x,  None,None, W,q,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x21] = X86_OP_ENTRY3(VPMOVSXBD, V,x,  None,None, W,d,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x22] = X86_OP_ENTRY3(VPMOVSXBQ, V,x,  None,None, W,w,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x23] = X86_OP_ENTRY3(VPMOVSXWD, V,x,  None,None, W,q,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x24] = X86_OP_ENTRY3(VPMOVSXWQ, V,x,  None,None, W,d,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x25] = X86_OP_ENTRY3(VPMOVSXDQ, V,x,  None,None, W,q,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+
+    /* Same as PMOVSX.  */
+    [0x30] = X86_OP_ENTRY3(VPMOVZXBW, V,x,  None,None, W,q,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x31] = X86_OP_ENTRY3(VPMOVZXBD, V,x,  None,None, W,d,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x32] = X86_OP_ENTRY3(VPMOVZXBQ, V,x,  None,None, W,w,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x33] = X86_OP_ENTRY3(VPMOVZXWD, V,x,  None,None, W,q,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x34] = X86_OP_ENTRY3(VPMOVZXWQ, V,x,  None,None, W,d,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x35] = X86_OP_ENTRY3(VPMOVZXDQ, V,x,  None,None, W,q,   vex5 cpuid(SSE41) avx_movx avx2_256 p_66),
+    [0x36] = X86_OP_ENTRY3(VPERMD,    V,qq, H,qq,      W,qq,  vex6 cpuid(AVX2) p_66),
+    [0x37] = X86_OP_ENTRY3(PCMPGTQ,   V,x,  H,x,       W,x,   vex4 cpuid(SSE42) avx2_256 p_66),
+
+    [0x40] = X86_OP_ENTRY3(PMULLD,      V,x,  H,x,       W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x41] = X86_OP_ENTRY3(VPHMINPOSUW, V,dq, None,None, W,dq, vex4 cpuid(SSE41) p_66),
+    /* Listed incorrectly as type 4 */
+    [0x45] = X86_OP_ENTRY3(VPSRLV,      V,x,  H,x,       W,x,  vex6 cpuid(AVX2) p_66),
+    [0x46] = X86_OP_ENTRY3(VPSRAV,      V,x,  H,x,       W,x,  vex6 cpuid(AVX2) p_66),
+    [0x47] = X86_OP_ENTRY3(VPSLLV,      V,x,  H,x,       W,x,  vex6 cpuid(AVX2) p_66),
+
+    [0x90] = X86_OP_ENTRY3(VPGATHERD, V,x,  H,x,  M,d,  vex12 cpuid(AVX2) p_66), /* vpgatherdd/q */
+    [0x91] = X86_OP_ENTRY3(VPGATHERQ, V,x,  H,x,  M,q,  vex12 cpuid(AVX2) p_66), /* vpgatherqd/q */
+    [0x92] = X86_OP_ENTRY3(VPGATHERD, V,x,  H,x,  M,d,  vex12 cpuid(AVX2) p_66), /* vgatherdps/d */
+    [0x93] = X86_OP_ENTRY3(VPGATHERQ, V,x,  H,x,  M,q,  vex12 cpuid(AVX2) p_66), /* vgatherqps/d */
+
+    [0x08] = X86_OP_ENTRY3(PSIGNB,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x09] = X86_OP_ENTRY3(PSIGNW,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x0a] = X86_OP_ENTRY3(PSIGND,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x0b] = X86_OP_ENTRY3(PMULHRSW,  V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x0c] = X86_OP_ENTRY3(VPERMILPS, V,x,        H,x,  W,x,  vex4 cpuid(AVX) p_00_66),
+    [0x0d] = X86_OP_ENTRY3(VPERMILPD, V,x,        H,x,  W,x,  vex4 cpuid(AVX) p_66),
+    [0x0e] = X86_OP_ENTRY3(VTESTPS,   None,None,  V,x,  W,x,  vex4 cpuid(AVX) p_66),
+    [0x0f] = X86_OP_ENTRY3(VTESTPD,   None,None,  V,x,  W,x,  vex4 cpuid(AVX) p_66),
+
+    [0x18] = X86_OP_ENTRY3(VPBROADCASTD,   V,x,  None,None, W,d,  vex6 cpuid(AVX) p_66), /* vbroadcastss */
+    [0x19] = X86_OP_ENTRY3(VPBROADCASTQ,   V,qq, None,None, W,q,  vex6 cpuid(AVX) p_66), /* vbroadcastsd */
+    [0x1a] = X86_OP_ENTRY3(VBROADCASTx128, V,qq, None,None, WM,dq,vex6 cpuid(AVX) p_66),
+    [0x1c] = X86_OP_ENTRY3(PABSB,          V,x,  None,None, W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x1d] = X86_OP_ENTRY3(PABSW,          V,x,  None,None, W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+    [0x1e] = X86_OP_ENTRY3(PABSD,          V,x,  None,None, W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
+
+    [0x28] = X86_OP_ENTRY3(PMULDQ,        V,x, H,x,       W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x29] = X86_OP_ENTRY3(PCMPEQQ,       V,x, H,x,       W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x2a] = X86_OP_ENTRY3(MOVDQ,         V,x, None,None, WM,x, vex1 cpuid(SSE41) avx2_256 p_66), /* movntdqa */
+    [0x2b] = X86_OP_ENTRY3(VPACKUSDW,     V,x, H,x,       W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x2c] = X86_OP_ENTRY3(VMASKMOVPS,    V,x, H,x,       WM,x, vex6 cpuid(AVX) p_66),
+    [0x2d] = X86_OP_ENTRY3(VMASKMOVPD,    V,x, H,x,       WM,x, vex6 cpuid(AVX) p_66),
+    /* Incorrectly listed as Mx,Hx,Vx in the manual */
+    [0x2e] = X86_OP_ENTRY3(VMASKMOVPS_st, M,x, V,x,       H,x,  vex6 cpuid(AVX) p_66),
+    [0x2f] = X86_OP_ENTRY3(VMASKMOVPD_st, M,x, V,x,       H,x,  vex6 cpuid(AVX) p_66),
+
+    [0x38] = X86_OP_ENTRY3(PMINSB,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x39] = X86_OP_ENTRY3(PMINSD,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x3a] = X86_OP_ENTRY3(PMINUW,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x3b] = X86_OP_ENTRY3(PMINUD,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x3c] = X86_OP_ENTRY3(PMAXSB,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x3d] = X86_OP_ENTRY3(PMAXSD,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x3e] = X86_OP_ENTRY3(PMAXUW,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x3f] = X86_OP_ENTRY3(PMAXUD,        V,x,  H,x, W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+
+    [0x58] = X86_OP_ENTRY3(VPBROADCASTD,   V,x,  None,None, W,d,  vex6 cpuid(AVX2) p_66),
+    [0x59] = X86_OP_ENTRY3(VPBROADCASTQ,   V,x,  None,None, W,q,  vex6 cpuid(AVX2) p_66),
+    [0x5a] = X86_OP_ENTRY3(VBROADCASTx128, V,qq, None,None, WM,dq,vex6 cpuid(AVX2) p_66),
+
+    [0x78] = X86_OP_ENTRY3(VPBROADCASTB,   V,x,  None,None, W,b,  vex6 cpuid(AVX2) p_66),
+    [0x79] = X86_OP_ENTRY3(VPBROADCASTW,   V,x,  None,None, W,w,  vex6 cpuid(AVX2) p_66),
+
+    [0x8c] = X86_OP_ENTRY3(VPMASKMOV,    V,x,  H,x, WM,x, vex6 cpuid(AVX2) p_66),
+    [0x8e] = X86_OP_ENTRY3(VPMASKMOV_st, M,x,  V,x, H,x,  vex6 cpuid(AVX2) p_66),
+
+    [0xdb] = X86_OP_ENTRY3(VAESIMC,     V,dq, None,None, W,dq, vex4 cpuid(AES) p_66),
+    [0xdc] = X86_OP_ENTRY3(VAESENC,     V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
+    [0xdd] = X86_OP_ENTRY3(VAESENCLAST, V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
+    [0xde] = X86_OP_ENTRY3(VAESDEC,     V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
+    [0xdf] = X86_OP_ENTRY3(VAESDECLAST, V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
 };
 
 /* five rows for no prefix, 66, F3, F2, 66+F2  */
@@ -431,8 +531,8 @@ static const X86OpEntry opcodes_0F3A[256] = {
     [0x0b] = X86_OP_ENTRY4(VROUNDSD,   V,x,  H,x, W,sd, vex3 cpuid(SSE41) p_66),
     [0x0c] = X86_OP_ENTRY4(VBLENDPS,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
     [0x0d] = X86_OP_ENTRY4(VBLENDPD,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
-    [0x0e] = X86_OP_ENTRY4(VPBLENDW,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
-    [0x0f] = X86_OP_ENTRY4(PALIGNR,    V,x,  H,x,  W,x,  vex4 cpuid(SSSE3) mmx p_00_66),
+    [0x0e] = X86_OP_ENTRY4(VPBLENDW,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x0f] = X86_OP_ENTRY4(PALIGNR,    V,x,  H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
 
     [0x18] = X86_OP_ENTRY4(VINSERTx128,  V,qq, H,qq, W,qq, vex6 cpuid(AVX) p_66),
     [0x19] = X86_OP_ENTRY3(VEXTRACTx128, W,dq, V,qq, I,b,  vex6 cpuid(AVX) p_66),
@@ -1428,6 +1528,14 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
         }
         break;
 
+    case X86_SPECIAL_AVXExtMov:
+        if (!decode.op[2].has_ea) {
+            decode.op[2].ot = s->vex_l ? MO_256 : MO_128;
+        } else if (s->vex_l) {
+            decode.op[2].ot++;
+        }
+        break;
+
     case X86_SPECIAL_MMX:
         if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA))) {
             gen_helper_enter_mmx(cpu_env);
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index ef318a00ed..2f0b0e4cfd 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -142,6 +142,12 @@ typedef enum X86InsnSpecial {
     X86_SPECIAL_ZExtOp0,
     X86_SPECIAL_ZExtOp2,
 
+    /*
+     * Register operand 2 is extended to full width, while a memory operand
+     * is doubled in size if VEX.L=1.
+     */
+    X86_SPECIAL_AVXExtMov,
+
     /*
      * MMX instruction exists with no prefix; if there is no prefix, V/H/W/U operands
      * become P/P/Q/N, and size "x" becomes "q".
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index ad93094ca8..e33688f672 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -19,6 +19,9 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+typedef void (*SSEFunc_0_epppti)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                 TCGv_ptr reg_c, TCGv a0, TCGv_i32 scale);
+
 static inline TCGv_i32 tcg_constant8u_i32(uint8_t val)
 {
     return tcg_constant_i32(val);
@@ -484,15 +487,20 @@ static inline void gen_ternary_sse(DisasContext *s, CPUX86State *env, X86Decoded
     fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, ptr3);
     tcg_temp_free_ptr(ptr3);
 }
-#define TERNARY_SSE(uvname, lname)                                                 \
+#define TERNARY_SSE(uname, uvname, lname)                                          \
 static void gen_##uvname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
     gen_ternary_sse(s, env, decode, (uint8_t)decode->immediate >> 4,               \
                     gen_helper_##lname##_xmm, gen_helper_##lname##_ymm);           \
+}                                                                                  \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_ternary_sse(s, env, decode, 0,                                             \
+                  gen_helper_##lname##_xmm, gen_helper_##lname##_ymm);             \
 }
-TERNARY_SSE(VBLENDVPS, blendvps)
-TERNARY_SSE(VBLENDVPD, blendvpd)
-TERNARY_SSE(VPBLENDVB, pblendvb)
+TERNARY_SSE(BLENDVPS, VBLENDVPS, blendvps)
+TERNARY_SSE(BLENDVPD, VBLENDVPD, blendvpd)
+TERNARY_SSE(PBLENDVB, VPBLENDVB, pblendvb)
 
 static inline void gen_binary_imm_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
                                       SSEFunc_0_epppi xmm, SSEFunc_0_epppi ymm)
@@ -522,6 +530,25 @@ BINARY_IMM_SSE(VDDPD,      dppd)
 BINARY_IMM_SSE(VMPSADBW,   mpsadbw)
 BINARY_IMM_SSE(PCLMULQDQ,  pclmulqdq)
 
+
+#define UNARY_INT_GVEC(uname, func, ...)                                           \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    int vec_len = vector_len(s, decode);                                          \
+                                                                                   \
+    func(__VA_ARGS__, decode->op[0].offset,                                        \
+         decode->op[2].offset, vec_len, vec_len);                                  \
+}
+UNARY_INT_GVEC(PABSB,          tcg_gen_gvec_abs, MO_8)
+UNARY_INT_GVEC(PABSW,          tcg_gen_gvec_abs, MO_16)
+UNARY_INT_GVEC(PABSD,          tcg_gen_gvec_abs, MO_32)
+UNARY_INT_GVEC(VBROADCASTx128, tcg_gen_gvec_dup_mem, MO_128)
+UNARY_INT_GVEC(VPBROADCASTB,   tcg_gen_gvec_dup_mem, MO_8)
+UNARY_INT_GVEC(VPBROADCASTW,   tcg_gen_gvec_dup_mem, MO_16)
+UNARY_INT_GVEC(VPBROADCASTD,   tcg_gen_gvec_dup_mem, MO_32)
+UNARY_INT_GVEC(VPBROADCASTQ,   tcg_gen_gvec_dup_mem, MO_64)
+
+
 #define BINARY_INT_GVEC(uname, func, ...)                                          \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -544,14 +571,25 @@ BINARY_INT_GVEC(PAND,    tcg_gen_gvec_and, MO_64)
 BINARY_INT_GVEC(PCMPEQB, tcg_gen_gvec_cmp, TCG_COND_EQ, MO_8)
 BINARY_INT_GVEC(PCMPEQD, tcg_gen_gvec_cmp, TCG_COND_EQ, MO_32)
 BINARY_INT_GVEC(PCMPEQW, tcg_gen_gvec_cmp, TCG_COND_EQ, MO_16)
+BINARY_INT_GVEC(PCMPEQQ, tcg_gen_gvec_cmp, TCG_COND_EQ, MO_64)
 BINARY_INT_GVEC(PCMPGTB, tcg_gen_gvec_cmp, TCG_COND_GT, MO_8)
 BINARY_INT_GVEC(PCMPGTW, tcg_gen_gvec_cmp, TCG_COND_GT, MO_16)
 BINARY_INT_GVEC(PCMPGTD, tcg_gen_gvec_cmp, TCG_COND_GT, MO_32)
+BINARY_INT_GVEC(PCMPGTQ, tcg_gen_gvec_cmp, TCG_COND_GT, MO_64)
+BINARY_INT_GVEC(PMAXSB,  tcg_gen_gvec_smax, MO_8)
 BINARY_INT_GVEC(PMAXSW,  tcg_gen_gvec_smax, MO_16)
+BINARY_INT_GVEC(PMAXSD,  tcg_gen_gvec_smax, MO_32)
 BINARY_INT_GVEC(PMAXUB,  tcg_gen_gvec_umax, MO_8)
+BINARY_INT_GVEC(PMAXUW,  tcg_gen_gvec_umax, MO_16)
+BINARY_INT_GVEC(PMAXUD,  tcg_gen_gvec_umax, MO_32)
+BINARY_INT_GVEC(PMINSB,  tcg_gen_gvec_smin, MO_8)
 BINARY_INT_GVEC(PMINSW,  tcg_gen_gvec_smin, MO_16)
+BINARY_INT_GVEC(PMINSD,  tcg_gen_gvec_smin, MO_32)
 BINARY_INT_GVEC(PMINUB,  tcg_gen_gvec_umin, MO_8)
+BINARY_INT_GVEC(PMINUW,  tcg_gen_gvec_umin, MO_16)
+BINARY_INT_GVEC(PMINUD,  tcg_gen_gvec_umin, MO_32)
 BINARY_INT_GVEC(PMULLW,  tcg_gen_gvec_mul, MO_16)
+BINARY_INT_GVEC(PMULLD,  tcg_gen_gvec_mul, MO_32)
 BINARY_INT_GVEC(POR,     tcg_gen_gvec_or, MO_64)
 BINARY_INT_GVEC(PSUBB,   tcg_gen_gvec_sub, MO_8)
 BINARY_INT_GVEC(PSUBW,   tcg_gen_gvec_sub, MO_16)
@@ -626,6 +664,19 @@ BINARY_INT_MMX(PSRLQ_r, psrlq)
 BINARY_INT_MMX(PSRAW_r, psraw)
 BINARY_INT_MMX(PSRAD_r, psrad)
 
+BINARY_INT_MMX(PHADDW,    phaddw)
+BINARY_INT_MMX(PHADDSW,   phaddsw)
+BINARY_INT_MMX(PHADDD,    phaddd)
+BINARY_INT_MMX(PHSUBW,    phsubw)
+BINARY_INT_MMX(PHSUBSW,   phsubsw)
+BINARY_INT_MMX(PHSUBD,    phsubd)
+BINARY_INT_MMX(PMADDUBSW, pmaddubsw)
+BINARY_INT_MMX(PSHUFB,    pshufb)
+BINARY_INT_MMX(PSIGNB,    psignb)
+BINARY_INT_MMX(PSIGNW,    psignw)
+BINARY_INT_MMX(PSIGND,    psignd)
+BINARY_INT_MMX(PMULHRSW,  pmulhrsw)
+
 /* Instructions with no MMX equivalent.  */
 #define BINARY_INT_SSE(uname, lname)                                               \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -636,8 +687,35 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
                           gen_helper_##lname##_ymm);                               \
 }
 
+/* Instructions with no MMX equivalent.  */
 BINARY_INT_SSE(PUNPCKLQDQ, punpcklqdq)
 BINARY_INT_SSE(PUNPCKHQDQ, punpckhqdq)
+BINARY_INT_SSE(VPACKUSDW,  packusdw)
+BINARY_INT_SSE(VPERMILPS,  vpermilps)
+BINARY_INT_SSE(VPERMILPD,  vpermilpd)
+BINARY_INT_SSE(VMASKMOVPS, vpmaskmovd)
+BINARY_INT_SSE(VMASKMOVPD, vpmaskmovq)
+
+BINARY_INT_SSE(PMULDQ,    pmuldq)
+
+BINARY_INT_SSE(VAESDEC, aesdec)
+BINARY_INT_SSE(VAESDECLAST, aesdeclast)
+BINARY_INT_SSE(VAESENC, aesenc)
+BINARY_INT_SSE(VAESENCLAST, aesenclast)
+
+#define UNARY_CMP_SSE(uname, lname)                                                \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    if (!s->vex_l) {                                                               \
+        gen_helper_##lname##_xmm(cpu_env, OP_PTR1, OP_PTR2);                       \
+    } else {                                                                       \
+        gen_helper_##lname##_ymm(cpu_env, OP_PTR1, OP_PTR2);                       \
+    }                                                                              \
+    set_cc_op(s, CC_OP_EFLAGS);                                                    \
+}
+UNARY_CMP_SSE(VPTEST,     ptest)
+UNARY_CMP_SSE(VTESTPS,    vtestps)
+UNARY_CMP_SSE(VTESTPD,    vtestpd)
 
 static inline void gen_unary_int_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
                                      SSEFunc_0_epp xmm, SSEFunc_0_epp ymm)
@@ -657,6 +735,20 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
                       gen_helper_##lname##_ymm);                                   \
 }
 
+UNARY_INT_SSE(VPMOVSXBW,    pmovsxbw)
+UNARY_INT_SSE(VPMOVSXBD,    pmovsxbd)
+UNARY_INT_SSE(VPMOVSXBQ,    pmovsxbq)
+UNARY_INT_SSE(VPMOVSXWD,    pmovsxwd)
+UNARY_INT_SSE(VPMOVSXWQ,    pmovsxwq)
+UNARY_INT_SSE(VPMOVSXDQ,    pmovsxdq)
+
+UNARY_INT_SSE(VPMOVZXBW,    pmovzxbw)
+UNARY_INT_SSE(VPMOVZXBD,    pmovzxbd)
+UNARY_INT_SSE(VPMOVZXBQ,    pmovzxbq)
+UNARY_INT_SSE(VPMOVZXWD,    pmovzxwd)
+UNARY_INT_SSE(VPMOVZXWQ,    pmovzxwq)
+UNARY_INT_SSE(VPMOVZXDQ,    pmovzxdq)
+
 UNARY_INT_SSE(VCVTDQ2PD, cvtdq2pd)
 UNARY_INT_SSE(VCVTPD2DQ, cvtpd2dq)
 UNARY_INT_SSE(VCVTTPD2DQ, cvttpd2dq)
@@ -714,6 +806,64 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 UNARY_IMM_FP_SSE(VROUNDPS,    roundps)
 UNARY_IMM_FP_SSE(VROUNDPD,    roundpd)
 
+static inline void gen_vexw_avx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                SSEFunc_0_eppp d_xmm, SSEFunc_0_eppp q_xmm,
+                                SSEFunc_0_eppp d_ymm, SSEFunc_0_eppp q_ymm)
+{
+    SSEFunc_0_eppp d = s->vex_l ? d_ymm : d_xmm;
+    SSEFunc_0_eppp q = s->vex_l ? q_ymm : q_xmm;
+    SSEFunc_0_eppp fn = s->vex_w ? q : d;
+    fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+}
+
+/* VEX.W affects whether to operate on 32- or 64-bit elements.  */
+#define VEXW_AVX(uname, lname)                                                     \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_vexw_avx(s, env, decode,                                                   \
+                 gen_helper_##lname##d_xmm, gen_helper_##lname##q_xmm,             \
+                 gen_helper_##lname##d_ymm, gen_helper_##lname##q_ymm);            \
+}
+VEXW_AVX(VPSLLV,    vpsllv)
+VEXW_AVX(VPSRLV,    vpsrlv)
+VEXW_AVX(VPSRAV,    vpsrav)
+VEXW_AVX(VPMASKMOV, vpmaskmov)
+
+/* Same as above, but with extra arguments to the helper.  */
+static inline void gen_vsib_avx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                SSEFunc_0_epppti d_xmm, SSEFunc_0_epppti q_xmm,
+                                SSEFunc_0_epppti d_ymm, SSEFunc_0_epppti q_ymm)
+{
+    SSEFunc_0_epppti d = s->vex_l ? d_ymm : d_xmm;
+    SSEFunc_0_epppti q = s->vex_l ? q_ymm : q_xmm;
+    SSEFunc_0_epppti fn = s->vex_w ? q : d;
+    TCGv_i32 scale = tcg_constant_i32(decode->mem.scale);
+    TCGv_ptr index = tcg_temp_new_ptr();
+
+    /* Pass third input as (index, base, scale) */
+    tcg_gen_addi_ptr(index, cpu_env, ZMM_OFFSET(decode->mem.index));
+    fn(cpu_env, OP_PTR0, OP_PTR1, index, s->A0, scale);
+
+    /*
+     * There are two output operands, so zero OP1's high 128 bits
+     * in the VEX.128 case.
+     */
+    if (!s->vex_l) {
+        int ymmh_ofs = vector_elem_offset(&decode->op[1], MO_128, 1);
+        tcg_gen_gvec_dup_imm(MO_64, ymmh_ofs, 16, 16, 0);
+    }
+    tcg_temp_free_ptr(index);
+}
+#define VSIB_AVX(uname, lname)                                                     \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_vsib_avx(s, env, decode,                                                   \
+                 gen_helper_##lname##d_xmm, gen_helper_##lname##q_xmm,             \
+                 gen_helper_##lname##d_ymm, gen_helper_##lname##q_ymm);            \
+}
+VSIB_AVX(VPGATHERD, vpgatherd)
+VSIB_AVX(VPGATHERQ, vpgatherq)
+
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
     TCGv carry_in = NULL;
@@ -1484,6 +1634,12 @@ static void gen_VAESKEYGEN(DisasContext *s, CPUX86State *env, X86DecodedInsn *de
     gen_helper_aeskeygenassist_xmm(cpu_env, OP_PTR0, OP_PTR1, imm);
 }
 
+static void gen_VAESIMC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    assert(!s->vex_l);
+    gen_helper_aesimc_xmm(cpu_env, OP_PTR0, OP_PTR2);
+}
+
 static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_unary_fp_sse(s, env, decode,
@@ -1567,6 +1723,41 @@ static void gen_VINSERTx128(DisasContext *s, CPUX86State *env, X86DecodedInsn *d
                      decode->op[1].offset + offsetof(YMMReg, YMM_X(!mask)), 16, 16);
 }
 
+static inline void gen_maskmov(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                               SSEFunc_0_eppt xmm, SSEFunc_0_eppt ymm)
+{
+    if (!s->vex_l) {
+        xmm(cpu_env, OP_PTR2, OP_PTR1, s->A0);
+    } else {
+        ymm(cpu_env, OP_PTR2, OP_PTR1, s->A0);
+    }
+}
+
+static void gen_VMASKMOVPD_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_maskmov(s, env, decode, gen_helper_vpmaskmovq_st_xmm, gen_helper_vpmaskmovq_st_ymm);
+}
+
+static void gen_VMASKMOVPS_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_maskmov(s, env, decode, gen_helper_vpmaskmovd_st_xmm, gen_helper_vpmaskmovd_st_ymm);
+}
+
+static void gen_VPMASKMOV_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->vex_w) {
+        gen_VMASKMOVPD_st(s, env, decode);
+    } else {
+        gen_VMASKMOVPS_st(s, env, decode);
+    }
+}
+
+static void gen_VPERMD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    assert(s->vex_l);
+    gen_helper_vpermd_ymm(OP_PTR0, OP_PTR1, OP_PTR2);
+}
+
 static void gen_VPERM2x128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
@@ -1574,6 +1765,12 @@ static void gen_VPERM2x128(DisasContext *s, CPUX86State *env, X86DecodedInsn *de
     gen_helper_vpermdq_ymm(OP_PTR0, OP_PTR1, OP_PTR2, imm);
 }
 
+static void gen_VPHMINPOSUW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    assert(!s->vex_l);
+    gen_helper_phminposuw_xmm(cpu_env, OP_PTR0, OP_PTR2);
+}
+
 static void gen_VROUNDSD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 857008835a..0e269e9d44 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4782,7 +4782,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         use_new &= b <= limit;
 #endif
         if (use_new &&
-            (b == 0x13a ||
+            (b == 0x138 || b == 0x13a ||
              (b >= 0x150 && b <= 0x17f) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
             disas_insn_new(s, cpu, b + 0x100);
-- 
2.37.3


