Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90F363896
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:47:40 +0200 (CEST)
Received: from localhost ([::1]:41174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH8d-0003Rj-A0
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwr-0000na-7p
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwp-0003C2-Gi
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so7432587wmh.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GiGPjIPUchqYBK2KNH58Rypm9hg2GtmV2AFVIAdCZkA=;
 b=AFvudnFRtRLINKpFrciZxdXQOQOkjdy3yEP4JZZAtlAL4N+0CIcRy58ISKrW5YTibn
 xcFTKbh+xdvLzwfKwlkjG2R1zd1zFVnsNJAidFbM0AQmZ/PJd99An7q1Sx26jP3ue9Dm
 W9beiBPSKVh5LBZkAeQtbEAiVNpYmjsIGSmHfbfvH6lRc5NtIk4Fp7e12cYV8a1mMqU0
 mjbewNzfjBlxxTEMgIqA7cwyWraXGWl7yzqjC5RpK3eJy6iXDzd5elL6+XZv6tnDRqWb
 /QyUEg9tkDAJ6NxiD28WQXBLODHlndpNugpHD+CNVVSdhIOtxhHFfZNHqGxVmCxPkfSB
 vwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GiGPjIPUchqYBK2KNH58Rypm9hg2GtmV2AFVIAdCZkA=;
 b=RsaTFiOn0XU0nD51CuIv7AvfcyEC7z6Ho/YQN76A0k25RK8o5WcMZC9eaNF/OqUOxq
 HD0zDmI0DvwXj14oOfjzv/nSnM8gxhaNVatVhvqJd38qUODCt1dN5GARY4Z9EoFPBoD2
 Nqg+q7cO9xOyncmNfuG9xHLrNm9loeVFPNd/T1CXxAdv2KjWdQ5nu3t0qLo/Lk493+Py
 RqPAXjx8RrzVC1d6p+2rVxTUG3pv5CpogckXefRY1o+vX+0z1lZIkgDWdgg/ympxfc2K
 I2FY7zg/0/XCYb2kC5ce+lt7pxzafvaFJ3Yu4YBKcNABBrQRkdUc+xfBWTDxUBq4nM4J
 eLLw==
X-Gm-Message-State: AOAM533X83h6xkpPyraewWA4bEhrz1w0OEvnZQinrWNQrjN3R5efOjNC
 I5ZRfofuifBlRudTGN1Y7PIRE4h1o7XdVw==
X-Google-Smtp-Source: ABdhPJyVSwxXALi3+UZDcTYHXHwJdqvDPn5iOm+ngO1Jc+Ipws4FnNglgW0NrtXa45M06t1VGP9xoA==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr13767522wmq.140.1618788925976; 
 Sun, 18 Apr 2021 16:35:25 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 3sm20534240wma.45.2021.04.18.16.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/15] gitlab-ci: Extract crossbuild job templates to
 crossbuild-template.yml
Date: Mon, 19 Apr 2021 01:34:40 +0200
Message-Id: <20210418233448.1267991-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the crossbuild job templates to a new file
(crossbuild-template.yml) to be able to reuse them
without having to run all the jobs included, which
are mainly useful for mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/crossbuild-template.yml | 41 ++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml         | 43 ++--------------------------
 2 files changed, 43 insertions(+), 41 deletions(-)
 create mode 100644 .gitlab-ci.d/crossbuild-template.yml

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
new file mode 100644
index 00000000000..bc790a43486
--- /dev/null
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -0,0 +1,41 @@
+.cross_system_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 80m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-user --target-list-exclude="arm-softmmu cris-softmmu
+          i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
+          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+
+# Job to cross-build specific accelerators.
+#
+# Set the $ACCEL variable to select the specific accelerator (default to
+# KVM), and set extra options (such disabling other accelerators) via the
+# $ACCEL_CONFIGURE_OPTS variable.
+.cross_accel_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 30m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
+.cross_user_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-system
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 2d95784ed51..7a0d2069c14 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,44 +1,5 @@
-.cross_system_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  timeout: 80m
-  script:
-    - mkdir build
-    - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-user --target-list-exclude="arm-softmmu cris-softmmu
-          i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
-          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
-
-# Job to cross-build specific accelerators.
-#
-# Set the $ACCEL variable to select the specific accelerator (default to
-# KVM), and set extra options (such disabling other accelerators) via the
-# $ACCEL_CONFIGURE_OPTS variable.
-.cross_accel_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  timeout: 30m
-  script:
-    - mkdir build
-    - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build
-
-.cross_user_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  script:
-    - mkdir build
-    - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-system
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+include:
+  - local: '/.gitlab-ci.d/crossbuild-template.yml'
 
 cross-armel-system:
   extends: .cross_system_build_job
-- 
2.26.3


