Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8E4C1D5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 21:56:05 +0200 (CEST)
Received: from localhost ([::1]:41486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdgge-00013a-Ux
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 15:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hdgYt-0003vk-2q
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 15:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hdgYm-00067H-19
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 15:47:59 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hdgYk-0005cj-JO
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 15:47:54 -0400
Received: by mail-wm1-x344.google.com with SMTP id f17so726637wme.2
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldUVv4HTWoARPMqPf3QzxXqOvU9Z7IK4lhIlDlw1SdY=;
 b=oPM1XFjFzZsdkSubeLX9Sws7wmCPsZgO+Z3iM3+cS+lzWom94UKCDiYAZpSiUg1pWF
 +gbokVPf+IqfbRLL27TE9dORPiT+QewwBzsTYdRI27QHXyaDNhRiw4ZBCLENepPrC1BT
 i3LngIqFQ9JHQXYWI3WEC7vzVENMMECFLi73kdmUM31Sf4Utd4VMaYnWLzp92xOZPmfz
 kdb2SUQmt6UpcwZQLse3cyDnfk89rNgPSuiU2xqV3aQ7AWMWcoTg4FVjleapAhcGNtw8
 kBc7a/U1F+DngFxHGWv2EsxDabrxdmlZCWIFA2lSX4HtP1rptyVky8CdVlsnS6UBpJ31
 aiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldUVv4HTWoARPMqPf3QzxXqOvU9Z7IK4lhIlDlw1SdY=;
 b=BZpXJa4bhYJUzkPoCepDUsSRzGZTxi8KJHmXYQfVpLrywdkihFnjUX8ApMjCAiVb89
 B7tPKSKB/zDmsPSgH2558prI2mpf7VtLXjyhILT/rOu3BQmpnlpdc9MP9awC9HhpYZ3U
 AXNaY7feU5c+0pSZg4L02ooSpXaEDj616HBh6Ah3pZPuRetNWjxzd9O9gSFNXBaTO0OM
 86oNWAJYiLCQqi8yGJ7lDSpfLypcRCaYkdp+aya0nU7hN6l5AZHFnohYWHrWDoeIQaDD
 es8s/VXOgvjGeMbvAqW3OiMQWPyvi5jQhkveJvdaeOfvnNfMKKIlUVPrwguBFySn4L0W
 nvPA==
X-Gm-Message-State: APjAAAXabFKQ2euFwdKfXRdzHzTjNHfOZBB8UjfbUVh3ZgceFjpAP3BP
 IkRkxR5bPkEUnlgIks1D8c586A==
X-Google-Smtp-Source: APXvYqwI3w0EsxsmVrLUL5vrkb2gG2QopxbYh/RmW/qp4s3uFvBhSNi1IOUHq4W04i8ceEBmxRIXHw==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr8983195wmk.147.1560973641798; 
 Wed, 19 Jun 2019 12:47:21 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id q193sm2283841wme.8.2019.06.19.12.47.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 12:47:21 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 825451FF87;
 Wed, 19 Jun 2019 20:40:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 20:40:17 +0100
Message-Id: <20190619194021.8240-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619194021.8240-1-alex.bennee@linaro.org>
References: <20190619194021.8240-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH  v1 13/17] tests/vm: netbsd autoinstall,
 using serial console
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Kamil Rytarowski <n54@gmx.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Instead of fetching the prebuilt image from patchew download the install
iso and prepare the image locally.  Install to disk, using the serial
console.  Create qemu user, configure ssh login.  Install packages
needed for qemu builds.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Kamil Rytarowski <n54@gmx.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190617043858.8290-10-kraxel@redhat.com>
[AJB: added tags]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/netbsd | 189 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 179 insertions(+), 10 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index ee9eaeab50..be59a2c1da 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -2,10 +2,11 @@
 #
 # NetBSD VM image
 #
-# Copyright 2017 Red Hat Inc.
+# Copyright 2017-2019 Red Hat Inc.
 #
 # Authors:
 #  Fam Zheng <famz@redhat.com>
+#  Gerd Hoffmann <kraxel@redhat.com>
 #
 # This code is licensed under the GPL version 2 or later.  See
 # the COPYING file in the top-level directory.
