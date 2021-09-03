Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC113FFCB6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:07:22 +0200 (CEST)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5AP-0000i0-LJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM570-000633-Ui
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56x-0005WW-EO
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n5so7154867wro.12
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPJMbPb/00tFTVR36+R0IPNgIkKT7YfEwaVVfGYX3DQ=;
 b=T/l5pdG85Xf30+CSIQbxDgQg8GO1ItpCkKx6PyZ2A0DkTOCWPKws70Rs7ACEJ6/4l3
 moqd2V0pa5u2/xhG+KQ2Ud6LStPcc0WbpGrk63B/ESTaePUl/iDsZ++JUSdvbTiZSD7Y
 hSX0WW7prwp06xHjs6YRsb3+k8eSx1aBhfYsVxSo1T1dUG3fb7mcf85tVRmBLku4AEW6
 HcE6ENGqBikn+QSNadpA8V47T4tBqR3bO5aQ4ylBbi9V851pGBK09bNElOOqe254ogZ8
 as09rAHVvgnykP4T3L0CVMDo1eY/CLXoBwiEY8PboPeYBy6+raNPlExNcuwZTWeTn2lH
 YCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPJMbPb/00tFTVR36+R0IPNgIkKT7YfEwaVVfGYX3DQ=;
 b=A05nXAmkJlmBIaugNubC0IOv+ESjCULfDVUI6vL64TAKLOBbjVKKc/pI61Qkg8Mlxl
 oDigCeEe4Cmy9N6UDMpO3TVCnNG6kG/1SOJkxnaA4REyrs7d8FTojKZykmriKsym/i5Z
 uWGQHAq/AkYMqNa0NgCteosZmrcjxNpPw4JIPyoZmMjp3hW0wJqCNO4MXWxqeSuCIk/k
 YpSffZTGkjbHkQVWxH8Ut7DTIk0WGwwWctLI39Rbsi6licGv1R8nsWF2A/Y+dXzZUHGb
 GZO4zMW+LyST/WIHVYWWkcQ5Rjr83f4/uijsI5oTpgNGcINJG9HONeb+T+N9fBXFnB4k
 Qw+w==
X-Gm-Message-State: AOAM532hcOVnFjVq6Om3IGRIvhcHaevNHVyqRmw4DsKYWHuXbrfa18xn
 rsPhGzG7DcYqzwBJKwEGKyeaHQ==
X-Google-Smtp-Source: ABdhPJy8eWAqJVEbZC2XCTsgdQLLCwPlUQAXxJQP/H5epTveMhRFBeNuIthII/n+V15dG/1X0ktf2g==
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr2861866wrb.54.1630659825962; 
 Fri, 03 Sep 2021 02:03:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm4518062wrc.16.2021.09.03.02.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 10E631FF99;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/22] gitlab-ci: Merge "build-disabled" with
 "build-without-default-features"
Date: Fri,  3 Sep 2021 10:03:19 +0100
Message-Id: <20210903090339.1074887-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Both jobs are testing more or less the same thing (building QEMU with
features disabled), so we are wasting precious CI cycles here by doing
this twice. Merge the jobs by using --without-default-features by default
and just adding some additional --disable-... switches which are not
covered by the generic switch (yet). And while we're at it, also test
compilation with "--disable-fdt" (which forces us to change the list
of targets in this job, though, since some targets do not work without
fdt).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210730143809.717079-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210806141015.2487502-3-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..f390f98044 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -202,85 +202,6 @@ acceptance-system-opensuse:
     MAKE_CHECK_ARGS: check-acceptance
 
 
-build-disabled:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
-    CONFIGURE_ARGS:
-      --disable-attr
-      --disable-auth-pam
-      --disable-avx2
-      --disable-bochs
-      --disable-brlapi
-      --disable-bzip2
-      --disable-cap-ng
-      --disable-capstone
-      --disable-cloop
-      --disable-coroutine-pool
-      --disable-curl
-      --disable-curses
-      --disable-dmg
-      --disable-docs
-      --disable-gcrypt
-      --disable-glusterfs
-      --disable-gnutls
-      --disable-gtk
-      --disable-guest-agent
-      --disable-iconv
-      --disable-keyring
-      --disable-kvm
-      --disable-libiscsi
-      --disable-libpmem
-      --disable-libssh
-      --disable-libudev
-      --disable-libusb
-      --disable-libxml2
-      --disable-linux-aio
-      --disable-live-block-migration
-      --disable-lzo
-      --disable-malloc-trim
-      --disable-mpath
-      --disable-nettle
-      --disable-numa
-      --disable-opengl
-      --disable-parallels
-      --disable-pie
-      --disable-qcow1
-      --disable-qed
-      --disable-qom-cast-debug
-      --disable-rbd
-      --disable-rdma
-      --disable-replication
-      --disable-sdl
-      --disable-seccomp
-      --disable-slirp
-      --disable-smartcard
-      --disable-snappy
-      --disable-sparse
-      --disable-spice
-      --disable-strip
-      --disable-tpm
-      --disable-usb-redir
-      --disable-vdi
-      --disable-vhost-crypto
-      --disable-vhost-net
-      --disable-vhost-scsi
-      --disable-vhost-kernel
-      --disable-vhost-user
-      --disable-vhost-vdpa
-      --disable-vhost-vsock
-      --disable-virglrenderer
-      --disable-vnc
-      --disable-vte
-      --disable-vvfat
-      --disable-xen
-      --disable-zstd
-    TARGETS: arm-softmmu i386-softmmu ppc64-softmmu mips64-softmmu
-      s390x-softmmu i386-linux-user
-    MAKE_CHECK_ARGS: check-qtest SPEED=slow
-
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
 # the configure script. The container doesn't contain Xen headers so
 # Xen accelerator is not detected / selected. As result it build the
@@ -649,12 +570,20 @@ build-without-default-devices:
 build-without-default-features:
   extends: .native_build_job_template
   needs:
-    job: amd64-debian-container
+    job: amd64-fedora-container
   variables:
-    IMAGE: debian-amd64
-    CONFIGURE_ARGS: --without-default-features --disable-user
-        --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
-    MAKE_CHECK_ARGS: check-unit
+    IMAGE: fedora
+    CONFIGURE_ARGS:
+      --without-default-features
+      --disable-capstone
+      --disable-fdt
+      --disable-pie
+      --disable-qom-cast-debug
+      --disable-slirp
+      --disable-strip
+    TARGETS: avr-softmmu i386-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
+      sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
+    MAKE_CHECK_ARGS: check-unit check-qtest SPEED=slow
 
 build-libvhost-user:
   stage: build
-- 
2.30.2


