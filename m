Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B902F35EF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:42:17 +0100 (CET)
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMkK-0004zs-SE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMjD-0003kr-0M
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMj8-0000yr-Cl
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610469661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQAE34/wcGoIq5FcGNPB5UBknPdqvlONDso880sVFjQ=;
 b=XT9REpOQoxhDPljVsaDMNN29iKbw83Nm2fyfhclVkTWLs6afOUKmLe7Zelv08xa7KwVZkm
 SS8rQvS93zjKdskxZWZVHYszzmik6fMiPoLiY6G/gIVHdmzrWq5XFG62Aau9nAxP6CT63C
 yfQ1Hx8NI6P2qcTje4yhjs5PGIWYxLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-8oY2MKOxPYik2g7shCIEng-1; Tue, 12 Jan 2021 11:40:58 -0500
X-MC-Unique: 8oY2MKOxPYik2g7shCIEng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29226107ACFC;
 Tue, 12 Jan 2021 16:40:57 +0000 (UTC)
Received: from thuth.com (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A32C5D9CD;
 Tue, 12 Jan 2021 16:40:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 1/3] tests/acceptance: Move the pseries test to a separate file
Date: Tue, 12 Jan 2021 17:40:43 +0100
Message-Id: <20210112164045.98565-2-thuth@redhat.com>
In-Reply-To: <20210112164045.98565-1-thuth@redhat.com>
References: <20210112164045.98565-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's gather the POWER-related tests in a separate file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                            |  1 +
 tests/acceptance/boot_linux_console.py | 19 --------------
 tests/acceptance/machine_ppc.py        | 34 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 19 deletions(-)
 create mode 100644 tests/acceptance/machine_ppc.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 4be087b88e..189776a036 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -280,6 +280,7 @@ F: target/ppc/
 F: hw/ppc/
 F: include/hw/ppc/
 F: disas/ppc.c
+F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index fb41bb7144..41d2c86e98 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -976,25 +976,6 @@ class BootLinuxConsole(LinuxKernelTest):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    def test_ppc64_pseries(self):
-        """
-        :avocado: tags=arch:ppc64
-        :avocado: tags=machine:pseries
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
-                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
-                      '/ppc/ppc64/vmlinuz')
-        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
-        self.vm.add_args('-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-
     def test_m68k_q800(self):
         """
         :avocado: tags=arch:m68k
diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
new file mode 100644
index 0000000000..51bbfd411c
--- /dev/null
+++ b/tests/acceptance/machine_ppc.py
@@ -0,0 +1,34 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class PpcMachine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc64_pseries(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:pseries
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
+                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
+                      '/ppc/ppc64/vmlinuz')
+        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        wait_for_console_pattern(self, console_pattern, self.panic_message)
-- 
2.27.0