@@ -13,30 +14,198 @@
 
 import os
 import sys
+import time
 import subprocess
 import basevm
 
 class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
+
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-8.0/images/NetBSD-8.0-amd64.iso"
+    size = "20G"
+    pkgs = [
+        # tools
+        "git-base",
+        "pkgconf",
+        "xz",
+        "python37",
+
+        # gnu tools
+        "bash",
+        "gmake",
+        "gsed",
+        "flex", "bison",
+
+        # libs: crypto
+        "gnutls",
+
+        # libs: images
+        "jpeg",
+        "png",
+
+	# libs: ui
+        "SDL2",
+        "gtk3+",
+        "libxkbcommon",
+    ]
+
     BUILD_SCRIPT = """
         set -e;
-        rm -rf /var/tmp/qemu-test.*
-        cd $(mktemp -d /var/tmp/qemu-test.XXXXXX);
+        rm -rf /home/qemu/qemu-test.*
+        cd $(mktemp -d /home/qemu/qemu-test.XXXXXX);
+        mkdir src build; cd src;
         tar -xf /dev/rld1a;
-        ./configure --python=python2.7 {configure_opts};
+        cd ../build
+        ../src/configure --python=python3.7 --disable-opengl {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
+    poweroff = "/sbin/poweroff"
 
     def build_image(self, img):
-        cimg = self._download_with_cache("http://download.patchew.org/netbsd-7.1-amd64.img.xz",
-                                         sha256sum='b633d565b0eac3d02015cd0c81440bd8a7a8df8512615ac1ee05d318be015732')
-        img_tmp_xz = img + ".tmp.xz"
+        cimg = self._download_with_cache(self.link)
         img_tmp = img + ".tmp"
-        sys.stderr.write("Extracting the image...\n")
-        subprocess.check_call(["ln", "-f", cimg, img_tmp_xz])
-        subprocess.check_call(["xz", "--keep", "-dvf", img_tmp_xz])
+        iso = img + ".install.iso"
+
+        self.print_step("Preparing iso and disk image")
+        subprocess.check_call(["cp", "-f", cimg, iso])
+        subprocess.check_call(["qemu-img", "create", "-f", "qcow2",
+                               img_tmp, self.size])
+
+        self.print_step("Booting installer")
+        self.boot(img_tmp, extra_args = [
+            "-bios", "pc-bios/bios-256k.bin",
+            "-machine", "graphics=off",
+            "-cdrom", iso
+        ])
+        self.console_init()
+        self.console_wait("Primary Bootstrap")
+
+        # serial console boot menu output doesn't work for some
+        # reason, so we have to fly blind ...
+        for char in list("5consdev com0\n"):
+            time.sleep(0.2)
+            self.console_send(char)
+            self.console_wait("")
+        self.console_wait_send("> ", "boot\n")
+
+        self.console_wait_send("Terminal type",            "xterm\n")
+        self.console_wait_send("a: Installation messages", "a\n")
+        self.console_wait_send("b: US-English",            "b\n")
+        self.console_wait_send("a: Install NetBSD",        "a\n")
+        self.console_wait("Shall we continue?")
+        self.console_wait_send("b: Yes",                   "b\n")
+
+        self.console_wait_send("a: ld0",                   "a\n")
+        self.console_wait_send("a: This is the correct",   "a\n")
+        self.console_wait_send("b: Use the entire disk",   "b\n")
+        self.console_wait("NetBSD bootcode")
+        self.console_wait_send("a: Yes",                   "a\n")
+        self.console_wait_send("b: Use existing part",     "b\n")
+        self.console_wait_send("x: Partition sizes ok",    "x\n")
+        self.console_wait_send("for your NetBSD disk",     "\n")
+        self.console_wait("Shall we continue?")
+        self.console_wait_send("b: Yes",                   "b\n")
+
+        self.console_wait_send("b: Use serial port com0",  "b\n")
+        self.console_wait_send("f: Set serial baud rate",  "f\n")
+        self.console_wait_send("a: 9600",                  "a\n")
+        self.console_wait_send("x: Exit",                  "x\n")
+
+        self.console_wait_send("a: Full installation",     "a\n")
+        self.console_wait_send("a: CD-ROM",                "a\n")
+
+        self.print_step("Installation started now, this will take a while")
+        self.console_wait_send("Hit enter to continue",    "\n")
+
+        self.console_wait_send("d: Change root password",  "d\n")
+        self.console_wait_send("a: Yes",                   "a\n")
+        self.console_wait("New password:")
+        self.console_send("%s\n" % self.ROOT_PASS)
+        self.console_wait("New password:")
+        self.console_send("%s\n" % self.ROOT_PASS)
+        self.console_wait("Retype new password:")
+        self.console_send("%s\n" % self.ROOT_PASS)
+
+        self.console_wait_send("o: Add a user",            "o\n")
+        self.console_wait("username")
+        self.console_send("%s\n" % self.GUEST_USER)
+        self.console_wait("to group wheel")
+        self.console_wait_send("a: Yes",                   "a\n")
+        self.console_wait_send("a: /bin/sh",               "a\n")
+        self.console_wait("New password:")
+        self.console_send("%s\n" % self.GUEST_PASS)
+        self.console_wait("New password:")
+        self.console_send("%s\n" % self.GUEST_PASS)
+        self.console_wait("Retype new password:")
+        self.console_send("%s\n" % self.GUEST_PASS)
+
+        self.console_wait_send("a: Configure network",     "a\n")
+        self.console_wait_send("a: vioif0",                "a\n")
+        self.console_wait_send("Network media type",       "\n")
+        self.console_wait("autoconfiguration")
+        self.console_wait_send("a: Yes",                   "a\n")
+        self.console_wait_send("DNS domain",               "localnet\n")
+        self.console_wait("Are they OK?")
+        self.console_wait_send("a: Yes",                   "a\n")
+        self.console_wait("installed in /etc")
+        self.console_wait_send("a: Yes",                   "a\n")
+
+        self.console_wait_send("e: Enable install",        "e\n")
+        proxy = os.environ.get("http_proxy")
+        if not proxy is None:
+            self.console_wait_send("f: Proxy",             "f\n")
+            self.console_wait("Proxy")
+            self.console_send("%s\n" % proxy)
+        self.console_wait_send("x: Install pkgin",         "x\n")
+        self.console_init(1200)
+        self.console_wait_send("Hit enter to continue", "\n")
+        self.console_init()
+
+        self.console_wait_send("g: Enable sshd",           "g\n")
+        self.console_wait_send("x: Finished conf",         "x\n")
+        self.console_wait_send("Hit enter to continue",    "\n")
+
+        self.print_step("Installation finished, rebooting")
+        self.console_wait_send("d: Reboot the computer",   "d\n")
+
+        # setup qemu user
+        prompt = "localhost$"
+        self.console_ssh_init(prompt, self.GUEST_USER, self.GUEST_PASS)
+        self.console_wait_send(prompt, "exit\n")
+
+        # setup root user
+        prompt = "localhost#"
+        self.console_ssh_init(prompt, "root", self.ROOT_PASS)
+        self.console_sshd_config(prompt)
+
+        # setup virtio-blk #1 (tarfile)
+        self.console_wait(prompt)
+        self.console_send("echo 'chmod 666 /dev/rld1a' >> /etc/rc.local\n")
+
+        # turn off mprotect (conflicts with tcg)
+        self.console_wait(prompt)
+        self.console_send("echo security.pax.mprotect.enabled=0 >> /etc/sysctl.conf\n")
+
+        self.print_step("Configuration finished, rebooting")
+        self.console_wait_send(prompt, "reboot\n")
+        self.console_wait("login:")
+        self.wait_ssh()
+
+        self.print_step("Installing packages")
+        self.ssh_root_check("pkgin update\n")
+        self.ssh_root_check("pkgin -y install %s\n" % " ".join(self.pkgs))
+
+        # shutdown
+        self.ssh_root(self.poweroff)
+        self.console_wait("entering state S5")
+        self.wait()
+
+        if os.path.exists(img):
+            os.remove(img)
         os.rename(img_tmp, img)
+        os.remove(iso)
+        self.print_step("All done")
 
 if __name__ == "__main__":
     sys.exit(basevm.main(NetBSDVM))
-- 
2.20.1


