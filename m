Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2429263D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 13:12:11 +0200 (CEST)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUT5H-0002ME-0B
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 07:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUT1D-00006s-CU
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 07:07:59 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUT1B-0003i8-FW
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 07:07:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id k18so12359625wmj.5
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rb3y84Dw5dpACWHtS+71U7Ao2OMWoaEhLj1rVe+bZNw=;
 b=tv4FOI23oZHSwRUYw90l36Eh5jmtsoKZ3fGxLDzXBbNMbzXbJtPrpVvWBbwbr9p+X7
 EGtG77DXpNZQEeG7kpoWAXHygEG/EMtemyQGLfRDsEIwPfEB4Ny5Ch4xeSoJbHzY5bBk
 g622Bbp7MGR92Vh1iOQ6ruI9sR1hKSaOX04lVz7iXeH7R+fMpfUwwrGxY/nqEnJAPpPO
 OiHA0TtBzzxPKB0caBm821Z3LqVp8RRsmTXVHsUPRgtf7KyEbvPUy+3RmrDgQ/mIn4L5
 V92Nq9yJYXw4OA9rsOedLK1vh6CL/8ECa3qMNsYEDAHsePp8oxb8kXOOH3rqLJWRLtIq
 rj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rb3y84Dw5dpACWHtS+71U7Ao2OMWoaEhLj1rVe+bZNw=;
 b=i+wrKCUiFtOOFqbvs7f4PXA23k8YSdqe1/Bwyqjs+mq1OfVFX7IxgJR2V2Rwn00sfc
 VXhcdHAxLoxv3+AV67V5EQH5DeC+699YsoSCcJ2zN8B2l+WLSc2H0GVHhJ9C0uhTlsRU
 DyX0rRTnLemRsajfnWqZANY72eahmx1cxNccMRjxbXY5Obx4bXNQZsQb6nyD5L8rlOoB
 8MLPmClw1M/Mh6HJ+GxD7cQxEaDBzKPKQwIw1cIy6pVoGuaengD5isBg+ISTzDuVBtlh
 XSiAqW3v00lscbfEhvqoI6iRpQfndBbXw4efqq2SAbgDDMCTKL3jXt2nHUxyv7fKAjsW
 hjqg==
X-Gm-Message-State: AOAM532pvH8ARcKtJglqkDv6LFmXH2OEHu83oBJGhNda9WAIsN3YV4+a
 E1i5fxv2ifH+JbARN7KQV6+QJf9WMBE=
X-Google-Smtp-Source: ABdhPJyQxODhsacLSpC3dsfwaFnSO6yftYcpf9n682liWfjwaINzNicY76PxH2FSvDXk1ByOd5eg3g==
X-Received: by 2002:a1c:2108:: with SMTP id h8mr16907258wmh.63.1603105675551; 
 Mon, 19 Oct 2020 04:07:55 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id q8sm17860168wro.32.2020.10.19.04.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 04:07:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 1/1] tests/vm: Add Haiku test based on their vagrant
 images
Date: Mon, 19 Oct 2020 13:07:49 +0200
Message-Id: <20201019110749.1635343-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019110749.1635343-1-f4bug@amsat.org>
References: <20201019110749.1635343-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_BTC_ID=0.499,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander von Gluck IV <kallisti5@unixzen.com>

Signed-off-by: Alexander von Gluck IV <kallisti5@unixzen.com>
[PMD: Avoid to recreate the image each time]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/keys/vagrant        |  27 +++++++++
 tests/keys/vagrant.pub    |   1 +
 tests/vm/Makefile.include |   3 +-
 tests/vm/basevm.py        |   5 +-
 tests/vm/haiku.x86_64     | 116 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 149 insertions(+), 3 deletions(-)
 create mode 100644 tests/keys/vagrant
 create mode 100644 tests/keys/vagrant.pub
 create mode 100755 tests/vm/haiku.x86_64

