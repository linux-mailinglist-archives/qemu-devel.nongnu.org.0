Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B06535DD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:09:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qk-0001Z2-K0; Wed, 21 Dec 2022 13:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QW-0001Q4-Hf
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QU-0004QQ-Rt
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Jeu6FA/MHieGI8CRyJ/ec1SisMuo8BV2uEAxcGzt/U=;
 b=I79/pXzcysPOGzsoWG7aGPeguRoa35O1SnPClL3tmhaMLqoywGdp19TsvRwxI/iqBzA4gf
 04Aw2YTB3MS2+i8aO0TX3hSdvNxRcueSKkFzA6msgY8mfZpmlZFhQP2FnK0KqS+j/b63mh
 BeB0MBQ/T3OaYaNZPWr4Qp/H+qa06gs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-RlgLHrgKPNy3QxiZjGD_8A-1; Wed, 21 Dec 2022 13:02:41 -0500
X-MC-Unique: RlgLHrgKPNy3QxiZjGD_8A-1
Received: by mail-ej1-f72.google.com with SMTP id
 qb2-20020a1709077e8200b00842b790008fso254196ejc.21
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Jeu6FA/MHieGI8CRyJ/ec1SisMuo8BV2uEAxcGzt/U=;
 b=eD01IqAASDwxFqz8g0iAm3I04zMiCXr6qouWkxBtScnfes7pAjgK+/s17TqqEwKsmL
 GpheUw/mpBlETt1adkfFd5o/LrNFyJK1iAclZABJWzpWKFOT3fA8YKvPtkfTj/Y6AmTB
 ZYZLeHZmKHDfDBSUJDQ51eDGnhNlTtG04CLLYmKXZvi+XmEoPOx9v5gMA6oy06nK0aVH
 jIX+dyNoY79tQ+9GQ1GExFyyg13bB+AaJvSP5ZCHOZ2oI22SOajcpApFg7yjXYT3OUv6
 Cwdc1bLlYJ2sMzLqi8t5p1QTEro4qfXXnCaiwPlfcgNYDjDi2jv3mTmlWJ9AcH3cYcGV
 tVVQ==
X-Gm-Message-State: AFqh2krhIKBgN2d+IFa0DOIOsX2lpdRIW+BjXr2KJ3odGouSYYJ2P/ZS
 1NLZSYT6Qi25LVwR8d74fRqn+4Oo8XOvwcSe5xlADZVYur7xM6E9mcvGfV5TmzZ7xtxg13P94z8
 YwozBVWbN5Aqbf1MzJ7rseyB3oLXHSgN+jlm7fRl7oJZjEoqTN62pIbCyst37/+u0iJE=
X-Received: by 2002:a17:907:a789:b0:7c0:bbab:22e5 with SMTP id
 vx9-20020a170907a78900b007c0bbab22e5mr2018487ejc.16.1671645759965; 
 Wed, 21 Dec 2022 10:02:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt0noU568TzeY9hqVxB2KlbqoDN507hc610RwHymRBhJJt+a2lMYX3Iwpdd/Ckx+yRIpWuHVw==
X-Received: by 2002:a17:907:a789:b0:7c0:bbab:22e5 with SMTP id
 vx9-20020a170907a78900b007c0bbab22e5mr2018467ejc.16.1671645759646; 
 Wed, 21 Dec 2022 10:02:39 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 jx14-20020a170906ca4e00b007b47749838asm7292711ejb.45.2022.12.21.10.02.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/24] util: remove support for hex numbers with a scaling
 suffix
Date: Wed, 21 Dec 2022 19:01:38 +0100
Message-Id: <20221221180141.839616-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This was deprecated in 6.0 and can now be removed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       |  8 --------
 docs/about/removed-features.rst |  8 ++++++++
 tests/unit/test-cutils.c        |  8 ++++++++
 util/cutils.c                   | 14 +++-----------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 5414289ffaf3..e2ca3c8b566d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -58,14 +58,6 @@ and will cause a warning.
 The replacement for the ``nodelay`` short-form boolean option is ``nodelay=on``
 rather than ``delay=off``.
 
-hexadecimal sizes with scaling multipliers (since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Input parameters that take a size value should only use a size suffix
-(such as 'k' or 'M') when the base is written in decimal, and not when
-the value is hexadecimal.  That is, '0x20M' is deprecated, and should
-be written either as '32M' or as '0x2000000'.
-
 ``-spice password=string`` (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 78b332faf50a..724a83142511 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -408,6 +408,14 @@ pcspk-audiodev=<name>``.
 
 Use ``-device`` instead.
 
+Hexadecimal sizes with scaling multipliers (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Input parameters that take a size value should only use a size suffix
+(such as 'k' or 'M') when the base is written in decimal, and not when
+the value is hexadecimal.  That is, '0x20M' should be written either as
+'32M' or as '0x2000000'.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 86caddcf6498..2126b463919b 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2315,6 +2315,14 @@ static void test_qemu_strtosz_invalid(void)
     g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
+    /* No suffixes */
+    str = "0x18M";
+    endptr = NULL;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
+    g_assert(endptr == str);
+
     /* No negative values */
     str = "-0";
     endptr = NULL;
diff --git a/util/cutils.c b/util/cutils.c
index def9c746cede..5887e7441405 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -197,10 +197,8 @@ static int64_t suffix_mul(char suffix, int64_t unit)
  *   fractional portion is truncated to byte
  * - 0x7fEE - hexadecimal, unit determined by @default_suffix
  *
- * The following cause a deprecation warning, and may be removed in the future
- * - 0xabc{kKmMgGtTpP} - hex with scaling suffix
- *
  * The following are intentionally not supported
+ * - hex with scaling suffix, such as 0x20M
  * - octal, such as 08
  * - fractional hex, such as 0x1.8
  * - floating point exponents, such as 1e3
@@ -222,7 +220,6 @@ static int do_strtosz(const char *nptr, const char **end,
     int retval;
     const char *endptr, *f;
     unsigned char c;
-    bool hex = false;
     uint64_t val, valf = 0;
     int64_t mul;
 
@@ -237,17 +234,16 @@ static int do_strtosz(const char *nptr, const char **end,
         goto out;
     }
     if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
-        /* Input looks like hex, reparse, and insist on no fraction. */
+        /* Input looks like hex; reparse, and insist on no fraction or suffix. */
         retval = qemu_strtou64(nptr, &endptr, 16, &val);
         if (retval) {
             goto out;
         }
-        if (*endptr == '.') {
+        if (*endptr == '.' || suffix_mul(*endptr, unit) > 0) {
             endptr = nptr;
             retval = -EINVAL;
             goto out;
         }
-        hex = true;
     } else if (*endptr == '.') {
         /*
          * Input looks like a fraction.  Make sure even 1.k works
@@ -272,10 +268,6 @@ static int do_strtosz(const char *nptr, const char **end,
     c = *endptr;
     mul = suffix_mul(c, unit);
     if (mul > 0) {
-        if (hex) {
-            warn_report("Using a multiplier suffix on hex numbers "
-                        "is deprecated: %s", nptr);
-        }
         endptr++;
     } else {
         mul = suffix_mul(default_suffix, unit);
-- 
2.38.1


