Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE2159C752
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:54:04 +0200 (CEST)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCYk-0003Wm-TD
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQBc8-0007Ky-Rs
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 13:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQBc4-0005fY-Qp
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 13:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661190803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qQHH+RVBY6YB2CM/bjs3PIBNHiCwHxJOQOLZOOr2TAg=;
 b=AGOwFGj871tKhdMC6AKyO5xfCJTs8dLqFTdI35iA7qdFMUdGWk1smm6QQiM7LHMSJV2gxG
 OqbFO6/0axn/5NoDly97FPRimaO22P5Ii8FgqJT4qJoK2EBLlzsmaYv4MGj8xnxKk4upIq
 GYQvnZhWSY5NiMmxvnmmcQvI2Ls9eHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-a-ImyP8lOh2j-8mBzRQBEQ-1; Mon, 22 Aug 2022 13:53:22 -0400
X-MC-Unique: a-ImyP8lOh2j-8mBzRQBEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A19F02A2AD4A;
 Mon, 22 Aug 2022 17:53:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 296F22026D64;
 Mon, 22 Aug 2022 17:53:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC PATCH] tests/vm: Remove obsolete Fedora VM test
Date: Mon, 22 Aug 2022 19:53:17 +0200
Message-Id: <20220822175317.190551-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's still based on Fedora 30 - which is not supported anymore by QEMU
since years. Seems like nobody is using (and refreshing) this, and it's
easier to test this via a container anyway, so let's remove this now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/Makefile.include |   3 +-
 tests/vm/fedora           | 190 --------------------------------------
 2 files changed, 1 insertion(+), 192 deletions(-)
 delete mode 100755 tests/vm/fedora

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 8d2a164552..2cc2203d09 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -15,7 +15,7 @@ endif
 
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
-X86_IMAGES := freebsd netbsd openbsd fedora haiku.x86_64
+X86_IMAGES := freebsd netbsd openbsd haiku.x86_64
 ifneq ($(GENISOIMAGE),)
 X86_IMAGES += centos
 ifneq ($(EFI_AARCH64),)
@@ -45,7 +45,6 @@ vm-help vm-test:
 	@echo "  vm-build-freebsd                - Build QEMU in FreeBSD VM"
 	@echo "  vm-build-netbsd                 - Build QEMU in NetBSD VM"
 	@echo "  vm-build-openbsd                - Build QEMU in OpenBSD VM"
-	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
 ifneq ($(GENISOIMAGE),)
 	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
 ifneq ($(EFI_AARCH64),)
