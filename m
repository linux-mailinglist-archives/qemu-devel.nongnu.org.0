Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282D341070
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:41:37 +0100 (CET)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1Kh-0005Yq-KH
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1If-00040H-GZ; Thu, 18 Mar 2021 18:39:29 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1Ia-0003yo-Gv; Thu, 18 Mar 2021 18:39:29 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlfGs-1m4MTM0LgY-00ihvV; Thu, 18 Mar 2021 23:39:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] iotests: Revert "iotests: use -ccw on s390x for 040, 139,
 and 182"
Date: Thu, 18 Mar 2021 23:39:05 +0100
Message-Id: <20210318223907.1344870-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318223907.1344870-1-laurent@vivier.eu>
References: <20210318223907.1344870-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9bBFlCmvAjK24/aRFL4Yn2mKny4m8sEArd3dBUpCppYtI9FsG2o
 cWEEGmfz9gy43aTRzeGXOSPD0Z3eKDhN9Xv/FScQrlfIwbEut1A/xTeto1W8zJd4Ks9yqB6
 EO/k0Oh6S8HC7qD3l3sJakCOfFsSxL9/uu82eb75hN2i4PC/IEZvM2/vyQiBJNEFWP+6HA9
 BJ/P+r8mjjRTbVgahXVAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9CzYRzuEQBo=:XEpt6G+JZXAiEfBClMRnBB
 4sEJR4sAPQwlKpNCEimNSwoqraQbAH1kNWH0QegzOWK9Nsp1dA5/0IhXpZLa6RFMGYjbk2RU1
 YQ7S58lfY93yYI1yOZOPDnZFAI8cjqPbPDCChlWFdi/Hg23BgvpoeM2P/aOVk/OgAjlEM33nz
 6Au4+DgmeCXvDi3byvzSqmG8+pFGACKanDIVLgVkOv4J0SlFwykjyH8Si8FifLazt9AhWiLQZ
 gi9OE7fsV0GEqQNVes/wAqus7ldGzB/WZBg40gL+dRU/uBYfgGp9ZV9UV5vQ9Pr/AgllEoYJG
 FZ2Acli3adbakFZWqcodYE/RGJbP2HlzGOJUTg6s30GmexFFAa2Nc+UiG3m1FVI3vODWCiBKQ
 5igBBhX1Sj1P1n3g/GRhUNrNR1f0qdimwm5hW6KQ+NdGtF56fWpZWHwuIo/Jtu8Vkxxsk6eOF
 Gwh7+cYT7w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f1d5516ab583 introduces a test in some iotests to check if
the machine is a s390-ssw-virtio and to select virtio-*-ccw rather
than virtio-*-pci.

We don't need that because QEMU already provides aliases to use the correct
virtio interface according to the machine type.

This patch removes all virtio-*-pci and virtio-*-ccw to use virtio-*
instead.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
cc: Cornelia Huck <cohuck@redhat.com>
---
 blockdev.c                    |  6 +-----
 tests/qemu-iotests/040        |  2 +-
 tests/qemu-iotests/051        | 12 +-----------
 tests/qemu-iotests/068        |  4 +---
 tests/qemu-iotests/093        |  3 +--
 tests/qemu-iotests/139        |  9 ++-------
 tests/qemu-iotests/182        | 13 ++-----------
 tests/qemu-iotests/238        |  4 +---
 tests/qemu-iotests/240        | 10 +++++-----
 tests/qemu-iotests/257        |  4 ++--
 tests/qemu-iotests/307        |  4 +---
 tests/qemu-iotests/iotests.py |  5 -----
 12 files changed, 18 insertions(+), 58 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 5cc7c7effe9f..64da5350e3ad 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -969,11 +969,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
         QemuOpts *devopts;
         devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
                                    &error_abort);
-        if (arch_type == QEMU_ARCH_S390X) {
-            qemu_opt_set(devopts, "driver", "virtio-blk-ccw", &error_abort);
-        } else {
-            qemu_opt_set(devopts, "driver", "virtio-blk-pci", &error_abort);
-        }
+        qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
         qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
                      &error_abort);
     }
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 336ff7c4f2ab..ba7cb34ce8cf 100755
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
index 7cbd1415ce7b..00382cc55e25 100755
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
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index 03e03508a6e2..54e49c8ffab1 100755
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
index 7745cb04b611..93274dc8cbde 100755
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
index e79b3c21fdce..178b1ee230ca 100755
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
index 55a0384c0873..fcd1d796ebd0 100755
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
index 8a10af57f17c..38bd3744e68c 100755
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
index ab077f4ceb01..9b281e1dc036 100755
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
index 7cd25208296e..c72c82a171b4 100755
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
index 9008974346b0..c7685347bc4c 100755
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
index 90d0b6252368..1e9e6a066e90 100644
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
2.30.2


