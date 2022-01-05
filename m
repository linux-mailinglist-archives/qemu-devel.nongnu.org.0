Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925A485443
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:22:26 +0100 (CET)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57BJ-0000qn-4G
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:22:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q8-0004dW-EF
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:33 -0500
Received: from [2a00:1450:4864:20::435] (port=34371
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q6-0006T7-6a
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:31 -0500
Received: by mail-wr1-x435.google.com with SMTP id h23so299653wrc.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ii+bvDWS85y0YClHEww7vyHUW9uUGIcI4psZCWKaqA8=;
 b=FyWtna+r5w4a2fvJI1OSujWrXqUHRamWGsIEez/OLbCydY3f7RbsK9qwMDvVsrCm5W
 +RVO21VoRHV4RMjW4+OjgJXdZceZsiz6bDp75lgywaFtuqhVKZ0/seuVUnT/J3LDRU6o
 v2RxjuaHnKP8bd8Go7/QI+iyGz50OL8mQetE/ZqfChtc0ghvQ53aYDtVjHBHZBxEo5vr
 q9yzE3yr+gc+MJna94V94OaRjNyxnqIsLGJqKV7a9avp0QxMOpRM90V0aR3I15Tf48qs
 6+7w1iQeMdiZTz/MmWRwEG+QdadXIP9deCjKcCE4LCpqwfM+Cc/WFBh6mO2XCju3/OkW
 lsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ii+bvDWS85y0YClHEww7vyHUW9uUGIcI4psZCWKaqA8=;
 b=diuJf5ZpJU6SIIXtG9jfiX8isXXAjlffXTIyvNkNTuNqEh7wK4S2bgX+gMSS/8sdI9
 1rX78SxbO3G1Z3UJ+oUGD52q/6IGyGegAfSwyR0VPxojrzC09BP/PiJyddC3v8LqCJ/q
 8sUEikbFB/X1rfqKm63y3GReIcXRruZSzhXIQeQuVdtqGivIXyaWDhJuwqdr5nmkfdGw
 ELJXs6JNerraWEAfODxyeDUIF+UQVJxkcc2Rs3cZWv5u5FgNR6zKfSldCH02SY9httt0
 BXt90P4YMD0l/nfKNzWf2JIeWhQWNGSKvKex9E3hgCt8Sba3+4rkWkGc7229V189HGI2
 pHRg==
X-Gm-Message-State: AOAM531/yBufmPO6Th8Om2v5SDBiCPzinqWa6TFL57oO3gzfyEJsGYRx
 264rAPSJUgdcTZs/0C75qKNApA==
X-Google-Smtp-Source: ABdhPJxkpM/Rd1qxVydwi/MzDhGTD4I/9vuC0qk4zKfToS91Gnic4j1KjfkpdPoTNMLuUsMWbqepQg==
X-Received: by 2002:a05:6000:1886:: with SMTP id
 a6mr27965898wri.703.1641391227480; 
 Wed, 05 Jan 2022 06:00:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 11sm52666446wrz.63.2022.01.05.06.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F07B1FFCF;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 24/34] docs/devel: more documentation on the use of suffixes
Date: Wed,  5 Jan 2022 13:49:59 +0000
Message-Id: <20220105135009.1584676-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using _qemu is a little confusing. Let's use _compat for these sorts
of things. We should also mention _impl which is another common suffix
in the code base.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211217171902.2668674-1-alex.bennee@linaro.org>

---
v2
  - use Paolo's suggested wording for _impl
---
 docs/devel/style.rst  | 6 ++++++
 include/glib-compat.h | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 4f770002a7..793a8d4280 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -151,6 +151,12 @@ If there are two versions of a function to be called with or without a
 lock held, the function that expects the lock to be already held
 usually uses the suffix ``_locked``.
 
+If a function is a shim designed to deal with compatibility
+workarounds we use the suffix ``_compat``. These are generally not
+called directly and aliased to the plain function name via the
+pre-processor. Another common suffix is ``_impl``; it is used for the
+concrete implementation of a function that will not be called
+directly, but rather through a macro or an inline function.
 
 Block structure
 ===============
diff --git a/include/glib-compat.h b/include/glib-compat.h
index 8d01a8c01f..3113a7d2af 100644
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


