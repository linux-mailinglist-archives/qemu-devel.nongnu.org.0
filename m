Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310BD3466CB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:52:27 +0100 (CET)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlCb-0004jt-SO
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHc-0007D0-IO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:32 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHW-0002vD-Dp
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:31 -0400
Received: by mail-ed1-x52f.google.com with SMTP id j3so24212713edp.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W0p5nkACG61LTtPlyGUhH4WotUQTXCAEeyFEH/xrxQ4=;
 b=ChsdA/96J88NZ4gmpUIHMMDFkjp1FDfrLEuIyvJXUu28euLsUq19P83jLLSFHBDj/4
 9l5hLb5FbPN5A/5KtBAvU1xIrKgVlYc38UPPjwDySX9oF2iP+7lad9rqXkHoV9wlIiCN
 2x0wJLRhZ0N94kr82Hpq6zD+82n+JB5XvyI1mhOaIC3XFAolBQpmCOJWWTlNlxpb9s4p
 vJkVD6+4UOJy3sFyhiDmRNiyasvmrgdfmrrXy5FklsqKvne6NQdPk2eImEyrA+qCpk0c
 bAzXTQmY5ZZfLGLNHPmUdiG7c0iJ1F/3m5yIkYaYr8kmeWoMhUByXPegq301AoTS6V+A
 U3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W0p5nkACG61LTtPlyGUhH4WotUQTXCAEeyFEH/xrxQ4=;
 b=dzxEaTs6eL51J/W2jQ7amH8qE1jpyNRoSjq+DuGq2ApmlqW2CVg3BBXX/KXkF4aTo1
 IHJjfawU4Ri9LxbTYjevyxJHXYDWsQW8Qka2xcfMVT9SuxUVwdBwlef6SFvsmfDuHx/6
 gxKs32vP2gQ4nSWPKuKszlomXjETAmiQgWM2XpBU4ln/k75b9DpoAJaAYsN4Nq6SKQYy
 wYmIuDFPJYOA06Y3GPlnsTpAehaAIqaaO+j73tFvwW9s6mrTMYlgxGcqIvmVjgQIYGVa
 ZI6lRYumPcvDqmdy14FQxbjLUJA0KcySPcB3kD6niVebaLRliDSMN7qlAAyI0niAm/Kd
 RFUw==
X-Gm-Message-State: AOAM530L8OPxc77fkvRt9J1fCuHB1zODGwc/jU97bYi+3ng9c7OkLs4B
 G6nhqu+dxO6KUBISuxr7VE8A2Q==
X-Google-Smtp-Source: ABdhPJzUixR4cXprtcL0kdU8V48DMPXH5yB++Z9bKLAA7gtqyZJj1cJ93Jyt655mZ/m+hL374ligjA==
X-Received: by 2002:aa7:d287:: with SMTP id w7mr5456796edq.23.1616518404285;
 Tue, 23 Mar 2021 09:53:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q10sm13089163eds.67.2021.03.23.09.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BD611FF87;
 Tue, 23 Mar 2021 16:53:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 13/22] utils: Tighter tests for qemu_strtosz
Date: Tue, 23 Mar 2021 16:52:59 +0000
Message-Id: <20210323165308.15244-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
Message-Id: <20210320133706.21475-14-alex.bennee@linaro.org>
---
 tests/unit/test-cutils.c | 117 +++++++++++++++++++++++++++++++++++++--
 util/cutils.c            |   4 +-
 2 files changed, 114 insertions(+), 7 deletions(-)

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


