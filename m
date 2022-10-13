Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB2A5FE523
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:17:08 +0200 (CEST)
Received: from localhost ([::1]:43726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Vn-00055m-ES
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63u-0002r0-Fs
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63s-0005Jw-Mb
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7e8mOsNVJ5BkgF/YVp6rw3C+un8EiYn6/oa+HILGEo=;
 b=Bo08pYi8f7ZC3JTF3i+JrhFlH3kRk3p43TBrwGXHqmEQ9uMcbG0broGTvVnKk444LERSnT
 zuMc2L55rp/T0mDlJrEpdWUr2FzXW+zav5Polno95PkQ90UVmqZdF/Fd2o6e+c0qutcI57
 mB+D/A7Izi1uNc/NaVu9d2p7Q4I6Yyg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-9N7Lp0SgOaeFwdDa0sgNkQ-1; Thu, 13 Oct 2022 17:48:14 -0400
X-MC-Unique: 9N7Lp0SgOaeFwdDa0sgNkQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 r16-20020a05640251d000b004599cfb8b95so2315738edd.5
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7e8mOsNVJ5BkgF/YVp6rw3C+un8EiYn6/oa+HILGEo=;
 b=2uyjJ6XFYtMhUleJtUMjjp4+ZQV72t4SYtG0Zkd9iNUL/4xdfuaGPMc9R/NaqWwoZM
 1mQsEuayrMRa76R0ukRpY3DGvBVtzpiKCpUGKnz60W3k2ptZlqT8gsqdcFsDDGk6ZsmW
 XEgS99AsggNkbWW9w500r59HxfrOdonr9M1auO5HVSPwgzDqml7orvueUgl0eo7t3bA2
 +DPIW4RGthdL6bJ+n2U32TsJvNGkgk+oOGIBcwEVqCdSrmn3CB49uh3Ai1FQg8iriNxK
 beYhy+Lr2lYlRGXy6WrzWQyWGEUi8DRF52tG6yrU7owFXVZruOaQbLiQjBcS+bCqJATv
 SZ1g==
X-Gm-Message-State: ACrzQf1ufSUX2k/+u47H9Nk9yFPHYzi6N3wFBpTHfXHNBiQip5HhxZYo
 F78Pv+E2XgPg8PzHKE3PilDU6CSGeous8tjp5JFfMqRjmh9df/qlwFEgeZ7fXZE7rjFjkbNHUc5
 p0Nq/WCEPV2EQ1ixARf5uCrcJ4xHkolh+yoUbVCcQ9eyJhk3AajHASeWFmHOo8Nruoow=
X-Received: by 2002:a17:907:3ea2:b0:78d:b416:4663 with SMTP id
 hs34-20020a1709073ea200b0078db4164663mr1308544ejc.766.1665697692815; 
 Thu, 13 Oct 2022 14:48:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Wa3oMfbVgX1J3szHekk4wXCH2YPvLlzONxfdbZjeSujFcfT4sjpUE2Lx4eB1/THoERGOw2Q==
X-Received: by 2002:a17:907:3ea2:b0:78d:b416:4663 with SMTP id
 hs34-20020a1709073ea200b0078db4164663mr1308530ejc.766.1665697692542; 
 Thu, 13 Oct 2022 14:48:12 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 du1-20020a17090772c100b0078e05db7002sm388427ejc.217.2022.10.13.14.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 27/35] target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6, add AVX
Date: Thu, 13 Oct 2022 23:46:43 +0200
Message-Id: <20221013214651.672114-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
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

Nothing special going on here, for once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  5 +++
 target/i386/tcg/emit.c.inc       | 75 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  1 +
 3 files changed, 81 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 6732720302..a5b4a98ba0 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -655,6 +655,11 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP0(0F7F),
 
