Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC356983A8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMka-0006A5-9j; Wed, 15 Feb 2023 13:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSMkW-00068M-Tn
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:43:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSMkU-0000jK-IO
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676486601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gol2oetqxD+3HeGFIqHtQXLHKccFPF4D4aVcDZbhj1E=;
 b=RLrg/eGq5BvSgKvEg9tZH8w76jKOa5VoaxxMaoDcTNTtC5a83IwuS9QF+qlkyNKUHB0Ex1
 hQJ9UjreCGbr4W4ERsPx2E3qLw1fSyTh03G2vT5OU4ZfeioQgpUKLPURznGLMvRr6Za9MM
 5Xdm9TXR+Klse2VLJv48nxCjdO2rf+c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-KNPE2HXyOwGOxAo9gn5EEQ-1; Wed, 15 Feb 2023 13:43:20 -0500
X-MC-Unique: KNPE2HXyOwGOxAo9gn5EEQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1623857A89;
 Wed, 15 Feb 2023 18:43:19 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD16E492B16;
 Wed, 15 Feb 2023 18:43:18 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 hczenczek@redhat.com, gmaglione@redhat.com, virtio-fs@redhat.com
Cc: pbonzini@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 1/4] virtiofsd: Remove test
Date: Wed, 15 Feb 2023 18:43:07 +0000
Message-Id: <20230215184310.161283-2-dgilbert@redhat.com>
In-Reply-To: <20230215184310.161283-1-dgilbert@redhat.com>
References: <20230215184310.161283-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Rmove the avocado test for virtiofsd, since we're about to remove
the C implementation.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 .../org.centos/stream/8/x86_64/test-avocado   |   7 -
 tests/avocado/virtiofs_submounts.py           | 217 ------------------
 2 files changed, 224 deletions(-)
 delete mode 100644 tests/avocado/virtiofs_submounts.py

diff --git a/scripts/ci/org.centos/stream/8/x86_64/test-avocado b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
index 7aeecbcfb8..f403e4e7ec 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/test-avocado
+++ b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
@@ -14,13 +14,6 @@
 # * Require machine type "x-remote":
 #   - tests/avocado/multiprocess.py:Multiprocess.test_multiprocess_x86_64
 #
-# * Needs superuser privileges:
-#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_virtiofsd_set_up
-#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_launch_set_up
-#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_post_launch_set_up
-#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_post_mount_set_up
-#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_two_runs
-#
 # * Requires display type "egl-headless":
 #   - tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
 #   - tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
