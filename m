Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE35BF0B3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:58:07 +0200 (CEST)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamBq-0008A8-98
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0a-0006li-Qc
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0Y-0002HH-2B
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kL9TEJMgcV6CpIfB1X9GtUOh3TtmamVndhuDMBySJLo=;
 b=ErwIFGETsfMW7tHYaccBjriD24a/UIcv+cqtzqrWBjKfSe43WQt6ScimzP51LmOMutL5XA
 1k9iOA1maxSPwAAcUX0C/a7Et6PYc4BxulgQjtXjNerqxjyrwIDf+56ri4LDXVoVHHiHah
 82oqUKKOzxcza2EJngLKQ48Zu45hF6I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-uaTwZRhUPhG28-3Zg3Qkhw-1; Tue, 20 Sep 2022 13:25:55 -0400
X-MC-Unique: uaTwZRhUPhG28-3Zg3Qkhw-1
Received: by mail-ej1-f69.google.com with SMTP id
 oz30-20020a1709077d9e00b0077239b6a915so1792414ejc.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kL9TEJMgcV6CpIfB1X9GtUOh3TtmamVndhuDMBySJLo=;
 b=ClrgOczDTEc8LlkC7F9JirD/DdqGJzIGS6Cwn/hbh41+sLbQv7ioDe6mwynnzpWRYo
 A+BEj28/PHtuSSt6aO2cH7//0wU7G4DKtDCbG1wAWWMUUGmVZsLChX9hJDatd2uhvxWp
 /OMGIVxlWqQYyZdaWjeRRknjr1TnyTiWkdaHEgYr9KxtciU53eZAAjf4P+7C2GdkbyFq
 Jb8jvHFcICZiKOGDAHv0dAXQslnmXCE2BI6suPigQLUVCp0qfNGP835eS1YMEdL6Qgeo
 QhDgwNqSAIT1AFvfYO8TErzmwXQBA2xqo8h7K2T8TznVQ9iQDd6ylesF0cRiKYYP2wfx
 8ijA==
X-Gm-Message-State: ACrzQf0/TqUt0rdUbH2PnysfuB1ep2BklixoJsXxAmkGIDZ9e3wqP95R
 SFTwrMQwSL8un5jWt5YENd+GGtTS23p009WpEvpjRYPWbqj34tIZsgx2eb7C9K/BvPqRqpCGZIU
 4C4vosqI9x81relNDcbfkYJfDetLggU5rbcKGJ9LdVdy8TTZzp2TGFJaWvw9FUcqjI54=
X-Received: by 2002:a17:907:724e:b0:77a:63:4a24 with SMTP id
 ds14-20020a170907724e00b0077a00634a24mr17647581ejc.35.1663694753850; 
 Tue, 20 Sep 2022 10:25:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kBhQhdaVctjAkUklhjboRYUAIqv7csIJEE0XPDrHZPMc+FbzVtnImDCfBpNpCpIg++rx+JQ==
X-Received: by 2002:a17:907:724e:b0:77a:63:4a24 with SMTP id
 ds14-20020a170907724e00b0077a00634a24mr17647552ejc.35.1663694753532; 
 Tue, 20 Sep 2022 10:25:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 7-20020a170906308700b00781b589a1afsm140558ejv.159.2022.09.20.10.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 29/37] target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6,
 add AVX
Date: Tue, 20 Sep 2022 19:24:59 +0200
Message-Id: <20220920172507.95568-30-pbonzini@redhat.com>
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

Nothing special going on here, for once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  5 +++
 target/i386/tcg/emit.c.inc       | 75 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  1 +
 3 files changed, 81 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 798b423163..461921a98d 100644
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
index dd36a3544e..71b8fcbe24 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1342,6 +1342,11 @@ static void gen_PINSRB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
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
@@ -1648,6 +1653,66 @@ static void gen_VAESIMC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
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
@@ -1793,6 +1858,16 @@ static void gen_VROUNDSS(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
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
index 32f937013f..eb7a4d0e4d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4697,6 +4697,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
              (b >= 0x150 && b <= 0x17f) ||
+             b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.2


