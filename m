Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B853376E7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:22:35 +0100 (CET)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN90-0004Nm-DQ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVb-0004RZ-4K
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:52 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:46722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVV-00071q-FZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:50 -0500
Received: by mail-qv1-xf34.google.com with SMTP id j17so2639311qvo.13
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LH70RiyHzxdek5Q28EGrMxuIKiWy1oDfjvApqs9uX0o=;
 b=xEBWWNapVaqd1o/zyqW0r+61BPvt8LidmifM2j+6j+ysMZ/WPPHEOM5Ln3X8YG+rFl
 TiedAt/dOC+FczHPAseudQv0TT521EuazRTnwmTAXFKKaA6Z3wlF1B3C3GKqr4AyWa+5
 1O5LCZNeVZTjcAi0oSmzYM9C/nxr81BRdGnMTSYR/REeoY7AFLL1RN7Vtc45QQ1y8eRS
 ibyBThvIDYJWwpVuPT5dt+P47/z+4osHLNNI2RwoTvQpHXPY3rlVSgkdZUznG0i3Qm6R
 ewf6xmwidv1OYAXceF0NXdUaK4GBq4ZQ2bOvVwZNHqj1hDvsRIohxjzSatuxGRYze1IG
 45+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LH70RiyHzxdek5Q28EGrMxuIKiWy1oDfjvApqs9uX0o=;
 b=uVZ11wKj3T2iz+nsjB2HNOH3ecVOw82jBYSTgzzG5XYfI6PJHXUpv4EOweTFPfqNKu
 WrS9pFmmbJ+gl7rkXO1AMPMABfIi8XZciykxSd07KWiv8bzCBLkthtIPt6churUaTj+c
 8mftXhBMaA35MNXs5KrYnigyxWUqPVjVL56+wTjfIo6Ft9K/y0XMtoRhL7WASa9cH/fB
 kcMvDtH/8B/9LHRHH2leIxUyYyTL4ZRMR3IuMYiNrijib741dx0KWTJp3Cg/wxyXGvsi
 QygouXa4T4pU6vg5ZrpMgYcRcU5ytHP6tc+dQ7PpSWX+hDlBfZlIGfIDMjHYVYGGkd1n
 E9Mw==
X-Gm-Message-State: AOAM532F/VT5ZoMslBxhy77+/sJ3jpUc4sUPvLd7QtkeOIjfCigF9wLd
 IswSVoKlw/Q6zwebxrCXe08k69NOpdkM4YT9
X-Google-Smtp-Source: ABdhPJzO4zlpxjwdbfGiutO/tAsWSq41uccp/Ju72G28l/4wsGnmgBm1+DauTnonRy21KarDkN7m9Q==
X-Received: by 2002:ad4:4745:: with SMTP id c5mr8090071qvx.39.1615473704360;
 Thu, 11 Mar 2021 06:41:44 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 56/57] gitlab: Rename ACCEL_CONFIGURE_OPTS to
 EXTRA_CONFIGURE_OPTS
Date: Thu, 11 Mar 2021 08:39:57 -0600
Message-Id: <20210311143958.562625-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
Cc: sw@weilnetz.de, Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d5098c986b..d573e431e5 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -16,7 +16,7 @@
 #
 # Set the $ACCEL variable to select the specific accelerator (default to
 # KVM), and set extra options (such disabling other accelerators) via the
-# $ACCEL_CONFIGURE_OPTS variable.
+# $EXTRA_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -26,7 +26,7 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
-        --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+        --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_user_build_job:
@@ -173,7 +173,7 @@ cross-s390x-kvm-only:
     job: s390x-debian-cross-container
   variables:
     IMAGE: debian-s390x-cross
-    ACCEL_CONFIGURE_OPTS: --disable-tcg
+    EXTRA_CONFIGURE_OPTS: --disable-tcg
 
 cross-win32-system:
   extends: .cross_system_build_job
@@ -196,7 +196,7 @@ cross-amd64-xen-only:
   variables:
     IMAGE: debian-amd64-cross
     ACCEL: xen
-    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
 
 cross-arm64-xen-only:
   extends: .cross_accel_build_job
@@ -205,4 +205,4 @@ cross-arm64-xen-only:
   variables:
     IMAGE: debian-arm64-cross
     ACCEL: xen
-    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
-- 
2.25.1


