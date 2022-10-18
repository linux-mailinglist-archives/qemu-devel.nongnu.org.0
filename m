Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C1602DBF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:00:40 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn94-0004PY-Cu
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiR-0004RO-VZ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhe-0005DZ-DF
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eak2Olk8SGXmy5UtEL5kCMoFzmLXJ5Mc/eK44fcXzMw=;
 b=cKyvf/5Uk3MRmdqpT3KEyn5fZM/aFsy79aKsv29h4dkWPm6+ZmOV2RXwzrR2cztjokLF8V
 mRBJcP/Vh2of5rjRj6kt1x11C0tP3TKgKZG+h6rx4Zp/IkUHalW0Rz3oKTkn1ROLAjntQa
 mDI1trOLHdp0ZyQKjogmtcVE1ncUDZI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-vj-fAHQpN2SUuwF2D15CHQ-1; Tue, 18 Oct 2022 09:32:08 -0400
X-MC-Unique: vj-fAHQpN2SUuwF2D15CHQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b13-20020a056402350d00b0045d0fe2004eso9900537edd.18
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eak2Olk8SGXmy5UtEL5kCMoFzmLXJ5Mc/eK44fcXzMw=;
 b=ZDLLRngBXty8tPwoxx+HkAvaeKypCMfDz8BC+YhcvcL3svVvTIADFaY+bbiwxnMsEy
 FRr0afh2WwQ+EGAGPzfO0RMEoV+8PNK2FgQ6ISWAMmWwsCyWbKvcesVR9LXzmrGdjj8t
 JIdO9JOziM32VpO7FTw2Taf5uVhgxCkoB6w6ruVetJS74Iw+Ugsr12pO+yX+su8Ix40M
 KjUo/FPqo0lGymzVGI7tvmyhp+phuG9t6uiAjpLHc8gzw7T2IIFAU/QjXCmnmAK5vPBC
 DUbLj8fXvIrez4XCL8xq+yW4AQrKwTkqqdV8LKTqcPa/7prTbz7UPrz52fbBIf/vG9KQ
 66pQ==
X-Gm-Message-State: ACrzQf0GlSUJN+tIwJRMEB2oBXY1javKwrwVtvLvhkZ30Nv8iminznEY
 /t3IpyvSTmAXrrSvaMeTQ/3qPqbR0abWz3nrmURZI+FsEBWv1KJWrR9abKK3fP7Pw9HC99oR3Pu
 Bys9xol0ehjIDU8reEONoxq8oRlM+Qyo9XPecuLKN017Dv23o1rauKRCjQJf+iXTU7lE=
X-Received: by 2002:a05:6402:51c6:b0:45d:50ef:1142 with SMTP id
 r6-20020a05640251c600b0045d50ef1142mr2678989edd.259.1666099926443; 
 Tue, 18 Oct 2022 06:32:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72h7H6V9nl/1jTdeeoMYE/caclX8qbFE5bI5iS6HH+uwz0jwU8mShjgBEDcV1LUJMdnKD6+g==
X-Received: by 2002:a05:6402:51c6:b0:45d:50ef:1142 with SMTP id
 r6-20020a05640251c600b0045d50ef1142mr2678963edd.259.1666099926048; 
 Tue, 18 Oct 2022 06:32:06 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 3-20020a170906318300b0078c213ad441sm7547455ejy.101.2022.10.18.06.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 24/53] target/i386: add CPUID feature checks to new decoder
Date: Tue, 18 Oct 2022 15:30:13 +0200
Message-Id: <20221018133042.856368-25-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 37e76692ba..9afc26b9c9 100644
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


