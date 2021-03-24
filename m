Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D673347AE6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:38:49 +0100 (CET)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4em-0006fQ-Ez
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wz-0006fN-1u
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wv-0007RG-NV
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id v11so24654904wro.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+eNxdVqj9XwdqB3itCU8v+02JuB6rI1ammJaGntp3g=;
 b=b/VF5N3sZPhu1u9I+Vd8cQ0+hbmk4kfe8a8DivCRf4/C3YE0oTJrv07HmasidQZG4I
 fglb5BUPnppyN6IiVxp/ocYQGS1tc+yXZ0SoF3i5URJJz3SZcyM65veiqL3PmJgM9Uaj
 INm0FDI7wdhFlnhsUWWLbosdlCQCIig3HkCjQbDiN3hLdgwyTJklX6LB5UflG8CS1SA0
 6dS4jUcvk2WdktivCccreHRU5G3wBEa1ESngSB557x5eC/mGPFdnjEddeAGs6jqeTi8u
 KANyhUwmqxqOzudgaTPO9eTQIbNkkMi7sT8f0+sg34j8ubtZYu8GmDr1u4qBjbb4j7wT
 75aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+eNxdVqj9XwdqB3itCU8v+02JuB6rI1ammJaGntp3g=;
 b=XhKbCrHuXJfINUL6OjG1qXEBWS63TaXGIP3RcutjnMlecIfe1UQZgIE1niRcXQxa+j
 infKqoVSxHsRnW8QggVqvOhIn+P3HN2Xj6RajWSq/EY58kslctMhLdQRHhPOsfxwkYOC
 vzIxeLta65fDy+tw13uI07R4NE5/I2ai99qfLyCw3nh1Hyt8uzaq1pSWmsbV9UKRqIQq
 4eXvVrdSVKPVaW4CiRp2N4P36QgLSaLkUyGzHEvl/BSwsXWY5DkIsXCb5Q2fNGE2Ykz6
 lobEEa7gQWd1PBqN4R0mZM98GBoyDsM4BJHyzKXw3zrlsr4LcweIRGLWMgmkmQxbg9H9
 GunA==
X-Gm-Message-State: AOAM533Nm+a6jpRdfF3Xn7ZkfOUGx8iaif2TjjKKGZjbcn24pNhkn7sg
 ER9qYHs0Tn7Ua0Va5VydL1ZhcQ==
X-Google-Smtp-Source: ABdhPJwq3TDPCodTS2VEJUBv2vX1md74OiWDdAtU8jSgsnXzDMQRT8DTO8Wo2d4wXPQlYYBC6OBWXg==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr3784686wrg.167.1616596240293; 
 Wed, 24 Mar 2021 07:30:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm2898987wmd.41.2021.03.24.07.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC5B51FF9C;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/22] utils: Tighter tests for qemu_strtosz
Date: Wed, 24 Mar 2021 14:30:12 +0000
Message-Id: <20210324143021.8560-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Our tests were not validating the return value in all cases, nor was
it guaranteeing our documented claim that 'res' is unchanged on error.
For that matter, it wasn't as thorough as the existing tests for
qemu_strtoi() and friends for proving that endptr and res are sanely
set.  Enhancing the test found one case where we violated our
documentation: namely, when failing with EINVAL when endptr is NULL,
we shouldn't modify res.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210317143325.2165821-2-eblake@redhat.com>
Message-Id: <20210323165308.15244-14-alex.bennee@linaro.org>

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index e025b54c05..5908de4fd0 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -1952,9 +1952,11 @@ static void test_qemu_strtosz_simple(void)
     const char *str;
     const char *endptr;
     int err;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;
 
     str = "0";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0);
@@ -1962,6 +1964,8 @@ static void test_qemu_strtosz_simple(void)
 
     /* Leading 0 gives decimal results, not octal */
     str = "08";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 8);
@@ -1969,46 +1973,61 @@ static void test_qemu_strtosz_simple(void)
 
     /* Leading space is ignored */
     str = " 12345";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345);
     g_assert(endptr == str + 6);
 
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345);
 
     str = "9007199254740991"; /* 2^53-1 */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x1fffffffffffff);
     g_assert(endptr == str + 16);
 
     str = "9007199254740992"; /* 2^53 */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x20000000000000);
     g_assert(endptr == str + 16);
 
     str = "9007199254740993"; /* 2^53+1 */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x20000000000001);
     g_assert(endptr == str + 16);
 
     str = "18446744073709549568"; /* 0xfffffffffffff800 (53 msbs set) */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0xfffffffffffff800);
     g_assert(endptr == str + 20);
 
     str = "18446744073709550591"; /* 0xfffffffffffffbff */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0xfffffffffffffbff);
     g_assert(endptr == str + 20);
 
     str = "18446744073709551615"; /* 0xffffffffffffffff */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0xffffffffffffffff);
