Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB9387B3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 12:12:25 +0200 (CEST)
Received: from localhost ([::1]:47880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZBrE-00085o-89
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 06:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42226)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAvT-0002H6-QI
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:12:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAvQ-0004zn-Un
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:12:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hZAvQ-0004qw-Hz
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:12:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id m3so1390662wrv.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FsH9fIoqslU5eUblZQD4hWHct1S0ABTNMLOgnPxlbLE=;
 b=aWXmPjGBy4Ril9qJecr8mYSOCksXK4aMrQUZ+rnS+4GKeMJdTyJdYGI0FcDR4KnwHG
 KM5v7XB+1zWm5xtiObxyl8iAob0s1Vu9Qak8sdT1E/DyJMxXGcDEKv/Js4oNDr+G97kB
 95wfTfCsLv+vP0Vsk0QWe32KPzaUQLtBlQdk0HF36N7S+K3zTsLmyoc8lfMwXcGCFHQM
 e3wS9Xttzez9iQJiYYpcMdmFfBjFiVBemzUS3rqcjGxOrxFjuRsF4SFRV738fKePRu66
 tP6KalD9v3I1Yylm/3Y+YZGM8KTAgLEtvcT1nul4g7wnKES06n5js1gQjgUi8ZBfFg2v
 iCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FsH9fIoqslU5eUblZQD4hWHct1S0ABTNMLOgnPxlbLE=;
 b=qTl6wWLA5pokSU/9P2UWPrM4a2nCEWtBvy6jab2uYSpGD0wQoyI0TnfSxirJttIFvU
 rJnLKXK3rxBVDfnJhNtu1SU8579FYkfBqlbn1bjVGyiDosog5aLLJ/PZu7sptNDwPXl1
 TzElLjvUcPvbGAhh9DbHd2+fwul6T942XvPkydlfIzziZD+qsnoJdvj9rWlcVQ8XsBC4
 pYCM0I4pbtHc1TY0x3oPDa39kgPCqBLhRHwhIQt8BG3UdaqMIXkCzB2BxWDcQSo2ZOm4
 V18yULHWZqE73nkFcLM3ETQOoCIz28RWILrX8fbvzRK74Z8gVF6V3/sNrxAG/1Fv6qiu
 /rYw==
X-Gm-Message-State: APjAAAX42ZibPA16XGYhDPbkRz7390+6pd4JsHSZou6PvfLUespy92ns
 tHzZgJ981uRfQhwA59GCvhjmOw==
X-Google-Smtp-Source: APXvYqwZP5JsqRUDTMi4MveI4gn71e5lqk6ykHu2tuveFPjBBVWCDm1OMEPg8qEfZsXUFSaA/xDMHA==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr7693721wrw.199.1559898756884; 
 Fri, 07 Jun 2019 02:12:36 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id s8sm2078626wra.55.2019.06.07.02.12.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 02:12:34 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D208C1FFAB;
 Fri,  7 Jun 2019 10:05:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Fri,  7 Jun 2019 10:05:22 +0100
Message-Id: <20190607090552.12434-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607090552.12434-1-alex.bennee@linaro.org>
References: <20190607090552.12434-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
Subject: [Qemu-devel] [PULL 23/52] tests/vm: netbsd autoinstall,
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
 qemu-devel@nongnu.org, Kamil Rytarowski <kamil@netbsd.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Kamil Rytarowski <n54@gmx.com>,
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
Message-Id: <20190520124716.30472-13-kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 4c6624ea5e..6dbfc1b0fb 100755
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
@@ -13,32 +14,198 @@
 
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
-        subprocess.check_call(["cp", "-f", cimg, img_tmp_xz])
-        subprocess.check_call(["xz", "-dvf", img_tmp_xz])
+        iso = img + ".install.iso"
+
+        self.print_step("Preparing iso and disk image")
+        subprocess.check_call(["cp", "-f", cimg, iso])
+        subprocess.check_call(["qemu-img", "create", "-f", "qcow2",
+                               img_tmp, self.size])
+
+        self.print_step("Booting installer")
+        self.boot(img_tmp, extra_args = [
+            "-device", "VGA",
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
         if os.path.exists(img):
             os.remove(img)
         os.rename(img_tmp, img)
+        os.remove(iso)
+        self.print_step("All done")
 
 if __name__ == "__main__":
     sys.exit(basevm.main(NetBSDVM))
-- 
2.20.1


