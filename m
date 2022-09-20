Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E665BF079
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:47:10 +0200 (CEST)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oam1F-0008M8-98
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah03-0006No-O5
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzz-00029g-5R
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=71v9UCBxG+vsAGEHFzGyYzgryy33ZHT4EeoLr6WO0sw=;
 b=bb03pEu1zNJ9qQlR8wu8KNVFXdkSfn22rzink/kLspy37RA+C+mUsM+4Eiw/TCurn5aZSL
 WjlKJq3JXLbNu5XLuS7t0owvuFQUZB4TveUkz35K+3DQtpax41PiYF5TzPWdsn6H6CgUfM
 sMfSbBz0RQx2sCOePnm9Nn3UA7+lpns=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-es43iWSDPUeD2qODJWsmPA-1; Tue, 20 Sep 2022 13:25:28 -0400
X-MC-Unique: es43iWSDPUeD2qODJWsmPA-1
Received: by mail-ej1-f70.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so1758468ejb.19
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=71v9UCBxG+vsAGEHFzGyYzgryy33ZHT4EeoLr6WO0sw=;
 b=PwGqGTEsTsUuef4A098tJnLlxUEePdhDc6GXUcZo+eI/KOcRLfyDjtl2VmrVkdK+am
 R+19n3zpSxuomlVxsX0ZpRXcrX5tFiUD97ZqGs4fTyFA5CKueySRHJ8eqCJFcRS+YtDb
 4mFYu6fyEjwqmwBfITzUNxO3uVvxGXQTWCCQqz5LbHcXFs/5ZdCEuWu+iB1U+MeNfrpM
 kxhdQBOTABGs4PO3PgkEJKJZyGZqWkTZ+seLhSflBifDfZTw5fHhBqqWBKEWCcBgHp19
 ZJtZ896dCFqXbqu41fdMAgZALXaqA1T1PzccCP7nmNebztYgh8wv+PowBJ2feg1UD/Xb
 Ko9w==
X-Gm-Message-State: ACrzQf3UFPM6s8OOOxB+QmyiwpKJdCsRThhkAIf+Y4pWZ1shcf/o89Ga
 C5telXg7I50+6ERfTn6QZFjCqA6GO8/sFqB1WM+lDde7j16qpclFQ0kUJmL7JupqvFBbbdxBRkI
 vD649TIs3i2BWp/hfIUw9x4NijcZDQOanHAkCLsxA4For8B1D/Cak4IvHOn2stdAjW6M=
X-Received: by 2002:a17:907:dac:b0:775:58d2:defe with SMTP id
 go44-20020a1709070dac00b0077558d2defemr17972646ejc.231.1663694727167; 
 Tue, 20 Sep 2022 10:25:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cAamLt+YpubthN+RlF28rkU+yLP8uLiMt3gZJuNOCiRrWLS7e937hlxn2Kt/p09/1b7MwJQ==
X-Received: by 2002:a17:907:dac:b0:775:58d2:defe with SMTP id
 go44-20020a1709070dac00b0077558d2defemr17972616ejc.231.1663694726821; 
 Tue, 20 Sep 2022 10:25:26 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a05640208d700b0044f2564c28csm223733edz.20.2022.09.20.10.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 11/37] target/i386: validate SSE prefixes directly in the
 decoding table
Date: Tue, 20 Sep 2022 19:24:41 +0200
Message-Id: <20220920172507.95568-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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

Many SSE and AVX instructions are only valid with specific prefixes
(none, 66, F3, F2).  Introduce a direct way to encode this in the
decoding table to avoid using decode groups too much.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 37 ++++++++++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  1 +
 2 files changed, 38 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index f56c654e08..4dc67e6d37 100644
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
index 8431057769..5fb68a365c 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -212,6 +212,7 @@ struct X86OpEntry {
     X86CPUIDFeature cpuid:8;
     uint8_t      vex_class:8;
     X86VEXSpecial vex_special:8;
+    uint16_t     valid_prefix:16;
     bool         is_decode:1;
 };
 
-- 
2.37.2


