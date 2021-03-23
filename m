Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D134670A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:58:34 +0100 (CET)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlIX-0001DA-UB
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMq-0006xr-F7
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:58:56 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMn-0005va-2p
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:58:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id dm8so24301953edb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLf1HKC40KrDyqu/nCAq35T+MmnrzCN581j6+laXy18=;
 b=BGhP+DutCaD0278iYZmykIlLI07f0mSFplNlupUn2IFMB6mOV1UO02tvMYzxono3Ck
 gDaLKYJmvdJBOuGBrNyLZia5XFezf8Oe9fFrnjkNTfinLR2v70pfrXDuLC14PYFT7Xp9
 XNMkwrPqRnGogmhr5T3scohBjBuwbtDaZlfZEtOZ5REOmASztC896lEL4zHQs8Arjndy
 ZfkjNpyPba4V8pHW14kNYWOhwkyG7I2SB3IQyHsktywcpv5cziY+0iPBlry4fclV3y9/
 OWIoOOgP9kd3ScwDdScINxsaubSNF+43BpXQjysFCGin4tKuQaHS1uxOdaIWRGjk6ACt
 slQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLf1HKC40KrDyqu/nCAq35T+MmnrzCN581j6+laXy18=;
 b=XLjvFAXUaziPj147050N8yNkTHEtoSUWWXSoXL1RTEcHbvcfVNpn/5DZ6DQGrdRuH5
 pLK4YpKOUe/vhJQA6nqtN2cCyFq9KyoEy3jvF0uhqPsEddZiVjBvCFQYYeD4iMd9A/Ws
 qwO+vhvzcHHj0BlejCqeli9EAiu4/CjM8+N0SEl2Xapc7q3SfWWpvtGBPLe4SHCWb/RZ
 F3wbg2mJCwxerIkzEtDMR2LrZp6tip09jBJD/PISm6+2FsvTNMelByiIm8rcO+umG2Gn
 gw6JQrgUA2ClZJdoX3doHpr14RTkIQV1L6Vq8m5/gfKLUHdyu74wiNmtTnjhoKvJtMNo
 Olqw==
X-Gm-Message-State: AOAM530RAYWTRmqxQ9aVMqG2co8r6N7q7sq5weSVfwhiypPEAEr/APOf
 OdYTOrFjT25fcc1LPggXjA9LIA==
X-Google-Smtp-Source: ABdhPJx5oeJ4+zhRMra4H/4SnXyuGWylQg5pDK+GhyQyE6jUDQEdgMkueTPb8MqcXViPsQxwmS6Bbg==
X-Received: by 2002:aa7:da97:: with SMTP id q23mr5460234eds.180.1616518730952; 
 Tue, 23 Mar 2021 09:58:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h22sm11385550eji.80.2021.03.23.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5006D1FF9B;
 Tue, 23 Mar 2021 16:53:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 14/22] utils: Work around mingw strto*l bug with 0x
Date: Tue, 23 Mar 2021 16:53:00 +0000
Message-Id: <20210323165308.15244-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210317143325.2165821-3-eblake@redhat.com>
Message-Id: <20210320133706.21475-15-alex.bennee@linaro.org>
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


