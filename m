Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A33AB09F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:58:33 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltonA-0000ps-Mh
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNa-0003AL-Qf
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNY-0006Nr-S7
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:06 -0400
Received: by mail-ed1-x530.google.com with SMTP id b11so3068346edy.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjriBpMgI0q1a3xgarAd+lYGNkwH88TJaY1pIobYkWM=;
 b=p+ZYzkJ8hnrgYk5Zx6Ki+jpROUbXdkEnteGU23Y3QTyjOc51nXwmKQFmUbqc5sSli6
 c9kdJx6vsF6BQRe4JxJIGS0RP3uNjTH8KXMJYjYKib2jySgrjf8FEzzR9R9UuD2LYsxF
 x1HXvrZb7TymzGDnbqkBbYils5R/nfSJ4W/zEa8lUXGydHdMIXFTjFpxdfxbW8IMnk1i
 4ufhS9zPGmaz5fCfOeh1BvJINV3Erxp9J2JMV/VbfoLwKNTx+eB4vMR32mDIkby9zKTc
 HJRDLJYNskSImrRbMEu+JcQXf71dSIZqDJLIurKe6c11LqyvzuzHBE6t3Ls4g9lgGIaw
 bMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gjriBpMgI0q1a3xgarAd+lYGNkwH88TJaY1pIobYkWM=;
 b=F11EjkezlUjnqPWZUvazz5CyQIqDRyI61pScwiB6AGSAfAxq65S0+EQQYXLYNYTqlm
 CNMTFbeAXkYZ4WLU2vdneeIqZa2rjr+BeZOsy950sddETybHbLWQLazJdu42fzF93bg6
 62M8tIvnL06U0ykhesMcbpYawhFjgtGEpqYsygVt15D+UzsSiHoiKqUE3+6ZoXdKs+mf
 iML5SJ27OKtNZUJlU7vI2qHtR+jANx0DqJXJmzSjpi1m5TdSMgIWWJkLRzPrHLQBZFm9
 U15zu3cvpMvAPHMH36dW9E5JWT3MZyo6Bq0mU5C/E6uNouQV+LIIBTX/21Tu2TOMIM4J
 5MlA==
X-Gm-Message-State: AOAM532Wme00Xft8U3SubE082MY7zfY4Jo1eMUZ6kb78hrMaWQIUiWok
 HbNTCDTD+BTOOrqsKOtNkgMlgNG7p/U=
X-Google-Smtp-Source: ABdhPJzlDGzFadndfMQRN0GwYJrn3ZoGDbK0HLhLI8fqjSYRhFG1L0Kj8HKTYZdJ6bUpN+Qs7vP5iw==
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr5235184edt.56.1623922323547; 
 Thu, 17 Jun 2021 02:32:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/45] configure: Use -std=gnu11
Date: Thu, 17 Jun 2021 11:31:27 +0200
Message-Id: <20210617093134.900014-39-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Now that the minimum gcc version is 7.5, we can use C11.
This will allow lots of cleanups to the code, currently
hidden behind macros in include/qemu/compiler.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210614233143.1221879-2-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 4 ++--
 meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 4478f3889a..ebc016111a 100755
--- a/configure
+++ b/configure
@@ -159,7 +159,7 @@ update_cxxflags() {
     # options which some versions of GCC's C++ compiler complain about
     # because they only make sense for C programs.
     QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
-    CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu99/-std=gnu++11/)
+    CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
     for arg in $QEMU_CFLAGS; do
         case $arg in
             -Wstrict-prototypes|-Wmissing-prototypes|-Wnested-externs|\
@@ -538,7 +538,7 @@ QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 # Flags that are needed during configure but later taken care of by Meson
-CONFIGURE_CFLAGS="-std=gnu99 -Wall"
+CONFIGURE_CFLAGS="-std=gnu11 -Wall"
 CONFIGURE_LDFLAGS=
 
 
diff --git a/meson.build b/meson.build
index a2311eda6e..d8a92666fb 100644
--- a/meson.build
+++ b/meson.build
@@ -1,5 +1,5 @@
 project('qemu', ['c'], meson_version: '>=0.55.0',
-        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto'] +
+        default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto'] +
                          (meson.version().version_compare('>=0.56.0') ? [ 'b_staticpic=false' ] : []),
         version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())
 
-- 
2.31.1



