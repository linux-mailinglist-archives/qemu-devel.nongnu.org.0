Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9934671E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:04:06 +0100 (CET)
Received: from localhost ([::1]:43026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlNt-0008Dh-B1
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkN5-0007PC-A6
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:11 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkN0-00061r-CY
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:11 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u9so28274360ejj.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T1DAl2vypqOHD8RnZUBDzTLiJbvhZJDTU+msyGDc9D4=;
 b=lQnzoPeAvy2XROeD/oIORy9Oa3ywyD6nbMqjnySgFcuWTC5LMhMKgNkmJ0fKZ7IOL3
 8uQ61gFTcop30hOnrROVpsfRw1R26N8wPjZciQlD+/vhZq0OldYNamnuErXItJXT2cMW
 rQ/MaMvaITJuNPyHDbGur2VYi+eyHLM1GPtDZmY7HrYZ0ixlpEFnSHLJNqwx/N6hQ7Zi
 12RaeeniUrMYLzQI7Qk9S0p2sb1KD/4aavosPP41akjF1TU1e60UADMjyAX6BKD6XF98
 Ek+PdW1pF3KMh0aci3IxUnstVXlPq4+nkiwj4ZKwyXwJGBxExsUnc7d1SYA6X2SS3RiA
 tP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T1DAl2vypqOHD8RnZUBDzTLiJbvhZJDTU+msyGDc9D4=;
 b=MoXoHwGbc5xarGTiOwWitnLKlhCTYQzN1VwEiddSzIP3UDA3ezp5+13TcAfCr9m4hD
 0wxQhv0OXbu894IH6Vwixgf6u4lx/ordEhJGPGS/A1UV/VXNtU8dls27/m8dJtDzO4rf
 jKqNLxQnfShcQcUG+D1BZuMwClg3eBmSAdkf5pwsYjcz2snvZCBJU4h/pUnrFYlnKMFZ
 D1eMrh6uF9Y8JGoOQHq+ZbDi5kCJVmC6PB2O8yLNQ1B8nAVHDce7ih11uBvbEk1iz5fn
 CpLcNRXcXG9IjPh0T0Yj9QO+JrDbPM94mD6qLNSQJqTHTHCtveXxELKZjAPhB/KytO12
 AlQA==
X-Gm-Message-State: AOAM532Es6AM05QmYFlEU/pQar/1bE1ixgUjbhSvQZ8EnnzkFEg6feuI
 558GAes5Ij9aLywAAnxLl1hxyQ==
X-Google-Smtp-Source: ABdhPJxnmZJdGEAeSUu3dlNTH5e1U8Y+PwTeQ5WWcLk7i1Ltax7wd+d4HGOw2b4uFktnw1wQUnEbvg==
X-Received: by 2002:a17:907:2642:: with SMTP id
 ar2mr5849875ejc.145.1616518742623; 
 Tue, 23 Mar 2021 09:59:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id rs24sm11420442ejb.75.2021.03.23.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F2841FFA5;
 Tue, 23 Mar 2021 16:53:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/22] iotests: Revert "iotests: use -ccw on s390x for 040, 139,
 and 182"
Date: Tue, 23 Mar 2021 16:53:05 +0000
Message-Id: <20210323165308.15244-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

Commit f1d5516ab583 introduces a test in some iotests to check if
the machine is a s390-ccw-virtio and to select virtio-*-ccw rather
than virtio-*-pci.

We don't need that because QEMU already provides aliases to use the correct
virtio interface according to the machine type.

This patch removes all virtio-*-pci and virtio-*-ccw to use virtio-*
instead and remove get_virtio_scsi_device().
This also enables virtio-mmio devices (virtio-*-device)

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210319202335.2397060-5-laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/040        |  2 +-
 tests/qemu-iotests/051        | 12 +-----------
 tests/qemu-iotests/051.out    |  2 +-
 tests/qemu-iotests/051.pc.out |  2 +-
 tests/qemu-iotests/068        |  4 +---
 tests/qemu-iotests/093        |  3 +--
 tests/qemu-iotests/139        |  9 ++-------
 tests/qemu-iotests/182        | 13 ++-----------
 tests/qemu-iotests/238        |  4 +---
 tests/qemu-iotests/240        | 10 +++++-----
 tests/qemu-iotests/257        |  4 ++--
 tests/qemu-iotests/307        |  4 +---
 tests/qemu-iotests/iotests.py |  5 -----
 13 files changed, 19 insertions(+), 55 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 336ff7c4f2..ba7cb34ce8 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -89,7 +89,7 @@ class TestSingleDrive(ImageCommitTestCase):
         qemu_io('-f', 'raw', '-c', 'write -P 0xab 0 524288', backing_img)
         qemu_io('-f', iotests.imgfmt, '-c', 'write -P 0xef 524288 524288', mid_img)
         self.vm = iotests.VM().add_drive(test_img, "node-name=top,backing.node-name=mid,backing.backing.node-name=base", interface="none")
