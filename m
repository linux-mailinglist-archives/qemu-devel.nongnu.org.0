Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEEB14C7D0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 10:06:17 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwjId-0000ep-Sf
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 04:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iwjHB-0008Bs-6L
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:04:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iwjH9-0007pz-Bw
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:04:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60118
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iwjH8-0007jb-1m
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580288681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5wyuV6xqCpsjKs9B9HCaRX/oVVS5cN7WdVgh2xGykQc=;
 b=deyhJgJDq20gffW0lpa41ZspnVnK8a4TcKEUd+0xC80t9EeHCUikU1nsRl4PdM2btm8lPM
 gUYXFM36P6egZM4Gb4OoKgWnWPyTS2NdS3gDWKMLEWw4KEd+baivAD4cSIgW59V8Ti2Jjd
 0BAju4yPNm1XIcaROqBxUNv2SD/oRNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-l3GMa-xpNG6KiLKiqcC6xg-1; Wed, 29 Jan 2020 04:04:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BEE9107ACC5;
 Wed, 29 Jan 2020 09:04:30 +0000 (UTC)
Received: from thuth.com (ovpn-116-210.ams2.redhat.com [10.36.116.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9635560BE0;
 Wed, 29 Jan 2020 09:04:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/acceptance: Add a test for the canon-a1100 machine
Date: Wed, 29 Jan 2020 10:04:20 +0100
Message-Id: <20200129090420.13954-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: l3GMa-xpNG6KiLKiqcC6xg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The canon-a1100 machine can be used with the Barebox firmware. The
QEMU Advent Calendar 2018 features a pre-compiled image which we
can use for testing.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Rename file and add class docstring to please pylint
 - Add entry to MAINTAINERS
 - Add :avocado: tags=3Ddevice:pflash_cfi02

 MAINTAINERS                                |  1 +
 tests/acceptance/machine_arm_canona1100.py | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_canona1100.py

diff --git a/MAINTAINERS b/MAINTAINERS
index efd3f3875f..ddf6fe0794 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -561,6 +561,7 @@ S: Odd Fixes
 F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
+F: tests/acceptance/machine_arm_canona1100.py
=20
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/acceptance/machine_arm_canona1100.py b/tests/acceptance/=
machine_arm_canona1100.py
new file mode 100644
index 0000000000..0e5c43dbcf
--- /dev/null
+++ b/tests/acceptance/machine_arm_canona1100.py
@@ -0,0 +1,35 @@
+# Functional test that boots the canon-a1100 machine with firmware
+#
+# Copyright (c) 2020 Red Hat, Inc.
+#
+# Author:
+#  Thomas Huth <thuth@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import archive
+
+class CanonA1100Machine(Test):
+    """Boots the barebox firmware and checks that the console is operation=
al"""
+
+    timeout =3D 90
+
+    def test_arm_canona1100(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:canon-a1100
+        :avocado: tags=3Ddevice:pflash_cfi02
+        """
+        tar_url =3D ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day18.tar.xz')
+        tar_hash =3D '068b5fc4242b29381acee94713509f8a876e9db6'
+        file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-bios',
+                         self.workdir + '/day18/barebox.canon-a1100.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'running /env/bin/init')
--=20
2.18.1


