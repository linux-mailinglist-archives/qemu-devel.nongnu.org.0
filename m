Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62B5FE496
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:55:20 +0200 (CEST)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Ah-00063r-91
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62w-0002UF-EZ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62u-0005Ci-My
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBqo45zKkQbmdFAhY9C08GN3giMhyKJ+DTWQrmWfBb4=;
 b=iD4kfZ7BgyVl4wXDoGIYcf/RxLkIDmPq4XiDXDqlJVdCfgMoNvCWm1yhZjSdjYCp47NxUz
 BmZT3L6mc16Px4cy9rUA8Z11kKgWOPmyEDPSZMqNrl7EAzlhXGcopBKJ8q3fSbd02TRpY0
 EslKNNqJ2UkvpNntJZeq8IV72QD2rUk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-2-tz0NCbNXWAigc6UY6qsg-1; Thu, 13 Oct 2022 17:47:14 -0400
X-MC-Unique: 2-tz0NCbNXWAigc6UY6qsg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso2123386edb.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MBqo45zKkQbmdFAhY9C08GN3giMhyKJ+DTWQrmWfBb4=;
 b=qppz7ClxHQ4azJqeVRvluvcV/iljZ8iS/uttP+PLuWFpDZtO/gYjwA9aA/l2NeAtWQ
 LCrpDU/U3ePcUFRGqrrYeoDE0/Nd/2aQdKsixUglG6kaB68j/rHM71d80QNyZtMoM6HK
 QwWiOYrNQFr1LWsh2pP08TX6pSplftEiUXYEwq/w/oNA8ItOfAN7KagYlYhJjjdFT5/O
 wcw7Xcw2UyGzO2Hly6pUXrCq+JLmsPTsEDzbaIOdavGuNPq+EP8eW4/RKApLWBSDbAhc
 xRKmjk7pvus9XmGh95vEXKcTQPZGPZmQ712O3KogT5V2T1TSPzAYSxuNOEdidfKFSccS
 ekqA==
X-Gm-Message-State: ACrzQf2KJYC4TDEIPnc/JlNqrRd+TRy55PG79slfNWOtiyclEaxdoyRl
 sz7XzAjNaqRNDpvZdyd9QADNvXpFbapBOt90DorXXQUXxODdtM6GFwEkZP/7KCP6UhgYjRBG1z8
 cJBrysq8O2PgbARQZd/6LDRRszSPDAuQeCbseGzQgVqw9wgnTgSZ12BO6SgXebPpld/8=
X-Received: by 2002:a17:907:6088:b0:78d:8e24:40d0 with SMTP id
 ht8-20020a170907608800b0078d8e2440d0mr1331467ejc.590.1665697632869; 
 Thu, 13 Oct 2022 14:47:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51qAskAcaHFIychrZQx2xZzcNdcMAQoCvq8DIHgK0veegt7/yLN0sTxoIld9fevwNgbzKcSQ==
X-Received: by 2002:a17:907:6088:b0:78d:8e24:40d0 with SMTP id
 ht8-20020a170907608800b0078d8e2440d0mr1331443ejc.590.1665697632474; 
 Thu, 13 Oct 2022 14:47:12 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709063d3200b0073d71792c8dsm410032ejf.180.2022.10.13.14.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 06/35] target/i386: add CPUID feature checks to new decoder
Date: Thu, 13 Oct 2022 23:46:22 +0200
Message-Id: <20221013214651.672114-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 55 ++++++++++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     | 20 ++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index be4e5705ed..e268b5fb48 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -85,6 +85,7 @@
 #define X86_OP_ENTRY0(op, ...)                                    \
     X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
 
+#define cpuid(feat) .cpuid = X86_FEAT_##feat,
 #define i64 .special = X86_SPECIAL_i64,
 #define o64 .special = X86_SPECIAL_o64,
 #define xchg .special = X86_SPECIAL_Locked,
@@ -513,6 +514,56 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
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
+        if (!(s->cpuid_ext_features & CPUID_EXT_AES)) {
+            return false;
+        } else if (!(s->prefix & PREFIX_VEX)) {
+            return true;
+        } else if (!(s->cpuid_ext_features & CPUID_EXT_AVX)) {
+            return false;
+        } else {
+            return !s->vex_l || (s->cpuid_7_0_ecx_features & CPUID_7_0_ECX_VAES);
+        }
+
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
+    }
+    g_assert_not_reached();
+}
+
 static void decode_temp_free(X86DecodedOp *op)
 {
     if (op->v_ptr) {
@@ -701,6 +752,10 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
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
index 3a856b48e7..e62e9c9d87 100644
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
     X86OpSize    s3:8;
 
     X86InsnSpecial special:8;
+    X86CPUIDFeature cpuid:8;
     bool         is_decode:1;
 };
 
-- 
2.37.3