diff --git a/tests/keys/vagrant b/tests/keys/vagrant
new file mode 100644
index 00000000000..7d6a083909e
--- /dev/null
+++ b/tests/keys/vagrant
@@ -0,0 +1,27 @@
+-----BEGIN RSA PRIVATE KEY-----
+MIIEogIBAAKCAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzI
+w+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoP
+kcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2
+hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NO
+Td0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW
+yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQIBIwKCAQEA4iqWPJXtzZA68mKd
+ELs4jJsdyky+ewdZeNds5tjcnHU5zUYE25K+ffJED9qUWICcLZDc81TGWjHyAqD1
+Bw7XpgUwFgeUJwUlzQurAv+/ySnxiwuaGJfhFM1CaQHzfXphgVml+fZUvnJUTvzf
+TK2Lg6EdbUE9TarUlBf/xPfuEhMSlIE5keb/Zz3/LUlRg8yDqz5w+QWVJ4utnKnK
+iqwZN0mwpwU7YSyJhlT4YV1F3n4YjLswM5wJs2oqm0jssQu/BT0tyEXNDYBLEF4A
+sClaWuSJ2kjq7KhrrYXzagqhnSei9ODYFShJu8UWVec3Ihb5ZXlzO6vdNQ1J9Xsf
+4m+2ywKBgQD6qFxx/Rv9CNN96l/4rb14HKirC2o/orApiHmHDsURs5rUKDx0f9iP
+cXN7S1uePXuJRK/5hsubaOCx3Owd2u9gD6Oq0CsMkE4CUSiJcYrMANtx54cGH7Rk
+EjFZxK8xAv1ldELEyxrFqkbE4BKd8QOt414qjvTGyAK+OLD3M2QdCQKBgQDtx8pN
+CAxR7yhHbIWT1AH66+XWN8bXq7l3RO/ukeaci98JfkbkxURZhtxV/HHuvUhnPLdX
+3TwygPBYZFNo4pzVEhzWoTtnEtrFueKxyc3+LjZpuo+mBlQ6ORtfgkr9gBVphXZG
+YEzkCD3lVdl8L4cw9BVpKrJCs1c5taGjDgdInQKBgHm/fVvv96bJxc9x1tffXAcj
+3OVdUN0UgXNCSaf/3A/phbeBQe9xS+3mpc4r6qvx+iy69mNBeNZ0xOitIjpjBo2+
+dBEjSBwLk5q5tJqHmy/jKMJL4n9ROlx93XS+njxgibTvU6Fp9w+NOFD/HvxB3Tcz
+6+jJF85D5BNAG3DBMKBjAoGBAOAxZvgsKN+JuENXsST7F89Tck2iTcQIT8g5rwWC
+P9Vt74yboe2kDT531w8+egz7nAmRBKNM751U/95P9t88EDacDI/Z2OwnuFQHCPDF
+llYOUI+SpLJ6/vURRbHSnnn8a/XG+nzedGH5JGqEJNQsz+xT2axM0/W/CRknmGaJ
+kda/AoGANWrLCz708y7VYgAtW2Uf1DPOIYMdvo6fxIB5i9ZfISgcJ/bbCUkFrhoH
++vq/5CIWxCPp0f85R4qxxQ5ihxJ0YDQT9Jpx4TMss4PSavPaBH3RXow5Ohe+bYoQ
+NE5OgEXk2wVfZczCZpigBKbKZHNYcelXtTt/nP3rsCuGcM4h53s=
+-----END RSA PRIVATE KEY-----
diff --git a/tests/keys/vagrant.pub b/tests/keys/vagrant.pub
new file mode 100644
index 00000000000..b8d012d787f
--- /dev/null
+++ b/tests/keys/vagrant.pub
@@ -0,0 +1 @@
+ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== well-known vagrant key for qemu-test, do not use on any machine exposed to an external network
diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 61f893ffdc0..e94d95ec541 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -4,7 +4,7 @@
 
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
-IMAGES := freebsd netbsd openbsd centos fedora
+IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
 ifneq ($(GENISOIMAGE),)
 IMAGES += ubuntu.i386 centos
 ifneq ($(EFI_AARCH64),)
@@ -41,6 +41,7 @@ endif
 else
 	@echo "  (install genisoimage to build centos/ubuntu images)"
 endif
+	@echo "  vm-build-haiku.x86_64           - Build QEMU in Haiku VM"
 	@echo ""
 	@echo "  vm-build-all                    - Build QEMU in all VMs"
 	@echo "  vm-clean-all                    - Clean up VM images"
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 3fac20e929a..00f1d5ca8da 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -44,6 +44,7 @@
     'machine'         : 'pc',
     'guest_user'      : "qemu",
     'guest_pass'      : "qemupass",
+    'root_user'       : "root",
     'root_pass'       : "qemupass",
     'ssh_key_file'    : SSH_KEY_FILE,
     'ssh_pub_key_file': SSH_PUB_KEY_FILE,
@@ -245,13 +246,13 @@ def ssh(self, *cmd):
         return self._ssh_do(self._config["guest_user"], cmd, False)
 
     def ssh_root(self, *cmd):
