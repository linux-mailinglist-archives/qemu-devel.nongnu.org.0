Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33E3245D1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:31:52 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1l9-0004WU-6I
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1gz-0001CW-Up
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1gu-0003IL-Dc
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614202047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5/lnd6vtaS+76a/rCGZw26+GnZZjZsGl9siggn0TUA=;
 b=OY+KNdTThImoZtvOK+oGuigeYXOZw5ZxlxfsILGFf/4HGleW5xJRsgHLAfaJnZeeop88m9
 kKgWC9JJRcjKX1wwcMiX09bCtt34GOTSMtKmDIa7bBUAlh4fY7s0rr9ToX51VoT4ziDGwZ
 QzpKEsxVjPVwXyIJLVD/0NmiRnpvn6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-Kz0VcwijP9GinAvxEVYjbQ-1; Wed, 24 Feb 2021 16:27:23 -0500
X-MC-Unique: Kz0VcwijP9GinAvxEVYjbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A491D1007B15;
 Wed, 24 Feb 2021 21:27:22 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE6DC5D6D3;
 Wed, 24 Feb 2021 21:27:17 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tests/acceptance: Tagging tests with "cpu:VALUE"
Date: Wed, 24 Feb 2021 18:26:54 -0300
Message-Id: <20210224212654.1146167-4-wainersm@redhat.com>
In-Reply-To: <20210224212654.1146167-1-wainersm@redhat.com>
References: <20210224212654.1146167-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing tests which are passing "-cpu VALUE" argument to the vm object
are now properly "cpu:VALUE" tagged, so letting the avocado_qemu framework to
handle that automatically.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/boot_linux_console.py     | 16 +++++++++-------
 tests/acceptance/pc_cpu_hotplug_props.py   |  2 +-
 tests/acceptance/replay_kernel.py          |  9 ++++++---
 tests/acceptance/virtio-gpu.py             |  4 ++--
 tests/acceptance/x86_cpu_model_versions.py |  8 ++++++++
 5 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index eb01286799..2447b370ff 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -238,6 +238,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:5KEc
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -257,8 +258,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
                                + 'console=ttyS0 console=tty '
                                + 'rdinit=/sbin/init noreboot')
-        self.vm.add_args('-cpu', '5KEc',
-                         '-kernel', kernel_path,
+        self.vm.add_args('-kernel', kernel_path,
                          '-initrd', initrd_path,
                          '-append', kernel_command_line,
                          '-no-reboot')
@@ -286,7 +286,6 @@ def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
                                + 'mem=256m@@0x0 '
                                + 'console=ttyS0')
         self.vm.add_args('-no-reboot',
-                         '-cpu', 'I7200',
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.launch()
@@ -298,6 +297,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -310,6 +310,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -322,6 +323,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -333,6 +335,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
@@ -343,8 +346,7 @@ def test_aarch64_virt(self):
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
-        self.vm.add_args('-cpu', 'cortex-a53',
-                         '-kernel', kernel_path,
+        self.vm.add_args('-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
@@ -1076,9 +1078,9 @@ def test_ppc64_e500(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
+        :avocado: tags=cpu:e5500
         """
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
-        self.vm.add_args('-cpu', 'e5500')
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
 
     def test_ppc_g3beige(self):
@@ -1120,7 +1122,7 @@ def test_xtensa_lx60(self):
         """
         :avocado: tags=arch:xtensa
         :avocado: tags=machine:lx60
+        :avocado: tags=cpu:dc233c
         """
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
-        self.vm.add_args('-cpu', 'dc233c')
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/acceptance/pc_cpu_hotplug_props.py
index e49bf33fc5..f8a39e6d0a 100644
--- a/tests/acceptance/pc_cpu_hotplug_props.py
+++ b/tests/acceptance/pc_cpu_hotplug_props.py
@@ -25,11 +25,11 @@
 class OmittedCPUProps(Test):
     """
     :avocado: tags=arch:x86_64
+    :avocado: tags=cpu:qemu64
     """
     def test_no_die_id(self):
         self.vm.add_args('-nodefaults', '-S')
         self.vm.add_args('-smp', '1,sockets=2,cores=2,threads=2,maxcpus=8')
-        self.vm.add_args('-cpu', 'qemu64')
         self.vm.add_args('-device', 'qemu64-x86_64-cpu,socket-id=1,core-id=0,thread-id=0')
         self.vm.launch()
         self.assertEquals(len(self.vm.command('query-cpus')), 2)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 6ae18485be..fefa6d8550 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -394,6 +394,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=slowness:high
+        :avocado: tags=cpu:5KEc
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -414,7 +415,7 @@ def test_mips64el_malta_5KEc_cpio(self):
                                'rdinit=/sbin/init noreboot')
         console_pattern = 'Boot successful.'
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5,
-                    args=('-initrd', initrd_path, '-cpu', '5KEc'))
+                    args=('-initrd', initrd_path))
 
     def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
         kernel_path = self.workdir + "kernel"
@@ -426,14 +427,14 @@ def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
                                'mem=256m@@0x0 '
                                'console=ttyS0')
         console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5,
-                    args=('-cpu', 'I7200'))
+        self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5)
 
     def test_mips_malta32el_nanomips_4k(self):
         """
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -447,6 +448,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -460,6 +462,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index ab1a4c1a71..c650427379 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -60,6 +60,7 @@ def test_virtio_vga_virgl(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=device:virtio-vga
+        :avocado: tags=cpu:host
         """
         kernel_command_line = (
             self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
@@ -72,7 +73,6 @@ def test_virtio_vga_virgl(self):
         initrd_path = self.fetch_asset(self.INITRD_URL)
 
         self.vm.set_console()
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-m", "2G")
         self.vm.add_args("-machine", "pc,accel=kvm")
         self.vm.add_args("-device", "virtio-vga,virgl=on")
@@ -96,6 +96,7 @@ def test_vhost_user_vga_virgl(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=device:vhost-user-vga
+        :avocado: tags=cpu:host
         """
         kernel_command_line = (
             self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
@@ -135,7 +136,6 @@ def test_vhost_user_vga_virgl(self):
         )
 
         self.vm.set_console()
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-m", "2G")
         self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
         self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/x86_cpu_model_versions.py
index 2b7461bb41..8a0a07ef71 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -252,6 +252,7 @@ def get_cpu_prop(self, prop):
     def test_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # machine-type only:
         self.vm.add_args('-S')
@@ -263,6 +264,7 @@ def test_4_1(self):
     def test_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
         self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off')
@@ -273,6 +275,7 @@ def test_4_0(self):
     def test_set_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # command line must override machine-type if CPU model is not versioned:
         self.vm.add_args('-S')
@@ -284,6 +287,7 @@ def test_set_4_0(self):
     def test_unset_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
         self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off,-arch-capabilities')
@@ -294,6 +298,7 @@ def test_unset_4_1(self):
     def test_v1_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # versioned CPU model overrides machine-type:
         self.vm.add_args('-S')
@@ -305,6 +310,7 @@ def test_v1_4_0(self):
     def test_v2_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
         self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=on,check=off,enforce=off')
@@ -315,6 +321,7 @@ def test_v2_4_0(self):
     def test_v1_set_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # command line must override machine-type and versioned CPU model:
         self.vm.add_args('-S')
@@ -326,6 +333,7 @@ def test_v1_set_4_0(self):
     def test_v2_unset_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
         self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=on,check=off,enforce=off,-arch-capabilities')
-- 
2.29.2


