Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F125B51D3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:16:16 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWBT-0000kP-Us
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0T-0000HZ-BZ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0R-00070g-O9
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vc/CcSryYtDk6Uvvp8jDUy7rkTxHVOtnsBmH3Dqy7g8=;
 b=B8mjl3uH89bB1fKYycFy+nGs1Zeo6WXvkOcIFlcBd9oE+t7X8eUEiXegh8/Qh++wZWtXjl
 9l5GKnvX1hpvb685K1rwdj5FefU/mH6IdrbALHdT9qJyTKqe+SQvMdgWSTMdonveFIqJd8
 afIt16Ahv2PgZ+qX8SIhsCbX8IwwsXk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-WMJWJGIiP6CR18cd8hUv6w-1; Sun, 11 Sep 2022 19:04:48 -0400
X-MC-Unique: WMJWJGIiP6CR18cd8hUv6w-1
Received: by mail-ed1-f72.google.com with SMTP id
 w17-20020a056402269100b0043da2189b71so4887832edd.6
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vc/CcSryYtDk6Uvvp8jDUy7rkTxHVOtnsBmH3Dqy7g8=;
 b=DdV+wuvIqgTrGgocjotWZh7x8p0HloypgZE9kCFdV9f6AbLiU+JDKptEE4HaKzEYbx
 llFlHEioYe92TE38kB9VqhokcRVFVpRIelIgOfuXn0/UwH1kSgLLiXdrPEXGve6eHL5j
 gzoUfEcfNA/fRCYEaIFqvWZHGX3Bggvmu7TE9XlwlYy+e+BtgNMbzLiwYcxo3CTQfBH4
 EpuGNOLlzA8FBsrfJrjron0XvA+KqRuROTQCQyIA1RUU9FTD1+cBcRYx1wTduuroO1QA
 zRTAnuXbqoa8Kcq8x9r5JTF2aOiN9UqZaGbjRrvajldI4Cn9WP0KxAmPQRMZ5QK08WOo
 gkAw==
X-Gm-Message-State: ACgBeo30VkzewJtUvkNwnYJIHz0YpwtTfKa9W6kzpM+NngvHv+5UHBph
 c4J/QE+g+AUZ/kqlE6BQqu802/IOmixQDsBI4+aXFBF3E69YLRpyu/pSHS76Ts/yDx9ZIjsIsqT
 pkJdbjdsxmzlsEuN+tIR0+7lKr9eNQUH8VQIfMcw8cvaWkyZ4h3iBF9z4iviDABKCIr0=
X-Received: by 2002:a05:6402:454:b0:447:59a8:fc7d with SMTP id
 p20-20020a056402045400b0044759a8fc7dmr20455790edw.68.1662937487287; 
 Sun, 11 Sep 2022 16:04:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Tqnt2LunwAYS6r2DwwdR/RwcDOPyQv+kuEn2HYF1utEKWyV0Mnbhe3+4NYCKPv2enXywTZw==
X-Received: by 2002:a05:6402:454:b0:447:59a8:fc7d with SMTP id
 p20-20020a056402045400b0044759a8fc7dmr20455779edw.68.1662937486931; 
 Sun, 11 Sep 2022 16:04:46 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a170906415500b0073d7ab84375sm3507635ejk.92.2022.09.11.16.04.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/37] target/i386: add CPUID feature checks to new decoder
Date: Mon, 12 Sep 2022 01:03:48 +0200
Message-Id: <20220911230418.340941-9-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 51 ++++++++++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     | 20 +++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 7f76051b2d..a9b8b6c05f 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -83,6 +83,7 @@
 #define X86_OP_ENTRY0(op, ...)                                    \
     X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
 
+#define cpuid(feat) .cpuid = X86_FEAT_##feat,
 #define i64 .special = X86_SPECIAL_i64,
 #define o64 .special = X86_SPECIAL_o64,
 #define xchg .special = X86_SPECIAL_Locked,
@@ -506,6 +507,52 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
     return true;
 }
 
+static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
+{
+    switch (cpuid) {
+    case X86_FEAT_None:
+        return true;
+    case X86_FEAT_MOVBE:
+        return (s->cpuid_ext_features & CPUID_EXT_MOVBE);
+    case X86_FEAT_PCLMULQDQ:
+        return (s->cpuid_ext_features & CPUID_EXT_PCLMULQDQ);
+    case X86_FEAT_SSE:
+        return (s->cpuid_ext_features & CPUID_SSE);
+    case X86_FEAT_SSE2:
+        return (s->cpuid_ext_features & CPUID_SSE2);
+    case X86_FEAT_SSE3:
+        return (s->cpuid_ext_features & CPUID_EXT_SSE3);
+    case X86_FEAT_SSSE3:
+        return (s->cpuid_ext_features & CPUID_EXT_SSSE3);
+    case X86_FEAT_SSE41:
+        return (s->cpuid_ext_features & CPUID_EXT_SSE41);
+    case X86_FEAT_SSE42:
+        return (s->cpuid_ext_features & CPUID_EXT_SSE42);
+    case X86_FEAT_AES:
+        if (s->vex_l) {
+            return (s->cpuid_7_0_ecx_features & CPUID_7_0_ECX_VAES);
+        } else {
+            return (s->cpuid_ext_features & CPUID_EXT_AES);
+        }
+    case X86_FEAT_AVX:
+        return (s->cpuid_ext_features & CPUID_EXT_AVX);
+
+    case X86_FEAT_SSE4A:
+        return (s->cpuid_ext3_features & CPUID_EXT3_SSE4A);
+
+    case X86_FEAT_ADX:
+        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX);
+    case X86_FEAT_BMI1:
+        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1);
+    case X86_FEAT_BMI2:
+        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2);
+    case X86_FEAT_AVX2:
+        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_AVX2);
+    default:
+        abort();
+    }
+}
+
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
@@ -690,6 +737,10 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
         goto unknown_op;
     }
 
+    if (!has_cpuid_feature(s, decode.e.cpuid)) {
+        goto illegal_op;
+    }
+
     switch (decode.e.special) {
     case X86_SPECIAL_None:
         break;
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index a2d3c3867f..6fb2d9151e 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -93,6 +93,25 @@ typedef enum X86OpSize {
     X86_SIZE_f64,
 } X86OpSize;
 
+typedef enum X86CPUIDFeature {
+    X86_FEAT_None,
+    X86_FEAT_ADX,
+    X86_FEAT_AES,
+    X86_FEAT_AVX,
+    X86_FEAT_AVX2,
+    X86_FEAT_BMI1,
+    X86_FEAT_BMI2,
+    X86_FEAT_MOVBE,
+    X86_FEAT_PCLMULQDQ,
+    X86_FEAT_SSE,
+    X86_FEAT_SSE2,
+    X86_FEAT_SSE3,
+    X86_FEAT_SSSE3,
+    X86_FEAT_SSE41,
+    X86_FEAT_SSE42,
+    X86_FEAT_SSE4A,
+} X86CPUIDFeature;
+
 /* Execution flags */
 
 typedef enum X86OpUnit {
@@ -160,6 +179,7 @@ struct X86OpEntry {
     X86OpSize    s3  : 8;
 
     X86InsnSpecial special : 8;
+    X86CPUIDFeature cpuid : 8;
     bool         is_decode : 1;
 };
 
-- 
2.37.2



