Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B228233EA6F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:23:39 +0100 (CET)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQWo-0004xI-Fi
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVa-0003T8-If
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:22 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVY-0007pg-OL
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:22 -0400
Received: by mail-ej1-x630.google.com with SMTP id mm21so887551ejb.12
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+prPljAtmIqrEMFGTEBz16szSwQnlu6kpSMTs/hIZA0=;
 b=UORXKIcUG5n4UzvWb8EbzTjc9BfNYWGsdjOje07zeq1wGm5j5tHyGE493oYtYkotE8
 o7hNwnmKK1mowD7FDPeLhIF+o8lol9Q4yzUwPBTecOx1Ibj1HL5ywzL0qXypWeqeHBZ/
 ECZybV76jFkLDy4KYDPW4fTsueA/tM9fD+EQX9zXq9piQ6ClUeVvKr3uLRgYR35P83uB
 /74jgV0t3l61wjMF6I3PFqRmUmI76p2yWfAeuRWo28MdACj/kdz7eD+iDDPvz53EptNQ
 6iMr21E54CKYGBH/khRrYda3ZsS9n3swdvAST5Isu+6UR6Nj21vIWZ/P6cpxpCOmEUeb
 PWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+prPljAtmIqrEMFGTEBz16szSwQnlu6kpSMTs/hIZA0=;
 b=KAoQWTby7HcWW45b2RJCIF+n9LnubZL9alVoEWUkCcPJUUr3zkgvHUW1LSIWrTtirD
 EF3Y9HZtSpcIUbkLEta9y8YrEh9o0Ii2sKvsKeYrng8MULTenDGmc0twQmg9Ve3pKOks
 vOYJh+FwZNTXukrit/hoYA1k42b0cj2bNFRYAvOziQdEMntT7TmpbVpBp6jDUJWtRFUR
 83GeQVkSifbFE/gG6Jq5bQvK+6SyRTY0rqlTgE/v8LVyJHpV1/iz0boUq0zr8RU5OINw
 GG96f7rocVBjZI1LSmnaBVrYCexmXBERM5zSea6NS2o1Le/PfeTZDuW7i05tNyjcfG/m
 627g==
X-Gm-Message-State: AOAM533/lrY9wmNJl0FeLHaU1U9vlL84P4nZbfc4OUKheXEPuKw3H1mf
 FZY7hpHx5+v0uqupwU9m3OIhBw==
X-Google-Smtp-Source: ABdhPJx+ImiZo3DGVvBXb4Cx2FYIC4611xdZDUQeUj9F7Yio8xoF+fzObHajglpBUMRZd5CUZprvzw==
X-Received: by 2002:a17:907:2672:: with SMTP id
 ci18mr21594533ejc.384.1615965738432; 
 Wed, 17 Mar 2021 00:22:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id be27sm11790335edb.47.2021.03.17.00.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDC111FF87;
 Wed, 17 Mar 2021 07:22:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 01/15] utils: Use fixed-point arithmetic in qemu_strtosz
Date: Wed, 17 Mar 2021 07:22:02 +0000
Message-Id: <20210317072216.16316-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Once we've parsed the fractional value, extract it into an integral
64-bit fraction.  Perform the scaling with integer arithmetic, and
simplify the overflow detection.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210315185117.1986240-2-richard.henderson@linaro.org>

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index bad3a60993..e025b54c05 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2128,7 +2128,7 @@ static void test_qemu_strtosz_float(void)
     str = "12.345M";
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB));
+    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
     g_assert(endptr == str + 7);
 }
 
diff --git a/util/cutils.c b/util/cutils.c
index d89a40a8c3..c442882b88 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -275,10 +275,9 @@ static int do_strtosz(const char *nptr, const char **end,
     int retval;
     const char *endptr, *f;
     unsigned char c;
-    bool mul_required = false, hex = false;
-    uint64_t val;
+    bool hex = false;
+    uint64_t val, valf = 0;
     int64_t mul;
-    double fraction = 0.0;
 
     /* Parse integral portion as decimal. */
     retval = qemu_strtou64(nptr, &endptr, 10, &val);
@@ -308,17 +307,19 @@ static int do_strtosz(const char *nptr, const char **end,
          * without fractional digits.  If we see an exponent, treat
          * the entire input as invalid instead.
          */
+        double fraction;
+
         f = endptr;
         retval = qemu_strtod_finite(f, &endptr, &fraction);
         if (retval) {
-            fraction = 0.0;
             endptr++;
         } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
             endptr = nptr;
             retval = -EINVAL;
             goto out;
-        } else if (fraction != 0) {
-            mul_required = true;
+        } else {
+            /* Extract into a 64-bit fixed-point fraction. */
+            valf = (uint64_t)(fraction * 0x1p64);
         }
     }
     c = *endptr;
@@ -333,16 +334,35 @@ static int do_strtosz(const char *nptr, const char **end,
         mul = suffix_mul(default_suffix, unit);
         assert(mul > 0);
     }
-    if (mul == 1 && mul_required) {
-        endptr = nptr;
-        retval = -EINVAL;
-        goto out;
-    }
-    if (val > (UINT64_MAX - ((uint64_t) (fraction * mul))) / mul) {
-        retval = -ERANGE;
-        goto out;
+    if (mul == 1) {
+        /* When a fraction is present, a scale is required. */
+        if (valf != 0) {
+            endptr = nptr;
+            retval = -EINVAL;
+            goto out;
+        }
+    } else {
+        uint64_t valh, tmp;
+
+        /* Compute exact result: 64.64 x 64.0 -> 128.64 fixed point */
+        mulu64(&val, &valh, val, mul);
+        mulu64(&valf, &tmp, valf, mul);
+        val += tmp;
+        valh += val < tmp;
+
+        /* Round 0.5 upward. */
+        tmp = valf >> 63;
+        val += tmp;
+        valh += val < tmp;
+
+        /* Report overflow. */
+        if (valh != 0) {
+            retval = -ERANGE;
+            goto out;
+        }
     }
-    *result = val * mul + (uint64_t) (fraction * mul);
+
+    *result = val;
     retval = 0;
 
 out:
-- 
2.20.1


