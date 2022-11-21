Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AAE631E42
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:26:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox3yx-0005lA-Q5; Mon, 21 Nov 2022 05:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox3yw-0005l1-A8
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:24:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox3ym-0003NY-1z
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669026281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JZ1M3/i8vZEyCnfZk/9xMaO6/HnHzqfwvo0bbIwNYow=;
 b=gY/TEUXXqwbaqq54v1TLWWDyPtEZUtwjHX3WUexFU+JT4b8PBd5iLsEnQcRiE7BPf//b3Z
 +HKssFTK31afmqO84fY4fXZCRiMobYhCivAiTwmfm9u03vl3HomzXSyQOfcjQtrCSumq++
 WQT9+EWIPTEfK1ktYqmctRrFJm8qK34=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-aQPiABZgOT-bJ4gscScvVg-1; Mon, 21 Nov 2022 05:24:39 -0500
X-MC-Unique: aQPiABZgOT-bJ4gscScvVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69590101A528;
 Mon, 21 Nov 2022 10:24:39 +0000 (UTC)
Received: from thuth.com (ovpn-192-119.brq.redhat.com [10.40.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07F6640C6EC2;
 Mon, 21 Nov 2022 10:24:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] tests/avocado: Update the URLs of the advent calendar images
Date: Mon, 21 Nov 2022 11:24:36 +0100
Message-Id: <20221121102436.78635-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The qemu-advent-calendar.org server will be decommissioned soon.
I've mirrored the images that we use for the QEMU CI to gitlab,
so update their URLs to point to the new location.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/boot_linux_console.py     |  4 +--
 tests/avocado/machine_arm_canona1100.py |  4 +--
 tests/avocado/machine_microblaze.py     |  4 +--
 tests/avocado/machine_sparc64_sun4u.py  |  4 +--
 tests/avocado/ppc_mpc8544ds.py          |  6 ++--
 tests/avocado/ppc_virtex_ml507.py       |  6 ++--
 tests/avocado/replay_kernel.py          | 40 ++++++++++++-------------
 7 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 4c9d551f47..f3e6f44ae9 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1029,8 +1029,8 @@ def test_m68k_q800(self):
         self.wait_for_console_pattern(console_pattern)
 
     def do_test_advcal_2018(self, day, tar_hash, kernel_name, console=0):
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day' + day + '.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day' + day + '.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         archive.extract(file_path, self.workdir)
         self.vm.set_console(console_index=console)
diff --git a/tests/avocado/machine_arm_canona1100.py b/tests/avocado/machine_arm_canona1100.py
index 182a0b0513..a42d8b0f2b 100644
--- a/tests/avocado/machine_arm_canona1100.py
+++ b/tests/avocado/machine_arm_canona1100.py
@@ -23,8 +23,8 @@ def test_arm_canona1100(self):
         :avocado: tags=machine:canon-a1100
         :avocado: tags=device:pflash_cfi02
         """
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day18.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day18.tar.xz')
         tar_hash = '068b5fc4242b29381acee94713509f8a876e9db6'
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         archive.extract(file_path, self.workdir)
diff --git a/tests/avocado/machine_microblaze.py b/tests/avocado/machine_microblaze.py
index 4928920f96..8d0efff30d 100644
--- a/tests/avocado/machine_microblaze.py
+++ b/tests/avocado/machine_microblaze.py
@@ -19,8 +19,8 @@ def test_microblaze_s3adsp1800(self):
         :avocado: tags=machine:petalogix-s3adsp1800
         """
 
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day17.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day17.tar.xz')
         tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         archive.extract(file_path, self.workdir)
diff --git a/tests/avocado/machine_sparc64_sun4u.py b/tests/avocado/machine_sparc64_sun4u.py
index 458165500e..d333c0ae91 100644
--- a/tests/avocado/machine_sparc64_sun4u.py
+++ b/tests/avocado/machine_sparc64_sun4u.py
@@ -24,8 +24,8 @@ def test_sparc64_sun4u(self):
         :avocado: tags=arch:sparc64
         :avocado: tags=machine:sun4u
         """
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day23.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day23.tar.xz')
         tar_hash = '142db83cd974ffadc4f75c8a5cad5bcc5722c240'
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         archive.extract(file_path, self.workdir)
diff --git a/tests/avocado/ppc_mpc8544ds.py b/tests/avocado/ppc_mpc8544ds.py
index 8d6a749201..b599fb1cc9 100644
--- a/tests/avocado/ppc_mpc8544ds.py
+++ b/tests/avocado/ppc_mpc8544ds.py
@@ -22,9 +22,9 @@ def test_ppc_mpc8544ds(self):
         :avocado: tags=accel:tcg
         """
         self.require_accelerator("tcg")
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2020/download/day17.tar.gz')
-        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day04.tar.xz')
+        tar_hash = 'f46724d281a9f30fa892d458be7beb7d34dc25f9'
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         archive.extract(file_path, self.workdir)
         self.vm.set_console()
diff --git a/tests/avocado/ppc_virtex_ml507.py b/tests/avocado/ppc_virtex_ml507.py
index 6b07686b56..a73f8ae396 100644
--- a/tests/avocado/ppc_virtex_ml507.py
+++ b/tests/avocado/ppc_virtex_ml507.py
@@ -22,9 +22,9 @@ def test_ppc_virtex_ml507(self):
         :avocado: tags=accel:tcg
         """
         self.require_accelerator("tcg")
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2020/download/hippo.tar.gz')
-        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day08.tar.xz')
+        tar_hash = '74c68f5af7a7b8f21c03097b298f3bb77ff52c1f'
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         archive.extract(file_path, self.workdir)
         self.vm.set_console()
diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 0b2b0dc692..00a26e4a0c 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -296,8 +296,8 @@ def test_arm_vexpressa9(self):
         :avocado: tags=machine:vexpress-a9
         """
         tar_hash = '32b7677ce8b6f1471fb0059865f451169934245b'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day16.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day16.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         dtb_path = self.workdir + '/day16/vexpress-v2p-ca9.dtb'
         self.do_test_advcal_2018(file_path, 'winter.zImage',
@@ -309,8 +309,8 @@ def test_m68k_mcf5208evb(self):
         :avocado: tags=machine:mcf5208evb
         """
         tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day07.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day07.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'sanity-clause.elf')
 
@@ -321,8 +321,8 @@ def test_microblaze_s3adsp1800(self):
         :avocado: tags=machine:petalogix-s3adsp1800
         """
         tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day17.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day17.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'ballerina.bin')
 
@@ -333,8 +333,8 @@ def test_ppc64_e500(self):
         :avocado: tags=cpu:e5500
         """
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day19.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day19.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'uImage')
 
@@ -344,8 +344,8 @@ def test_or1k_sim(self):
         :avocado: tags=machine:or1k-sim
         """
         tar_hash = '20334cdaf386108c530ff0badaecc955693027dd'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day20.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day20.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux')
 
@@ -355,8 +355,8 @@ def test_nios2_10m50(self):
         :avocado: tags=machine:10m50-ghrd
         """
         tar_hash = 'e4251141726c412ac0407c5a6bceefbbff018918'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day14.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day14.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux.elf')
 
@@ -366,8 +366,8 @@ def test_ppc_g3beige(self):
         :avocado: tags=machine:g3beige
         """
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day15.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day15.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'invaders.elf',
                                  args=('-M', 'graphics=off'))
@@ -378,8 +378,8 @@ def test_ppc_mac99(self):
         :avocado: tags=machine:mac99
         """
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day15.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day15.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'invaders.elf',
                                  args=('-M', 'graphics=off'))
@@ -390,8 +390,8 @@ def test_sparc_ss20(self):
         :avocado: tags=machine:SS-20
         """
         tar_hash = 'b18550d5d61c7615d989a06edace051017726a9f'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day11.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day11.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'zImage.elf')
 
@@ -402,8 +402,8 @@ def test_xtensa_lx60(self):
         :avocado: tags=cpu:dc233c
         """
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2018/download/day02.tar.xz')
+        tar_url = ('https://qemu-advcal.gitlab.io'
+                   '/qac-best-of-multiarch/download/day02.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf')
 
-- 
2.31.1


