Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD773233FA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 23:55:49 +0100 (CET)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEgaq-0003gz-AN
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 17:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lEgZ9-0002An-SH; Tue, 23 Feb 2021 17:54:03 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lEgZ4-000229-AK; Tue, 23 Feb 2021 17:54:03 -0500
Received: by mail-ej1-x62f.google.com with SMTP id hs11so91487ejc.1;
 Tue, 23 Feb 2021 14:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8WaP4W7cXz+9hJN4RigR0J/h1gkWz375q6Lq0YgScc=;
 b=XAhsuoHGugsSXtpNGT5IWmBKTB15WyHQ/jh08tr5uru+1CJpmIzNwKhSzsJ42SxBaD
 Nj8pWikkCx81MVAZrbUw2dxeJtmnQ/ajEFnyV92eMgZloS33pEwp3KBty4VmCgo5T+Hx
 4YJticZOjq201WG/DhWYnNzKyyBJrzYMylXJ32vDQN0gt2Vlmyj2QAxI6yqg4dG7NPLs
 lSlb+LTbTExKL6gEpNGI5KXHxCUvPcn+a1V9CsL3klZGVqfpj5tNn5it75G4zjGtXtAn
 OQyBXD5109FBH5/1xIbNT73lQlXmfTPRzP5kFetmG6DID7IhqI1PempUdfTGSW8NXi6I
 xsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8WaP4W7cXz+9hJN4RigR0J/h1gkWz375q6Lq0YgScc=;
 b=hqk8JGXQu3JuhMYSRsvhfCve4LY99MSoEBss66YIXG95AMD41Fap7fLFpkZBl7k5Tq
 n52JWxbqeYffw4i2BIKe3DosjRzZ2PGalACDWPsO0BexqFwSzBhMzZ5lPeoVI46rJH4R
 hQTGoC86egOsM7CLJvRDKIwB0vxFRVE6JqVeeWLnRaKuJr63x4ueeeMY7R3tAgYKnVb9
 AaxH9OHppc8J1cRlUzn9cWYI6OvWZGulvMAbz8HUi/6PGUz6ll75bSSNc9BkIin8soSk
 8tt0wfRDKcXqDXqIfnl1dgSsdR9pB4evxZhmVohnR4Et+mCri5zpsiXiQH5SO0XR7RcP
 Xi8g==
X-Gm-Message-State: AOAM531ZgR+60K1rCxNqBjgPIuABo2F7qeamZ/VZgY+dW7J4UVc6RGG/
 zxcgQIzonTkEJcXUyYAHRLrBHkvZScA=
X-Google-Smtp-Source: ABdhPJzVNxO42UbKirbtP11PvpVZcXSUpMrtbKsvkrZCV/d8BobIZio7+yUAUnH0QtKlZdqZAjuE6Q==
X-Received: by 2002:a17:906:7f14:: with SMTP id
 d20mr28102936ejr.322.1614120836385; 
 Tue, 23 Feb 2021 14:53:56 -0800 (PST)
Received: from localhost.localdomain
 (2a02-a456-6be8-1-9f7b-4035-6320-cb66.fixed6.kpn.net.
 [2a02:a456:6be8:1:9f7b:4035:6320:cb66])
 by smtp.gmail.com with ESMTPSA id u15sm55752ejy.48.2021.02.23.14.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 14:53:55 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
Date: Tue, 23 Feb 2021 23:53:26 +0100
Message-Id: <20210223225327.26700-2-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223225327.26700-1-nieklinnenbank@gmail.com>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com,
 Willian Rampazzo <willianr@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the automated acceptance tests for the Orange Pi PC and cubieboard
machines are disabled by default. The tests for both machines require artifacts
that are stored on the apt.armbian.com domain. Unfortunately, some of these artifacts
have been removed from apt.armbian.com and it is uncertain whether more will be removed.

This commit moves the artifacts previously stored on apt.armbian.com to github
and retrieves them using the path: '/<machine>/<artifact>'.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 49 ++++++++++----------------
 tests/acceptance/replay_kernel.py      |  6 ++--
 2 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index eb01286799..0f8a824c61 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -507,15 +507,13 @@ def test_arm_exynos4210_initrd(self):
         self.wait_for_console_pattern('Boot successful.')
         # TODO user command, for now the uart is stuck
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                   'master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb')
         deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
@@ -549,15 +547,13 @@ def test_arm_cubieboard_initrd(self):
                                                 'system-control@1c00000')
         # cubieboard's reboot is not functioning; omit reboot test.
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_sata(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                   'master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb')
         deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
@@ -678,15 +674,13 @@ def test_arm_quanta_gsj_initrd(self):
         self.wait_for_console_pattern(
                 'Give root password for system maintenance')
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                   'master/orangepi-pc/linux-image-dev-sunxi_5.75_armhf.deb')
         deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
@@ -705,15 +699,13 @@ def test_arm_orangepi(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                   'master/orangepi-pc/linux-image-dev-sunxi_5.75_armhf.deb')
         deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
@@ -749,24 +741,23 @@ def test_arm_orangepi_initrd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_sd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                   'master/orangepi-pc/linux-image-dev-sunxi_5.75_armhf.deb')
         deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
                                             '/boot/vmlinuz-4.20.7-sunxi')
         dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
-        rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
-                      'kci-2019.02/armel/base/rootfs.ext2.xz')
+        # Rootfs is based on buildroot 2019.02 from kernelci.org
+        rootfs_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                      'master/orangepi-pc/rootfs.ext2.xz')
         rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
         rootfs_path_xz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
         rootfs_path = os.path.join(self.workdir, 'rootfs.cpio')
@@ -828,8 +819,6 @@ def do_test_arm_orangepi_uboot_armbian(self, image_path):
                                       'to <orangepipc>')
         self.wait_for_console_pattern('Starting Load Kernel Modules...')
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
     def test_arm_orangepi_bionic_19_11(self):
@@ -840,7 +829,8 @@ def test_arm_orangepi_bionic_19_11(self):
         """
 
         # This test download a 196MB compressed image and expand it to 1GB
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+        image_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                     'master/orangepi-pc/'
                      'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
         image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
         image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
@@ -851,8 +841,6 @@ def test_arm_orangepi_bionic_19_11(self):
 
         self.do_test_arm_orangepi_uboot_armbian(image_path)
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_bionic_20_08(self):
         """
@@ -865,7 +853,8 @@ def test_arm_orangepi_bionic_20_08(self):
         # to 1036 MiB, but the underlying filesystem is 1552 MiB...
         # As we expand it to 2 GiB we are safe.
 
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+        image_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                     'master/orangepi-pc/'
                      'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
         image_hash = ('b4d6775f5673486329e45a0586bf06b6'
                       'dbe792199fd182ac6b9c7bb6c7d3e6dd')
@@ -884,8 +873,8 @@ def test_arm_orangepi_uboot_netbsd9(self):
         :avocado: tags=device:sd
         """
         # This test download a 304MB compressed image and expand it to 2GB
-        deb_url = ('http://snapshot.debian.org/archive/debian/'
-                   '20200108T145233Z/pool/main/u/u-boot/'
+        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                   'master/orangepi-pc/'
                    'u-boot-sunxi_2020.01%2Bdfsg-1_armhf.deb')
         deb_hash = 'f67f404a80753ca3d1258f13e38f2b060e13db99'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index c1cb862468..ca5670fa76 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -177,15 +177,13 @@ def test_arm_virt(self):
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=1)
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
+                   'master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb')
         deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-- 
2.25.1