+    [0xc2] = X86_OP_ENTRY4(VCMP,       V,x, H,x, W,x,       vex2_rep3 p_00_66_f3_f2),
+    [0xc4] = X86_OP_ENTRY4(PINSRW,     V,dq,H,dq,E,w,       vex5 mmx p_00_66),
+    [0xc5] = X86_OP_ENTRY3(PEXTRW,     G,d, U,dq,I,b,       vex5 mmx p_00_66),
+    [0xc6] = X86_OP_ENTRY4(VSHUF,      V,x, H,x, W,x,       vex4 p_00_66),
+
     [0xd0] = X86_OP_ENTRY3(VADDSUB,   V,x, H,x, W,x,        vex2 cpuid(SSE3) p_66_f2),
     [0xd1] = X86_OP_ENTRY3(PSRLW_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
     [0xd2] = X86_OP_ENTRY3(PSRLD_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0c5e9d956a..d4534c3f39 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1341,6 +1341,11 @@ static void gen_PINSRB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
     gen_pinsr(s, env, decode, MO_8);
 }
 
+static void gen_PINSRW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_pinsr(s, env, decode, MO_16);
+}
+
 static void gen_PINSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_pinsr(s, env, decode, decode->op[2].ot);
@@ -1645,6 +1650,66 @@ static void gen_VAESIMC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
     gen_helper_aesimc_xmm(cpu_env, OP_PTR0, OP_PTR2);
 }
 
+/*
+ * 00 = v*ps Vps, Hps, Wpd
+ * 66 = v*pd Vpd, Hpd, Wps
+ * f3 = v*ss Vss, Hss, Wps
+ * f2 = v*sd Vsd, Hsd, Wps
+ */
+#define SSE_CMP(x) { \
+    gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
+    gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, \
+    gen_helper_ ## x ## ps ## _ymm, gen_helper_ ## x ## pd ## _ymm}
+static const SSEFunc_0_eppp gen_helper_cmp_funcs[32][6] = {
+    SSE_CMP(cmpeq),
+    SSE_CMP(cmplt),
+    SSE_CMP(cmple),
+    SSE_CMP(cmpunord),
+    SSE_CMP(cmpneq),
+    SSE_CMP(cmpnlt),
+    SSE_CMP(cmpnle),
+    SSE_CMP(cmpord),
+
+    SSE_CMP(cmpequ),
+    SSE_CMP(cmpnge),
+    SSE_CMP(cmpngt),
+    SSE_CMP(cmpfalse),
+    SSE_CMP(cmpnequ),
+    SSE_CMP(cmpge),
+    SSE_CMP(cmpgt),
+    SSE_CMP(cmptrue),
+
+    SSE_CMP(cmpeqs),
+    SSE_CMP(cmpltq),
+    SSE_CMP(cmpleq),
+    SSE_CMP(cmpunords),
+    SSE_CMP(cmpneqq),
+    SSE_CMP(cmpnltq),
+    SSE_CMP(cmpnleq),
+    SSE_CMP(cmpords),
+
+    SSE_CMP(cmpequs),
+    SSE_CMP(cmpngeq),
+    SSE_CMP(cmpngtq),
+    SSE_CMP(cmpfalses),
+    SSE_CMP(cmpnequs),
+    SSE_CMP(cmpgeq),
+    SSE_CMP(cmpgtq),
+    SSE_CMP(cmptrues),
+};
+#undef SSE_CMP
+
+static void gen_VCMP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int index = decode->immediate & (s->prefix & PREFIX_VEX ? 31 : 7);
+    int b =
+        s->prefix & PREFIX_REPZ  ? 2 /* ss */ :
+        s->prefix & PREFIX_REPNZ ? 3 /* sd */ :
+        !!(s->prefix & PREFIX_DATA) /* pd */ + (s->vex_l << 2);
+
+    gen_helper_cmp_funcs[index][b](cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+}
+
 static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_unary_fp_sse(s, env, decode,
@@ -1790,6 +1855,16 @@ static void gen_VROUNDSS(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
     gen_helper_roundss_xmm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
 }
 
+static void gen_VSHUF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant_i32(decode->immediate);
+    SSEFunc_0_pppi ps, pd, fn;
+    ps = s->vex_l ? gen_helper_shufps_ymm : gen_helper_shufps_xmm;
+    pd = s->vex_l ? gen_helper_shufpd_ymm : gen_helper_shufpd_xmm;
+    fn = s->prefix & PREFIX_DATA ? pd : ps;
+    fn(OP_PTR0, OP_PTR1, OP_PTR2, imm);
+}
+
 static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     TCGv_ptr ptr = tcg_temp_new_ptr();
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9cb567f02f..04b51d7477 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4776,6 +4776,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
              (b >= 0x150 && b <= 0x17f) ||
+             b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.3


