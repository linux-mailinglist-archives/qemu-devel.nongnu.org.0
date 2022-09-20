Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F3D5BF014
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:28:19 +0200 (CEST)
Received: from localhost ([::1]:45562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaliz-00028m-6Z
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0I-0006SK-69
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0G-0002C7-7l
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGkl/92AJmHGD0OchJP1HzUYvDeID0ABtmt3aekzqts=;
 b=HQ3OmqTX+BpTXH5WCXYhNwD3Q5G76LDszKlZEwDpGzMGOJynCIxw2OjUzTSwf46bzb9DHu
 TisxXISZ+Qk67kM3AcEaV1kk+cBHDIMCZJjxN+INu7q+V3UmFHEXfYDVVw8KW9rXbjmEZU
 9lDLVKkFX+d5c7blX1SFmmRWfBEQQA4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-JTkBqOK_O1KXsFzLiz5Nvg-1; Tue, 20 Sep 2022 13:25:41 -0400
X-MC-Unique: JTkBqOK_O1KXsFzLiz5Nvg-1
Received: by mail-ej1-f71.google.com with SMTP id
 gt19-20020a1709072d9300b00780ec98af88so1770433ejc.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mGkl/92AJmHGD0OchJP1HzUYvDeID0ABtmt3aekzqts=;
 b=jPxh8GuJXfIW2ETW0JMsTaoLheXzgQhOtQ4T0fuNWNCcsTzeLohjM77cznFDkRNg92
 3c5MOsdjmFbVILFEiJURZgo+jowD6EAa5RO0DjomGAWFIQYbDLNnwdjls3fnSKaXEgm+
 OCzEu8v+FsghebJ778uLN4YE3m+PWLdoX+3pEKn81xxqHYiBii+g7KWDAXOLD3sDDXdi
 WFApLBGc8Lj3Es2EAW9XmO7lShNXQ/TQ69m4EuXMyP2zYLgYqdzHGRuOHFxsBlz8GZVm
 wObXppyhBXM4o00wXz/i7wcTL2yrV8doxEfciUUFlHZd75UIim7kPIyM8C+Q59325dtN
 z/Pw==
X-Gm-Message-State: ACrzQf1ok+Bqlk9edALAbaeKHGSlPcMTiESUktQa0gJUEDEMRmbzLBV/
 DZ3u7Kut3drfrXyn9hu6A5zIPb9EWH5UrU7wIs2jCu9g5chlibjJ+PHAf/pOTrMD7pTi+mkGTyy
 3lwK4j3klWz++Pb8X4xSH7uMUv24WTqrbYnudD6QDIN6jxEg1UBD00h79TpJc8JXBEyI=
X-Received: by 2002:a05:6402:22a9:b0:453:9ae3:a18b with SMTP id
 cx9-20020a05640222a900b004539ae3a18bmr15572188edb.242.1663694740493; 
 Tue, 20 Sep 2022 10:25:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SvSB+j/SDlovKtCONVlXzXNxLWaiC20F36XpquyOpJXzOJ12Onn9knEmjYKrsOb+1qd5pfw==
X-Received: by 2002:a05:6402:22a9:b0:453:9ae3:a18b with SMTP id
 cx9-20020a05640222a900b004539ae3a18bmr15572160edb.242.1663694740201; 
 Tue, 20 Sep 2022 10:25:40 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a50ff0a000000b00454546561cfsm153144edu.82.2022.09.20.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 20/37] target/i386: reimplement 0x0f 0xd8-0xdf, 0xe8-0xef,
 0xf8-0xff, add AVX
Date: Tue, 20 Sep 2022 19:24:50 +0200
Message-Id: <20220920172507.95568-21-pbonzini@redhat.com>
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

