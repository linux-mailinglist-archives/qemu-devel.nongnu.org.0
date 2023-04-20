Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A66E8FC5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:15:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHp-00014g-7w; Thu, 20 Apr 2023 06:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHg-0000y7-EM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHa-00084e-5E
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kc1tYvJuyTeeK8Dav2IAukLWi/glVQlGwism2ORzkZU=;
 b=HmD+HTiJlBjnWDxTzlXJUygfrPzAZIq/cCbanMyTAJVV6N0XjWFSPeFHg4Lb4X8Raycqud
 sXXHDnS0exDyU5Wlz2a9qz0aH00yaRpaZX/WdZeHbgoSzwV1j/l0mevyqqDJfxGIqWYqD+
 nOzXP47uQxcUF1QYoOYGe6BLEwMpYtY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-Bl0QPdQaNZGZFFTsKCiXHA-1; Thu, 20 Apr 2023 06:12:50 -0400
X-MC-Unique: Bl0QPdQaNZGZFFTsKCiXHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B91853C1484E;
 Thu, 20 Apr 2023 10:12:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8DEC5AB7A;
 Thu, 20 Apr 2023 10:12:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Subject: [PULL 23/23] tests/vm/freebsd: Update to FreeBSD 13.2
Date: Thu, 20 Apr 2023 12:12:16 +0200
Message-Id: <20230420101216.786304-24-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

According to QEMU's support policy, we stop supporting the previous
major release two years after the the new major release has been
published. So we can stop testing FreeBSD 12 now and should switch
our FreeBSD VM to version 13 instead.

Some changes are needed for this update: The downloadable .ISO images
do not use the serial port as console by default anymore, so they
are not usable in the same way as with FreeBSD 12. Fortunately, the
FreeBSD project now also offers some pre-installed CI images that
have the serial console enabled, so we can use those now, with the
benefit that we can skip almost all parts of the previous installation
process.

Message-Id: <20230419144553.719749-1-thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/freebsd | 101 ++++++++++++-----------------------------------
 1 file changed, 25 insertions(+), 76 deletions(-)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index ba2ba23d24..11de6473f4 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -28,15 +28,15 @@ class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz"
