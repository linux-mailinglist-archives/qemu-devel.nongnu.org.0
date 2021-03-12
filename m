Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320ED338F85
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:11:52 +0100 (CET)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiW7-0003ep-7q
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD9-00032m-ES
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:15 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCt-0001zI-Q9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:15 -0500
Received: by mail-wr1-x444.google.com with SMTP id d15so4849344wrv.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pVJCCTXEBFCdTpdgMvxQ3MowdcBHA8h6sYnGpHGOj7E=;
 b=Tb/SRBOo+2UCT8dIVnGCxaxb2E+0FDQHyfheKmVHeBuM71zJMAkHJ0RKdUSD/Uy63A
 Focow3Y/KjsRC+NcIMwSPynQk7SjHK+s1epWIO+yFn0SF/ATz2ibJzj2aBDDzeR7qxFG
 bqWbKZ/+e96j2XH9Yt+qbMqAO/Z0Bxrwo2e9S9mB4cTL2jfx2CWbOCew1HGwpIgApBMx
 SmZPd1P57LAw8xPaRf5y1A7vQlHQZOXpqFTh1vc4riZnfkWO0CoHeGDZuiCENQ2JOmdh
 wSMuwyTPJOqApO4DJWKs0qhGaxf1HeVWgreL5Bq5GBsvccZ9Q2d/SJG5lUbliVepED9d
 RlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVJCCTXEBFCdTpdgMvxQ3MowdcBHA8h6sYnGpHGOj7E=;
 b=maK6IiHRNV1qgEPeUnrvOEU09+5qdlHU1g9KxSwhj4OCQnGJmnrgl8jBK48CQNNFpS
 PG6xSIUWyLSC1pbTuv+cKYGQbXeaDv6UJUM5ge/B8gvN61nNEe2nnW2Fkenv0rJshKTH
 uUd6HVLNvW9Pf3p+ccj3dS1xt2GTI6rbCMHGjqkIMJtWJkOPCZjTtL4MVO7jfb3/6ckk
 URTSxCVITYVPXNcCuys1H4ikUvcMVFTgs2PbvmeRINa90VHcSATOJKmsesqu1CSvESbL
 ce+6LYzGaavweDs8jecU/GU2SnKlpxUMh725El2ltQojfkvYYhu3JoavOOVqcn8FkomN
 soBQ==
X-Gm-Message-State: AOAM530w+7edM8qYc3H90pSj8C907WhRkTWwoq6lQ2mPNQwUr5J4kx4K
 1OicNnXK899kJRqqKMPnb6AhQnpR/t7tq2KZ
X-Google-Smtp-Source: ABdhPJxRcGizCR9zB7NKuBDYKS9twJMlW/Frh3TegeNLf5qJnnXzuNMLB5FpyO5hRHp5fBftIKp/mQ==
X-Received: by 2002:adf:8545:: with SMTP id 63mr13854517wrh.128.1615557115590; 
 Fri, 12 Mar 2021 05:51:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/39] tests/acceptance/boot_linux_console: remove Armbian
 19.11.3 bionic test for orangepi-pc machine
Date: Fri, 12 Mar 2021 13:51:20 +0000
Message-Id: <20210312135140.1099-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niek Linnenbank <nieklinnenbank@gmail.com>

The image for Armbian 19.11.3 bionic has been removed from the armbian server.
Without the image as input the test arm_orangepi_bionic_19_11 cannot run.

This commit removes the test completely and merges the code of the generic function
do_test_arm_orangepi_uboot_armbian back with the 20.08 test.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20210310195820.21950-3-nieklinnenbank@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/acceptance/boot_linux_console.py | 72 ++++++++------------------
 1 file changed, 23 insertions(+), 49 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index eb012867997..9fadea99586 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    def do_test_arm_orangepi_uboot_armbian(self, image_path):
+    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
+                'Test artifacts fetched from unreliable apt.armbian.com')
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    def test_arm_orangepi_bionic_20_08(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        :avocado: tags=device:sd
+        """
+
+        # This test download a 275 MiB compressed image and expand it
+        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
+        # As we expand it to 2 GiB we are safe.
+
+        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
+        image_hash = ('b4d6775f5673486329e45a0586bf06b6'
+                      'dbe792199fd182ac6b9c7bb6c7d3e6dd')
+        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
+                                         algorithm='sha256')
+        image_path = archive.extract(image_path_xz, self.workdir)
+        image_pow2ceil_expand(image_path)
+
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
                          '-nic', 'user',
@@ -828,54 +850,6 @@ def do_test_arm_orangepi_uboot_armbian(self, image_path):
                                       'to <orangepipc>')
         self.wait_for_console_pattern('Starting Load Kernel Modules...')
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
-    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
-    @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
-    def test_arm_orangepi_bionic_19_11(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        """
-
-        # This test download a 196MB compressed image and expand it to 1GB
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
-                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
-        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
-        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
-        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
-        image_path = os.path.join(self.workdir, image_name)
-        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))
-        image_pow2ceil_expand(image_path)
-
-        self.do_test_arm_orangepi_uboot_armbian(image_path)
-
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
-    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
-    def test_arm_orangepi_bionic_20_08(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        """
-
-        # This test download a 275 MiB compressed image and expand it
-        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
-        # As we expand it to 2 GiB we are safe.
-
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
-                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
-        image_hash = ('b4d6775f5673486329e45a0586bf06b6'
-                      'dbe792199fd182ac6b9c7bb6c7d3e6dd')
-        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
-                                         algorithm='sha256')
-        image_path = archive.extract(image_path_xz, self.workdir)
-        image_pow2ceil_expand(image_path)
-
-        self.do_test_arm_orangepi_uboot_armbian(image_path)
-
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_uboot_netbsd9(self):
         """
-- 
2.20.1


