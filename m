Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893F153849C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:19:05 +0200 (CEST)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhAe-00018s-I4
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzW-0003Xy-FL
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzU-00062r-O1
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoQ+nsqCtzbS0+oLdSKIRurF/kVBlUkg6b7i2gTEzh0=;
 b=HRsHIL0WAtI+1Wi2UlJPYbKEIURfwRssWyyTJfIkWJSaF+oP8h3WRyXdomI01CyiJfDCB7
 +dmdBhAmDh7eN14AcLkrCTN9jXLk+1gXGY/RdQHA4oO7pEUA1Zd08+mmJTNYX2taiyEwh5
 o3Juk4Y/zyYmbIOBGonJjOjkWsESGqw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-zjQcTL2CMxmCVgGTXGzrzw-1; Mon, 30 May 2022 11:07:31 -0400
X-MC-Unique: zjQcTL2CMxmCVgGTXGzrzw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g22-20020adfa496000000b002101fcd7c86so1019341wrb.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aoQ+nsqCtzbS0+oLdSKIRurF/kVBlUkg6b7i2gTEzh0=;
 b=JSnIHj+kDMHN4mAmrLTbBiE0uk34Jg8oI0w7fDIhjSldvbxmkOBe7tXUPSkIFxWjM7
 pJSv4LZ6+bpSVxsOgFxE0mCAcZgGwe1z3w1S9AcmIXpi0+LE4T/5Q6INyB+J5KOSd5kb
 /TGoT0AGpIqz8Y1to1/9ZVW/2H+xnrL8EIcxom/WXb17nZGpaQAAg9l2Nh7tyKZ1RcOz
 3W3nHFkBTMD1OBr5yrfQXn8DipOFRhg1eTIWsc5uXaqUUu4swAy/kRJFqi0aTco84U6e
 BthF80ORrtNJsS/xzwnNTkMV2NGcYeCviMM6JnhHTvucebadXW6MBsXEGf/pvXk0W8Jb
 K9dw==
X-Gm-Message-State: AOAM530U+VpVzM56sNSpzWSsARqv0H6NuKNOZX/vOXReSzds7rCjD80+
 vVo4R0xvrYh9WKI41ovLmL/LEpUSxD2uxOIjEaVaIqejdxwtplTcOLYGk4OEn1YhubMLD8IXLGC
 8wsgk0HJf2mXuOVG3cG6SwUVasdi5ftV+zV0G1HmHDXZDEuv3LH4bvNwqz2AEKkpdriA=
X-Received: by 2002:a1c:f213:0:b0:39b:ad32:5e51 with SMTP id
 s19-20020a1cf213000000b0039bad325e51mr6613180wmc.72.1653923249179; 
 Mon, 30 May 2022 08:07:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzskEMqIrC1DFFUb2Za5+RHiUSPb9c9ryRJ+T3ZQhXZB7iyNdJZt9r2ytK6MdOIF/VoT8/arA==
X-Received: by 2002:a1c:f213:0:b0:39b:ad32:5e51 with SMTP id
 s19-20020a1cf213000000b0039bad325e51mr6613144wmc.72.1653923248679; 
 Mon, 30 May 2022 08:07:28 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adffa43000000b0020d07d90b71sm6701239wrr.66.2022.05.30.08.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v5 05/10] cutils: add functions for IEC and SI prefixes
Date: Mon, 30 May 2022 17:07:09 +0200
Message-Id: <20220530150714.756954-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530150714.756954-1-pbonzini@redhat.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Extract the knowledge of IEC and SI prefixes out of size_to_str and
freq_to_str, so that it can be reused when printing statistics.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/cutils.h    | 18 ++++++++++++++++++
 tests/unit/test-cutils.c | 32 ++++++++++++++++++++++++++++++++
 util/cutils.c            | 34 +++++++++++++++++++++++++---------
 3 files changed, 75 insertions(+), 9 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 40e10e19a7..d3e532b64c 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -1,6 +1,24 @@
 #ifndef QEMU_CUTILS_H
 #define QEMU_CUTILS_H
 