-        self.vm.add_device(iotests.get_virtio_scsi_device())
+        self.vm.add_device('virtio-scsi')
         self.vm.add_device("scsi-hd,id=scsi0,drive=drive0")
         self.vm.launch()
         self.has_quit = False
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index f92161d8ef..333cc81818 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -119,17 +119,7 @@ echo
 echo === Device without drive ===
 echo
 
-case "$QEMU_DEFAULT_MACHINE" in
-  s390-ccw-virtio)
-      virtio_scsi=virtio-scsi-ccw
-      ;;
-  *)
-      virtio_scsi=virtio-scsi-pci
-      ;;
-esac
-
-run_qemu -device $virtio_scsi -device scsi-hd |
-    sed -e "s/$virtio_scsi/VIRTIO_SCSI/"
+run_qemu -device virtio-scsi -device scsi-hd
 
 echo
 echo === Overriding backing file ===
diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index de4771bcb3..437053c839 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -72,7 +72,7 @@ QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node name
 
 === Device without drive ===
 
-Testing: -device VIRTIO_SCSI -device scsi-hd
+Testing: -device virtio-scsi -device scsi-hd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device scsi-hd: drive property not set
 
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index a28e3fc124..e95bd42b8d 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -72,7 +72,7 @@ QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node-name: 'fo
 
 === Device without drive ===
 
-Testing: -device VIRTIO_SCSI -device scsi-hd
+Testing: -device virtio-scsi -device scsi-hd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device scsi-hd: drive property not set
 
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index 03e03508a6..54e49c8ffa 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -49,11 +49,9 @@ IMG_SIZE=128K
 case "$QEMU_DEFAULT_MACHINE" in
   s390-ccw-virtio)
       platform_parm="-no-shutdown"
-      hba=virtio-scsi-ccw
       ;;
   *)
       platform_parm=""
-      hba=virtio-scsi-pci
       ;;
 esac
 
@@ -61,7 +59,7 @@ _qemu()
 {
     $QEMU $platform_parm -nographic -monitor stdio -serial none \
           -drive if=none,id=drive0,file="$TEST_IMG",format="$IMGFMT" \
-          -device $hba,id=hba0 \
+          -device virtio-scsi,id=hba0 \
           -device scsi-hd,drive=drive0 \
           "$@" |\
     _filter_qemu | _filter_hmp
diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index 7745cb04b6..93274dc8cb 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -371,8 +371,7 @@ class ThrottleTestGroupNames(iotests.QMPTestCase):
 class ThrottleTestRemovableMedia(iotests.QMPTestCase):
     def setUp(self):
         self.vm = iotests.VM()
-        self.vm.add_device("{},id=virtio-scsi".format(
-            iotests.get_virtio_scsi_device()))
+        self.vm.add_device("{},id=virtio-scsi".format('virtio-scsi'))
         self.vm.launch()
 
     def tearDown(self):
diff --git a/tests/qemu-iotests/139 b/tests/qemu-iotests/139
index e79b3c21fd..178b1ee230 100755
--- a/tests/qemu-iotests/139
+++ b/tests/qemu-iotests/139
@@ -26,18 +26,13 @@ import time
 
 base_img = os.path.join(iotests.test_dir, 'base.img')
 new_img = os.path.join(iotests.test_dir, 'new.img')
-if iotests.qemu_default_machine == 's390-ccw-virtio':
-    default_virtio_blk = 'virtio-blk-ccw'
-else:
-    default_virtio_blk = 'virtio-blk-pci'
 
 class TestBlockdevDel(iotests.QMPTestCase):
 
     def setUp(self):
         iotests.qemu_img('create', '-f', iotests.imgfmt, base_img, '1M')
         self.vm = iotests.VM()
-        self.vm.add_device("{},id=virtio-scsi".format(
-            iotests.get_virtio_scsi_device()))
+        self.vm.add_device("{},id=virtio-scsi".format('virtio-scsi'))
         self.vm.launch()
 
     def tearDown(self):
@@ -93,7 +88,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
         self.checkBlockDriverState(node, expect_error)
 
     # Add a device model
-    def addDeviceModel(self, device, backend, driver = default_virtio_blk):
+    def addDeviceModel(self, device, backend, driver = 'virtio-blk'):
         result = self.vm.qmp('device_add', id = device,
                              driver = driver, drive = backend)
         self.assert_qmp(result, 'return', {})
diff --git a/tests/qemu-iotests/182 b/tests/qemu-iotests/182
index 55a0384c08..fcd1d796eb 100755
--- a/tests/qemu-iotests/182
+++ b/tests/qemu-iotests/182
@@ -46,26 +46,17 @@ _supported_proto file
 
 size=32M
 
-case "$QEMU_DEFAULT_MACHINE" in
-  s390-ccw-virtio)
-      virtioblk=virtio-blk-ccw
-      ;;
-  *)
-      virtioblk=virtio-blk-pci
-      ;;
-esac
-
 _make_test_img $size
 
 echo "Starting QEMU"
 _launch_qemu -drive file=$TEST_IMG,if=none,id=drive0,file.locking=on \
