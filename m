Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A132DB4B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:45:31 +0100 (CET)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuqg-0002lo-IT
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhg-0001jo-5V; Thu, 04 Mar 2021 15:36:12 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:32903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhT-0005LT-Sy; Thu, 04 Mar 2021 15:36:11 -0500
Received: by mail-ej1-x631.google.com with SMTP id jt13so52119122ejb.0;
 Thu, 04 Mar 2021 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DfX0PX9k5vslF+u0G7Geev69QRDpZEy4IHT6ko0vTfg=;
 b=jjN/oXlPnXf71M43yhNt3SRLOMSNXDRKj/kttg1Zn7NvQTh6pynZRP712ILNugGdaM
 NhrutsxXA8MDSJ/E1N9DXS2TCCgnA1RBx6J2al6im5YG1pf2Ow90O69cKHZyo2KDsnBI
 9FNffMkn0LVvisO03tcs7UpK4bASeRvlVQb4POIgmI1/I09jC38wFfxjcO8qzVEVKpml
 xHPmnBo2EuqQ7qgoAoL7UzT0tGh/H2koLdPaqFkq6fzFqISOlw/fsyYA8oM4sQ/U/S5k
 nrHLsT9Ux3MrYeMRo2MQjEfZL5XgaQKv+QTe+dqWPaPNRtcbfJ2ZSmYsTP9ZjjbGm7ut
 fYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DfX0PX9k5vslF+u0G7Geev69QRDpZEy4IHT6ko0vTfg=;
 b=Zlf8UsG4qUpL2Q5FQCyoNvL5cL+WXA3wgbmyLXhgiPhRjA+F5Bc62owuGtkwwBLxQy
 QBvmklKCcKrD0bZYVcNghL5cFgEXwLbC4rFsae7ZOOLxYDd+3RwzHdX/9oIDYVbIGden
 WmsT6PjJitgWJTM6haKUIXKrkOGCRGt0ShHAQnLzWDi+qBzUAhPhs7nOwvJWR6++YTm0
 dH7odrnmxoK5WHJVE/nUyjaReVPJQ6jDjjYwrw5KioTiQ1zepWpplb+05nWmLtoPjf4j
 xTDDJbxdBGhultGqooweHvuApbj6bJmuVqNQBaTbcGMkQeYSAT/YP/1FQeueF6UKSC9o
 VGCw==
X-Gm-Message-State: AOAM531YJBMTSHJx0DFBiDPfJG8r5jEAPaWeFp/zgNY25fpiW/qFlDPo
 bo0hp/k8nriQTGdQahwY6am4NsCl2Od9EQ==
X-Google-Smtp-Source: ABdhPJxMiEAWvd8NXDHoFD924xyL1UVmw7X5xezZYi2hGzXpm/ZfZdGzsN/zoydfOP6aD2iunlTdwQ==
X-Received: by 2002:a17:906:6047:: with SMTP id
 p7mr6322074ejj.400.1614890157344; 
 Thu, 04 Mar 2021 12:35:57 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-ebf2-7b2-6f3d-5954.fixed6.kpn.net.
 [2a02:a456:6be8:1:ebf2:7b2:6f3d:5954])
 by smtp.gmail.com with ESMTPSA id t8sm289956edv.16.2021.03.04.12.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 12:35:57 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] tests/acceptance: update sunxi kernel from armbian to
 5.10.16
Date: Thu,  4 Mar 2021 21:35:39 +0100
Message-Id: <20210304203540.41614-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304203540.41614-1-nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The linux kernel 4.20.7 binary for sunxi has been removed from apt.armbian.com:

  $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
  ...
  (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
    CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.55 s)

This commit updates the sunxi kernel to 5.10.16 for the acceptance
tests of the orangepi-pc and cubieboard machines.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 40 +++++++++++++-------------
 tests/acceptance/replay_kernel.py      |  8 +++---
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 4a7a6830ca..04a8b23352 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -515,12 +515,12 @@ def test_arm_cubieboard_initrd(self):
         :avocado: tags=machine:cubieboard
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -557,12 +557,12 @@ def test_arm_cubieboard_sata(self):
         :avocado: tags=machine:cubieboard
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -686,12 +686,12 @@ def test_arm_orangepi(self):
         :avocado: tags=machine:orangepi-pc
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
 
         self.vm.set_console()
@@ -713,12 +713,12 @@ def test_arm_orangepi_initrd(self):
         :avocado: tags=machine:orangepi-pc
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -758,12 +758,12 @@ def test_arm_orangepi_sd(self):
         :avocado: tags=device:sd
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
                       'kci-2019.02/armel/base/rootfs.ext2.xz')
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index c1cb862468..8c68caae31 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -185,12 +185,12 @@ def test_arm_cubieboard_initrd(self):
         :avocado: tags=machine:cubieboard
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
-- 
2.25.1


