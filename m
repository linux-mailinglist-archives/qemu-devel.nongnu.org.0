Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE25B51F6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:39:05 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWXY-0001KV-G1
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW16-0000uO-SC
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW14-0007L6-91
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FW4Z1TYbUqVbKB+UYVWcEtd79l89qxtOGgRtrSHI16w=;
 b=aVPBO6kE0MY9gUIycLIWqCWJmVRDjO0VcFcHB7IdonpPjDogsWDzgbySTMwXdk5j+3ij1d
 2E5M1DL+VA4OiSLVt20wDU7MnbDNiilDlF9CbNUwqyWbuxxdezZuA2Ym8O0B9tEY+yAWeN
 b8ZEtvb2YaCR305so18A06SRfCBSLyo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-ApOGARNWPiChGWtiVBpYTg-1; Sun, 11 Sep 2022 19:05:28 -0400
X-MC-Unique: ApOGARNWPiChGWtiVBpYTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so5055286edb.22
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FW4Z1TYbUqVbKB+UYVWcEtd79l89qxtOGgRtrSHI16w=;
 b=D69LzoAEXtMfaups7KCAE41wZFQn4Gqkt2rGdn3uCMv3MkBd+2e2ZyAEovikKo51ga
 RrziFccnmh4vPwH0qeeGwrO++ec9EP4k47ac/BaQZGh/cK1+g6lEM25cgREr86VU12hj
 tlFJSVcjjaR3dM0owFnzG7b1r4Q+Ho24Cr5zwktd9Hw5H/Z/CcDc1N7tzxYhjSr1kVcn
 32sYI9xbEUoczIfE86LhS+vjphsYh88ASsLlIo4qgDMIpirlrGejC5wI3Xd+RP1G63ZX
 y0F/yHe0j8wq/YpzSQpyxxltyZyFWRWH3Xip35x2g9R+fFgSVE3sT4T6r3BwvNIMsOaL
 oe/g==
X-Gm-Message-State: ACgBeo0JMyAxLof5EahCP+7L+6oZOufL5dhh3tNljfQKXMahT2hUca7E
 eJDQ2J9AEJNKvat7cxy5CNJQjd3/8NO97t+PTtCyTe6EmdZnwZ9IzMdUct1ZwssogmaBkDefS57
 JyRsGT+3H+jvbNiceFeEWNodVEK856oc0Noy5UgXZ4oHDIc7HcerJ+vPzBjojQ0a5rVg=
X-Received: by 2002:a05:6402:1e8f:b0:440:eb20:7a05 with SMTP id
 f15-20020a0564021e8f00b00440eb207a05mr19621552edf.169.1662937526851; 
 Sun, 11 Sep 2022 16:05:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SddNfKtVgA/CPDoPeNpiTUnNPUl9zsffeAJZWBVvK/F0LipDtkir+1kVrBK4gyRCu5bIL4w==
X-Received: by 2002:a05:6402:1e8f:b0:440:eb20:7a05 with SMTP id
 f15-20020a0564021e8f00b00440eb207a05mr19621536edf.169.1662937526482; 
 Sun, 11 Sep 2022 16:05:26 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a05640226c600b00445c0ab272fsm4718167edd.29.2022.09.11.16.05.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/37] target/i386: reimplement 0x0f 0xd8-0xdf, 0xe8-0xef,
 0xf8-0xff, add AVX
Date: Mon, 12 Sep 2022 01:04:01 +0200
Message-Id: <20220911230418.340941-22-pbonzini@redhat.com>
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

These are more simple integer instructions present in both MMX and SSE/AVX,
with no holes that were later occupied by newer instructions.

Simple, non-saturating operations are implemented using gvec; apart
from this, there is not much to talk about.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  28 ++++++++
 target/i386/tcg/emit.c.inc       | 113 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   4 +-
 3 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index f20587c096..59f5637583 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -264,6 +264,34 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x6d] = X86_OP_ENTRY3(PUNPCKHQDQ, V,x, H,x, W,x,  vex4 p_66 avx2_256),
     [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
     [0x6f] = X86_OP_GROUP3(0F6F,       V,x, None,None, W,x, vex5 mmx p_00_66_f3),
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
index 3f89d3cf50..1ba7a45668 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -290,6 +290,20 @@ BINARY_INT_MMX(PUNPCKHWD,  punpckhwd)
 BINARY_INT_MMX(PUNPCKHDQ,  punpckhdq)
 BINARY_INT_MMX(PACKSSDW,   packssdw)
 
+BINARY_INT_MMX(PSUBUSB, psubusb)
+BINARY_INT_MMX(PSUBUSW, psubusw)
+BINARY_INT_MMX(PMINUB,  pminub)
+BINARY_INT_MMX(PADDUSB, paddusb)
+BINARY_INT_MMX(PADDUSW, paddusw)
+BINARY_INT_MMX(PMAXUB,  pmaxub)
+
+BINARY_INT_MMX(PSUBSB, psubsb)
+BINARY_INT_MMX(PSUBSW, psubsw)
+BINARY_INT_MMX(PMINSW, pminsw)
+BINARY_INT_MMX(PADDSB, paddsb)
+BINARY_INT_MMX(PADDSW, paddsw)
+BINARY_INT_MMX(PMAXSW, pmaxsw)
+
 /* Instructions with no MMX equivalent.  */
 #define BINARY_INT_SSE(uname, lname)                                               \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -526,6 +540,51 @@ static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 
 }
 
+static void gen_PADDB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_add(MO_8,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PADDW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_add(MO_16,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PADDD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_add(MO_32,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PAND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_and(MO_64,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_andc(MO_64,
+                      decode->op[0].offset, decode->op[2].offset,
+                      decode->op[1].offset, vec_len, vec_len);
+}
+
 static void gen_PCMPGTB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = sse_vec_len(s, decode);
@@ -571,6 +630,60 @@ static void gen_PEXT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_pext(s->T0, s->T0, s->T1);
 }
 
+static void gen_POR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_or(MO_64,
+                    decode->op[0].offset, decode->op[1].offset,
+                    decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PXOR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_xor(MO_64,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PSUBB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_sub(MO_8,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PSUBW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_sub(MO_16,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PSUBD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_sub(MO_32,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
+static void gen_PSUBQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+
+    tcg_gen_gvec_sub(MO_64,
+                     decode->op[0].offset, decode->op[1].offset,
+                     decode->op[2].offset, vec_len, vec_len);
+}
+
 static void gen_RORX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index cf18e12d38..11c17258eb 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4666,7 +4666,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifndef CONFIG_USER_ONLY
         use_new &= b <= limit;
 #endif
-        if (use_new && (b >= 0x160 && b <= 0x16f)) {
+        if (use_new &&
+            ((b >= 0x160 && b <= 0x16f) ||
+             (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             return disas_insn_new(s, cpu, b + 0x100);
         }
         break;
-- 
2.37.2



