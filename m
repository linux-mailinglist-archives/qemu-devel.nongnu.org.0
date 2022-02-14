Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A14B5A56
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:03:46 +0100 (CET)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgdU-0002oV-03
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:03:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWd-00089Z-Df; Mon, 14 Feb 2022 13:56:39 -0500
Received: from [2607:f8b0:4864:20::42d] (port=39509
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWX-0006Lx-Vn; Mon, 14 Feb 2022 13:56:39 -0500
Received: by mail-pf1-x42d.google.com with SMTP id m22so11605628pfk.6;
 Mon, 14 Feb 2022 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9AHl4PWSxPKlzGOmJiwTT/tCSVVYvFbKDzeLrCswrLU=;
 b=pamL5TQhCSvb6oJCPYiiHrQ6GzYDBtdk/V4moOBNbzQY+ts+GSBxAM/k8fiIjuuHzI
 g9pCldHn/4TZrVUD7uo1o8iJEK8OzbH+YeW01X/yIBmkt23dINJMl0VKMxEmFI/6LNXn
 JdOYiHAhO+cQo3m3RwAuvQLyZJj5K7jBpmP0bpWEa0q2SH5MPUFcTEB7LEeN/4XGBJIL
 pioCawcS+9DsjbGrWisNvF9v2TAXZqCrDyTL+IDohSM9aHxtyJPAhmjuRwacBhKlYG7L
 uRcZV7KrF4d0CGySWJCQNoK5qj2UsFm/volQCHdS0fA0nUk9D8HtFB3x5rVi54rbpi9A
 naRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9AHl4PWSxPKlzGOmJiwTT/tCSVVYvFbKDzeLrCswrLU=;
 b=BCZZnwQIZXcWJA1V3GC+EOG8ANXPcjt4tfVV9zF7uiW3xjTl/Ys1RAe+5olUJMT8JU
 Ybsgvn7wWVyPENbiNY1JU1nepnqty3N2XsCCnPa60hBtEcAhIvtEWkkYDPbIjolaSV6W
 LEyFXqpyjRTlna9PmkqGFH0Ssnawn1gEIHD5CW9zrmtSrwuOJgdZaTAf7nZFPa4ppOvE
 Tljw6o6uSUWBQl+fDUqPkjwXdvZoeXvJG08Hm9AD5KWC6de4hm/zRSjbpiETx/5sWNlG
 qBvwqc2SZ093E8/VZrOwtqzGFxcy9b3B3ESuwZBqZYOi1oryf6fEgvNwLuToo9B7iMlv
 s0BA==
X-Gm-Message-State: AOAM531rsbdDANt8oDsmdK+tdWcg2mYYv8zjEqBKj1+H04photwfZmSk
 x/HO/OVM2LCMcOwGxkvTokjCj3oj0ZQ=
X-Google-Smtp-Source: ABdhPJwLdRmwiyy7f/ETexecTBAt5wEWPUECT1Uv+V8USLoVswKvP5aSVJ3Da0Zh3gD5OXhBNYJdPQ==
X-Received: by 2002:a65:6b90:: with SMTP id d16mr345987pgw.49.1644864992176;
 Mon, 14 Feb 2022 10:56:32 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id g126sm295953pgc.31.2022.02.14.10.56.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:56:31 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 02/16] configure: Allow passing extra Objective C compiler
 flags
Date: Mon, 14 Feb 2022 19:55:51 +0100
Message-Id: <20220214185605.28087-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.635,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
variables, or via configure --extra-cflags / --extra-cxxflags /
--extra-ldflags options. Provide similar behavior for Objective C:
use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure   | 8 ++++++++
 meson.build | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/configure b/configure
index 3a29eff5cc..06c03cebd3 100755
--- a/configure
+++ b/configure
@@ -287,6 +287,7 @@ done
 
 EXTRA_CFLAGS=""
 EXTRA_CXXFLAGS=""
+EXTRA_OBJCFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
@@ -391,9 +392,12 @@ for opt do
   --extra-cflags=*)
     EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
     EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
+    EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
     ;;
   --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
   ;;
+  --extra-objcflags=*) EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
+  ;;
   --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
   ;;
   --enable-debug-info) debug_info="yes"
@@ -774,6 +778,8 @@ for opt do
   ;;
   --extra-cxxflags=*)
   ;;
+  --extra-objcflags=*)
+  ;;
   --extra-ldflags=*)
   ;;
   --enable-debug-info)
@@ -1312,6 +1318,7 @@ Advanced options (experts only):
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
+  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
@@ -3724,6 +3731,7 @@ if test "$skip_meson" = no; then
   echo "[built-in options]" >> $cross
   echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
+  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
diff --git a/meson.build b/meson.build
index ae5f7eec6e..df25e7a5e7 100644
--- a/meson.build
+++ b/meson.build
@@ -3292,6 +3292,11 @@ if link_language == 'cpp'
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
 endif
+if targetos == 'darwin'
+  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
+                                               + ['-O' + get_option('optimization')]
+                                               + (get_option('debug') ? ['-g'] : []))}
+endif
 link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
-- 
2.34.1


