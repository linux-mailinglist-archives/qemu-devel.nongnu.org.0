Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70E164B77
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 18:05:39 +0100 (CET)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4Sn4-0005J8-3F
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 12:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1j4SOS-0003ZU-W9
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:40:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1j4SOQ-0008Cl-Lm
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:40:12 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38144)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1j4SOQ-0008CG-DQ
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:40:10 -0500
Received: by mail-pg1-x52a.google.com with SMTP id d6so365188pgn.5
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U8AhPED6ldfYVbeLlC+RLh2FFh/ALLPiS0HEVCLcfeY=;
 b=mcTDaPA/mHo4iF8sV4E2MJ56/fJosZdt+1qjCoOG2YgapwbOFkQNkaRW5E/rYgGgu2
 VmfOKJXmsvGTIX9Z7jPvoVm7tmevVBmt+/Dl4d/16VcD7kBBnpqA0sWHbxQ0sS0KDgOj
 wLtOy8nawFAlaiJSPT3GLnHWmLUqAMzD1JqJYzphNDmF74PChYAiqYKGYk7JSYOCZRwg
 NSYhNvHBt6cF1xHTc7TXJg85Cp3RB97TTfdp2eDLhpg5DkHCEsvmbMzq2NwzTuedxCiJ
 wP5Dg54P5WO1V13zbnKEygGYdFVcDbWF0msM2Db2i+ihJ72Uknny6ohTIWyG0pPkTC6A
 LqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U8AhPED6ldfYVbeLlC+RLh2FFh/ALLPiS0HEVCLcfeY=;
 b=kU8pLgNcLCzMd1ZC7m78du5jPzScvihQXm1tryn+BSDCSzX2pKbigN3EKbzP43LPId
 ZQ93z54yJncxkcWQfYybD8xZCyhljP8TiygWWnRq9EcWHCGNRmhtTJL/F23esHR1WM9z
 V5Qa7IavjlHJfBDUyjhC9MHaACYNa5xDtUErcAXUqufPGDj/FNwCf5RvpIO6p4EpNXem
 XKOpHhZAA7emdnuavyNX0o5EE0Ze7pepvHtG9RQTAvEa6hmiv7bRKj+e2jyPoXEG1NHo
 feZMkSjaIhI5Cv0DOdGKeXW0AlXeudaTnQ6AoGFzcA4p+oEoq75oFRUXboilLM+vCYS8
 orcg==
X-Gm-Message-State: APjAAAU5hoey/LVKHNLRhe27sV2tHFCBMZEcDa1B46+o/NZdtA5a0wHM
 82Xfk2RommbJ9q+9uwBf2gSCKlCoN+Q=
X-Google-Smtp-Source: APXvYqyKdIsuZNj8ufRAQoSrOs2cu+Wxd9xirckU/WVfsHnVjf82CO2UmCSDMhHFRdh4URLnZ044hw==
X-Received: by 2002:a62:cfc1:: with SMTP id b184mr27278036pfg.55.1582130408674; 
 Wed, 19 Feb 2020 08:40:08 -0800 (PST)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:3cc2:5eb7:e248:ad23])
 by smtp.gmail.com with ESMTPSA id a69sm112362pfa.129.2020.02.19.08.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:40:08 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/14] tests/vm: Added a new script for centos.aarch64.
Date: Wed, 19 Feb 2020 11:35:36 -0500
Message-Id: <20200219163537.22098-14-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219163537.22098-1-robert.foley@linaro.org>
References: <20200219163537.22098-1-robert.foley@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52a
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
Cc: philmd@redhat.com, alex.bennee@linaro.org, robert.foley@linaro.org,
 peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

centos.aarch64 creates a CentOS 8 image.
Also added a new kickstart script used to build the centos.aarch64 image.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 tests/vm/Makefile.include    |   3 +-
 tests/vm/centos-8-aarch64.ks |  51 ++++++++
 tests/vm/centos.aarch64      | 224 +++++++++++++++++++++++++++++++++++
 3 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 tests/vm/centos-8-aarch64.ks
 create mode 100755 tests/vm/centos.aarch64

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 9dfa517936..bb41bc255f 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -2,7 +2,7 @@
 
 .PHONY: vm-build-all vm-clean-all
 
