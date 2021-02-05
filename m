Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14021310567
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:04:36 +0100 (CET)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vAR-0004Yv-3u
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v37-0001OX-De
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v35-0001D8-3R
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5xdjsIL5kfRu1EtFLW1WjElqhm7aHoOp2jsxYJZ3Jo=;
 b=ZLRICBH9trCTDM/DQYxYYmX6f2we9dZP8aUa6g+LfeeduCWD6o7p79zkZ1/X7uYQGL2Sof
 Na4DOLAPk+kNF5PfRYqCgnVZ/rquPvilXfQmG6/PNW6oVGT1ru1A+qA/kdHMZPgtYnzDCQ
 1Exlo+UBFh0WxtZ+TbfVPC7L70KhwJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-oz15ptIJOB2Mkgv_1Wuejg-1; Fri, 05 Feb 2021 01:56:55 -0500
X-MC-Unique: oz15ptIJOB2Mkgv_1Wuejg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9A8280196C
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6452E60C70;
 Fri,  5 Feb 2021 06:56:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B9ECC1800867; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] tests: add some virtio-gpu & vhost-user-gpu acceptance
 test
Date: Fri,  5 Feb 2021 07:56:20 +0100
Message-Id: <20210205065620.1726554-25-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This will check virtio/vhost-user-vga & virgl are correctly initialized
by the Linux kernel on an egl-headless display.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-21-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 161 +++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100644 tests/acceptance/virtio-gpu.py

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
new file mode 100644
index 000000000000..211f02932f27
--- /dev/null
+++ b/tests/acceptance/virtio-gpu.py
@@ -0,0 +1,161 @@
+# virtio-gpu tests
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+from avocado_qemu import Test
+from avocado_qemu import BUILD_DIR
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import is_readable_executable_file
+
+from qemu.accel import kvm_available
+
+import os
+import socket
+import subprocess
+
+
+ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
+KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
+
+
+def pick_default_vug_bin():
+    relative_path = "./contrib/vhost-user-gpu/vhost-user-gpu"
+    if is_readable_executable_file(relative_path):
+        return relative_path
+
+    bld_dir_path = os.path.join(BUILD_DIR, relative_path)
+    if is_readable_executable_file(bld_dir_path):
+        return bld_dir_path
+
+
+class VirtioGPUx86(Test):
+    """
+    :avocado: tags=virtio-gpu
+    """
+
+    KERNEL_COMMON_COMMAND_LINE = "printk.time=0 "
+    KERNEL_URL = (
+        "https://archives.fedoraproject.org/pub/fedora"
+        "/linux/releases/33/Everything/x86_64/os/images"
+        "/pxeboot/vmlinuz"
+    )
+    INITRD_URL = (
+        "https://archives.fedoraproject.org/pub/fedora"
+        "/linux/releases/33/Everything/x86_64/os/images"
+        "/pxeboot/initrd.img"
+    )
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(
+            self,
+            success_message,
+            failure_message="Kernel panic - not syncing",
+            vm=vm,
+        )
+
+    def test_virtio_vga_virgl(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=device:virtio-vga
+        """
+        kernel_command_line = (
+            self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
+        )
+        # FIXME: should check presence of virtio, virgl etc
+        if not kvm_available(self.arch, self.qemu_bin):
+            self.cancel(KVM_NOT_AVAILABLE)
+
+        kernel_path = self.fetch_asset(self.KERNEL_URL)
+        initrd_path = self.fetch_asset(self.INITRD_URL)
+
+        self.vm.set_console()
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-m", "2G")
+        self.vm.add_args("-machine", "pc,accel=kvm")
+        self.vm.add_args("-device", "virtio-vga,virgl=on")
+        self.vm.add_args("-display", "egl-headless")
+        self.vm.add_args(
+            "-kernel",
+            kernel_path,
+            "-initrd",
+            initrd_path,
+            "-append",
+            kernel_command_line,
+        )
+        self.vm.launch()
+        self.wait_for_console_pattern("as init process")
+        exec_command_and_wait_for_pattern(
+            self, "/usr/sbin/modprobe virtio_gpu", ""
+        )
+        self.wait_for_console_pattern("features: +virgl +edid")
+
+    def test_vhost_user_vga_virgl(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=device:vhost-user-vga
+        """
+        kernel_command_line = (
+            self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
+        )
+        # FIXME: should check presence of vhost-user-gpu, virgl, memfd etc
+        if not kvm_available(self.arch, self.qemu_bin):
+            self.cancel(KVM_NOT_AVAILABLE)
+
+        vug = pick_default_vug_bin()
+        if not vug:
+            self.cancel("Could not find vhost-user-gpu")
+
+        kernel_path = self.fetch_asset(self.KERNEL_URL)
+        initrd_path = self.fetch_asset(self.INITRD_URL)
+
+        # Create socketpair to connect proxy and remote processes
+        qemu_sock, vug_sock = socket.socketpair(
+            socket.AF_UNIX, socket.SOCK_STREAM
+        )
+        os.set_inheritable(qemu_sock.fileno(), True)
+        os.set_inheritable(vug_sock.fileno(), True)
+
+        self._vug_log_path = os.path.join(
+            self.vm._test_dir, "vhost-user-gpu.log"
+        )
+        self._vug_log_file = open(self._vug_log_path, "wb")
+        print(self._vug_log_path)
+
+        vugp = subprocess.Popen(
+            [vug, "--virgl", "--fd=%d" % vug_sock.fileno()],
+            stdin=subprocess.DEVNULL,
+            stdout=self._vug_log_file,
+            stderr=subprocess.STDOUT,
+            shell=False,
+            close_fds=False,
+        )
+
+        self.vm.set_console()
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-m", "2G")
+        self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
+        self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
+        self.vm.add_args("-chardev", "socket,id=vug,fd=%d" % qemu_sock.fileno())
+        self.vm.add_args("-device", "vhost-user-vga,chardev=vug")
+        self.vm.add_args("-display", "egl-headless")
+        self.vm.add_args(
+            "-kernel",
+            kernel_path,
+            "-initrd",
+            initrd_path,
+            "-append",
+            kernel_command_line,
+        )
+        self.vm.launch()
+        self.wait_for_console_pattern("as init process")
+        exec_command_and_wait_for_pattern(
+            self, "/usr/sbin/modprobe virtio_gpu", ""
+        )
+        self.wait_for_console_pattern("features: +virgl -edid")
+        self.vm.shutdown()
+        qemu_sock.close()
+        vugp.terminate()
+        vugp.wait()
-- 
2.29.2


