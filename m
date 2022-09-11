Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741C5B51E7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:26:34 +0200 (CEST)
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWLR-0005UR-9n
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0x-0000oX-Qi
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0v-0007IT-Tq
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzgz4ku4rHQTyyjAV6VNW6xhHI2bqM8/RFghrFmi0LI=;
 b=WDG2DmJpdTU6RqGZbneN69y84mPZSzbe4wmam9etgbQ/Z5CsR7jXWAqjPi2Mh4GiZQOO9T
 Zm7bu8ZGjhAJhEgufFtsYzw8C+3ehieM4Zxu1p/h+Gmqy2t/G0EalftDXbzys38N/nBf7G
 RtN1RWlfyocXWNtLzpWYpMYFsoTqrcE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-wvZPfnAkNX-xO3BNoX4_uA-1; Sun, 11 Sep 2022 19:05:19 -0400
X-MC-Unique: wvZPfnAkNX-xO3BNoX4_uA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z9-20020a05640235c900b0044f0575e9ddso4978314edc.1
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hzgz4ku4rHQTyyjAV6VNW6xhHI2bqM8/RFghrFmi0LI=;
 b=4cnXMYRMr0umQmETv6bGUGaG/hIyoBeS5PGGPYnO4oZPCaA77wQxdvQ6vqzMheOwER
 cRy8TmPEkKrRaEfEspFuRq5QratvFq1PJw6J900cpsjsb404tAL/WNMrIq/TPXHbVU/c
 WstTfOmXFwASgA3FYuzrCBj90F3j3dJzQ3g+ORsAQCu7z1ZVuIUiaIMBwpjfytAZFfbn
 Hu0LlAy46L0ObZz/dg4G1l/XA3Vc85TfpqhOOwJQtNjAmnGJMHsZq186xQaYbgAUpany
 Qq3+xieYkr2xfEBxBQUE1aUlsyQslHmjsTQBrDDU/N7M8EwneLgNcCDWFMVy4UPnUC0H
 R5XA==
X-Gm-Message-State: ACgBeo16UEDwcC3fwlZVhbLHXD7BpbABRandmQwpVF1xWPEmnJ0tRlbc
 Hw3p3YsKyyV6FKJr02bbv5SBzoI3ARvZDC6q/BoHN6UjcQpt3xY7mxhC5Tt/iuDB0m4uPpBYmg2
 Nam8kiC/NL11j+g1QFmmxyK6MxUP85+H8r3W75yok3xFGMrm20FF6ZURGTxJsZZ2Fky8=
X-Received: by 2002:a05:6402:26d3:b0:451:6ca9:bc5e with SMTP id
 x19-20020a05640226d300b004516ca9bc5emr5567897edd.325.1662937518196; 
 Sun, 11 Sep 2022 16:05:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5NaUYAjnI/UHD2geYqz9M5ZN9gVsH8/i4uxob4+vUJH2TbVYpoPjRpjFQ2PNwFOBVXhpvKKA==
X-Received: by 2002:a05:6402:26d3:b0:451:6ca9:bc5e with SMTP id
 x19-20020a05640226d300b004516ca9bc5emr5567883edd.325.1662937517952; 
 Sun, 11 Sep 2022 16:05:17 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906048a00b0073d83f80b05sm3512640eja.94.2022.09.11.16.05.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/37] target/i386: implement additional AVX comparison
 operators
Date: Mon, 12 Sep 2022 01:03:58 +0200
Message-Id: <20220911230418.340941-19-pbonzini@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

The new implementation of SSE will cover AVX from the get go, so include
the 24 extra comparison operators that are only available with the VEX
prefix.

Based on a patch by Paul Brook <paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 38 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h | 27 +++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0d56f0949b..93cee330d2 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1075,10 +1075,21 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
         }                                                                   \
     }
 
+static inline bool FPU_EQU(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_unordered);
+}
+static inline bool FPU_GE(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_greater);
+}
 #define FPU_EQ(x) (x == float_relation_equal)
 #define FPU_LT(x) (x == float_relation_less)
 #define FPU_LE(x) (x <= float_relation_equal)
+#define FPU_GT(x) (x == float_relation_greater)
 #define FPU_UNORD(x) (x == float_relation_unordered)
+// We must make sure we evaluate the argument in case it is a signalling NAN
+#define FPU_FALSE(x) (x == float_relation_equal && 0)
 
 #define FPU_CMPQ(size, a, b) \
     float ## size ## _compare_quiet(a, b, &env->sse_status)
@@ -1098,6 +1109,33 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
 SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
 #undef SSE_HELPER_CMP
 
 #if SHIFT == 1
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 5d17146049..4bef536edb 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -237,6 +237,33 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
 SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
 #if SHIFT == 1
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
-- 
2.37.2