+/*
+ * si_prefix:
+ * @exp10: exponent of 10, a multiple of 3 between -18 and 18 inclusive.
+ *
+ * Return a SI prefix (n, u, m, K, M, etc.) corresponding
+ * to the given exponent of 10.
+ */
+const char *si_prefix(unsigned int exp10);
+
+/*
+ * iec_binary_prefix:
+ * @exp2: exponent of 2, a multiple of 10 between 0 and 60 inclusive.
+ *
+ * Return an IEC binary prefix (Ki, Mi, etc.) corresponding
+ * to the given exponent of 2.
+ */
+const char *iec_binary_prefix(unsigned int exp2);
+
 /**
  * pstrcpy:
  * @buf: buffer to copy string into
diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 783127ff0e..5696ce94de 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2466,6 +2466,34 @@ static void test_size_to_str(void)
     g_assert_cmpstr(size_to_str(512ull << 20), ==, "512 MiB");
 }
 
+static void test_iec_binary_prefix(void)
+{
+    g_assert_cmpstr(iec_binary_prefix(0), ==, "");
+    g_assert_cmpstr(iec_binary_prefix(10), ==, "ki");
+    g_assert_cmpstr(iec_binary_prefix(20), ==, "Mi");
+    g_assert_cmpstr(iec_binary_prefix(30), ==, "Gi");
+    g_assert_cmpstr(iec_binary_prefix(40), ==, "Ti");
+    g_assert_cmpstr(iec_binary_prefix(50), ==, "Pi");
+    g_assert_cmpstr(iec_binary_prefix(60), ==, "Ei");
+}
+
+static void test_si_prefix(void)
+{
+    g_assert_cmpstr(si_prefix(-18), ==, "a");
+    g_assert_cmpstr(si_prefix(-15), ==, "f");
+    g_assert_cmpstr(si_prefix(-12), ==, "p");
+    g_assert_cmpstr(si_prefix(-9), ==, "n");
+    g_assert_cmpstr(si_prefix(-6), ==, "u");
+    g_assert_cmpstr(si_prefix(-3), ==, "m");
+    g_assert_cmpstr(si_prefix(0), ==, "");
+    g_assert_cmpstr(si_prefix(3), ==, "k");
+    g_assert_cmpstr(si_prefix(6), ==, "M");
+    g_assert_cmpstr(si_prefix(9), ==, "G");
+    g_assert_cmpstr(si_prefix(12), ==, "T");
+    g_assert_cmpstr(si_prefix(15), ==, "P");
+    g_assert_cmpstr(si_prefix(18), ==, "E");
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -2749,5 +2777,9 @@ int main(int argc, char **argv)
                     test_size_to_str);
     g_test_add_func("/cutils/freq_to_str",
                     test_freq_to_str);
+    g_test_add_func("/cutils/iec_binary_prefix",
+                    test_iec_binary_prefix);
+    g_test_add_func("/cutils/si_prefix",
+                    test_si_prefix);
     return g_test_run();
 }
diff --git a/util/cutils.c b/util/cutils.c
index 19fb4d04f8..485e9b0cea 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -872,6 +872,25 @@ int parse_debug_env(const char *name, int max, int initial)
     return debug;
 }
 
+const char *si_prefix(unsigned int exp10)
+{
+    static const char *prefixes[] = {
+        "a", "f", "p", "n", "u", "m", "", "k", "M", "G", "T", "P", "E"
+    };
+
+    exp10 += 18;
+    assert(exp10 % 3 == 0 && exp10 / 3 < ARRAY_SIZE(prefixes));
+    return prefixes[exp10 / 3];
+}
+
+const char *iec_binary_prefix(unsigned int exp2)
+{
+    static const char *prefixes[] = { "", "ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
+
+    assert(exp2 % 10 == 0 && exp2 / 10 < ARRAY_SIZE(prefixes));
+    return prefixes[exp2 / 10];
+}
+
 /*
  * Return human readable string for size @val.
  * @val can be anything that uint64_t allows (no more than "16 EiB").
@@ -880,7 +899,6 @@ int parse_debug_env(const char *name, int max, int initial)
  */
 char *size_to_str(uint64_t val)
 {
-    static const char *suffixes[] = { "", "ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
     uint64_t div;
     int i;
 
@@ -891,25 +909,23 @@ char *size_to_str(uint64_t val)
      * (see e41b509d68afb1f for more info)
      */
     frexp(val / (1000.0 / 1024.0), &i);
-    i = (i - 1) / 10;
-    div = 1ULL << (i * 10);
+    i = (i - 1) / 10 * 10;
+    div = 1ULL << i;
 
-    return g_strdup_printf("%0.3g %sB", (double)val / div, suffixes[i]);
+    return g_strdup_printf("%0.3g %sB", (double)val / div, iec_binary_prefix(i));
 }
 
 char *freq_to_str(uint64_t freq_hz)
 {
-    static const char *const suffixes[] = { "", "k", "M", "G", "T", "P", "E" };
     double freq = freq_hz;
-    size_t idx = 0;
+    size_t exp10 = 0;
 
     while (freq >= 1000.0) {
         freq /= 1000.0;
-        idx++;
+        exp10 += 3;
     }
-    assert(idx < ARRAY_SIZE(suffixes));
 
-    return g_strdup_printf("%0.3g %sHz", freq, suffixes[idx]);
+    return g_strdup_printf("%0.3g %sHz", freq, si_prefix(exp10));
 }
 
 int qemu_pstrcmp0(const char **str1, const char **str2)
-- 
2.36.1



