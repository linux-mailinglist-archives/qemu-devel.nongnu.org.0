Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA05FE492
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:54:49 +0200 (CEST)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6AC-0005QI-Ei
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj636-0002au-R2
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj635-0005EW-4j
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZrsFbZrksxRdixl7OjnTw4wWKEtKGk44EhOWWwZVK4c=;
 b=T1nuR3O3v24jAxDGhMIYZ87ugBvStWOvNh97MbMnp9RFekTiaTT7C+k5+q6gl9S1WB8RO2
 htWVnNSbOyHoXQuzw3fssGZbWqn1+AwqFHGWpi4LLqG7D/0JmTsZgODPpxnxQJkf+qU8p3
 o9qi9d5398+jhyYQVBlDlUe2p7KXlHU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-fFdcSxsoOG6gMgBddEQ-Pw-1; Thu, 13 Oct 2022 17:47:23 -0400
X-MC-Unique: fFdcSxsoOG6gMgBddEQ-Pw-1
Received: by mail-ed1-f72.google.com with SMTP id
 v4-20020a056402348400b0045bd50cb9adso2350703edc.0
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZrsFbZrksxRdixl7OjnTw4wWKEtKGk44EhOWWwZVK4c=;
 b=FCQihNC+LiYlD9u6qfrT1eCWeKxw0HQocc67pMQ6HXQ12p4mYmSsSouMX/8fyQaQBv
 CQg9g9enBygv7II2wCDKveIfSSgwkBnXUK0TQtEDvta38h1QAJSkO93pTY07euBIvmMp
 Is3PpSR/H/IWl7RWwYSeDC2rEq/yxDO6QWn+8/9DoF0I3IAuHHts/PKTYtYSc72vHvU8
 OYRp5ujZbSpmJvG945kg/ljf+YuxUm8IXekJsL8Z7agAIbxwHPt4BedS6yZuZTMJ0GRD
 crHN+dk0JvP0HdgDEwrFJUkvu3gcEe/g99vYPUYc9ucTqkSfTIgJZddvtx7J5uKU37Ao
 ZiKQ==
X-Gm-Message-State: ACrzQf0BVFX2nlO7/JXyuDjYNQMQ0LN1jTozFkWJOAtAPKyTKBDmMYvK
 SO6cjQbJtsGgkqsBOvJ4fghBI6sNHwdZ7AqyNuHiA7mH3xs8HtDfGyUiNAxaBpqxJ6tRvVAkl7C
 jsXQDHngErMUpTXj5eK/Q24P3SWFfH/HGSNpn/J3jUjdXWdSesL1Q6dRVbQfhRIBVV2o=
X-Received: by 2002:a05:6402:5110:b0:459:e912:17c8 with SMTP id
 m16-20020a056402511000b00459e91217c8mr1568420edd.137.1665697641619; 
 Thu, 13 Oct 2022 14:47:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ydhCDNoZvF/BPuO+rNtI77RbA3fsnw/UbYgzqUXbLEyhOEjyFJnj+tXPO31+0E9hA+8L8dw==
X-Received: by 2002:a05:6402:5110:b0:459:e912:17c8 with SMTP id
 m16-20020a056402511000b00459e91217c8mr1568407edd.137.1665697641395; 
 Thu, 13 Oct 2022 14:47:21 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ku15-20020a170907788f00b0078b551d2fa3sm450848ejc.103.2022.10.13.14.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 09/35] target/i386: validate SSE prefixes directly in the
 decoding table
Date: Thu, 13 Oct 2022 23:46:25 +0200
Message-Id: <20221013214651.672114-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
index f0d7b24a07..ff3f45dc8c 100644
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


