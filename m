Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41F3C7906
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:34:59 +0200 (CEST)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Q3O-0004HW-FN
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqi-0003Td-6y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqe-0000Op-EV
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snt2gY+1Tn6roJs4CdC0FTTEVPWvkwPrgfRH/7pXsGU=;
 b=heBsZsNa7g0nbDkVt6qrpNc8oqr6QpO/1l+loA06SzJEnsN09QaXrF/X/Wef1nwEkATrsS
 gkYW5+Dy/Izlzz2RMeD1D7/j0dqR+Zh437fYsmgcBki3PtxjdG+bi3C0uJIc2AC9lTqtKb
 m7TLNJ9cUTt2qwnx5nx7i0ZtqppDa88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-vbfEFe9dOHaQ3kP_vUmGFQ-1; Tue, 13 Jul 2021 17:21:41 -0400
X-MC-Unique: vbfEFe9dOHaQ3kP_vUmGFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7694B343CD;
 Tue, 13 Jul 2021 21:21:39 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CFC519C44;
 Tue, 13 Jul 2021 21:21:36 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 16/23] tests/acceptance: Tagging tests with "cpu:VALUE"
Date: Tue, 13 Jul 2021 17:19:16 -0400
Message-Id: <20210713211923.3809241-17-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The existing tests which are passing "-cpu VALUE" argument to the vm object
are now properly "cpu:VALUE" tagged, so letting the avocado_qemu framework to
handle that automatically.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-5-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py   | 13 ++++++++-----
 tests/acceptance/pc_cpu_hotplug_props.py |  2 +-
 tests/acceptance/replay_kernel.py        |  9 ++++++---
 tests/acceptance/virtio-gpu.py           |  4 ++--
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0a8222f17d..5248c8097d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -239,6 +239,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:5KEc
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -258,8 +259,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
                                + 'console=ttyS0 console=tty '
                                + 'rdinit=/sbin/init noreboot')
-        self.vm.add_args('-cpu', '5KEc',
-                         '-kernel', kernel_path,
+        self.vm.add_args('-kernel', kernel_path,
                          '-initrd', initrd_path,
                          '-append', kernel_command_line,
                          '-no-reboot')
@@ -287,7 +287,6 @@ def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
                                + 'mem=256m@@0x0 '
                                + 'console=ttyS0')
         self.vm.add_args('-no-reboot',
-                         '-cpu', 'I7200',
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.launch()
@@ -299,6 +298,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -311,6 +311,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -323,6 +324,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -335,6 +337,7 @@ def test_aarch64_virt(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
@@ -1168,9 +1171,9 @@ def test_ppc64_e500(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
+        :avocado: tags=cpu:e5500
         """
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
-        self.vm.add_args('-cpu', 'e5500')
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
 
     def test_ppc_g3beige(self):
@@ -1212,7 +1215,7 @@ def test_xtensa_lx60(self):
         """
         :avocado: tags=arch:xtensa
         :avocado: tags=machine:lx60
+        :avocado: tags=cpu:dc233c
         """
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
-        self.vm.add_args('-cpu', 'dc233c')
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/acceptance/pc_cpu_hotplug_props.py
index f48f68fc6b..2e86d5017a 100644
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
         self.assertEquals(len(self.vm.command('query-cpus-fast')), 2)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 75f80506c1..bb32b31240 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -392,6 +392,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=slowness:high
+        :avocado: tags=cpu:5KEc
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -412,7 +413,7 @@ def test_mips64el_malta_5KEc_cpio(self):
                                'rdinit=/sbin/init noreboot')
         console_pattern = 'Boot successful.'
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5,
-                    args=('-initrd', initrd_path, '-cpu', '5KEc'))
+                    args=('-initrd', initrd_path))
 
     def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
         kernel_path = self.workdir + "kernel"
@@ -424,14 +425,14 @@ def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
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
@@ -445,6 +446,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -458,6 +460,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index e7979343e9..589332c1b7 100644
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
@@ -101,6 +101,7 @@ def test_vhost_user_vga_virgl(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=device:vhost-user-vga
+        :avocado: tags=cpu:host
         """
         kernel_command_line = (
             self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
@@ -140,7 +141,6 @@ def test_vhost_user_vga_virgl(self):
         )
 
         self.vm.set_console()
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-m", "2G")
         self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
         self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
-- 
2.31.1