diff --git a/tests/vm/fedora b/tests/vm/fedora
deleted file mode 100755
index 12eca919a0..0000000000
--- a/tests/vm/fedora
+++ /dev/null
@@ -1,190 +0,0 @@
-#!/usr/bin/env python3
-#
-# Fedora VM image
-#
-# Copyright 2019 Red Hat Inc.
-#
-# Authors:
-#  Gerd Hoffmann <kraxel@redhat.com>
-#
-# This code is licensed under the GPL version 2 or later.  See
-# the COPYING file in the top-level directory.
-#
-
-import os
-import re
-import sys
-import time
-import socket
-import subprocess
-import basevm
-
-class FedoraVM(basevm.BaseVM):
-    name = "fedora"
-    arch = "x86_64"
-
-    base = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/30/"
-    link = base + "Server/x86_64/iso/Fedora-Server-netinst-x86_64-30-1.2.iso"
-    repo = base + "Server/x86_64/os/"
-    full = base + "Everything/x86_64/os/"
-    csum = "5e4eac4566d8c572bfb3bcf54b7d6c82006ec3c6c882a2c9235c6d3494d7b100"
-    size = "20G"
-    pkgs = [
-        # tools
-        'git-core',
-        'gcc', 'binutils', 'make', 'ninja-build',
-
-        # perl
-        'perl',
-
-        # libs: usb
-        '"pkgconfig(libusb-1.0)"',
-        '"pkgconfig(libusbredirparser-0.5)"',
-
-        # libs: crypto
-        '"pkgconfig(gnutls)"',
-
-        # libs: ui
-        '"pkgconfig(sdl2)"',
-        '"pkgconfig(gtk+-3.0)"',
-        '"pkgconfig(ncursesw)"',
-
-        # libs: audio
-        '"pkgconfig(libpulse)"',
-        '"pkgconfig(alsa)"',
-
-        # libs: migration
-        '"pkgconfig(libzstd)"',
-]
-
-    BUILD_SCRIPT = """
-        set -e;
-        rm -rf /home/qemu/qemu-test.*
-        cd $(mktemp -d /home/qemu/qemu-test.XXXXXX);
-        mkdir src build; cd src;
-        tar -xf /dev/vdb;
-        cd ../build
-        ../src/configure --python=python3 {configure_opts};
-        gmake --output-sync -j{jobs} {target} {verbose};
-    """
-
-    def build_image(self, img):
-        self.print_step("Downloading install iso")
-        cimg = self._download_with_cache(self.link, sha256sum=self.csum)
-        img_tmp = img + ".tmp"
-        iso = img + ".install.iso"
-
-        self.print_step("Preparing iso and disk image")
-        subprocess.check_call(["cp", "-f", cimg, iso])
-        self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
-        self.print_step("Booting installer")
-        self.boot(img_tmp, extra_args = [
-            "-machine", "graphics=off",
-            "-device", "VGA",
-            "-cdrom", iso
-        ])
-        self.console_init(300)
-        self.console_wait("installation process.")
-        time.sleep(0.3)
-        self.console_send("\t")
-        time.sleep(0.3)
-        self.console_send(" console=ttyS0")
-        proxy = os.environ.get("http_proxy")
-        if not proxy is None:
-            self.console_send(" proxy=%s" % proxy)
-            self.console_send(" inst.proxy=%s" % proxy)
-        self.console_send(" inst.repo=%s" % self.repo)
-        self.console_send("\n")
-
-        self.console_wait_send("2) Use text mode",         "2\n")
-
-        self.console_wait_send("5) [!] Installation Dest", "5\n")
-        self.console_wait_send("1) [x]",                   "c\n")
-        self.console_wait_send("2) [ ] Use All Space",     "2\n")
-        self.console_wait_send("2) [x] Use All Space",     "c\n")
-        self.console_wait_send("1) [ ] Standard Part",     "1\n")
-        self.console_wait_send("1) [x] Standard Part",     "c\n")
-
-        self.console_wait_send("7) [!] Root password",     "7\n")
-        self.console_wait("Password:")
-        self.console_send("%s\n" % self._config["root_pass"])
-        self.console_wait("Password (confirm):")
-        self.console_send("%s\n" % self._config["root_pass"])
-
-        self.console_wait_send("8) [ ] User creation",     "8\n")
-        self.console_wait_send("1) [ ] Create user",       "1\n")
-        self.console_wait_send("3) User name",             "3\n")
-        self.console_wait_send("ENTER:", "%s\n" % self._config["guest_user"])
-        self.console_wait_send("4) [ ] Use password",      "4\n")
-        self.console_wait_send("5) Password",              "5\n")
-        self.console_wait("Password:")
-        self.console_send("%s\n" % self._config["guest_pass"])
-        self.console_wait("Password (confirm):")
-        self.console_send("%s\n" % self._config["guest_pass"])
-        self.console_wait_send("7) Groups",                "c\n")
-
-        while True:
-            good = self.console_wait("3) [x] Installation",
-                                     "3) [!] Installation")
-            self.console_send("r\n")
-            if good:
-                break
-            time.sleep(10)
-
-        while True:
-            good = self.console_wait("4) [x] Software",
-                                     "4) [!] Software")
-            self.console_send("r\n")
-            if good:
-                break
-            time.sleep(10)
-            self.console_send("r\n" % self._config["guest_pass"])
-
-        self.console_wait_send("'b' to begin install",     "b\n")
-
-        self.print_step("Installation started now, this will take a while")
-
-        self.console_wait_send("Installation complete",    "\n")
-        self.print_step("Installation finished, rebooting")
-
-        # setup qemu user
-        prompt = " ~]$"
-        self.console_ssh_init(prompt, self._config["guest_user"],
-                                      self._config["guest_pass"])
-        self.console_wait_send(prompt, "exit\n")
-
-        # setup root user
-        prompt = " ~]#"
-        self.console_ssh_init(prompt, "root", self._config["root_pass"])
-        self.console_sshd_config(prompt)
-
-        # setup virtio-blk #1 (tarfile)
-        self.console_wait(prompt)
-        self.console_send("echo 'KERNEL==\"vdb\" MODE=\"666\"' >> %s\n" %
-                          "/etc/udev/rules.d/99-qemu.rules")
-
-        self.print_step("Configuration finished, rebooting")
-        self.console_wait_send(prompt, "reboot\n")
-        self.console_wait("login:")
-        self.wait_ssh()
-
-        self.print_step("Installing packages")
-        self.ssh_root_check("rm -vf /etc/yum.repos.d/fedora*.repo\n")
-        self.ssh_root_check("echo '[fedora]' >> /etc/yum.repos.d/qemu.repo\n")
-        self.ssh_root_check("echo 'baseurl=%s' >> /etc/yum.repos.d/qemu.repo\n" % self.full)
-        self.ssh_root_check("echo 'gpgcheck=0' >> /etc/yum.repos.d/qemu.repo\n")
-        self.ssh_root_check("dnf install -y %s\n" % " ".join(self.pkgs))
-
-        # shutdown
-        self.ssh_root(self.poweroff)
-        self.console_wait("sleep state S5")
-        self.wait()
-
-        if os.path.exists(img):
-            os.remove(img)
-        os.rename(img_tmp, img)
-        os.remove(iso)
-        self.print_step("All done")
-
-if __name__ == "__main__":
-    sys.exit(basevm.main(FedoraVM))
-- 
2.31.1


