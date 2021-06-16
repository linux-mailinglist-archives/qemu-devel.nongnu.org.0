Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CAF3A8E89
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:47:22 +0200 (CEST)
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKeH-0005Y1-IA
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTq-0008NU-FH
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:34 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTo-0005ak-KC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:34 -0400
Received: by mail-pl1-x629.google.com with SMTP id e7so284979plj.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCKAdANmH1Xtpoehzhc4V1D5rmsyIp28yEK3SJRUGT4=;
 b=lIsbNkz/tbwdbAQAoD4l/RtJs/D5/pBwaQWAOHmAp44xMeNyC1MgNRfK+XToB64giW
 gfmWSRdb9HULUZCc/r3WU+6eQdMAvBuxZ6DkMP2I4VmYbLxBkP+c7Mg75UShcju80f3z
 QpZswWTuGH4Rp2qRnQrhz96O673+ZtosQYGFdJ2Ewmv/sNX1Sy6Z391W+PGaimE8zlHq
 Jj6FRtNNhUijG5kEOhYrtjmxyEiayd7BakE/HOmYGti3UUpegE7Ec9C/2ULAKsp3EzJE
 nEqlBQDGIVAi3C8RHuKbZrXY9FDLdFU44afeuKRcYJoCBJdVO9yb7GQIqlrNSbSS6Xo6
 guLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCKAdANmH1Xtpoehzhc4V1D5rmsyIp28yEK3SJRUGT4=;
 b=HgTFpBIR5U2sflXi1nGIXobePNuTR/tkSto6dFBonq00YQcXDlowJEROazfophC/15
 RDM+ECIWWneNKo8a+tA27kucGSMZGqg+N6ekPUf8zuPqq5HD6NEPT12FHXePUMJsopML
 jZLRogiaK7Y84EVKcVnQMFHY19Q8v7B8yv6UsnUtFKPWqVofIf3CEErKe6ocOkJWL7Hs
 23ZyDiUvNU1ev4f13qxHZKHiEz9zEn+65EXeHrPQdr2tVMD94Te+0vm8WfJZ+xNi/ivA
 0uKpjVPYZQVRXlgZNJh9tbYIi5vG6txC94BbVwjuhvMI+/t6cBAritr5L1cNo1Cek78B
 c8Ag==
X-Gm-Message-State: AOAM531JsJV0sUzbUTCgaNpVupcBv49Hpb1DB/bvAB3VeAgQ8wTI6ggN
 m6TCPhEZV6j2xe4z78svW0zpuGnCOgQGVg==
X-Google-Smtp-Source: ABdhPJwqPVlQY6Nz3VOhEo9EMOcBpoF21UmOxe66xtkidfpP2r++dxnZLGziNoqBTbJj4vKCTYGlqQ==
X-Received: by 2002:a17:903:2311:b029:115:29a9:a3ee with SMTP id
 d17-20020a1709032311b029011529a9a3eemr6799238plh.46.1623807391361; 
 Tue, 15 Jun 2021 18:36:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] configure: Use -std=gnu11
Date: Tue, 15 Jun 2021 18:36:22 -0700
Message-Id: <20210616013629.1458790-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the minimum gcc version is 7.5, we can use C11.
This will allow lots of cleanups to the code, currently
hidden behind macros in include/qemu/compiler.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-2-richard.henderson@linaro.org>
---
 configure   | 4 ++--
 meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 8dcb9965b2..0489864667 100755
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
2.25.1


