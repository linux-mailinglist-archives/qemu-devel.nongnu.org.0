Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506C3D3FC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 19:25:54 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hakWv-0007lu-A1
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58113)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hakMz-0008Su-DW
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 13:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hakMx-0004cL-W6
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 13:15:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hakMx-0004WG-IW
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 13:15:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F51731628ED;
 Tue, 11 Jun 2019 17:15:24 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E95E5D705;
 Tue, 11 Jun 2019 17:15:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Date: Tue, 11 Jun 2019 14:14:53 -0300
Message-Id: <20190611171456.23444-4-ehabkost@redhat.com>
In-Reply-To: <20190611171456.23444-1-ehabkost@redhat.com>
References: <20190611171456.23444-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 11 Jun 2019 17:15:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/6] BootLinuxConsoleTest: Test the SmartFusion2
 board
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
Cc: Fam Zheng <fam@euphon.net>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Similar to the x86_64/pc test, it boots a Linux kernel on an
Emcraft board and verify the serial is working.

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

  $ avocado run -t arch:arm tests/acceptance
  $ avocado run -t machine:emcraft_sf2 tests/acceptance

Based on the recommended test setup from Subbaraya Sundeep:
https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg03810.html

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20190520220635.10961-3-f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index e86e66900a..e6b5ed5dda 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -179,6 +179,33 @@ class BootLinuxConsole(Test):
         console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
         self.wait_for_console_pattern(console_pattern)
=20
+    def test_arm_emcraft_sf2(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:emcraft_sf2
+        :avocado: tags=3Dendian:little
+        """
+        uboot_url =3D ('https://raw.githubusercontent.com/'
+                     'Subbaraya-Sundeep/qemu-test-binaries/'
+                     'fa030bd77a014a0b8e360d3b7011df89283a2f0b/u-boot')
+        uboot_hash =3D 'abba5d9c24cdd2d49cdc2a8aa92976cf20737eff'
+        uboot_path =3D self.fetch_asset(uboot_url, asset_hash=3Duboot_ha=
sh)
+        spi_url =3D ('https://raw.githubusercontent.com/'
+                   'Subbaraya-Sundeep/qemu-test-binaries/'
+                   'fa030bd77a014a0b8e360d3b7011df89283a2f0b/spi.bin')
+        spi_hash =3D '85f698329d38de63aea6e884a86fbde70890a78a'
+        spi_path =3D self.fetch_asset(spi_url, asset_hash=3Dspi_hash)
+
+        self.vm.set_machine('emcraft-sf2')
+        self.vm.set_console()
+        kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE
+        self.vm.add_args('-kernel', uboot_path,
+                         '-append', kernel_command_line,
+                         '-drive', 'file=3D' + spi_path + ',if=3Dmtd,for=
mat=3Draw',
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('init started: BusyBox')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=3Darch:s390x
--=20
2.18.0.rc1.1.g3f1ff2140


