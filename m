Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D34602E15
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:14:15 +0200 (CEST)
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknMD-0000t1-NF
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiR-0004RM-VQ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhf-0005FP-Vx
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JETjXvsLDGBVZaWr8X9vwnBhgE2BdBgJ63vEQ6jShxs=;
 b=ebe3+jMgNDCDxBM8a5xt9sWLfuEt5jF8OA4H+jnX0KjhIvsVATcnKY0wK36542NFCrQ2/f
 v7NPuP65WAdSLYjD/LfaHVt9fPuPRYSMzU4VFwC3roEXAtKBgpfsg938/nWzfgyDH27LKK
 V1GogW4NUjGY1H63cqznRIwAO9NGCTM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-z-yTJ_KYMSa6EkTa-yXsLg-1; Tue, 18 Oct 2022 09:32:17 -0400
X-MC-Unique: z-yTJ_KYMSa6EkTa-yXsLg-1
Received: by mail-ed1-f69.google.com with SMTP id
 b13-20020a056402350d00b0045d0fe2004eso9900935edd.18
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JETjXvsLDGBVZaWr8X9vwnBhgE2BdBgJ63vEQ6jShxs=;
 b=dcIXbdeYERrn2ciQ9EZFZjcoztzKJgFp8ZoQ5PijmLl16kBpB2jTRnNGzeB044g58M
 M5hlJYK/qYr93M0H0S557WIN7wGK+WAkIFcjxKpLvO/x94ot63qmRNdDis/jV1/04b8U
 VmnQxO7aBymN9SEMFj9Jp774q/8OdU7+tAGh877U5qJcrXGsPlDbBLyKpLcHlOyqtOQl
 1GHrzENdrwaps6Nc//mWo4RxOtUQFt9/jT8DVpNLtEJ/FwPvUfrJq5TCGYE6tPW+zhN/
 sl7WATr7GVj35bwdW37utn0vlcEs9Tx3XVHA4gXgOVUF4CP/XjcAD6ilzqX2SBgx1QC6
 2TJA==
X-Gm-Message-State: ACrzQf0+mKD/K6zVoGExV+ITSQrv71KxZMKsgPEAly9XrmWZJ94uFs2u
 IjoSIiQw+/9SSTC2D4RcBJGcU4/HBT+qSHELoRk1PhVIhe4d8mWiUShwpkKLfLZreXghpAvNBO2
 6py1U19cUomH0PpsxsS31QsLymin6NhDechB19ziGaE/anfp7ecTejck+tTkXsoW2Hu8=
X-Received: by 2002:a17:907:e87:b0:78e:2b3c:f672 with SMTP id
 ho7-20020a1709070e8700b0078e2b3cf672mr2446159ejc.74.1666099935809; 
 Tue, 18 Oct 2022 06:32:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM759cRnBmoqcUeIi2ZOd1qNmpRLxjX4SmTHQwWD7Rr0ZsnGlmXfurIioKVf6Fm2zzJIPu+1Bg==
X-Received: by 2002:a17:907:e87:b0:78e:2b3c:f672 with SMTP id
 ho7-20020a1709070e8700b0078e2b3cf672mr2446133ejc.74.1666099935524; 
 Tue, 18 Oct 2022 06:32:15 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a170906119800b0077077b59085sm7498283eja.184.2022.10.18.06.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 27/53] target/i386: validate SSE prefixes directly in the
 decoding table
Date: Tue, 18 Oct 2022 15:30:16 +0200
Message-Id: <20221018133042.856368-28-pbonzini@redhat.com>
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

Many SSE and AVX instructions are only valid with specific prefixes
(none, 66, F3, F2).  Introduce a direct way to encode this in the
decoding table to avoid using decode groups too much.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 37 ++++++++++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  1 +
 2 files changed, 38 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index a7af673df3..64bef76159 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -110,6 +110,22 @@
 
 #define avx2_256 .vex_special = X86_VEX_AVX2_256,
 
+#define P_00          1
+#define P_66          (1 << PREFIX_DATA)
+#define P_F3          (1 << PREFIX_REPZ)
+#define P_F2          (1 << PREFIX_REPNZ)
+
+#define p_00          .valid_prefix = P_00,
+#define p_66          .valid_prefix = P_66,
+#define p_f3          .valid_prefix = P_F3,
+#define p_f2          .valid_prefix = P_F2,
+#define p_00_66       .valid_prefix = P_00 | P_66,
+#define p_00_f3       .valid_prefix = P_00 | P_F3,
+#define p_66_f2       .valid_prefix = P_66 | P_F2,
+#define p_00_66_f3    .valid_prefix = P_00 | P_66 | P_F3,
+#define p_66_f3_f2    .valid_prefix = P_66 | P_F3 | P_F2,
+#define p_00_66_f3_f2 .valid_prefix = P_00 | P_66 | P_F3 | P_F2,
+
 static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
 {
     if (!s->has_modrm) {
@@ -480,6 +496,23 @@ static bool decode_op(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
     return true;
 }
 
+static bool validate_sse_prefix(DisasContext *s, X86OpEntry *e)
+{
+    uint16_t sse_prefixes;
+
+    if (!e->valid_prefix) {
+        return true;
+    }
+    if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        /* In SSE instructions, 0xF3 and 0xF2 cancel 0x66.  */
+        s->prefix &= ~PREFIX_DATA;
+    }
+
+    /* Now, either zero or one bit is set in sse_prefixes.  */
+    sse_prefixes = s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA);
+    return e->valid_prefix & (1 << sse_prefixes);
+}
+
 static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_func,
                         X86DecodedInsn *decode)
 {
@@ -491,6 +524,10 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
         e->decode(s, env, e, &decode->b);
     }
 
+    if (!validate_sse_prefix(s, e)) {
+        return false;
+    }
+
     /* First compute size of operands in order to initialize s->rip_offset.  */
     if (e->op0 != X86_TYPE_None) {
         if (!decode_op_size(s, e, e->s0, &decode->op[0].ot)) {
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index 25e5400a8a..8456ae67ad 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -212,6 +212,7 @@ struct X86OpEntry {
     X86CPUIDFeature cpuid:8;
     unsigned     vex_class:8;
     X86VEXSpecial vex_special:8;
+    uint16_t     valid_prefix:16;
     bool         is_decode:1;
 };
 
-- 
2.37.3


