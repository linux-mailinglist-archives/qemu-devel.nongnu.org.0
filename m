Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CC604ADC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:12:51 +0200 (CEST)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAkU-0001tp-Qt
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeZ-0000gj-6j
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeS-0000Na-NS
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666191994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qYroOAHfX8vpoCpk5hbMxu8s/WoUL5S0lSUEVC2zLs=;
 b=fluKGfq9j+O6B0pG+eevOW10FpgEqVh+gbAoxT1GYr+PFt7IDlcGu0u2Bi6iswX159VEUG
 OME/h5EMZL8XI8K/a8aNSI1UO6WegRDYd6jeo9+Mpc6/EcC2z9F77VWNZql6spBdSe/B05
 DGCk/we4pS5m5rSAAzoHGG4XpKLbsZw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-0BR3vsSjP1CCCvDAniBdag-1; Wed, 19 Oct 2022 11:06:33 -0400
X-MC-Unique: 0BR3vsSjP1CCCvDAniBdag-1
Received: by mail-qk1-f197.google.com with SMTP id
 u7-20020a05620a0c4700b006ee526183fcso14918132qki.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7qYroOAHfX8vpoCpk5hbMxu8s/WoUL5S0lSUEVC2zLs=;
 b=XetPaQi31yXC+9lyaZFxNJMz8vcWVK9FWV51ilrfyPzdsCJMgy8BfYCIP0cbh5NLUN
 flaq6V3tO+BJJsPEUyuBB2xHwhjFovf/5FIWWpBVHoFz+BPRi1eazd6jMGj+AlyOWxDv
 0E2HUd53famJ+pudQWnj48/uT52A4nLq6dyfAknZfqOTLmr9Z5N3qw6L3mQR59YPjko6
 hQeW5zNnVM2Fw+NJbXLcXOzUTOiYqxNmg705qOIEb9RfEuxy5sGjEdtgkwXMGClT+XFX
 w82XRZlEmkR9Zdi9YECRy7DXZtCIJIPB8U/SNOgfiNoQBfMHo0Uv1zqeME4flRB5JpPP
 S+pw==
X-Gm-Message-State: ACrzQf2OjKNgBuZY7uF3JQRmVR5t1HKHb0rSeliOzl2+kDbn3EYMhS5J
 2PJJjx+UXO5q+/C/410TvDf7rjQS3DqOJDArQfY1QUhehKh8WxoEI3Unt49JDzscFkr/IUfoOlH
 Vlj6bxePGxTJEWs+YhlXlt1TTlA3dF4OXrYykb5kHnZPgzWPaLWIiVeoABaDRSHip0PM=
X-Received: by 2002:ac8:5f09:0:b0:39a:4df9:9fc8 with SMTP id
 x9-20020ac85f09000000b0039a4df99fc8mr6884024qta.402.1666191992126; 
 Wed, 19 Oct 2022 08:06:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LNGoejTeTeOfSHIn502YPuQ+YQ1TO3R9TRNjoR/IMVQydm3KN1vW6dMHZi9weTXheH1aAjA==
X-Received: by 2002:ac8:5f09:0:b0:39a:4df9:9fc8 with SMTP id
 x9-20020ac85f09000000b0039a4df99fc8mr6883953qta.402.1666191991443; 
 Wed, 19 Oct 2022 08:06:31 -0700 (PDT)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a05620a44c500b006b5e296452csm5364654qkp.54.2022.10.19.08.06.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:06:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/i386: implement FMA instructions
Date: Wed, 19 Oct 2022 17:06:16 +0200
Message-Id: <20221019150616.929463-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221019150616.929463-1-pbonzini@redhat.com>
References: <20221019150616.929463-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The only issue with FMA instructions is that there are _a lot_ of them
(30 opcodes, each of which comes in up to 4 versions depending on VEX.W
and VEX.L).

We can reduce the number of helpers to one third by passing four operands
(one output and three inputs); the reordering of which operands go to
the multiply and which go to the add is done in emit.c.