-    -device $virtioblk,drive=drive0
+    -device virtio-blk,drive=drive0
 
 echo
 echo "Starting a second QEMU using the same image should fail"
 echo 'quit' | $QEMU -nographic -monitor stdio \
     -drive file=$TEST_IMG,if=none,id=drive0,file.locking=on \
-    -device $virtioblk,drive=drive0 2>&1 | _filter_testdir 2>&1 |
+    -device virtio-blk,drive=drive0 2>&1 | _filter_testdir 2>&1 |
     _filter_qemu |
     sed -e '/falling back to POSIX file/d' \
         -e '/locks can be lost unexpectedly/d'
diff --git a/tests/qemu-iotests/238 b/tests/qemu-iotests/238
index 8a10af57f1..38bd3744e6 100755
--- a/tests/qemu-iotests/238
+++ b/tests/qemu-iotests/238
@@ -26,14 +26,12 @@ from iotests import log
 
 iotests.script_initialize()
 
-virtio_scsi_device = iotests.get_virtio_scsi_device()
-
 vm = iotests.VM()
 vm.launch()
 
 log(vm.qmp('blockdev-add', node_name='hd0', driver='null-co', read_zeroes=True))
 log(vm.qmp('object-add', qom_type='iothread', id='iothread0'))
-log(vm.qmp('device_add', id='scsi0', driver=virtio_scsi_device, iothread='iothread0'))
+log(vm.qmp('device_add', id='scsi0', driver='virtio-scsi', iothread='iothread0'))
 log(vm.qmp('device_add', id='scsi-hd0', driver='scsi-hd', drive='hd0'))
 log(vm.qmp('block_set_io_throttle', id='scsi-hd0', bps=0, bps_rd=0, bps_wr=0,
            iops=1000, iops_rd=0, iops_wr=0, conv_keys=False))
diff --git a/tests/qemu-iotests/240 b/tests/qemu-iotests/240
index ab077f4ceb..9b281e1dc0 100755
--- a/tests/qemu-iotests/240
+++ b/tests/qemu-iotests/240
@@ -42,7 +42,7 @@ class TestCase(iotests.QMPTestCase):
         iotests.log('==Unplug a SCSI disk and then plug it again==')
         self.vm.qmp_log('blockdev-add', driver='null-co', read_zeroes=True, node_name='hd0')
         self.vm.qmp_log('object-add', qom_type='iothread', id="iothread0")