-    csum = "1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af6138ee4b181ed719a87"
+    link = "https://download.freebsd.org/releases/CI-IMAGES/13.2-RELEASE/amd64/Latest/FreeBSD-13.2-RELEASE-amd64-BASIC-CI.raw.xz"
+    csum = "a4fb3b6c7b75dd4d58fb0d75e4caf72844bffe0ca00e66459c028b198ffb3c0e"
     size = "20G"
     pkgs = [
         # build tools
         "git",
         "pkgconf",
         "bzip2",
-        "python37",
+        "python39",
         "ninja",
 
         # gnu tools
@@ -78,72 +78,42 @@ class FreeBSDVM(basevm.BaseVM):
         mkdir src build; cd src;
         tar -xf /dev/vtbd1;
         cd ../build
-        ../src/configure --python=python3.7 {configure_opts};
+        ../src/configure --python=python3.9 {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
 
-    def console_boot_serial(self):
-        self.console_wait_send("Autoboot", "3")
-        self.console_wait_send("OK", "set console=comconsole\n")
-        self.console_wait_send("OK", "boot\n")
-
     def build_image(self, img):
-        self.print_step("Downloading install iso")
+        self.print_step("Downloading disk image")
         cimg = self._download_with_cache(self.link, sha256sum=self.csum)
-        img_tmp = img + ".tmp"
-        iso = img + ".install.iso"
-        iso_xz = iso + ".xz"
-
-        self.print_step("Preparing iso and disk image")
-        subprocess.check_call(["cp", "-f", cimg, iso_xz])
-        subprocess.check_call(["xz", "-dvf", iso_xz])
-        self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
-
-        self.print_step("Booting installer")
+        tmp_raw = img + ".tmp.raw"
+        tmp_raw_xz = tmp_raw + ".xz"
+        img_tmp = img + ".tmp.qcow2"
+
+        self.print_step("Preparing disk image")
+        subprocess.check_call(["cp", "-f", cimg, tmp_raw_xz])
+        subprocess.check_call(["xz", "-dvf", tmp_raw_xz])
+        self.exec_qemu_img("convert", "-O", "qcow2", tmp_raw, img_tmp)
+        self.exec_qemu_img("resize", img_tmp, self.size)
+        os.remove(tmp_raw)
+
+        self.print_step("Preparing disk image")
         self.boot(img_tmp, extra_args = [
             "-machine", "graphics=off",
-            "-device", "VGA",
-            "-cdrom", iso
+            "-vga", "none"
         ])
         self.console_init()
-        self.console_boot_serial()
-        self.console_wait_send("Console type",          "xterm\n")
-
-        # pre-install configuration
-        self.console_wait_send("Welcome",               "\n")
-        self.console_wait_send("Keymap Selection",      "\n")
-        self.console_wait_send("Set Hostname",          "freebsd\n")
-        self.console_wait_send("Distribution Select",   "\n")
-        self.console_wait_send("Partitioning",          "\n")
-        self.console_wait_send("Partition",             "\n")
-        self.console_wait_send("Scheme",                "\n")
-        self.console_wait_send("Editor",                "f")
-        self.console_wait_send("Confirmation",          "c")
-
-        self.print_step("Installation started now, this will take a while")
-
-        # post-install configuration
+        self.console_wait_send("login:", "root\n")
+        self.console_wait_send("~ #", "service growfs onestart\n")
+
+        # root user
+        self.console_wait_send("~ #", "passwd\n")
         self.console_wait("New Password:")
         self.console_send("%s\n" % self._config["root_pass"])
         self.console_wait("Retype New Password:")
         self.console_send("%s\n" % self._config["root_pass"])
 
-        self.console_wait_send("Network Configuration", "\n")
-        self.console_wait_send("IPv4",                  "y")
-        self.console_wait_send("DHCP",                  "y")
-        self.console_wait_send("IPv6",                  "n")
-        self.console_wait_send("Resolver",              "\n")
-
-        self.console_wait_send("Time Zone Selector",    "0\n")
-        self.console_wait_send("Confirmation",          "y")
-        self.console_wait_send("Time & Date",           "\n")
-        self.console_wait_send("Time & Date",           "\n")
-
-        self.console_wait_send("System Configuration",  "\n")
-        self.console_wait_send("System Hardening",      "\n")
-
         # qemu user
-        self.console_wait_send("Add User Accounts", "y")
+        self.console_wait_send("~ #", "adduser\n")
         self.console_wait("Username")
         self.console_send("%s\n" % self._config["guest_user"])
         self.console_wait("Full name")
@@ -165,13 +135,7 @@ class FreeBSDVM(basevm.BaseVM):
         self.console_wait_send("Lock out",              "\n")
         self.console_wait_send("OK",                    "yes\n")
         self.console_wait_send("Add another user",      "no\n")
-
-        self.console_wait_send("Final Configuration",   "\n")
-        self.console_wait_send("Manual Configuration",  "\n")
-        self.console_wait_send("Complete",              "\n")
-
-        self.print_step("Installation finished, rebooting")
-        self.console_boot_serial()
+        self.console_wait_send("~ #", "exit\n")
 
         # setup qemu user
         prompt = "$"
@@ -183,35 +147,20 @@ class FreeBSDVM(basevm.BaseVM):
         self.console_ssh_init(prompt, "root", self._config["root_pass"])
         self.console_sshd_config(prompt)
 
-        # setup serial console
-        self.console_wait(prompt)
-        self.console_send("echo 'console=comconsole' >> /boot/loader.conf\n")
-
-        # setup boot delay
-        self.console_wait(prompt)
-        self.console_send("echo 'autoboot_delay=1' >> /boot/loader.conf\n")
-
         # setup virtio-blk #1 (tarfile)
         self.console_wait(prompt)
         self.console_send("echo 'chmod 666 /dev/vtbd1' >> /etc/rc.local\n")
 
-        self.print_step("Configuration finished, rebooting")
-        self.console_wait_send(prompt, "reboot\n")
-        self.console_wait("login:")
-        self.wait_ssh()
-
         self.print_step("Installing packages")
         self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
 
         # shutdown
         self.ssh_root(self.poweroff)
-        self.console_wait("Uptime:")
         self.wait()
 
         if os.path.exists(img):
             os.remove(img)
         os.rename(img_tmp, img)
-        os.remove(iso)
         self.print_step("All done")
 
 if __name__ == "__main__":
-- 
2.31.1


