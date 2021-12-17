Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B044792CD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 18:26:59 +0100 (CET)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myH0T-0003KR-Vt
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 12:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myGt6-0007sG-CN
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:19:20 -0500
Received: from [2a00:1450:4864:20::42d] (port=39822
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myGt3-0007Fy-G7
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:19:19 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a18so5358459wrn.6
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWiwbMtGuOs2ePyaKXb44RTU1/jTo9WyKyh46pOkXgQ=;
 b=ZPVkn3/MMuQjb314y4S3nQ8ZWNl2bynXi/+4BJVfmgsuD0C4m7tWKiV1VXd3zjD15h
 y/c5IdF3Taa6UnCTFpjRMDnLVsfRBnbQENIZT0vyxv13dWnjBmQb7qfPcvZsgiY2pw+W
 2nHyff6B6GJRbWdkUHEeqy4V1T6eHh/AzNv2AFdqmaKVtcx7XY3rMt4Rhao9nlKd5IAx
 sw+bGDKWWWryJ1hyPP3OtVNITwEG+nSs99QkCdx3lvO8hCPh4UgZQUMaEvx7whowbv8x
 +zYWSKnAHRZfPwVQLwpWScANQcp7Z3j+6/J7wx5YvjLKJpRing0bvQsbXzFl5hl+rK7K
 E2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWiwbMtGuOs2ePyaKXb44RTU1/jTo9WyKyh46pOkXgQ=;
 b=OoenOVM5h1M1JgJQusBX6UdC8Flp2TaHmCUcuQqBeU9q8fVlSy/W1lbTeeSJ2/eugU
 VYALKkf7fiuuhb0kaVAOzlmthm9MMDu9RTepe1h+M0JERZ+PB8L4CZNT2XQQW8ZoDgea
 PgGsiWoIrJ/Ypns6fw+DGMOXgLl7zcYGHQ49BOe+Xa+Za3bngdTebcjXuhWPDAbEIEE3
 t7YSanft4MeLXQfo9O3v6Ri3fMgT4bInmUYtDf65KP3nr/+k48H0BTk1PL/Z76RnKp2h
 5NtUX2tcOJ5Utdscj6DGPJB0O+BS0a6ZjWZPgNcQ2neuRqTkEKTsknxHb3le1U/eWtIx
 NtVg==
X-Gm-Message-State: AOAM533B9Swimy3SnNA6QPk8gqxZrpTchGB0OM24KRM8QokzhAh94JEX
 y5YwX7OuIbYhet5tNxKYm5ZE6Q==
X-Google-Smtp-Source: ABdhPJyrXRLVssAmGE/SbK+8o026MMC446JWAPdqkXWPSLbR+CgIBNJZjduJzfmEwkRFR6zJdlfrJA==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr2626052wrw.84.1639761555564;
 Fri, 17 Dec 2021 09:19:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r8sm9908635wrz.43.2021.12.17.09.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:19:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BCCC31FF96;
 Fri, 17 Dec 2021 17:19:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/devel: more documentation on the use of suffixes
Date: Fri, 17 Dec 2021 17:19:02 +0000
Message-Id: <20211217171902.2668674-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using _qemu is a little confusing. Let's use _compat for these sorts
of things. We should also mention _impl which is another common suffix
in the code base.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/style.rst  | 7 +++++++
 include/glib-compat.h | 6 +++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 9c5c0fffd9..60dfdf9b7f 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -151,6 +151,13 @@ If there are two versions of a function to be called with or without a
 lock held, the function that expects the lock to be already held
 usually uses the suffix ``_locked``.
 
+If a function is a shim designed to deal with compatibility
+workarounds we use the suffix ``_compat``. These are generally not
+called directly and aliased to the plain function name via the
+pre-processor. Another common suffix that is used is ``__impl`` which
+is often used for the concrete implementation of something that has
+multiple potential approaches hidden behind a common function name or
+one that needs expansion via the pre-processor.
 
 Block structure
 ===============
diff --git a/include/glib-compat.h b/include/glib-compat.h
index 9e95c888f5..9d3eb1b7a0 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -46,9 +46,9 @@
  *    int g_foo(const char *wibble)
  *
  * We must define a static inline function with the same signature that does
- * what we need, but with a "_qemu" suffix e.g.
+ * what we need, but with a "_compat" suffix e.g.
  *
- * static inline void g_foo_qemu(const char *wibble)
+ * static inline void g_foo_compat(const char *wibble)
  * {
  *     #if GLIB_CHECK_VERSION(X, Y, 0)
  *        g_foo(wibble)
@@ -61,7 +61,7 @@
  * ensuring this wrapper function impl doesn't trigger the compiler warning
  * about using too new glib APIs. Finally we can do
  *
- *   #define g_foo(a) g_foo_qemu(a)
+ *   #define g_foo(a) g_foo_compat(a)
  *
  * So now the code elsewhere in QEMU, which *does* have the
  * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
-- 
2.30.2


