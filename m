Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6353A4B47
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:36:56 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqhr-00079M-Af
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqey-0004L9-V0
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:34:01 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqes-0006Nd-2h
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:56 -0400
Received: by mail-pg1-x52e.google.com with SMTP id n12so3629104pgs.13
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FOVCmFTpg9+OxYQSRGceFtA/G8JdvxW5xy5Q+eU+6WU=;
 b=izMulYGgp1oNyqXpXWmdusyZdTFKTVWHVjAXUUwRiNAQ2ryU28UC0tiRlh+qeSZdyb
 6OC703/SXmSPbFe3UOTkA7VcSfeAAgHxqwXMd1rxV9H4YxUAwUsg2sjH1WZ2V3Ri6YUW
 WXPyzNY3IGxHgKN/nmffk+max3BKgbtcwoCy4xnfJnkbyFS6EEO04UdYG5Bl4DyM0MNb
 UUvYUHIgv7DgJO6hGuod4MfrmTEuIAwSXTE0orhsL3woJM3Mty+xP8qnrOQYNxQYZwlg
 xoDH2vurJ5hIHoAlyn9sSpvX6/W3PSElt2qAVdU5wQwUiydIFAyOjFi8WOrYhyl10hL2
 WCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FOVCmFTpg9+OxYQSRGceFtA/G8JdvxW5xy5Q+eU+6WU=;
 b=uW461fLFrtjoSAIxrQA3Nv2nV1lHWGqGtHE4AWhctr3SHKAhyZrWUsKsjPsdmzX3nb
 IpakePidps+ejpNKOQ6t5x27Gmo+/2Yx2CI1Y9CrvFHCM29hWaUILh/AMbpqwyLfvas0
 SksAM4uhzi47QSshbNn2oCyB3BViNDjBk5ICkGPWc2VVBSkEJs8hL66m9Mvkfs4U8qYe
 VfM2zLkem/fFsjJorSPtv1HBSFB+CCJYoLC6us4gCw2l4kLrPoflwSyoDTlsvGA7KsHS
 acCZxI07wVwGBPJu0yF1V324oE+2EWXSveesFOKq00VZtoP6rOKg3mJK9ZV6w2IY8JfB
 ik3Q==
X-Gm-Message-State: AOAM533Fbe3L1f2/bMdscS3MgGb4xk+IdNu3PRCnrnb7I+w9LepOGH4U
 /GYSVJ0tymdUH2YMxiM4E/tLWR/LEunahw==
X-Google-Smtp-Source: ABdhPJw02MMMRVV7oNDyJZ08pcfItxUIl9WTLf87FoIr8ny6mEgVmPRnCvzUl13QFE2OOc3GWiHsow==
X-Received: by 2002:a62:a217:0:b029:2ee:48e1:fd92 with SMTP id
 m23-20020a62a2170000b02902ee48e1fd92mr10452191pff.55.1623454428724; 
 Fri, 11 Jun 2021 16:33:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] configure: Use -std=gnu11
Date: Fri, 11 Jun 2021 16:33:40 -0700
Message-Id: <20210611233347.653129-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@liaro.org>

Now that the minimum gcc version is 7.5, we can use C11.
This will allow lots of cleanups to the code, currently
hidden behind macros in include/qemu/compiler.h.

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
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
index d2a9ce91f5..c070cb6aa7 100644
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


