Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22539BD6F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:42:52 +0200 (CEST)
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCuJ-0001au-BV
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRa-0003U7-5R
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRP-0003t0-1v
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id u7so4415019wrs.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oBDOyQH7E7gFoIfvmNRWV3L6dZVZeclFGF8pX/YLgLo=;
 b=VJPJiOBLcu5S27efU17cDZylFxY1kO5tqe1r4Uf8ak294k8DwnHJTNLOpktsYVTbHm
 VCypjXUwxAK6cl5SpUNtKab9Xigh5XP39gXP5l6dIQekKBmaOVe0GnluaqsKc7OsfK+9
 Rp3ausL/J4WK3CsME5d7us7GZylLYVDVH7dWk9REhLRkmEZknUTWcfe84Q2FnEaQdfXL
 AHNW5eTV/3uwWsyxECVRMu+Rr6w5n00kV9b473SbJCBiX6O+SgmBegsvDNdZh7m/4etX
 GBOSj2dEAwNZbq1VwkR2bP+8y7lDwJAJkOiS+pdjL0rYM1q8+zB6aCwinUvuFy5ePyWq
 w+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oBDOyQH7E7gFoIfvmNRWV3L6dZVZeclFGF8pX/YLgLo=;
 b=Okbt/zNTQ9WCvoWEth2ai2EBhK/C1ybZoSSKmXBeBzDZ+9Z1nuaSwcYKubHnePmE4j
 5RE3A6uERfmBf0WeNpfSVBXMXWisJUjQnc8TVhVMZ5pDJQuYlMzy/Am/5R30yhQ49j4e
 Q5FNAGjzLHav/M3eLL2jWoNQxBPY6ET23qcFIkpALRbMQPkvDx5tPL00zbm1oI2MazJG
 UaqOXueRS3bx2S372xFYFs81iS6DxgXohAo/t2eMI4qfVcn0P+nq83ROsiQhvb4aOi4d
 duO83RAQXSD4NxnWlsMDUGMi+RxMadxu8NjbSXEVzmM8D0aMhXG1JqGfYOhT3RBJlVAd
 DNOA==
X-Gm-Message-State: AOAM533LoBRxTassaKr8qiXA0Y+sBwQ/LE7Umt62aeE/W4Brq6Q1RoV4
 D26+AocQOGDmC1Cl/mAuRRsWSA==
X-Google-Smtp-Source: ABdhPJwcmnKIDEaOAX4pSQR4RVWxCHOcphV/hF/DJg7mGiwNqRBwfi2i8zyL68vFlLUf5as9d8YuNg==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr4658027wro.187.1622823177020; 
 Fri, 04 Jun 2021 09:12:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g17sm2392881wrp.61.2021.06.04.09.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEA8720026;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 99/99] gitlab: defend the new stripped down arm64 configs
Date: Fri,  4 Jun 2021 16:53:12 +0100
Message-Id: <20210604155312.15902-100-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can now build a KVM only aarch64-softmmu image which we need to
cross build. We can also build a version that only supports a limited
set of 64 bit images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml   | 10 ++++++++++
 .gitlab-ci.d/crossbuilds.yml |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index b72c57e4df..a48e723efe 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -645,6 +645,16 @@ build-without-default-features:
         --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
     MAKE_CHECK_ARGS: check-unit
 
+build-64bit-only-aarch64-softmmu:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-container
+  variables:
+    IMAGE: debian-amd64
+    TARGETS: aarch64-softmmu
+    CONFIGURE_ARGS: --with-devices-aarch64=../configs/aarch64-softmmu/64bit-only.mak
+    MAKE_CHECK_ARGS: check
+
 build-libvhost-user:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 6b3865c9e8..a118aa3052 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -36,6 +36,15 @@ cross-arm64-system:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-arm64-kvm-only-system:
+  extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg
+
 cross-arm64-user:
   extends: .cross_user_build_job
   needs:
-- 
2.20.1


