Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B900254DD02
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:37:14 +0200 (CEST)
Received: from localhost ([::1]:54334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l05-0004OU-Pn
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvS-0001b5-G3
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvP-0002o4-D9
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Glh9d8yFY0poxuW4I6ZKFimyvEHRkSEEwBdX8rUliEg=;
 b=eRICxtbk+EsgE6XwtUyEnD27p4rS8zvRyAPw1flZcco7ts1rDRAu3Xg1UzALX+LlzPZWly
 Pjhd8fZFrQIAFuHIHDk68kH4A8w1vn3Lu6l3jegpaw/QbscNLRUqEUm00Lfp9TthIYbC2g
 +7EQlKsYoompCTs7W93klsUtcdrcNQU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-jFPKM1gUOyqN0w3JD_KOPw-1; Thu, 16 Jun 2022 04:32:21 -0400
X-MC-Unique: jFPKM1gUOyqN0w3JD_KOPw-1
Received: by mail-ed1-f70.google.com with SMTP id
 co13-20020a0564020c0d00b0042dc9ef4f01so751506edb.16
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Glh9d8yFY0poxuW4I6ZKFimyvEHRkSEEwBdX8rUliEg=;
 b=wRXtojfAseo+vCCMsglStXgoZTN9DRc0W8sxz7OUhK4A3gZLs6VdloX//OTSNHXH8S
 WYVSxTRgbjsYZipT1EfYBCuTjFd1DuQSJ2u1Fp/EYonU2CNdGZLnu6L5HJJXutUTw6wZ
 V/XORWV6RV8waaFT3PnyG2ExIMs7lWmaYzmCeGEMzXv6gFheR9YHWRisSV7lPqMm7h2P
 gu4yq8YqIRgVP0OrblcnU7a8TA2KrlDl1gy/p/0y0biAiUEG73A686KVa/zIUNkj4ObK
 kJownLcKs5VIKVLLI7aAt7qP791ME3Uo3NhE3Pbl1ScgW/CXo/hIUvL+A6Sx9dTcBGfy
 5QMA==
X-Gm-Message-State: AJIora9U1o7BeIKyAiT8SoI/3o1ioci26zENzlhhU0QVH+pJnR/95o3O
 fp3tnB1ywSIE/DZsth9/J9r/mJLUsUJfuKGe0TLmYg40MuNeQu72ZFpNA6isgEkh3P23ZPf9ZEg
 QqVdQu+HE2zBebkDkOPX9+8wb1quEaFNE52CJv1DVVlR8iljnoH9NgMZHvTEXo5swSoo=
X-Received: by 2002:a05:6402:378a:b0:431:6d8d:9023 with SMTP id
 et10-20020a056402378a00b004316d8d9023mr4854965edb.98.1655368339882; 
 Thu, 16 Jun 2022 01:32:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uahxKBS/3n2nOO/dFNBEkSOxNWwTY9B8rB0ZATTOJ9v1Df/S1NMarqbSuKG86wqQwNhBQ63w==
X-Received: by 2002:a05:6402:378a:b0:431:6d8d:9023 with SMTP id
 et10-20020a056402378a00b004316d8d9023mr4854934edb.98.1655368339438; 
 Thu, 16 Jun 2022 01:32:19 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05640235c600b0043158c608e4sm1325225edc.27.2022.06.16.01.32.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] cutils: add functions for IEC and SI prefixes
Date: Thu, 16 Jun 2022 10:31:52 +0200
Message-Id: <20220616083209.117397-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Extract the knowledge of IEC and SI prefixes out of size_to_str and
freq_to_str, so that it can be reused when printing statistics.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/cutils.h    | 18 ++++++++++++++
 tests/unit/test-cutils.c | 52 ++++++++++++++++++++++++++++++++++++++++
 util/cutils.c            | 34 +++++++++++++++++++-------
 3 files changed, 95 insertions(+), 9 deletions(-)

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
index 98671f1ac3..f5b780f012 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2450,6 +2450,50 @@ static void test_qemu_strtosz_metric(void)
     g_assert(endptr == str + 7);
 }
 
+static void test_freq_to_str(void)
+{
+    g_assert_cmpstr(freq_to_str(999), ==, "999 Hz");
+    g_assert_cmpstr(freq_to_str(1000), ==, "1 KHz");
+    g_assert_cmpstr(freq_to_str(1010), ==, "1.01 KHz");
+}
+
+static void test_size_to_str(void)
+{
+    g_assert_cmpstr(size_to_str(0), ==, "0 B");
+    g_assert_cmpstr(size_to_str(1), ==, "1 B");
+    g_assert_cmpstr(size_to_str(1016), ==, "0.992 KiB");
+    g_assert_cmpstr(size_to_str(1024), ==, "1 KiB");
+    g_assert_cmpstr(size_to_str(512ull << 20), ==, "512 MiB");
+}
+
+static void test_iec_binary_prefix(void)
+{
+    g_assert_cmpstr(iec_binary_prefix(0), ==, "");
+    g_assert_cmpstr(iec_binary_prefix(10), ==, "Ki");
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
+    g_assert_cmpstr(si_prefix(3), ==, "K");
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
@@ -2729,5 +2773,13 @@ int main(int argc, char **argv)
     g_test_add_func("/cutils/strtosz/metric",
                     test_qemu_strtosz_metric);
 
+    g_test_add_func("/cutils/size_to_str",
+                    test_size_to_str);
+    g_test_add_func("/cutils/freq_to_str",
+                    test_freq_to_str);
+    g_test_add_func("/cutils/iec_binary_prefix",
+                    test_iec_binary_prefix);
+    g_test_add_func("/cutils/si_prefix",
+                    test_si_prefix);
     return g_test_run();
 }
diff --git a/util/cutils.c b/util/cutils.c
index a58bcfd80e..6d04e52907 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -872,6 +872,25 @@ int parse_debug_env(const char *name, int max, int initial)
     return debug;
 }
 
+const char *si_prefix(unsigned int exp10)
+{
+    static const char *prefixes[] = {
+        "a", "f", "p", "n", "u", "m", "", "K", "M", "G", "T", "P", "E"
+    };
+
+    exp10 += 18;
+    assert(exp10 % 3 == 0 && exp10 / 3 < ARRAY_SIZE(prefixes));
+    return prefixes[exp10 / 3];
+}
+
+const char *iec_binary_prefix(unsigned int exp2)
+{
+    static const char *prefixes[] = { "", "Ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
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
-    static const char *suffixes[] = { "", "Ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
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
-    static const char *const suffixes[] = { "", "K", "M", "G", "T", "P", "E" };
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