-IMAGES := ubuntu.i386 freebsd netbsd openbsd centos fedora ubuntu.aarch64
+IMAGES := ubuntu.i386 freebsd netbsd openbsd centos fedora ubuntu.aarch64 centos.aarch64
 IMAGES_DIR := $(HOME)/.cache/qemu-vm/images
 IMAGE_FILES := $(patsubst %, $(IMAGES_DIR)/%.img, $(IMAGES))
 
@@ -19,6 +19,7 @@ vm-help vm-test:
 	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
 	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
 	@echo "  vm-build-ubuntu.aarch64         - Build QEMU in ubuntu aarch64 VM"
+	@echo "  vm-build-centos.aarch64         - Build QEMU in CentOS aarch64 VM"
 	@echo ""
 	@echo "  vm-build-all                    - Build QEMU in all VMs"
 	@echo "  vm-clean-all                    - Clean up VM images"
diff --git a/tests/vm/centos-8-aarch64.ks b/tests/vm/centos-8-aarch64.ks
new file mode 100644
index 0000000000..fd6ebe4d49
--- /dev/null
+++ b/tests/vm/centos-8-aarch64.ks
@@ -0,0 +1,51 @@
+# CentOS aarch64 image kickstart file.
+# This file is used by the CentOS installer to
+# script the generation of the image.
+#
+# Copyright 2020 Linaro
+#
+ignoredisk --only-use=vda
+# System bootloader configuration
+bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
+autopart --type=plain
+# Partition clearing information
+clearpart --linux --initlabel --drives=vda
+# Use text mode install
+text
+repo --name="AppStream" --baseurl=file:///run/install/repo/AppStream
+# Use CDROM installation media
+cdrom
+# Keyboard layouts
+keyboard --vckeymap=us --xlayouts=''
+# System language
+lang en_US.UTF-8
+
+# Network information
+network  --bootproto=dhcp --device=enp0s1 --onboot=off --ipv6=auto --no-activate
+network  --hostname=localhost.localdomain
+# Run the Setup Agent on first boot
+firstboot --enable
+# Do not configure the X Window System
+skipx
+# System services
+services --enabled="chronyd"
+# System timezone
+timezone America/New_York --isUtc
+
+# Shutdown after installation is complete.
+shutdown
+
+%packages
+@^server-product-environment
+kexec-tools
+
+%end
+
+%addon com_redhat_kdump --enable --reserve-mb='auto'
+
+%end
+%anaconda
+pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
+pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
+pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
+%end
diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
new file mode 100755
index 0000000000..c4a020dc4c
--- /dev/null
+++ b/tests/vm/centos.aarch64
@@ -0,0 +1,224 @@
+#!/usr/bin/env python3
+#
+# Centos aarch64 image
+#
+# Copyright 2020 Linaro
+#
+# Authors:
+#  Robert Foley <robert.foley@linaro.org>
+#  Originally based on ubuntu.aarch64
+#
+# This code is licensed under the GPL version 2 or later.  See
+# the COPYING file in the top-level directory.
+#
+
+import os
+import sys
+import subprocess
+import basevm
+import time
+import traceback
+import aarch64vm
+
+DEFAULT_CONFIG = {
+    'cpu'          : "max",
+    'machine'      : "virt,gic-version=max",
+    'install_cmds' : "yum install -y make git python3 gcc gcc-c++ flex bison, "\
+        "yum install -y glib2-devel pixman-devel zlib-devel, "\
+        "yum install -y perl-Test-Harness, "\
+        "sudo dnf config-manager "\
+        "--add-repo=https://download.docker.com/linux/centos/docker-ce.repo,"\
+        "sudo dnf install --nobest -y docker-ce.aarch64,"\
+        "systemctl enable docker",
+    # We increase beyond the default time since during boot
+    # it can take some time (many seconds) to log into the VM.
+    'ssh_timeout'  : 60,
+}
+
+class CentosAarch64VM(basevm.BaseVM):
+    name = "centos.aarch64"
+    arch = "aarch64"
+    login_prompt = "localhost login:"
+    prompt = '[root@localhost ~]#'
+    image_name = "CentOS-8-aarch64-1905-dvd1.iso"
+    image_link = "http://mirrors.usc.edu/pub/linux/distributions/centos/8.0.1905/isos/aarch64/"
+    image_link += image_name
+    BUILD_SCRIPT = """
+        set -e;
+        cd $(mktemp -d);
+        sudo chmod a+r /dev/vdb;
+        tar --checkpoint=.10 -xf /dev/vdb;
+        ./configure {configure_opts};
+        make --output-sync {target} -j{jobs} {verbose};
+    """
+    def set_key_perm(self):
+        """Set permissions properly on certain files to allow
+           ssh access."""
+        self.console_wait_send(self.prompt,
+                               "/usr/sbin/restorecon -R -v /root/.ssh\n")
+        self.console_wait_send(self.prompt,
+                "/usr/sbin/restorecon -R -v "\
+                "/home/{}/.ssh\n".format(self._config["guest_user"]))
+
+    def create_kickstart(self):
+        """Generate the kickstart file used to generate the centos image."""
+        # Start with the template for the kickstart.
+        ks_file = "../tests/vm/centos-8-aarch64.ks"
+        subprocess.check_call("cp {} ./ks.cfg".format(ks_file), shell=True)
+        # Append the ssh keys to the kickstart file
+        # as the post processing phase of installation.
+        with open("ks.cfg", "a") as f:
+            # Add in the root pw and guest user.
+            rootpw = "rootpw --plaintext {}\n"
+            f.write(rootpw.format(self._config["root_pass"]))
+            add_user = "user --groups=wheel --name={} "\
+                       "--password={} --plaintext\n"
+            f.write(add_user.format(self._config["guest_user"],
+                                    self._config["guest_pass"]))
+            # Add the ssh keys.
+            f.write("%post --log=/root/ks-post.log\n")
+            f.write("mkdir -p /root/.ssh\n")
+            addkey = 'echo "{}" >> /root/.ssh/authorized_keys\n'
+            addkey_cmd = addkey.format(self._config["ssh_pub_key"])
+            f.write(addkey_cmd)
+            f.write('mkdir -p /home/{}/.ssh\n'.format(self._config["guest_user"]))
+            addkey = 'echo "{}" >> /home/{}/.ssh/authorized_keys\n'
+            addkey_cmd = addkey.format(self._config["ssh_pub_key"],
+                                       self._config["guest_user"])
+            f.write(addkey_cmd)
+            f.write("%end\n")
+        # Take our kickstart file and create an .iso from it.
+        # The .iso will be provided to qemu as we boot
+        # from the install dvd.
+        # Anaconda will recognize the label "OEMDRV" and will
+        # start the automated installation.
+        gen_iso_img = 'genisoimage -output ks.iso -volid "OEMDRV" ks.cfg'
+        subprocess.check_call(gen_iso_img, shell=True)
+
+    def wait_for_shutdown(self):
+        """We wait for qemu to shutdown the VM and exit.
+           While this happens we display the console view
+           for easier debugging."""
+        # The image creation is essentially done,
+        # so whether or not the wait is successful we want to
+        # wait for qemu to exit (the self.wait()) before we return.
+        try:
+            self.console_wait("reboot: Power down")
+        except Exception as e:
+            sys.stderr.write("Exception hit\n")
+            if isinstance(e, SystemExit) and e.code == 0:
+                return 0
+            traceback.print_exc()
+        finally:
+            self.wait()
+
+    def build_base_image(self, dest_img):
+        """Run through the centos installer to create
+           a base image with name dest_img."""
+        # We create the temp image, and only rename
+        # to destination when we are done.
+        img = dest_img + ".tmp"
+        # Create an empty image.
+        # We will provide this as the install destination.
+        qemu_img_create = "qemu-img create {} 50G".format(img)
+        subprocess.check_call(qemu_img_create, shell=True)
+
+        # Create our kickstart file to be fed to the installer.
+        self.create_kickstart()
+        # Boot the install dvd with the params as our ks.iso
+        os_img = self._download_with_cache(self.image_link)
+        dvd_iso = "centos-8-dvd.iso"
+        subprocess.check_call(["cp", "-f", os_img, dvd_iso])
+        extra_args = "-cdrom ks.iso"
+        extra_args += " -drive file={},if=none,id=drive1,cache=writeback"
+        extra_args += " -device virtio-blk,drive=drive1,bootindex=1"
+        extra_args = extra_args.format(dvd_iso).split(" ")
+        self.boot(img, extra_args=extra_args)
+        self.console_wait_send("change the selection", "\n")
+        # We seem to need to hit esc (chr(27)) twice to abort the
+        # media check, which takes a long time.
+        # Waiting a bit seems to be more reliable before hitting esc.
+        self.console_wait("Checking")
+        time.sleep(5)
+        self.console_wait_send("Checking", chr(27))
+        time.sleep(5)
+        self.console_wait_send("Checking", chr(27))
+        print("Found Checking")
+        self.wait_for_shutdown()
+        os.rename(img, dest_img)
+        print("Done with base image build: {}".format(dest_img))
+
+    def check_create_base_img(self, img_base, img_dest):
+        """Create a base image using the installer.
+           We will use the base image if it exists.
+           This helps cut down on install time in case we
+           need to restart image creation,
+           since the base image creation can take a long time."""
+        if not os.path.exists(img_base):
+            print("Generate new base image: {}".format(img_base))
+            self.build_base_image(img_base);
+        else:
+            print("Use existing base image: {}".format(img_base))
+        # Save a copy of the base image and copy it to dest.
+        # which we will use going forward.
+        subprocess.check_call(["cp", img_base, img_dest])
+
+    def boot(self, img, extra_args=None):
+        aarch64vm.create_flash_images(self._tmpdir)
+        default_args = aarch64vm.get_pflash_args(self._tmpdir)
+        if extra_args:
+            extra_args.extend(default_args)
+        else:
+            extra_args = default_args
+        # We always add these performance tweaks
+        # because without them, we boot so slowly that we
+        # can time out finding the boot efi device.
+        if '-smp' not in extra_args and \
+           '-smp' not in self._config['extra_args'] and \
+           '-smp' not in self._args:
+            # Only add if not already there to give caller option to change it.
+            extra_args.extend(["-smp", "8"])
+        # We have overridden boot() since aarch64 has additional parameters.
+        # Call down to the base class method.
+        super(CentosAarch64VM, self).boot(img, extra_args=extra_args)
+
+    def build_image(self, img):
+        img_tmp = img + ".tmp"
+        self.check_create_base_img(img + ".base", img_tmp)
+
+        # Boot the new image for the first time to finish installation.
+        self.boot(img_tmp)
+        self.console_init()
+        self.console_wait_send(self.login_prompt, "root\n")
+        self.console_wait_send("Password:",
+                               "{}\n".format(self._config["root_pass"]))
+
+        self.set_key_perm()
+        self.console_wait_send(self.prompt, "rpm -q centos-release\n")
+        enable_adapter = "sed -i 's/ONBOOT=no/ONBOOT=yes/g'" \
+                         " /etc/sysconfig/network-scripts/ifcfg-enp0s1\n"
+        self.console_wait_send(self.prompt, enable_adapter)
+        self.console_wait_send(self.prompt, "ifup enp0s1\n")
+        self.console_wait_send(self.prompt,
+                               'echo "qemu  ALL=(ALL) NOPASSWD:ALL" | '\
+                               'sudo tee /etc/sudoers.d/qemu\n')
+        self.console_wait(self.prompt)
+
+        # Rest of the commands we issue through ssh.
+        self.wait_ssh(wait_root=True)
+
+        # If the user chooses *not* to do the second phase,
+        # then we will jump right to the graceful shutdown
+        if self._config['install_cmds'] != "":
+            install_cmds = self._config['install_cmds'].split(',')
+            for cmd in install_cmds:
+                self.ssh_root(cmd)
+        self.ssh_root("poweroff")
+        self.wait_for_shutdown()
+        os.rename(img_tmp, img)
+        print("image creation complete: {}".format(img))
+        return 0
+
+if __name__ == "__main__":
+    defaults = aarch64vm.get_config_defaults(CentosAarch64VM, DEFAULT_CONFIG)
+    sys.exit(basevm.main(CentosAarch64VM, defaults))
-- 
2.17.1


