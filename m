Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B215BEFD5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:12:26 +0200 (CEST)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalTd-0004FQ-2f
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0A-0006QS-EZ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah08-0002Aq-Mm
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KT2NOlwaQokd6chNCwWU1zFutgO7jY0xwNMqsV7fX8o=;
 b=K9rBzjBTkbaMC53VoC3nPuta9PDB7iuJia/Tisntbe1w6J2xmzgVt9cc+G7TSMPqOehZ14
 G1ZUfGccZz4kqOiOrZYVFYGBVlFn429tZRz1Lw2nHvH+wSBYium2UJYVa2f2Jd4yBYRoI3
 Quj7t1fTFuwv+bsrvraToP9Ae3gavzg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-zXkLDW-6Pci0uKkopfJn-A-1; Tue, 20 Sep 2022 13:25:36 -0400
X-MC-Unique: zXkLDW-6Pci0uKkopfJn-A-1
Received: by mail-ej1-f71.google.com with SMTP id
 du20-20020a17090772d400b0077df99c5ab3so1785745ejc.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KT2NOlwaQokd6chNCwWU1zFutgO7jY0xwNMqsV7fX8o=;
 b=QJGNbNeZl6H61rwsUBLcv6E36mjfE5DfEuBSethaixs+BT6PImntKIvK7D8LnxrZys
 3Dbvp3upaaaGDF3pyKuguU60DhhY9v9Uh2kctPEeX3HLiDzPiYoOKYglQEDk3ZgKUBBY
 ag7C2MT+5ELqiVCTB1n4kFLnyi9LKg7sF7d5TOgG+u6wVvCCWYogazzoW0yMRxeqLcsJ
 oqm0dI3udn3S/L/kHFdKLdF1qpK6AoRlUOp5nSt2Cyv3N0jYWepq+gKzpBBhRtDb28DQ
 bUJYjUKV3Lf0EBRFAf4Zexn2w8XZrxU9Re2Qb8M0oUj9to9hOBEDlJnNBykWYM3/XekI
 lj2w==
X-Gm-Message-State: ACrzQf0xJJ8PkorO9YvNkGnsnv1l865UA39+pb1wJHXz922OSGDLzdwQ
 E7vkDn264FbtBhZ1o8yNV7eCa7m5BSNXSH1ShIk4Q77T1hmKKU6I0xauTtjD3pCfBLSuWGBjY7j
 QbQ8L86uG9Lpkw2S8U0hP16qzG2Yh2uStV0rhMl+aYB3FHvNkrD+uqQ03bHPBolEAdVA=
X-Received: by 2002:a17:907:ea0:b0:779:6c9d:7355 with SMTP id
 ho32-20020a1709070ea000b007796c9d7355mr17271820ejc.542.1663694735578; 
 Tue, 20 Sep 2022 10:25:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM52pWp+U2TgEWK8zFXICCb2ufYsOJe4GWMYDS9HjjnyASrtl+eRZGCSoaKiYXPGQBE+XXIDFg==
X-Received: by 2002:a17:907:ea0:b0:779:6c9d:7355 with SMTP id
 ho32-20020a1709070ea000b007796c9d7355mr17271799ejc.542.1663694735281; 
 Tue, 20 Sep 2022 10:25:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a508d14000000b0044657ecfbb5sm225981eds.13.2022.09.20.10.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 17/37] target/i386: implement additional AVX comparison
 operators
Date: Tue, 20 Sep 2022 19:24:47 +0200
Message-Id: <20220920172507.95568-18-pbonzini@redhat.com>
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

The new implementation of SSE will cover AVX from the get go, so include
the 24 extra comparison operators that are only available with the VEX
prefix.

Based on a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 38 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h | 27 +++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 8bb7293975..18d217ebf5 100644
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
+/* We must make sure we evaluate the argument in case it is a signalling NAN */
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
index 32ffa8445b..e7866a8395 100644
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


