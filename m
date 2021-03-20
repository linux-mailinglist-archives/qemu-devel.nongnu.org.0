Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1EB342D29
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:50:58 +0100 (CET)
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNc0H-00007k-Nw
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbuT-000323-Ab
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:44:57 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbuP-0007yg-44
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:44:57 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so14058587ejc.10
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uL96Uis9yF2paA0n5GhgWk7dCyVBjyOpNhr7RDd2Ljw=;
 b=vNgvsdRZRpu65j5WOpju5KTzkw6uCxbQAsUj1/FhmdxO4g61GvNPg5piF4pY3DBwT7
 SA+3RxhHCzSlbBujrC9ShlcRsPPfvfeJeX0vmKbBZlyDtT1GgtwFp8xBQvk+/WkM9r3x
 wpygDw4v56E9JCLWJAJHTfDGzudcIV1+SbJOEqrFc0kSgDy7si/bLCRO+2wNoKmsqaPq
 w88gOJ0ewE9beDLp81BlwjrN+OwwfuVjuN4GcLeghRoyjHoVP0MGwHrhXr4G/STP9GW0
 msM2Y6VroqBsxKkLYZCUBQzBIL+nTCM+4kQCR/vu7EajU1bBEJ//gXPLmfitd6LnK3Sm
 S5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uL96Uis9yF2paA0n5GhgWk7dCyVBjyOpNhr7RDd2Ljw=;
 b=NeL/3wColLIYAzI5Vq63DNatCLGe+jhVG0RI246baf0lLaGW76Kwfeao1tHyiXLb8I
 Du895YgayCT2WemambpjanIYsuEepXz/uNyOCAD2YbWuuRGYebUA/ZFUZKTNu/chLo4n
 yvAnnfzXqcBgIEf6AcQTKighIp5nloneeE6c/DaU0bg7Dl+WcR6xoiOcHDke9BO1aKzK
 jCSPnPQW1FrUaU6IPKL4TWTt/hRO6+6Z1s6V5rCqoa5gBhTJg1Xypix33u/wNUhhm0YZ
 kZtodlbapwGTaA0HbSxve1OArCTcicDi2/3trLq+Ha40YarRES/pa8HcQdYEfil7MAKI
 3r1A==
X-Gm-Message-State: AOAM531RNBce9WqhZy3T7VJMKJKHeQKNoZXw2981itSe4PZ37o7DmrRJ
 uWoauZdhGM9Hh2iapX5g0d5jAw==
X-Google-Smtp-Source: ABdhPJxxqEA3br//HlkRQN/BAf5xSuVH8oQsxzOHyvbxs6+7PISOJQsJT7Uhj93DUHZKheke8fIgkA==
X-Received: by 2002:a17:906:9152:: with SMTP id
 y18mr9872282ejw.19.1616247891424; 
 Sat, 20 Mar 2021 06:44:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g21sm5335707ejd.6.2021.03.20.06.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:44:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1168B1FF9D;
 Sat, 20 Mar 2021 13:37:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/14] utils: Work around mingw strto*l bug with 0x
Date: Sat, 20 Mar 2021 13:37:06 +0000
Message-Id: <20210320133706.21475-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Mingw recognizes that "0x" has value 0 without setting errno, but
fails to advance endptr to the trailing garbage 'x'.  This in turn
showed up in our recent testsuite additions for qemu_strtosz (commit
1657ba44b4 utils: Enhance testsuite for do_strtosz()); adjust our
remaining tests to show that we now work around this windows bug.

This patch intentionally fails check-syntax for use of strtol.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210317143325.2165821-3-eblake@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/unit/test-cutils.c | 54 ++++++++++++++++++++++++++++++++++++++++
 util/cutils.c            | 29 +++++++++++++++------
 2 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 5908de4fd0..98671f1ac3 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -378,6 +378,15 @@ static void test_qemu_strtoi_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtoi(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
 }
 
 static void test_qemu_strtoi_max(void)
@@ -669,6 +678,15 @@ static void test_qemu_strtoui_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmphex(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtoui(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmphex(res, ==, 0);
+    g_assert(endptr == str + 1);
 }
 
 static void test_qemu_strtoui_max(void)
@@ -955,6 +973,15 @@ static void test_qemu_strtol_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtol(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
 }
 
 static void test_qemu_strtol_max(void)
@@ -1244,6 +1271,15 @@ static void test_qemu_strtoul_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmphex(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtoul(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmphex(res, ==, 0);
+    g_assert(endptr == str + 1);
 }
 
 static void test_qemu_strtoul_max(void)
@@ -1528,6 +1564,15 @@ static void test_qemu_strtoi64_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    endptr = &f;
+    res = 999;
+    err = qemu_strtoi64(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
 }
 
 static void test_qemu_strtoi64_max(void)
@@ -1815,6 +1860,15 @@ static void test_qemu_strtou64_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmphex(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    endptr = &f;
+    res = 999;
+    err = qemu_strtou64(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmphex(res, ==, 0);
+    g_assert(endptr == str + 1);
 }
 
 static void test_qemu_strtou64_max(void)
diff --git a/util/cutils.c b/util/cutils.c
index b425ed6570..ee908486da 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -396,9 +396,22 @@ int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result)
  * Helper function for error checking after strtol() and the like
  */
 static int check_strtox_error(const char *nptr, char *ep,
-                              const char **endptr, int libc_errno)
+                              const char **endptr, bool check_zero,
+                              int libc_errno)
 {
     assert(ep >= nptr);
+
+    /* Windows has a bug in that it fails to parse 0 from "0x" in base 16 */
+    if (check_zero && ep == nptr && libc_errno == 0) {
+        char *tmp;
+
+        errno = 0;
+        if (strtol(nptr, &tmp, 10) == 0 && errno == 0 &&
+            (*tmp == 'x' || *tmp == 'X')) {
+            ep = tmp;
+        }
+    }
+
     if (endptr) {
         *endptr = ep;
     }
@@ -465,7 +478,7 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
     } else {
         *result = lresult;
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, lresult == 0, errno);
 }
 
 /**
@@ -524,7 +537,7 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
             *result = lresult;
         }
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, lresult == 0, errno);
 }
 
 /**
@@ -566,7 +579,7 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,
 
     errno = 0;
     *result = strtol(nptr, &ep, base);
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }
 
 /**
@@ -613,7 +626,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,
     if (errno == ERANGE) {
         *result = -1;
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }
 
 /**
@@ -639,7 +652,7 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,
     QEMU_BUILD_BUG_ON(sizeof(int64_t) != sizeof(long long));
     errno = 0;
     *result = strtoll(nptr, &ep, base);
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }
 
 /**
@@ -668,7 +681,7 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
     if (errno == ERANGE) {
         *result = -1;
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }
 
 /**
@@ -708,7 +721,7 @@ int qemu_strtod(const char *nptr, const char **endptr, double *result)
 
     errno = 0;
     *result = strtod(nptr, &ep);
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, false, errno);
 }
 
 /**
-- 
2.20.1


