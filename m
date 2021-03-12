Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66D338F74
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:09:37 +0100 (CET)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiTw-0007mo-FH
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD6-000326-5h
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:13 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:44714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCt-0001zb-Ou
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:11 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so15240694wmi.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LngMXXlY8WIvoitoMUjR2vKoMNM40aImyWnmtuC57Hg=;
 b=LK1GoWryq4pQR1KthJeHsBXyWEhwRy2adVzoA47m+hsHVg38K75UCq5DPBK4e3Dl9k
 T8zrOJjLdVILV5TnX0eZPfiTFIlLCC8O4iVA/We8SxpHWwW55FKqDb7yS0qsAmsa9S29
 sDvzNfCMjmobXOyuI5nP0fuT103i7iTzGXYWb7Ppml1N2W5LvmGE+J2WFkkbMzfyx1XO
 oyw3DpbYWQZv5K2GqlQkawFKH5CaPz1cLVQh3MBeJSVu0x9WBHFVPuogFLdz8U3o+FLM
 N5B4ckJ3Omjbi3t/elh3BhjTHqXEhWaFhmBnubBU9ecGOizWrURs5lto9mZdRYK4M2Mr
 zqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LngMXXlY8WIvoitoMUjR2vKoMNM40aImyWnmtuC57Hg=;
 b=uVs8lVi+h15apdd3Yw4Am+3uXaJv4QPxw/7zPWHckV3XDlTFgIt3EkY32VbICv6ogK
 ULxUPimuVYALTcCUiFqdWMs5bZFgW1aMiUCmksNlqzFXGEXkNGWbHlVvdUnIw+Fo9Spd
 7pEFsr/oVPgKU2kij6tpXzdT9GaN9kK91JzBLXUT+LDTfCSdz+b3ax5Vk1J+dHavooJs
 AK5GpE7VXeNARPWtTs8hXbcLEXBq39bcZM6uhtXdtjWqwk1DlVP0oWXi8bGIawfZE8GE
 ZnNIHfqnTIAuaTyDVrpRkD/XkjtHYzLWLEe2YaHBBrEBVpOMWi6qvA0t7u3shHF/zG/C
 u4Nw==
X-Gm-Message-State: AOAM530vKhnb0FqpckR/QXrvIVbWfB1q5h5eGdPxCNy0zQtmb0aRL52n
 P/1vaptGNRrX4z1FzJl3NaAd5nAI0v4EITSP
X-Google-Smtp-Source: ABdhPJzjSA9a++y4MVM+4wPyFri5L1ncyHU7PBA3jIclnwHUuEFjMHoX8Chc6EeW2iLshMP/A8sdkQ==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr13030510wmb.135.1615557116864; 
 Fri, 12 Mar 2021 05:51:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/39] tests/acceptance: update sunxi kernel from armbian to
 5.10.16
Date: Fri, 12 Mar 2021 13:51:22 +0000
Message-Id: <20210312135140.1099-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

The linux kernel 4.20.7 binary for sunxi has been removed from apt.armbian.com:

  $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
  ...
  (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
    CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.55 s)

This commit updates the sunxi kernel to 5.10.16 for the acceptance
tests of the orangepi-pc and cubieboard machines.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20210310195820.21950-5-nieklinnenbank@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/acceptance/boot_linux_console.py | 40 +++++++++++++-------------
 tests/acceptance/replay_kernel.py      |  8 +++---
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 4a7a6830ca9..04a8b233526 100644
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
index c1cb8624683..8c68caae317 100644
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
2.20.1


