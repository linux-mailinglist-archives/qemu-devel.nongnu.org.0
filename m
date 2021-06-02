Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F023986A4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:36:28 +0200 (CEST)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOEd-0002M0-TG
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loODt-0001f7-6L
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:35:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loODr-0005ER-9Y
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:35:40 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so1362058wmq.3
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qvtf76u8y4rQt4gVty1LYjpeYIfu6OzuVZkiqUUjXrM=;
 b=q/LYDKBHTGsnl21JgVzvSGosFbSUQPFvZ5bA7zKD97tDnt0a59BPCR2dlXd2inizCH
 t/aLkKoQeAmXlWpWU++t8G1QUHO8XxzuP2PGMYURdOBp1ysa3Upmm2LOFmxFY846IYeL
 LjLgIfmcRiq7yonHbtI2bJUPeyVRe5NsyOxrXB2pSJPixNYYnguXcLBgvRCrQFEgHOZj
 2y+GZo2sLG4lAvbjobHcXE+Ri+IrtmMQRc3AM5lDB/gGZCubsRGioDrJBBhr61jzYZ9F
 u1KfhT4BMVl75GQ+9zExu0EgZljinH4Iodw44s4pQrvofxCEqL9qFCgIhy2RY5AWAI4d
 P2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qvtf76u8y4rQt4gVty1LYjpeYIfu6OzuVZkiqUUjXrM=;
 b=gft8GYZGKTCvY+OI9tvkOj6K2/kOsuoazLEIxwQ6VTYFIlHT8450xl8CVaGj1d1Jev
 hy1lzKtxFK+91BYJ/gmHcY9/yKs/SSef98yjbWkaCgfGUL2gfHxy8QRc8PeNKQ+Gk/66
 h18cYxFgHktyayUdtjXcY8VWvAocst1IQWSvgvWZADmxmZNC5RtwaRIyJ4t6RLriDsbF
 UzO5/7XmDW9DjpuOJpa0nPz7JcUkm9ifDRY5kkeplVYG+fBUIwX8rT6SfGVUmNcwiba4
 4EoG+Ah46dJRLx3N3cNuv9tbrbWNsVydFtN1kLsr41BVw4dLCtoy4ZSSptdbSyiJUGDr
 1r+A==
X-Gm-Message-State: AOAM5306KO4SouA/h3TDC6+vNhi5S+8khEF+WgiU33o0k3ZjIFcDFLu8
 483B01SNs/JhJs+APbefYz5ybA==
X-Google-Smtp-Source: ABdhPJyu0TkhatH42cCYZfGNgYklEMlY3V20fga3JQ7pFsIo1YTbm81YY7dFW8J2il0vt/nsSLCPeA==
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr16432001wmr.137.1622630137242; 
 Wed, 02 Jun 2021 03:35:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm5785871wrt.24.2021.06.02.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:35:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A7D71FF7E;
 Wed,  2 Jun 2021 11:35:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/vm: expose --source-path to scripts to find extra
 files
Date: Wed,  2 Jun 2021 11:35:27 +0100
Message-Id: <20210602103527.32021-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, jsnow@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the centos8 image expects to run an in-src build to find the
kick starter file. Fix this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 1 +
 tests/vm/basevm.py        | 4 ++++
 tests/vm/centos.aarch64   | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index e94d95ec54..f3a3a1c751 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -84,6 +84,7 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
 		$(if $(LOG_CONSOLE),--log-console) \
+		--source-path $(SRC_PATH) \
 		--image "$@" \
 		--force \
 		--build-image $@, \
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 00f1d5ca8d..30a417a0e4 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -96,6 +96,7 @@ def __init__(self, args, config=None):
         self._genisoimage = args.genisoimage
         self._build_path = args.build_path
         self._efi_aarch64 = args.efi_aarch64
+        self._source_path = args.source_path
         # Allow input config to override defaults.
         self._config = DEFAULT_CONFIG.copy()
         if config != None:
@@ -595,6 +596,9 @@ def get_default_jobs():
     parser.add_argument("--build-path", default=None,
                         help="Path of build directory, "\
                         "for using build tree QEMU binary. ")
+    parser.add_argument("--source-path", default=None,
+                        help="Path of source directory, "\
+                        "for finding additional files. ")
     parser.add_argument("--interactive", "-I", action="store_true",
                         help="Interactively run command")
     parser.add_argument("--snapshot", "-s", action="store_true",
diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
index e687b93e52..81c3004c3c 100755
--- a/tests/vm/centos.aarch64
+++ b/tests/vm/centos.aarch64
@@ -64,7 +64,7 @@ class CentosAarch64VM(basevm.BaseVM):
     def create_kickstart(self):
         """Generate the kickstart file used to generate the centos image."""
         # Start with the template for the kickstart.
-        ks_file = "../tests/vm/centos-8-aarch64.ks"
+        ks_file = self._source_path + "/tests/vm/centos-8-aarch64.ks"
         subprocess.check_call("cp {} ./ks.cfg".format(ks_file), shell=True)
         # Append the ssh keys to the kickstart file
         # as the post processing phase of installation.
-- 
2.20.1


