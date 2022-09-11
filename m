Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10CC5B51D7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:17:59 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWD8-0002A1-SL
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0g-0000ZZ-UA
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0f-0007C7-8j
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wP99hXnuPonol6H5+1uykQRwZBY8yy3iSpF/VeYj2vY=;
 b=BRQJUX28vIXbbwNN/ZLHnvzquFyrxaHiFGqTgWKrfzw4XcU3qw/Zi9/0R2ayO24zBiAG/s
 5KTRBmTm+14y6V9jvo+XyH1N8iISEJxjOA2Is72x70o+AyEN3MZqNY9fna70Bs2WDnlAL2
 JhXHqI/wQo3Qyp3EUTD2adMe7tHPwN8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-L4_4L0WuPj2GFN9mrWz6Fw-1; Sun, 11 Sep 2022 19:04:57 -0400
X-MC-Unique: L4_4L0WuPj2GFN9mrWz6Fw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso1180268edc.18
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wP99hXnuPonol6H5+1uykQRwZBY8yy3iSpF/VeYj2vY=;
 b=RrObV6llzT4b3lRFpB37HAfAtZQU+RBzyuO1hjbk6y/02ZW8UCnzymZ8ZKQFey/GTl
 WaHvwLBYCvO3GJ/K+wzHebgRhcOuVlhYUDyub8k+IPivT1XECt8mKOeltxjooQqmH+1u
 5KjELfb8M6HvHPCgsKw0JXWe9hjg7cpOLdry32Kkf+sf6LWZy4g1GFHtcfn4qLG5i46D
 02FARTfoFpCJBD6FubCpuq1K3N8ns6t5p40EvQQJexhbn4sSt1OpA3b3ZFnMZ+nYu1fb
 gjKREZBc4AI/MYn2AyydDGTJ5RZDPRb28mzAl5fhIffeG2B+fUR8H88o9OhKbFXjcKZl
 TBQw==
X-Gm-Message-State: ACgBeo1VLTumA1MxmvcQMGqrp5E2zyt3i2tGgvM62OQ3appW7T+togVE
 MlXzYDzkryCjgdjmSUOtoLjPmueFNt+8jqJ7Jq6cvm/3b2WOQtQMFKTdjYDuZp5qMIRXXd3yU/s
 zIj5MZqKhP0sS8H4grzjX94cHuc6kCGCCKIC7eBVgFB3atU7V/q74iqP6iL5pELbUL40=
X-Received: by 2002:a05:6402:268d:b0:451:d6e9:5572 with SMTP id
 w13-20020a056402268d00b00451d6e95572mr1665891edd.390.1662937496576; 
 Sun, 11 Sep 2022 16:04:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4B4i6YV9/AsHy7yh1pnsjHNXqdhiAukV9jb0W0JwbX29ihd42lCmiBJgZLB5QSE6pk5zzS3A==
X-Received: by 2002:a05:6402:268d:b0:451:d6e9:5572 with SMTP id
 w13-20020a056402268d00b00451d6e95572mr1665872edd.390.1662937496220; 
 Sun, 11 Sep 2022 16:04:56 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05640243cb00b0043df042bfc6sm4609917edc.47.2022.09.11.16.04.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/37] target/i386: validate SSE prefixes directly in the
 decoding table
Date: Mon, 12 Sep 2022 01:03:51 +0200
Message-Id: <20220911230418.340941-12-pbonzini@redhat.com>
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

Many SSE and AVX instructions are only valid with specific prefixes
(none, 66, F3, F2).  Introduce a direct way to encode this in the
decoding table to avoid using decode groups too much.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 37 ++++++++++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  1 +
 2 files changed, 38 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index f6c032c694..7b4fd9fb54 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -108,6 +108,22 @@
 
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
+#define p_00_66       .valid_prefix = P_00|P_66,
+#define p_00_f3       .valid_prefix = P_00|P_F3,
+#define p_66_f2       .valid_prefix = P_66|P_F2,
+#define p_00_66_f3    .valid_prefix = P_00|P_66|P_F3,
+#define p_66_f3_f2    .valid_prefix = P_66|P_F3|P_F2,
+#define p_00_66_f3_f2 .valid_prefix = P_00|P_66|P_F3|P_F2,
+
 static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
 {
     if (!s->has_modrm) {
@@ -473,6 +489,23 @@ static bool decode_op(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
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
@@ -484,6 +517,10 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
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
index b5299d0dd2..3db7b82506 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -212,6 +212,7 @@ struct X86OpEntry {
     X86CPUIDFeature cpuid : 8;
     uint8_t      vex_class : 8;
     X86VEXSpecial vex_special : 8;
+    uint16_t     valid_prefix : 16;
     bool         is_decode : 1;
 };
 
-- 
2.37.2