-        return self._ssh_do("root", cmd, False)
+        return self._ssh_do(self._config["root_user"], cmd, False)
 
     def ssh_check(self, *cmd):
         self._ssh_do(self._config["guest_user"], cmd, True)
 
     def ssh_root_check(self, *cmd):
-        self._ssh_do("root", cmd, True)
+        self._ssh_do(self._config["root_user"], cmd, True)
 
     def build_image(self, img):
         raise NotImplementedError
diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
new file mode 100755
index 00000000000..634ef774870
--- /dev/null
+++ b/tests/vm/haiku.x86_64
@@ -0,0 +1,116 @@
+#!/usr/bin/env python3
+#
+# Haiku VM image
+#
+# Copyright 2020 Haiku, Inc.
+#
+# Authors:
+#  Alexander von Gluck IV <kallisti5@unixzen.com>
+#
+# This code is licensed under the GPL version 2 or later.  See
+# the COPYING file in the top-level directory.
+#
+
+import os
+import re
+import sys
+import time
+import socket
+import subprocess
+import basevm
+
+VAGRANT_KEY_FILE = os.path.join(os.path.dirname(__file__),
+    "..", "keys", "vagrant")
+
+VAGRANT_PUB_KEY_FILE = os.path.join(os.path.dirname(__file__),
+    "..", "keys", "vagrant.pub")
+
+HAIKU_CONFIG = {
+    'cpu'             : "max",
+    'machine'         : 'pc',
+    'guest_user'      : "vagrant",
+    'guest_pass'      : "",
+    'root_user'       : "vagrant",
+    'root_pass'       : "",
+    'ssh_key_file'    : VAGRANT_KEY_FILE,
+    'ssh_pub_key_file': VAGRANT_PUB_KEY_FILE,
+    'memory'          : "4G",
+    'extra_args'      : [],
+    'qemu_args'       : "-device VGA",
+    'dns'             : "",
+    'ssh_port'        : 0,
+    'install_cmds'    : "",
+    'boot_dev_type'   : "block",
+    'ssh_timeout'     : 1,
+}
+
+class HaikuVM(basevm.BaseVM):
+    name = "haiku"
+    arch = "x86_64"
+
+    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
+    csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
+
+    poweroff = "shutdown"
+
+    requirements = [
+        "devel:libbz2",
+        "devel:libcapstone",
+        "devel:libcurl",
+        "devel:libfdt",
+        "devel:libgcrypt",
+        "devel:libgl",
+        "devel:libglib_2.0",
+        "devel:libgnutls",
+        "devel:libgpg_error",
+        "devel:libintl",
+        "devel:libjpeg",
+        "devel:liblzo2",
+        "devel:libncursesw",
+        "devel:libnettle",
+        "devel:libpixman_1",
+        "devel:libpng16",
+        "devel:libsdl2_2.0",
+        "devel:libsnappy",
+        "devel:libssh2",
+        "devel:libtasn1",
+        "devel:libusb_1.0",
+        "devel:libz",
+        "setuptools_python3"
+    ]
+
+    # https://dev.haiku-os.org/ticket/16512 virtio disk1 shows up as 0 (reversed order)
+    BUILD_SCRIPT = """
+        set -e;
+        rm -rf /tmp/qemu-test.*
+        cd $(mktemp -d /tmp/qemu-test.XXXXXX);
+        mkdir src build; cd src;
+        tar -xf /dev/disk/virtual/virtio_block/0/raw;
+        cd ../build
+        ../src/configure --python=python3 {configure_opts};
+        make --output-sync -j{jobs} {target} {verbose};
+    """
+
+    def build_image(self, img):
+        self.print_step("Downloading disk image")
+        tarball = self._download_with_cache(self.link, sha256sum=self.csum)
+
+        self.print_step("Extracting disk image")
+
+        subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O"],
+                              stdout=open(img, 'wb'))
+
+        self.print_step("Preparing disk image")
+        self.boot(img)
+
+        # Wait for ssh to be available.
+        self.wait_ssh(wait_root=True, cmd="exit 0")
+
+        # Install packages
+        self.ssh_root("pkgman install -y %s" % " ".join(self.requirements))
+        self.graceful_shutdown()
+
+        self.print_step("All done")
+
+if __name__ == "__main__":
+    sys.exit(basevm.main(HaikuVM, config=HAIKU_CONFIG))
-- 
2.26.2