@@ -2020,21 +2039,27 @@ static void test_qemu_strtosz_hex(void)
     const char *str;
     const char *endptr;
     int err;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;
 
     str = "0x0";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0);
     g_assert(endptr == str + 3);
 
     str = "0xab";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 171);
     g_assert(endptr == str + 4);
 
     str = "0xae";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 174);
@@ -2053,44 +2078,60 @@ static void test_qemu_strtosz_units(void)
     const char *e = "1E";
     int err;
     const char *endptr;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;
 
     /* default is M */
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz_MiB(none, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, MiB);
     g_assert(endptr == none + 1);
 
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(b, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1);
     g_assert(endptr == b + 2);
 
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(k, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, KiB);
     g_assert(endptr == k + 2);
 
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(m, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, MiB);
     g_assert(endptr == m + 2);
 
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(g, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, GiB);
     g_assert(endptr == g + 2);
 
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(t, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, TiB);
     g_assert(endptr == t + 2);
 
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(p, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, PiB);
     g_assert(endptr == p + 2);
 
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(e, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, EiB);
@@ -2102,9 +2143,11 @@ static void test_qemu_strtosz_float(void)
     const char *str;
     int err;
     const char *endptr;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;
 
     str = "0.5E";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, EiB / 2);
@@ -2112,6 +2155,8 @@ static void test_qemu_strtosz_float(void)
 
     /* For convenience, a fraction of 0 is tolerated even on bytes */
     str = "1.0B";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1);
@@ -2119,6 +2164,8 @@ static void test_qemu_strtosz_float(void)
 
     /* An empty fraction is tolerated */
     str = "1.k";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1024);
@@ -2126,6 +2173,8 @@ static void test_qemu_strtosz_float(void)
 
     /* For convenience, we permit values that are not byte-exact */
     str = "12.345M";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
@@ -2140,67 +2189,91 @@ static void test_qemu_strtosz_invalid(void)
     uint64_t res = 0xbaadf00d;
 
     str = "";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     str = " \t ";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     str = "crap";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     str = "inf";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     str = "NaN";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     /* Fractional values require scale larger than bytes */
     str = "1.1B";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     str = "1.1";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     /* No floating point exponents */
     str = "1.5e1k";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     str = "1.5E+0k";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     /* No hex fractions */
     str = "0x1.8k";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     /* No negative values */
     str = "-0";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
     str = "-1";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 }
 
@@ -2209,48 +2282,72 @@ static void test_qemu_strtosz_trailing(void)
     const char *str;
     const char *endptr;
     int err;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;
 
     str = "123xxx";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz_MiB(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 123 * MiB);
     g_assert(endptr == str + 3);
 
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
 
     str = "1kiB";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1024);
     g_assert(endptr == str + 2);
 
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
 
     str = "0x";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0);
     g_assert(endptr == str + 1);
 
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
 
     str = "0.NaN";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
     g_assert(endptr == str + 2);
 
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
 
     str = "123-45";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 123);
     g_assert(endptr == str + 3);
 
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
 }
 
 static void test_qemu_strtosz_erange(void)
@@ -2261,13 +2358,17 @@ static void test_qemu_strtosz_erange(void)
     uint64_t res = 0xbaadf00d;
 
     str = "18446744073709551616"; /* 2^64; see strtosz_simple for 2^64-1 */
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str + 20);
 
     str = "20E";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str + 3);
 }
 
@@ -2276,15 +2377,19 @@ static void test_qemu_strtosz_metric(void)
     const char *str;
     int err;
     const char *endptr;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;
 
     str = "12345k";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz_metric(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345000);
     g_assert(endptr == str + 6);
 
     str = "12.345M";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz_metric(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345000);
diff --git a/util/cutils.c b/util/cutils.c
index c442882b88..b425ed6570 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -362,7 +362,6 @@ static int do_strtosz(const char *nptr, const char **end,
         }
     }
 
-    *result = val;
     retval = 0;
 
 out:
@@ -371,6 +370,9 @@ out:
     } else if (*endptr) {
         retval = -EINVAL;
     }
+    if (retval == 0) {
+        *result = val;
+    }
 
     return retval;
 }
-- 
2.20.1


