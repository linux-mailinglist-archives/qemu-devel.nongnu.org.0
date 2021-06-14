Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512953A7281
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:33:15 +0200 (CEST)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw4w-0000U8-Bq
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3Y-0006DF-UN
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:48 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3W-0007hK-R0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:48 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i34so9923166pgl.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N/h1KI91Si6p/Xt+2fYqhyWh23pJ4Rr+Ts/OyuJu290=;
 b=uUKpY0J2n17ELErljaSGoi+5BvQi9yVZyAgmacNBoV8UqEUunpab1mZYIV3J+/hPUf
 sx3wWa63irQsFl8kVxkEwuZX178HKGPEXLv/8StKfCnHjOcVrC1VbfPnu5lgfHU50bA6
 2DwrlUidDoG+Aqj+L/V3RgXNezxUIlS4VDjNMptDW4P0KGkAlLpThAQcmSVaDeIOGqZW
 meLZxlNyqzGIkYTtQ698UE1dMcG/oaJcAwkdSEouEYy1iu8DNAH+U6uEDJ2a3goPSzaf
 xqyXvZKICWoAHg5p7mNBpPV/UppbvL9dWKjRW5BbFIp6EM4vsI1QZUdtmXseZJNes8Gt
 XVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/h1KI91Si6p/Xt+2fYqhyWh23pJ4Rr+Ts/OyuJu290=;
 b=VcsjIFNvXfYGsdbexQv71kFm3bQuCyDhLZ1k3fpT1uBaifpL75pOnbSyl1LtkRV6dQ
 ogKfT4vWDH2UfKr4tf6UuYv5erfqs876yjqm9jpIheWblOl8Q6L4R2Z4l8OZyseGGAFF
 cnCwH9eEGqTDk9Ulnesog2fmY+45SELbDUpYrOmvVLFiYvcDYoXMkBKQvXhwA2P6LfA1
 fLuNHAMhIguO7AEdAO42hZA4C05+7Y9mn7g6UGntJVwZAzrg+as+WxMNy/YkD4albTYU
 CiJ3P5kWzcwoLVMkMvfnrfGcg/0+DDUwOAgGRt8eTWl2cRtmK1SmwT6hg6mTzbzUm1xH
 RM5Q==
X-Gm-Message-State: AOAM533W1oJ8QJV0M1nQRvx/2d+L/TOT5ACu4LxwpULFdSFcOMxbU40T
 Susse6rsHQS3kJuBHkHSpAMuz/am19CyKg==
X-Google-Smtp-Source: ABdhPJz7KfkRj8As5GzkhXfEuoVNNBVUH0VcqblY6ZARfLnWVGHd91QSBL7H7G7kMSU248Jg1TqGrg==
X-Received: by 2002:aa7:96d0:0:b029:2e9:fea1:c9c1 with SMTP id
 h16-20020aa796d00000b02902e9fea1c9c1mr1456896pfq.67.1623713505513; 
 Mon, 14 Jun 2021 16:31:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] configure: Use -std=gnu11
Date: Mon, 14 Jun 2021 16:31:36 -0700
Message-Id: <20210614233143.1221879-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the minimum gcc version is 7.5, we can use C11.
This will allow lots of cleanups to the code, currently
hidden behind macros in include/qemu/compiler.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


