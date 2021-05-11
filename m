Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283837A0F1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:37:46 +0200 (CEST)
Received: from localhost ([::1]:56880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMxd-0006eU-5G
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqV-00047Z-76
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqR-0008FK-W7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so651521wmh.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPW/vWw/DYoYJxDKWIvJOoYPABx6estNS+RutNHnWXY=;
 b=o8VG16ZICoeldN9dqd2unuDJYF+4zflcS1lo45WRRCkBpoH75y2D9AmEzgAkckxWak
 yNOYhN5gbEtC1TH7MV7XZyWrfdxh1A/NATw/GUOx7Toizai8CcGV8dT7hjci2bdQk5mW
 F5mx9BwO+rWDszGyDCEYWGVHrPGEXNULdAGZyXrheipPDP/G7tdVLdDHPzMmW5fumtWh
 g0wRtI4GL73fLyia8v/uY19yb5SZVvZdGQfh5PLGEGM5J/I+xVeKfYp8oDq2dFsaVO34
 Mz68Vu0vVUHyLIqSr5WM9ZQYPwIWvHYe4ID5BfAV6H2R9sQJTwsET5FrkSlLirTNSjDq
 p9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yPW/vWw/DYoYJxDKWIvJOoYPABx6estNS+RutNHnWXY=;
 b=RBP4CVc5S8DtWfAY+ag0N49WL9fDeo7LROrax+i8MNqNbRxlcwjygqbvF4S+wuJ9GG
 2mCL33SR8HhaZB09Yek1GiICuOoPfhL5cB2Kaoy6eQiNvywydpQwwsTjiKQeu9G9f3Me
 e4U+YGGIBjeptA3DpEClyeDfbSvUKAJwcOfEl7efl+iNScSR/9BX0D/ng4WdJgBRkU9U
 VVeQcOnTo8zZb1jY8M0wINFFd8bCv+tiYEsH2o9kwA+LP1fBHp8Z+zz+Snl0SSC2GJmg
 bxo9PgYVn4ehLvXl9I4NvpE8pr0ty4lz/Yd7y4GeA6loW4FhrQI+9UkeHFEhR+kk2Sts
 d7pw==
X-Gm-Message-State: AOAM533VGOKsqRjZocAROOukJDdME0DjhKtMxP6k9PudvLL7QMi8Tm/D
 aq1YWSEy42yZ3udR5QnFcIqVXcmSxwUEWg==
X-Google-Smtp-Source: ABdhPJzlmUsX+Yjo6KEmz/is/GZSeJyFUo8crOgHVDxq7oFA4+M2Si4SqQVnxjXD9gWKY7uqXR69Sw==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr30164855wmb.141.1620718213896; 
 Tue, 11 May 2021 00:30:13 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 3sm22880446wms.30.2021.05.11.00.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/10] gitlab-ci: Extract crossbuild job templates to
 crossbuild-template.yml
Date: Tue, 11 May 2021 09:29:46 +0200
Message-Id: <20210511072952.2813358-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
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
index e44e4b49a25..bf626bed1cc 100644
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