-        self.vm.qmp_log('device_add', id='scsi0', driver=iotests.get_virtio_scsi_device(), iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
+        self.vm.qmp_log('device_add', id='scsi0', driver='virtio-scsi', iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
         self.vm.qmp_log('device_add', id='scsi-hd0', driver='scsi-hd', drive='hd0')
         self.vm.qmp_log('device_del', id='scsi-hd0')
         self.vm.event_wait('DEVICE_DELETED')
@@ -55,7 +55,7 @@ class TestCase(iotests.QMPTestCase):
         iotests.log('==Attach two SCSI disks using the same block device and the same iothread==')
         self.vm.qmp_log('blockdev-add', driver='null-co', read_zeroes=True, node_name='hd0', read_only=True)
         self.vm.qmp_log('object-add', qom_type='iothread', id="iothread0")
-        self.vm.qmp_log('device_add', id='scsi0', driver=iotests.get_virtio_scsi_device(), iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
+        self.vm.qmp_log('device_add', id='scsi0', driver='virtio-scsi', iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
 
         self.vm.qmp_log('device_add', id='scsi-hd0', driver='scsi-hd', drive='hd0')
         self.vm.qmp_log('device_add', id='scsi-hd1', driver='scsi-hd', drive='hd0')
@@ -73,8 +73,8 @@ class TestCase(iotests.QMPTestCase):
         self.vm.qmp_log('object-add', qom_type='iothread', id="iothread0")
         self.vm.qmp_log('object-add', qom_type='iothread', id="iothread1")
 
-        self.vm.qmp_log('device_add', id='scsi0', driver=iotests.get_virtio_scsi_device(), iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
-        self.vm.qmp_log('device_add', id='scsi1', driver=iotests.get_virtio_scsi_device(), iothread='iothread1', filters=[iotests.filter_qmp_virtio_scsi])
+        self.vm.qmp_log('device_add', id='scsi0', driver='virtio-scsi', iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
+        self.vm.qmp_log('device_add', id='scsi1', driver='virtio-scsi', iothread='iothread1', filters=[iotests.filter_qmp_virtio_scsi])
 
         self.vm.qmp_log('device_add', id='scsi-hd0', driver='scsi-hd', drive='hd0', bus="scsi0.0")
         self.vm.qmp_log('device_add', id='scsi-hd1', driver='scsi-hd', drive='hd0', bus="scsi1.0")
@@ -99,7 +99,7 @@ class TestCase(iotests.QMPTestCase):
         self.vm.qmp_log('nbd-server-add', device='hd0')
 
         self.vm.qmp_log('object-add', qom_type='iothread', id="iothread0")
-        self.vm.qmp_log('device_add', id='scsi0', driver=iotests.get_virtio_scsi_device(), iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
+        self.vm.qmp_log('device_add', id='scsi0', driver='virtio-scsi', iothread='iothread0', filters=[iotests.filter_qmp_virtio_scsi])
         self.vm.qmp_log('device_add', id='scsi-hd0', driver='scsi-hd', drive='hd0')
 
 if __name__ == '__main__':
diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index 7cd2520829..c72c82a171 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -292,7 +292,7 @@ def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
         log('--- Preparing image & VM ---\n')
         drive0 = Drive(img_path, vm=vm)
         drive0.img_create(iotests.imgfmt, SIZE)
-        vm.add_device("{},id=scsi0".format(iotests.get_virtio_scsi_device()))
+        vm.add_device("{},id=scsi0".format('virtio-scsi'))
         vm.launch()
 
         file_config = {
@@ -449,7 +449,7 @@ def test_backup_api():
         log('--- Preparing image & VM ---\n')
         drive0 = Drive(img_path, vm=vm)
         drive0.img_create(iotests.imgfmt, SIZE)
-        vm.add_device("{},id=scsi0".format(iotests.get_virtio_scsi_device()))
+        vm.add_device("{},id=scsi0".format('virtio-scsi'))
         vm.launch()
 
         file_config = {
diff --git a/tests/qemu-iotests/307 b/tests/qemu-iotests/307
index 9008974346..c7685347bc 100755
--- a/tests/qemu-iotests/307
+++ b/tests/qemu-iotests/307
@@ -40,13 +40,11 @@ with iotests.FilePath('image') as img, \
 
     iotests.log('=== Launch VM ===')
 
-    virtio_scsi_device = iotests.get_virtio_scsi_device()
-
     vm.add_object('iothread,id=iothread0')
     vm.add_blockdev(f'file,filename={img},node-name=file')
     vm.add_blockdev(f'{iotests.imgfmt},file=file,node-name=fmt')
     vm.add_blockdev('raw,file=file,node-name=ro,read-only=on')
-    vm.add_device(f'id=scsi0,driver={virtio_scsi_device},iothread=iothread0')
+    vm.add_device(f'id=scsi0,driver=virtio-scsi,iothread=iothread0')
     vm.launch()
 
     vm.qmp_log('nbd-server-start',
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 90d0b62523..1e9e6a066e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -234,11 +234,6 @@ def qemu_io_silent_check(*args):
                                stderr=subprocess.STDOUT)
     return exitcode == 0
 
-def get_virtio_scsi_device():
-    if qemu_default_machine == 's390-ccw-virtio':
-        return 'virtio-scsi-ccw'
-    return 'virtio-scsi-pci'
-
 class QemuIoInteractive:
     def __init__(self, *args):
         self.args = qemu_io_args_no_fmt + list(args)
-- 
2.20.1


