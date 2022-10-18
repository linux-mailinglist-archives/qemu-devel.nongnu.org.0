Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9D602E12
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:13:54 +0200 (CEST)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknLt-0000dp-FP
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmie-0004ua-AJ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiZ-0005Qd-3o
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/o5CAnxOa2M2TwFHrSb6+UYpM5QFfq1Fs4ftAtY3h8=;
 b=L9bOxzWyxZXxz4d50+0DOXmFCbykyZTb8ykwK3b23BHTKTB6ZsKi9hwIn7PaJwpBiQPpNA
 a4iRAxKOzuGdly1K0c2sNriujOJCz5dacmfkfi19zbvdjEFt33FVYj95nKck7db/rBNvcm
 XGS7rD6bj6nA1Kn5N539GZVCf755sg4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-82CwPjlENh2lxVmazQc2AQ-1; Tue, 18 Oct 2022 09:33:13 -0400
X-MC-Unique: 82CwPjlENh2lxVmazQc2AQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h9-20020a05640250c900b0045cfb639f56so10970685edb.13
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/o5CAnxOa2M2TwFHrSb6+UYpM5QFfq1Fs4ftAtY3h8=;
 b=Ob0oHyCgNa/LxTRPKMk0ss1hBrMaoHi3JHVtcaEEAA/n5HXBx7Q0MOGOl312drqo4K
 tx947jNFggcXJxz6dUcHqL2wRH5U1lOt4gzHwBIX7wJcuc/O8C48hX2BL8ezME0e1HnR
 ZCmcd9UDsxOEtiH+9XGfGdXULiBO38P2+uajARwa/t3rq/AxcwvSxcuMAAlxs/7D8t/Y
 EMfOfpeaT7oEI0Z4ptsiJ0I2nyhEhwowiKT463YfTnDhVSfvkMwa3QIPVIUOsz/ECOGX
 Fi1dyZ46sy5SwJewKt7oZX4aK72z6BSjbbDxXu1ZRjqg4FX4jE4P2Pm6bCG2wTTYWuRJ
 bL0w==
X-Gm-Message-State: ACrzQf2X6IYt0FJ7AgOuqQpeAJEkRytyL9OSJ2VhfyVxxteDUYEHwdwL
 NML4Jps1o5TXeJ/8TT2azUpdIZokd2iJH1D1he/FynpNCw518vbYrd7ctucB97ByMPwT/vvrGF6
 8GwMPxVOl46Ao+PmTyfDOpVE9l2ORdVmk9mJtaN4qaOhRW6U4M5a0THvvTsVWim4z6Sc=
X-Received: by 2002:a17:907:980e:b0:78d:b6d8:f53c with SMTP id
 ji14-20020a170907980e00b0078db6d8f53cmr2531988ejc.70.1666099991453; 
 Tue, 18 Oct 2022 06:33:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ZtltS5SX1K1wS9n9+k2ULNYSxBvckwG8tuysV3k7e6LgkcoVKy3wPWtFBNghRRTuT6B3Q4w==
X-Received: by 2002:a17:907:980e:b0:78d:b6d8:f53c with SMTP id
 ji14-20020a170907980e00b0078db6d8f53cmr2531973ejc.70.1666099991178; 
 Tue, 18 Oct 2022 06:33:11 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a1709062a4a00b007838e332d78sm7549812eje.128.2022.10.18.06.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 45/53] target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6, add AVX
Date: Tue, 18 Oct 2022 15:30:34 +0200
Message-Id: <20221018133042.856368-46-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index e148edd819..6a82d58b23 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -648,6 +648,11 @@ static const X86OpEntry opcodes_0F[256] = {
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
index e33688f672..f7ac481203 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1336,6 +1336,11 @@ static void gen_PINSRB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
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
@@ -1640,6 +1645,66 @@ static void gen_VAESIMC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
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
@@ -1785,6 +1850,16 @@ static void gen_VROUNDSS(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
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
index 0e269e9d44..c79dffd6f9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4784,6 +4784,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
              (b >= 0x150 && b <= 0x17f) ||
+             b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.3