Scalar versions do not do any merging; they only affect the bottom 32
or 64 bits of the output operand.  Therefore, there is no separate XMM
and YMM of the scalar helpers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c                |  5 ++-
 target/i386/ops_sse.h            | 63 ++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h     | 28 ++++++++++++++
 target/i386/tcg/decode-new.c.inc | 38 +++++++++++++++++++
 target/i386/tcg/decode-new.h     |  1 +
 target/i386/tcg/emit.c.inc       | 43 ++++++++++++++++++++++
 tests/tcg/i386/test-avx.py       |  2 +-
 7 files changed, 177 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6292b7e12f..22b681ca37 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -625,10 +625,11 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
-          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C)
+          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C | \
+          CPUID_EXT_FMA)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
-          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
+          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
           CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
 
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 33c61896ee..041a048a70 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2522,6 +2522,69 @@ void helper_vpermd_ymm(Reg *d, Reg *v, Reg *s)
 }
 #endif
 
+/* FMA3 op helpers */
+#if SHIFT == 1
+#define SSE_HELPER_FMAS(name, elem, F)                                         \
+    void name(CPUX86State *env, Reg *d, Reg *a, Reg *b, Reg *c)                \
+    {                                                                          \
+        d->elem(0) = F(a->elem(0), b->elem(0), c->elem(0));                    \
+    }
+#define SSE_HELPER_FMAP(name, elem, num, F)                                    \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *a, Reg *b, Reg *c)  \
+    {                                                                          \
+        int i;                                                                 \
+        for (i = 0; i < num; i++) {                                            \
+            d->elem(i) = F(a->elem(i), b->elem(i), c->elem(i));                \
+        }                                                                      \
+    }
+
+#define FMADD32(a, b, c) float32_muladd(a, b, c, 0, &env->sse_status)
+#define FMADD64(a, b, c) float64_muladd(a, b, c, 0, &env->sse_status)
+
+#define FMNADD32(a, b, c) float32_muladd(a, b, c, float_muladd_negate_product, &env->sse_status)
+#define FMNADD64(a, b, c) float64_muladd(a, b, c, float_muladd_negate_product, &env->sse_status)
+
+#define FMSUB32(a, b, c) float32_muladd(a, b, c, float_muladd_negate_c, &env->sse_status)
+#define FMSUB64(a, b, c) float64_muladd(a, b, c, float_muladd_negate_c, &env->sse_status)
+
+#define FMNSUB32(a, b, c) float32_muladd(a, b, c, float_muladd_negate_c|float_muladd_negate_product, &env->sse_status)
+#define FMNSUB64(a, b, c) float64_muladd(a, b, c, float_muladd_negate_c|float_muladd_negate_product, &env->sse_status)
+
+#define FMADDSUB32(a, b, c) float32_muladd(a, b, c, (i & 1) ? 0 : float_muladd_negate_c, &env->sse_status)
+#define FMADDSUB64(a, b, c) float64_muladd(a, b, c, (i & 1) ? 0 : float_muladd_negate_c, &env->sse_status)
+
+#define FMSUBADD32(a, b, c) float32_muladd(a, b, c, (i & 1) ? float_muladd_negate_c : 0, &env->sse_status)
+#define FMSUBADD64(a, b, c) float64_muladd(a, b, c, (i & 1) ? float_muladd_negate_c : 0, &env->sse_status)
+
+SSE_HELPER_FMAS(helper_fmaddss,  ZMM_S,             FMADD32)
+SSE_HELPER_FMAS(helper_fmaddsd,  ZMM_D,             FMADD64)
+SSE_HELPER_FMAS(helper_fmnaddss, ZMM_S,             FMNADD32)
+SSE_HELPER_FMAS(helper_fmnaddsd, ZMM_D,             FMNADD64)
+SSE_HELPER_FMAS(helper_fmsubss,  ZMM_S,             FMSUB32)
+SSE_HELPER_FMAS(helper_fmsubsd,  ZMM_D,             FMSUB64)
+SSE_HELPER_FMAS(helper_fmnsubss, ZMM_S,             FMNSUB32)
+SSE_HELPER_FMAS(helper_fmnsubsd, ZMM_D,             FMNSUB64)
+#endif
+
+#if SHIFT >= 1
+SSE_HELPER_FMAP(helper_fmaddps,  ZMM_S, 2 << SHIFT, FMADD32)
+SSE_HELPER_FMAP(helper_fmaddpd,  ZMM_D, 1 << SHIFT, FMADD64)
+
+SSE_HELPER_FMAP(helper_fmnaddps, ZMM_S, 2 << SHIFT, FMNADD32)
+SSE_HELPER_FMAP(helper_fmnaddpd, ZMM_D, 1 << SHIFT, FMNADD64)
+
+SSE_HELPER_FMAP(helper_fmsubps,  ZMM_S, 2 << SHIFT, FMSUB32)
+SSE_HELPER_FMAP(helper_fmsubpd,  ZMM_D, 1 << SHIFT, FMSUB64)
+
+SSE_HELPER_FMAP(helper_fmnsubps, ZMM_S, 2 << SHIFT, FMNSUB32)
+SSE_HELPER_FMAP(helper_fmnsubpd, ZMM_D, 1 << SHIFT, FMNSUB64)
+
+SSE_HELPER_FMAP(helper_fmaddsubps,  ZMM_S, 2 << SHIFT, FMADDSUB32)
+SSE_HELPER_FMAP(helper_fmaddsubpd,  ZMM_D, 1 << SHIFT, FMADDSUB64)
+SSE_HELPER_FMAP(helper_fmsubaddps,  ZMM_S, 2 << SHIFT, FMSUBADD32)
+SSE_HELPER_FMAP(helper_fmsubaddpd,  ZMM_D, 1 << SHIFT, FMSUBADD64)
+#endif
+
 #undef SSE_HELPER_S
 
 #undef LANE_WIDTH
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index c4c41976c0..1f9a5c9e94 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -359,6 +359,34 @@ DEF_HELPER_3(glue(cvtph2ps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(cvtps2ph, SUFFIX), void, env, Reg, Reg, int)
 #endif
 
+/* FMA3 helpers */
+#if SHIFT == 1
+DEF_HELPER_5(fmaddss, void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(fmaddsd, void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(fmnaddss, void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(fmnaddsd, void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(fmsubss, void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(fmsubsd, void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(fmnsubss, void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(fmnsubsd, void, env, Reg, Reg, Reg, Reg)
+#endif
+
+#if SHIFT >= 1
+DEF_HELPER_5(glue(fmaddps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmaddpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmnaddps,SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmnaddpd,SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmsubps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmsubpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmnsubps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmnsubpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+
+DEF_HELPER_5(glue(fmaddsubps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmaddsubpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmsubaddps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(fmsubaddpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+#endif
+
 /* AVX helpers */
 #if SHIFT >= 1
 DEF_HELPER_4(glue(vpermilpd, SUFFIX), void, env, Reg, Reg, Reg)
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 8baee9018a..8a6b0ae37c 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -376,6 +376,15 @@ static const X86OpEntry opcodes_0F38_00toEF[240] = {
     [0x92] = X86_OP_ENTRY3(VPGATHERD, V,x,  H,x,  M,d,  vex12 cpuid(AVX2) p_66), /* vgatherdps/d */
     [0x93] = X86_OP_ENTRY3(VPGATHERQ, V,x,  H,x,  M,q,  vex12 cpuid(AVX2) p_66), /* vgatherqps/d */
 
+    [0x96] = X86_OP_ENTRY3(VFMADDSUB132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x97] = X86_OP_ENTRY3(VFMSUBADD132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xa6] = X86_OP_ENTRY3(VFMADDSUB213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xa7] = X86_OP_ENTRY3(VFMSUBADD213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xb6] = X86_OP_ENTRY3(VFMADDSUB231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xb7] = X86_OP_ENTRY3(VFMSUBADD231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
     [0x08] = X86_OP_ENTRY3(PSIGNB,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
     [0x09] = X86_OP_ENTRY3(PSIGNW,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
     [0x0a] = X86_OP_ENTRY3(PSIGND,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
@@ -421,6 +430,33 @@ static const X86OpEntry opcodes_0F38_00toEF[240] = {
     [0x8c] = X86_OP_ENTRY3(VPMASKMOV,    V,x,  H,x, WM,x, vex6 cpuid(AVX2) p_66),
     [0x8e] = X86_OP_ENTRY3(VPMASKMOV_st, M,x,  V,x, H,x,  vex6 cpuid(AVX2) p_66),
 
+    [0x98] = X86_OP_ENTRY3(VFMADD132Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x99] = X86_OP_ENTRY3(VFMADD132Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9a] = X86_OP_ENTRY3(VFMSUB132Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9b] = X86_OP_ENTRY3(VFMSUB132Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9c] = X86_OP_ENTRY3(VFNMADD132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9d] = X86_OP_ENTRY3(VFNMADD132Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9e] = X86_OP_ENTRY3(VFNMSUB132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9f] = X86_OP_ENTRY3(VFNMSUB132Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xa8] = X86_OP_ENTRY3(VFMADD213Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xa9] = X86_OP_ENTRY3(VFMADD213Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xaa] = X86_OP_ENTRY3(VFMSUB213Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xab] = X86_OP_ENTRY3(VFMSUB213Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xac] = X86_OP_ENTRY3(VFNMADD213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xad] = X86_OP_ENTRY3(VFNMADD213Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xae] = X86_OP_ENTRY3(VFNMSUB213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xaf] = X86_OP_ENTRY3(VFNMSUB213Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xb8] = X86_OP_ENTRY3(VFMADD231Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xb9] = X86_OP_ENTRY3(VFMADD231Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xba] = X86_OP_ENTRY3(VFMSUB231Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbb] = X86_OP_ENTRY3(VFMSUB231Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbc] = X86_OP_ENTRY3(VFNMADD231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbd] = X86_OP_ENTRY3(VFNMADD231Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbe] = X86_OP_ENTRY3(VFNMSUB231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbf] = X86_OP_ENTRY3(VFNMSUB231Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
     [0xdb] = X86_OP_ENTRY3(VAESIMC,     V,dq, None,None, W,dq, vex4 cpuid(AES) p_66),
     [0xdc] = X86_OP_ENTRY3(VAESENC,     V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
     [0xdd] = X86_OP_ENTRY3(VAESENCLAST, V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
@@ -1350,6 +1386,8 @@ static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
         return true;
     case X86_FEAT_F16C:
         return (s->cpuid_ext_features & CPUID_EXT_F16C);
+    case X86_FEAT_FMA:
+        return (s->cpuid_ext_features & CPUID_EXT_FMA);
     case X86_FEAT_MOVBE:
         return (s->cpuid_ext_features & CPUID_EXT_MOVBE);
     case X86_FEAT_PCLMULQDQ:
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index 0ef54628ee..cb6b8bcf67 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -105,6 +105,7 @@ typedef enum X86CPUIDFeature {
     X86_FEAT_BMI1,
     X86_FEAT_BMI2,
     X86_FEAT_F16C,
+    X86_FEAT_FMA,
     X86_FEAT_MOVBE,
     X86_FEAT_PCLMULQDQ,
     X86_FEAT_SSE,
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 9334f0939d..9e234f71f7 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -491,6 +491,49 @@ FP_SSE(VMIN, min)
 FP_SSE(VDIV, div)
 FP_SSE(VMAX, max)
 
+#define FMA_SSE_PACKED(uname, lname, ptr0, ptr1, ptr2)                             \
+static void gen_##uname##Px(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    SSEFunc_0_epppp xmm = s->vex_w ? gen_helper_##lname##pd_xmm : gen_helper_##lname##ps_xmm; \
+    SSEFunc_0_epppp ymm = s->vex_w ? gen_helper_##lname##pd_ymm : gen_helper_##lname##ps_ymm; \
+    SSEFunc_0_epppp fn = s->vex_l ? ymm : xmm;                                     \
+                                                                                   \
+    fn(cpu_env, OP_PTR0, ptr0, ptr1, ptr2);                                        \
+}
+
+#define FMA_SSE(uname, lname, ptr0, ptr1, ptr2)                                    \
+FMA_SSE_PACKED(uname, lname, ptr0, ptr1, ptr2)                                     \
+static void gen_##uname##Sx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    SSEFunc_0_epppp fn = s->vex_w ? gen_helper_##lname##sd : gen_helper_##lname##ss; \
+                                                                                   \
+    fn(cpu_env, OP_PTR0, ptr0, ptr1, ptr2);                                        \
+}                                                                                  \
+
+FMA_SSE(VFMADD231,    fmadd,    OP_PTR1, OP_PTR2, OP_PTR0)
+FMA_SSE(VFMADD213,    fmadd,    OP_PTR1, OP_PTR0, OP_PTR2)
+FMA_SSE(VFMADD132,    fmadd,    OP_PTR0, OP_PTR2, OP_PTR1)
+
+FMA_SSE(VFNMADD231,   fmnadd,   OP_PTR1, OP_PTR2, OP_PTR0)
+FMA_SSE(VFNMADD213,   fmnadd,   OP_PTR1, OP_PTR0, OP_PTR2)
+FMA_SSE(VFNMADD132,   fmnadd,   OP_PTR0, OP_PTR2, OP_PTR1)
+
+FMA_SSE(VFMSUB231,    fmsub,    OP_PTR1, OP_PTR2, OP_PTR0)
+FMA_SSE(VFMSUB213,    fmsub,    OP_PTR1, OP_PTR0, OP_PTR2)
+FMA_SSE(VFMSUB132,    fmsub,    OP_PTR0, OP_PTR2, OP_PTR1)
+
+FMA_SSE(VFNMSUB231,   fmnsub,   OP_PTR1, OP_PTR2, OP_PTR0)
+FMA_SSE(VFNMSUB213,   fmnsub,   OP_PTR1, OP_PTR0, OP_PTR2)
+FMA_SSE(VFNMSUB132,   fmnsub,   OP_PTR0, OP_PTR2, OP_PTR1)
+
+FMA_SSE_PACKED(VFMADDSUB231, fmaddsub, OP_PTR1, OP_PTR2, OP_PTR0)
+FMA_SSE_PACKED(VFMADDSUB213, fmaddsub, OP_PTR1, OP_PTR0, OP_PTR2)
+FMA_SSE_PACKED(VFMADDSUB132, fmaddsub, OP_PTR0, OP_PTR2, OP_PTR1)
+
+FMA_SSE_PACKED(VFMSUBADD231, fmsubadd, OP_PTR1, OP_PTR2, OP_PTR0)
+FMA_SSE_PACKED(VFMSUBADD213, fmsubadd, OP_PTR1, OP_PTR0, OP_PTR2)
+FMA_SSE_PACKED(VFMSUBADD132, fmsubadd, OP_PTR0, OP_PTR2, OP_PTR1)
+
 #define FP_UNPACK_SSE(uname, lname)                                                \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index ebb1d99c5e..d9ca00a49e 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -9,7 +9,7 @@
 archs = [
     "SSE", "SSE2", "SSE3", "SSSE3", "SSE4_1", "SSE4_2",
     "AES", "AVX", "AVX2", "AES+AVX", "VAES+AVX",
-    "F16C",
+    "F16C", "FMA",
 ]
 
 ignore = set(["FISTTP",
-- 
2.37.3


