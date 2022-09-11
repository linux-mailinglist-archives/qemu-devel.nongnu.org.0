Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF75B520C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:46:33 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWem-0001O8-Q4
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1S-0001Qz-3g
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1Q-0007N2-53
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBx+1Tm3b7AbQAkF8waIObgv+8BD9DA4k8u8OvaLSGY=;
 b=ghDDW3ju/vM8WspRy7h4Av4Dbpv6/cAtObY+dyCcRd359Y3zeawPljBZJzCd6Jv+TX94zS
 9x103M3Qu/deK9pVx9JcxAUIhq0ZZIC9MyvQS6LhAAhlkm6a3VFMgsYk15ZZunVkHcSz5p
 ixtwBw8zvNFt/tltmnQR4CfonL/XUMY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-r2AZ_cLxONyrNuz_h-5mbg-1; Sun, 11 Sep 2022 19:05:50 -0400
X-MC-Unique: r2AZ_cLxONyrNuz_h-5mbg-1
Received: by mail-ej1-f70.google.com with SMTP id
 qw34-20020a1709066a2200b0077e0e8a55b4so47330ejc.21
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VBx+1Tm3b7AbQAkF8waIObgv+8BD9DA4k8u8OvaLSGY=;
 b=VW/UjPdcjL1B5N1r6xdPJVrDzGd9M7MO/yk4sc9Z8I39/Cg2zphQKl5UY1//mq5srN
 +ygXxsj52IikUcCLMq5DHko9foV/hHg+PjggmSsENmRJ79nGpvcudQDgJRbzCx7v76fQ
 +xDEW+Cf6JhFhgsjSxSuenih0pY6oi20zLizAM9nTkg+kbNDbfxNSU+TQt1PWkrFd0WK
 RqdfQm5wfWV+hLWti7P//mkmxyRy5BVeLob5ShuK7xRTjaZegqa4+m1MGeggv41FtuEp
 k/92kYVDC9aRwEMS64mM75ZH9MjpJAM0IB6WDcdJMXhY2H3civG5lLzjoFSU4v8ERAq+
 2GKw==
X-Gm-Message-State: ACgBeo1+w6HPjRGeJBPy5atbqwBPU3nnQSOuoN0igFlADAcbcQqpsGba
 CtvkD6eGTrPXC3Pv2UYjq5qIyWSrEsiFbPPNEAPRSkgWFE/lxrI9Hx/Y7z2kr79gGkaWxMz9IQU
 xebvFuhFDWy+qg7w/RLkUWMkAelNNvJcQQmtyWZx5oLLaQjduDG58Q3QCxgkgYkVIlf8=
X-Received: by 2002:a17:906:cc14:b0:779:8ae0:eece with SMTP id
 ml20-20020a170906cc1400b007798ae0eecemr9361802ejb.418.1662937548855; 
 Sun, 11 Sep 2022 16:05:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5MV4qqDhIG9+X0BJ7dNBM/dc8OtIUljJaX5Xc3OvxnAAz0Z09H+h+O8LFIDqKXXu9u5G9nQA==
X-Received: by 2002:a17:906:cc14:b0:779:8ae0:eece with SMTP id
 ml20-20020a170906cc1400b007798ae0eecemr9361783ejb.418.1662937548515; 
 Sun, 11 Sep 2022 16:05:48 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b0073cdeedf56fsm3520988ejg.57.2022.09.11.16.05.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/37] target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6, add AVX
Date: Mon, 12 Sep 2022 01:04:09 +0200
Message-Id: <20220911230418.340941-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Nothing special going on here, for once.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  5 +++
 target/i386/tcg/emit.c.inc       | 76 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  1 +
 3 files changed, 82 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 7feb0eca4e..c51b59f721 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -579,6 +579,11 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP3(0F6F,       W,x, None,None, V,x, vex5 mmx p_00_66_f3),
 
+    [0xc2] = X86_OP_ENTRY4(VCMP,       V,x, H,x, W,x,       vex2_rep3 p_00_66_f3_f2),
+    [0xc4] = X86_OP_ENTRY4(PINSRW,     V,dq,H,dq,E,w,       vex5 mmx p_00_66),
+    [0xc5] = X86_OP_ENTRY3(PEXTRW,     G,d, U,dq,I,b,       vex5 mmx p_00_66),
+    [0xc6] = X86_OP_ENTRY4(VSHUF,      V,x, H,x, W,x,       vex4 p_00_66),
+
     [0xd0] = X86_OP_ENTRY3(VADDSUB,   V,x, H,x, W,x,        vex2 cpuid(SSE3) p_66_f2),
     [0xd1] = X86_OP_ENTRY3(PSRLW_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
     [0xd2] = X86_OP_ENTRY3(PSRLD_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 7084875af6..d1819f3581 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1367,6 +1367,11 @@ static void gen_PINSRB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
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
@@ -1779,6 +1784,66 @@ static inline void gen_VBROADCASTx128(DisasContext *s, CPUX86State *env, X86Deco
                      decode->op[2].offset, 16, 16);
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
+static inline void gen_VCMP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int index = decode->immediate & (s->prefix & PREFIX_VEX ? 31 : 7);
+    int b =
+        s->prefix & PREFIX_REPZ  ? 2 /* ss */ :
+        s->prefix & PREFIX_REPNZ ? 3 /* ss */ :
+        !!(s->prefix & PREFIX_DATA) + (s->vex_l << 2);
+
+    gen_helper_cmp_funcs[index][b](cpu_env, s->ptr0, s->ptr1, s->ptr2);
+}
+
 static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_unary_fp_sse(s, env, decode,
@@ -1963,4 +2028,15 @@ static inline void gen_VROUNDSS(DisasContext *s, CPUX86State *env, X86DecodedIns
     tcg_temp_free_i32(imm);
 }
 
+static inline void gen_VSHUF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    SSEFunc_0_pppi ps, pd, fn;
+    ps = s->vex_l ? gen_helper_shufps_ymm : gen_helper_shufps_xmm;
+    pd = s->vex_l ? gen_helper_shufpd_ymm : gen_helper_shufpd_xmm;
+    fn = s->prefix & PREFIX_DATA ? pd : ps;
+    fn(s->ptr0, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+}
+
 #define gen_VXOR  gen_PXOR
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e42cb275a1..468867afcf 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4669,6 +4669,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
              (b >= 0x150 && b <= 0x17f) ||
+             b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
             return disas_insn_new(s, cpu, b);
         }
-- 
2.37.2



