Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1C3921F1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:23:57 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm10O-00070U-EV
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vk-0002lc-Tl
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vj-0008N9-7h
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id t206so1535081wmf.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cBfMctSwzMD1BVBFymvsetW6bsopBRXF+wcu6ORjgWo=;
 b=l94Yda6s+AfIgpyEW33agTmjV30LcQ7AM8NNR59J1KSxkFs7nLCfVvDK3yE1fmJZy+
 8loXXkolm3l8o6UFZefVXzYVeNPSD0OUFVoxohf2AMG+Q8/Nvpd1o1JCawvJMGnsQPur
 9Nne0LkfEV7GnAcooRM2PIXwKMJJUFkMt1LiQz9497kJtOJBr2OKRs10dPSaZwHnu1sp
 3sOkX0aZ98QlbEPISI5hh1e/D4TTnX/f7+rMnfM10wGAUQ0j5f08hi113YFzz0mp5zd3
 m9LJYcAG0yFxY38QBFDJIXsz79cWuOcYkvtOaqPGwyzjXGKgAHAKKKl0AGFjPoR+6pJu
 rYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cBfMctSwzMD1BVBFymvsetW6bsopBRXF+wcu6ORjgWo=;
 b=CuUkeUQEowC/FA83KNI+Mfhq8I/oPwTIB4syP9LWssoZgA+0ppSyLcg6Pa8CgQ7iK9
 sRQe0yD5JZwcCTh20VsN+aKpr07lOx8YjIodnZ/r4sRwwTNWMPaNCiD5bKJekC+V+GUq
 /HCQWucvJogOjuhl4T8hSDRvAL69IXaxkmC0X01vkOQQs6YPffpDftevnoSNOMb9c2Vq
 CHCjVJQgIni9lFOBeDpfDAtldsMUPcFlJ+Km+JOj2/Wo0XyhLyf1poP7SgjV91Za2Kbn
 ct+x7XTA3Cg1oD0zXJJrHDToq0aDN1DbQwPYiveX8vD6QnWQMu7Kp2Iagk383QD5/e4S
 TNMQ==
X-Gm-Message-State: AOAM532NwibIqyqDvS02cmUyI9LKugLOD5MU4X8IeNMrcxwiArcRincH
 Q9JZu2DDlqMAGzHiIJq/wv8ZPqZz1UvN2Q==
X-Google-Smtp-Source: ABdhPJwe2z/Nbc3GX6FM0RwZeW6RoKYp0PbCIXrEHijIZtVls0j8Sz3qKkfza7I/ERyZkUL50i8kwg==
X-Received: by 2002:a1c:a58c:: with SMTP id o134mr354854wme.2.1622063945633;
 Wed, 26 May 2021 14:19:05 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id y3sm183878wrh.28.2021.05.26.14.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] gitlab: Extract crossbuild job templates to
 crossbuild-template.yml
Date: Wed, 26 May 2021 23:18:24 +0200
Message-Id: <20210526211838.421716-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the crossbuild job templates to a new file
(crossbuild-template.yml) to be able to reuse them
without having to run all the jobs included, which
are mainly useful for mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-5-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 41 ++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml         | 43 ++--------------------------
 2 files changed, 43 insertions(+), 41 deletions(-)
 create mode 100644 .gitlab-ci.d/crossbuild-template.yml

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
new file mode 100644
index 00000000000..1be541174c9
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
+# $EXTRA_CONFIGURE_OPTS variable.
+.cross_accel_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 30m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
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
index edf3a625633..6b3865c9e83 100644
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
-# $EXTRA_CONFIGURE_OPTS variable.
-.cross_accel_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  timeout: 30m
-  script:
-    - mkdir build
-    - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
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