These are more simple integer instructions present in both MMX and SSE/AVX,
with no holes that were later occupied by newer instructions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 28 ++++++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 32 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  4 +++-
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 6635c41a2f..d207a1f0c1 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -273,6 +273,34 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x6d] = X86_OP_ENTRY3(PUNPCKHQDQ, V,x, H,x, W,x,  vex4 p_66 avx2_256),
     [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
     [0x6f] = X86_OP_GROUP0(0F6F),
+
+    /* Incorrectly missing from 2-17 */
+    [0xd8] = X86_OP_ENTRY3(PSUBUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xd9] = X86_OP_ENTRY3(PSUBUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xda] = X86_OP_ENTRY3(PMINUB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdb] = X86_OP_ENTRY3(PAND,     V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdc] = X86_OP_ENTRY3(PADDUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdd] = X86_OP_ENTRY3(PADDUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xde] = X86_OP_ENTRY3(PMAXUB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdf] = X86_OP_ENTRY3(PANDN,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+
+    [0xe8] = X86_OP_ENTRY3(PSUBSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xe9] = X86_OP_ENTRY3(PSUBSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xea] = X86_OP_ENTRY3(PMINSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xeb] = X86_OP_ENTRY3(POR,     V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xec] = X86_OP_ENTRY3(PADDSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xed] = X86_OP_ENTRY3(PADDSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xee] = X86_OP_ENTRY3(PMAXSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xef] = X86_OP_ENTRY3(PXOR,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+
+    [0xf8] = X86_OP_ENTRY3(PSUBB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xf9] = X86_OP_ENTRY3(PSUBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfa] = X86_OP_ENTRY3(PSUBD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfb] = X86_OP_ENTRY3(PSUBQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfc] = X86_OP_ENTRY3(PADDB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfd] = X86_OP_ENTRY3(PADDW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfe] = X86_OP_ENTRY3(PADDD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    /* 0xff = UD0 */
 };
 
 static void do_decode_0F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 60b80e9d30..f1f7397869 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -328,9 +328,31 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
          decode->op[2].offset, vec_len, vec_len);                                  \
 }
 
+BINARY_INT_GVEC(PADDB,   tcg_gen_gvec_add, MO_8)
+BINARY_INT_GVEC(PADDW,   tcg_gen_gvec_add, MO_16)
+BINARY_INT_GVEC(PADDD,   tcg_gen_gvec_add, MO_32)
+BINARY_INT_GVEC(PADDSB,  tcg_gen_gvec_ssadd, MO_8)
+BINARY_INT_GVEC(PADDSW,  tcg_gen_gvec_ssadd, MO_16)
+BINARY_INT_GVEC(PADDUSB, tcg_gen_gvec_usadd, MO_8)
+BINARY_INT_GVEC(PADDUSW, tcg_gen_gvec_usadd, MO_16)
+BINARY_INT_GVEC(PAND,    tcg_gen_gvec_and, MO_64)
 BINARY_INT_GVEC(PCMPGTB, tcg_gen_gvec_cmp, TCG_COND_GT, MO_8)
 BINARY_INT_GVEC(PCMPGTW, tcg_gen_gvec_cmp, TCG_COND_GT, MO_16)
 BINARY_INT_GVEC(PCMPGTD, tcg_gen_gvec_cmp, TCG_COND_GT, MO_32)
+BINARY_INT_GVEC(PMAXSW,  tcg_gen_gvec_smax, MO_16)
+BINARY_INT_GVEC(PMAXUB,  tcg_gen_gvec_umax, MO_8)
+BINARY_INT_GVEC(PMINSW,  tcg_gen_gvec_smin, MO_16)
+BINARY_INT_GVEC(PMINUB,  tcg_gen_gvec_umin, MO_8)
+BINARY_INT_GVEC(POR,     tcg_gen_gvec_or, MO_64)
+BINARY_INT_GVEC(PSUBB,   tcg_gen_gvec_sub, MO_8)
+BINARY_INT_GVEC(PSUBW,   tcg_gen_gvec_sub, MO_16)
+BINARY_INT_GVEC(PSUBD,   tcg_gen_gvec_sub, MO_32)
+BINARY_INT_GVEC(PSUBQ,   tcg_gen_gvec_sub, MO_64)
+BINARY_INT_GVEC(PSUBSB,  tcg_gen_gvec_sssub, MO_8)
+BINARY_INT_GVEC(PSUBSW,  tcg_gen_gvec_sssub, MO_16)
+BINARY_INT_GVEC(PSUBUSB, tcg_gen_gvec_ussub, MO_8)
+BINARY_INT_GVEC(PSUBUSW, tcg_gen_gvec_ussub, MO_16)
+BINARY_INT_GVEC(PXOR,    tcg_gen_gvec_xor, MO_64)
 
 
 /*
@@ -609,6 +631,16 @@ static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 
 }
 
+static void gen_PANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    /* Careful, operand order is reversed!  */
+    tcg_gen_gvec_andc(MO_64,
+                      decode->op[0].offset, decode->op[2].offset,
+                      decode->op[1].offset, vec_len, vec_len);
+}
+
 static void gen_PDEP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[1].ot;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1ffbf2f4f8..fd565650a9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4694,7 +4694,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifndef CONFIG_USER_ONLY
         use_new &= b <= limit;
 #endif
-        if (use_new && (b >= 0x160 && b <= 0x16f)) {
+        if (use_new &&
+            ((b >= 0x160 && b <= 0x16f) ||
+             (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
         }
-- 
2.37.2