diff --git a/tests/avocado/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
deleted file mode 100644
index e6dc32ffd4..0000000000
--- a/tests/avocado/virtiofs_submounts.py
+++ /dev/null
@@ -1,217 +0,0 @@
-import logging
-import re
-import os
-import subprocess
-import time
-
-from avocado import skipUnless
-from avocado_qemu import LinuxTest, BUILD_DIR
-from avocado_qemu import has_cmds
-from avocado_qemu import run_cmd
-from avocado_qemu import wait_for_console_pattern
-from avocado.utils import ssh
-
-
-class VirtiofsSubmountsTest(LinuxTest):
-    """
-    :avocado: tags=arch:x86_64
-    :avocado: tags=accel:kvm
-    """
-
-    def run(self, args, ignore_error=False):
-        stdout, stderr, ret = run_cmd(args)
-
-        if ret != 0:
-            cmdline = ' '.join(args)
-            if not ignore_error:
-                self.fail(f'{cmdline}: Returned {ret}: {stderr}')
-            else:
-                self.log.warn(f'{cmdline}: Returned {ret}: {stderr}')
-
-        return (stdout, stderr, ret)
-
-    def set_up_shared_dir(self):
-        self.shared_dir = os.path.join(self.workdir, 'virtiofs-shared')
-
-        os.mkdir(self.shared_dir)
-
-        self.run(('cp', self.get_data('guest.sh'),
-                 os.path.join(self.shared_dir, 'check.sh')))
-
-        self.run(('cp', self.get_data('guest-cleanup.sh'),
-                 os.path.join(self.shared_dir, 'cleanup.sh')))
-
-    def set_up_virtiofs(self):
-        attmp = os.getenv('AVOCADO_TESTS_COMMON_TMPDIR')
-        self.vfsdsock = os.path.join(attmp, 'vfsdsock')
-
-        self.run(('sudo', '-n', 'rm', '-f', self.vfsdsock), ignore_error=True)
-
-        self.virtiofsd = \
-            subprocess.Popen(('sudo', '-n',
-                              'tools/virtiofsd/virtiofsd',
-                              f'--socket-path={self.vfsdsock}',
-                              '-o', f'source={self.shared_dir}',
-                              '-o', 'cache=always',
-                              '-o', 'xattr',
-                              '-o', 'announce_submounts',
-                              '-f'),
-                             stdout=subprocess.DEVNULL,
-                             stderr=subprocess.PIPE,
-                             universal_newlines=True)
-
-        while not os.path.exists(self.vfsdsock):
-            if self.virtiofsd.poll() is not None:
-                self.fail('virtiofsd exited prematurely: ' +
-                          self.virtiofsd.communicate()[1])
-            time.sleep(0.1)
-
-        self.run(('sudo', '-n', 'chmod', 'go+rw', self.vfsdsock))
-
-        self.vm.add_args('-chardev',
-                         f'socket,id=vfsdsock,path={self.vfsdsock}',
-                         '-device',
-                         'vhost-user-fs-pci,queue-size=1024,chardev=vfsdsock' \
-                             ',tag=host',
-                         '-object',
-                         'memory-backend-file,id=mem,size=1G,' \
-                             'mem-path=/dev/shm,share=on',
-                         '-numa',
-                         'node,memdev=mem')
-
-    def set_up_nested_mounts(self):
-        scratch_dir = os.path.join(self.shared_dir, 'scratch')
-        try:
-            os.mkdir(scratch_dir)
-        except FileExistsError:
-            pass
-
-        args = ['bash', self.get_data('host.sh'), scratch_dir]
-        if self.seed:
-            args += [self.seed]
-
-        out, _, _ = self.run(args)
-        seed = re.search(r'^Seed: \d+', out)
-        self.log.info(seed[0])
-
-    def mount_in_guest(self):
-        self.ssh_command('mkdir -p /mnt/host')
-        self.ssh_command('mount -t virtiofs host /mnt/host')
-
-    def check_in_guest(self):
-        self.ssh_command('bash /mnt/host/check.sh /mnt/host/scratch/share')
-
-    def live_cleanup(self):
-        self.ssh_command('bash /mnt/host/cleanup.sh /mnt/host/scratch')
-
-        # It would be nice if the above was sufficient to make virtiofsd clear
-        # all references to the mounted directories (so they can be unmounted
-        # on the host), but unfortunately it is not.  To do so, we have to
-        # resort to a remount.
-        self.ssh_command('mount -o remount /mnt/host')
-
-        scratch_dir = os.path.join(self.shared_dir, 'scratch')
-        self.run(('bash', self.get_data('cleanup.sh'), scratch_dir))
-
-    @skipUnless(*has_cmds(('sudo -n', ('sudo', '-n', 'true')),
-                          'ssh-keygen', 'bash', 'losetup', 'mkfs.xfs', 'mount'))
-    def setUp(self):
-        vmlinuz = self.params.get('vmlinuz')
-        if vmlinuz is None:
-            """
-            The Linux kernel supports FUSE auto-submounts only as of 5.10.
-            boot_linux.py currently provides Fedora 31, whose kernel is too
-            old, so this test cannot pass with the on-image kernel (you are
-            welcome to try, hence the option to force such a test with
-            -p vmlinuz='').  Therefore, for now the user must provide a
-            sufficiently new custom kernel, or effectively explicitly
-            request failure with -p vmlinuz=''.
-            Once an image with a sufficiently new kernel is available
-            (probably Fedora 34), we can make -p vmlinuz='' the default, so
-            that this parameter no longer needs to be specified.
-            """
-            self.cancel('vmlinuz parameter not set; you must point it to a '
-                        'Linux kernel binary to test (to run this test with ' \
-                        'the on-image kernel, set it to an empty string)')
-
-        self.seed = self.params.get('seed')
-
-        self.ssh_key = os.path.join(self.workdir, 'id_ed25519')
-
-        self.run(('ssh-keygen', '-N', '', '-t', 'ed25519', '-f', self.ssh_key))
-
-        pubkey = self.ssh_key + '.pub'
-
-        super(VirtiofsSubmountsTest, self).setUp(pubkey)
-
-        if vmlinuz:
-            self.vm.add_args('-kernel', vmlinuz,
-                             '-append', 'console=ttyS0 root=/dev/sda1')
-
-        self.require_accelerator("kvm")
-        self.vm.add_args('-accel', 'kvm')
-
-    def tearDown(self):
-        try:
-            self.vm.shutdown()
-        except:
-            pass
-
-        scratch_dir = os.path.join(self.shared_dir, 'scratch')
-        self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
-                 ignore_error=True)
-
-    def test_pre_virtiofsd_set_up(self):
-        self.set_up_shared_dir()
-
-        self.set_up_nested_mounts()
-
-        self.set_up_virtiofs()
-        self.launch_and_wait()
-        self.mount_in_guest()
-        self.check_in_guest()
-
-    def test_pre_launch_set_up(self):
-        self.set_up_shared_dir()
-        self.set_up_virtiofs()
-
-        self.set_up_nested_mounts()
-
-        self.launch_and_wait()
-        self.mount_in_guest()
-        self.check_in_guest()
-
-    def test_post_launch_set_up(self):
-        self.set_up_shared_dir()
-        self.set_up_virtiofs()
-        self.launch_and_wait()
-
-        self.set_up_nested_mounts()
-
-        self.mount_in_guest()
-        self.check_in_guest()
-
-    def test_post_mount_set_up(self):
-        self.set_up_shared_dir()
-        self.set_up_virtiofs()
-        self.launch_and_wait()
-        self.mount_in_guest()
-
-        self.set_up_nested_mounts()
-
-        self.check_in_guest()
-
-    def test_two_runs(self):
-        self.set_up_shared_dir()
-
-        self.set_up_nested_mounts()
-
-        self.set_up_virtiofs()
-        self.launch_and_wait()
-        self.mount_in_guest()
-        self.check_in_guest()
-
-        self.live_cleanup()
-        self.set_up_nested_mounts()
-
-        self.check_in_guest()
-- 
2.39.1


