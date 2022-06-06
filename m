Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E358653E17D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 10:05:09 +0200 (CEST)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny7jY-0008Sd-By
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 04:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79s-0005SV-B8; Mon, 06 Jun 2022 03:28:17 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:49426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79i-0002Zc-NO; Mon, 06 Jun 2022 03:28:16 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 3B8ED2E0EB3;
 Mon,  6 Jun 2022 10:27:58 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 PIYSBM7dl0-RvJSXSu1; Mon, 06 Jun 2022 10:27:58 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654500478; bh=KsQsardW5tbLH8t1lCuEiWzDfu1PSUc1hq+8YBweoIU=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=dQ4WmIE2NRmy3lb0E46kPAG54dXaR6YgzHdjG86mWqY+vLFXIIDjcSfDmGeGZUmVy
 MmtYxOOnrRDXMjNxHFXn5BLz68lnWY7TebL4A4Ch0O+9FYH3M653+GFhcnhOBNzEi3
 Xh3brOC7sBI3R3U/CsV+jsYggC5NiMD6IWpWsgsk=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y8SDrjDjAj-RuM4LgaV; Mon, 06 Jun 2022 10:27:57 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 jsnow@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 08/11] iotests: drop some extra ** in qmp() call
Date: Mon,  6 Jun 2022 10:27:28 +0300
Message-Id: <20220606072731.878226-9-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606072731.878226-1-vsementsov@yandex-team.ru>
References: <20220606072731.878226-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qmp() method supports passing dict (if it doesn't need substituting
'_' to '-' in keys). So, drop some extra '**' operators.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/040                        |  4 +-
 tests/qemu-iotests/041                        | 14 +++---
 tests/qemu-iotests/129                        |  2 +-
 tests/qemu-iotests/147                        |  2 +-
 tests/qemu-iotests/155                        |  2 +-
 tests/qemu-iotests/264                        | 12 ++---
 tests/qemu-iotests/295                        |  5 +-
 tests/qemu-iotests/296                        | 15 +++---
 tests/qemu-iotests/tests/migrate-bitmaps-test |  4 +-
 .../tests/mirror-ready-cancel-error           | 50 +++++++++----------
 10 files changed, 54 insertions(+), 56 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 2b68946744..46a4ec9bde 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -774,7 +774,7 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         result = self.vm.qmp('object-add', qom_type='throttle-group', id='tg')
         self.assert_qmp(result, 'return', {})
 
-        result = self.vm.qmp('blockdev-add', **{
+        result = self.vm.qmp('blockdev-add', {
                 'node-name': 'top-filter',
                 'driver': 'throttle',
                 'throttle-group': 'tg',
@@ -935,7 +935,7 @@ class TestCommitWithOverriddenBacking(iotests.QMPTestCase):
         self.vm.launch()
 
         # Use base_b instead of base_a as the backing of top
-        result = self.vm.qmp('blockdev-add', **{
+        result = self.vm.qmp('blockdev-add', {
                                 'node-name': 'top',
                                 'driver': iotests.imgfmt,
                                 'file': {
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 550e4dc391..3aef42aec8 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -236,7 +236,7 @@ class TestSingleBlockdev(TestSingleDrive):
         args = {'driver': iotests.imgfmt,
                 'node-name': self.qmp_target,
                 'file': { 'filename': target_img, 'driver': 'file' } }
-        result = self.vm.qmp("blockdev-add", **args)
+        result = self.vm.qmp("blockdev-add", args)
         self.assert_qmp(result, 'return', {})
 
     def test_mirror_to_self(self):
@@ -963,7 +963,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
         #assemble the quorum block device from the individual files
         args = { "driver": "quorum", "node-name": "quorum0",
                  "vote-threshold": 2, "children": [ "img0", "img1", "img2" ] }
-        result = self.vm.qmp("blockdev-add", **args)
+        result = self.vm.qmp("blockdev-add", args)
         self.assert_qmp(result, 'return', {})
 
 
@@ -1278,7 +1278,7 @@ class TestReplaces(iotests.QMPTestCase):
         """
         Check that we can replace filter nodes.
         """
-        result = self.vm.qmp('blockdev-add', **{
+        result = self.vm.qmp('blockdev-add', {
                                  'driver': 'copy-on-read',
                                  'node-name': 'filter0',
                                  'file': {
@@ -1319,7 +1319,7 @@ class TestFilters(iotests.QMPTestCase):
         self.vm = iotests.VM().add_device('virtio-scsi,id=vio-scsi')
         self.vm.launch()
 
-        result = self.vm.qmp('blockdev-add', **{
+        result = self.vm.qmp('blockdev-add', {
                                 'node-name': 'target',
                                 'driver': iotests.imgfmt,
                                 'file': {
@@ -1355,7 +1355,7 @@ class TestFilters(iotests.QMPTestCase):
         os.remove(backing_img)
 
     def test_cor(self):
-        result = self.vm.qmp('blockdev-add', **{
+        result = self.vm.qmp('blockdev-add', {
                                 'node-name': 'filter',
                                 'driver': 'copy-on-read',
                                 'file': self.filterless_chain
@@ -1384,7 +1384,7 @@ class TestFilters(iotests.QMPTestCase):
         assert target_map[1]['depth'] == 0
 
     def test_implicit_mirror_filter(self):
-        result = self.vm.qmp('blockdev-add', **self.filterless_chain)
+        result = self.vm.qmp('blockdev-add', self.filterless_chain)
         self.assert_qmp(result, 'return', {})
 
         # We need this so we can query from above the mirror node
@@ -1418,7 +1418,7 @@ class TestFilters(iotests.QMPTestCase):
     def test_explicit_mirror_filter(self):
         # Same test as above, but this time we give the mirror filter
         # a node-name so it will not be invisible
-        result = self.vm.qmp('blockdev-add', **self.filterless_chain)
+        result = self.vm.qmp('blockdev-add', self.filterless_chain)
         self.assert_qmp(result, 'return', {})
 
         # We need this so we can query from above the mirror node
diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index c75ec62ecf..e1536ee3c3 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -87,7 +87,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.overlay_img,
                          '1G')
 
-        result = self.vm.qmp('blockdev-add', **{
+        result = self.vm.qmp('blockdev-add', {
             'node-name': 'overlay',
             'driver': iotests.imgfmt,
             'file': {
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 770b73e2f4..08111c5108 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -58,7 +58,7 @@ class NBDBlockdevAddBase(iotests.QMPTestCase):
     def client_test(self, filename, address, export=None,
                     node_name='nbd-blockdev', delete=True):
         bao = self.blockdev_add_options(address, export, node_name)
-        result = self.vm.qmp('blockdev-add', **bao)
+        result = self.vm.qmp('blockdev-add', bao)
         self.assert_qmp(result, 'return', {})
 
         found = False
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index d3e1b7401e..0c073fd61b 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -110,7 +110,7 @@ class BaseClass(iotests.QMPTestCase):
                 elif self.target_blockdev_backing:
                         options['backing'] = self.target_blockdev_backing
 
-                result = self.vm.qmp('blockdev-add', **options)
+                result = self.vm.qmp('blockdev-add', options)
                 self.assert_qmp(result, 'return', {})
 
     def tearDown(self):
diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index bc431d1a19..f8a4c055f3 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -49,12 +49,12 @@ class TestNbdReconnect(iotests.QMPTestCase):
         assert job in ('blockdev-backup', 'blockdev-mirror')
         with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
             result = self.vm.qmp('blockdev-add',
-                                 **{'node_name': 'backup0',
-                                    'driver': 'raw',
-                                    'file': {'driver': 'nbd',
-                                             'server': {'type': 'unix',
-                                                        'path': nbd_sock},
-                                             'reconnect-delay': 10}})
+                                 {'node-name': 'backup0',
+                                  'driver': 'raw',
+                                  'file': {'driver': 'nbd',
+                                           'server': {'type': 'unix',
+                                                      'path': nbd_sock},
+                                           'reconnect-delay': 10}})
             self.assert_qmp(result, 'return', {})
             result = self.vm.qmp(job, device='drive0',
                                  sync='full', target='backup0',
diff --git a/tests/qemu-iotests/295 b/tests/qemu-iotests/295
index 270ad3999f..8ebe31054c 100755
--- a/tests/qemu-iotests/295
+++ b/tests/qemu-iotests/295
@@ -102,8 +102,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
                 }
             }
 
-        result = self.vm.qmp('blockdev-add', **
-            {
+        result = self.vm.qmp('blockdev-add', {
                 'driver': iotests.imgfmt,
                 'node-name': id,
                 'read-only': read_only,
@@ -120,7 +119,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
 
     # close the encrypted block device
     def closeImageQmp(self, id):
-        result = self.vm.qmp('blockdev-del', **{ 'node-name': id })
+        result = self.vm.qmp('blockdev-del', {'node-name': id})
         self.assert_qmp(result, 'return', {})
 
     ###########################################################################
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 19a674c5ae..47d2526b72 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -42,7 +42,7 @@ class Secret:
         return  [ "secret,id=" + self._id + ",data=" + self._secret]
 
     def to_qmp_object(self):
-        return { "qom_type" : "secret", "id": self.id(),
+        return { "qom-type" : "secret", "id": self.id(),
                  "data": self.secret() }
 
 ################################################################################
@@ -61,9 +61,9 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
         # create the secrets and load 'em into the VMs
         self.secrets = [ Secret(i) for i in range(0, 4) ]
         for secret in self.secrets:
-            result = self.vm1.qmp("object-add", **secret.to_qmp_object())
+            result = self.vm1.qmp("object-add", secret.to_qmp_object())
             self.assert_qmp(result, 'return', {})
-            result = self.vm2.qmp("object-add", **secret.to_qmp_object())
+            result = self.vm2.qmp("object-add", secret.to_qmp_object())
             self.assert_qmp(result, 'return', {})
 
     # test case shutdown
@@ -135,15 +135,14 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
             result = vm.qmp(command, options=[opts])
             self.assert_qmp(result, 'return', {})
         else:
-            result = vm.qmp(command, **opts)
+            result = vm.qmp(command, opts)
             self.assert_qmp(result, 'return', {})
 
 
     ###########################################################################
     # add virtio-blk consumer for a block device
     def addImageUser(self, vm, id, disk_id, share_rw=False):
-        result = vm.qmp('device_add', **
-            {
+        result = vm.qmp('device_add', {
                 'driver': 'virtio-blk',
                 'id': id,
                 'drive': disk_id,
@@ -155,7 +154,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
 
     # close the encrypted block device
     def closeImageQmp(self, vm, id):
-        result = vm.qmp('blockdev-del', **{ 'node-name': id })
+        result = vm.qmp('blockdev-del', {'node-name': id})
         self.assert_qmp(result, 'return', {})
 
     ###########################################################################
@@ -174,7 +173,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
             },
         }
 
-        result = vm.qmp('x-blockdev-amend', **args)
+        result = vm.qmp('x-blockdev-amend', args)
         iotests.log(result)
         # Run the job only if it was created
         event = ('JOB_STATUS_CHANGE',
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index 8668caae1e..eebb256485 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -67,7 +67,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         if persistent:
             params['persistent'] = True
 
-        result = vm.qmp('block-dirty-bitmap-add', **params)
+        result = vm.qmp('block-dirty-bitmap-add', params)
         self.assert_qmp(result, 'return', {})
 
     def check_bitmap(self, vm, sha256):
@@ -256,7 +256,7 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         self.vm = iotests.VM()
         self.vm.launch()
 
-        result = self.vm.qmp('blockdev-add', **blockdev)
+        result = self.vm.qmp('blockdev-add', blockdev)
         self.assert_qmp(result, 'return', {})
 
         # Check that the bitmaps are there
diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error b/tests/qemu-iotests/tests/mirror-ready-cancel-error
index 01217459b9..a59e245659 100755
--- a/tests/qemu-iotests/tests/mirror-ready-cancel-error
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error
@@ -49,12 +49,12 @@ class TestMirrorReadyCancelError(iotests.QMPTestCase):
 
     def add_blockdevs(self, once: bool) -> None:
         res = self.vm.qmp('blockdev-add',
-                          **{'node-name': 'source',
-                             'driver': iotests.imgfmt,
-                             'file': {
-                                 'driver': 'file',
-                                 'filename': source
-                             }})
+                          {'node-name': 'source',
+                           'driver': iotests.imgfmt,
+                           'file': {
+                               'driver': 'file',
+                               'filename': source
+                           }})
         self.assert_qmp(res, 'return', {})
 
         # blkdebug notes:
@@ -63,25 +63,25 @@ class TestMirrorReadyCancelError(iotests.QMPTestCase):
         # when the job is about to complete, and we want that one to
         # fail.
         res = self.vm.qmp('blockdev-add',
-                          **{'node-name': 'target',
-                             'driver': iotests.imgfmt,
-                             'file': {
-                                 'driver': 'blkdebug',
-                                 'image': {
-                                     'driver': 'file',
-                                     'filename': target
-                                 },
-                                 'set-state': [{
-                                     'event': 'flush_to_disk',
-                                     'state': 1,
-                                     'new_state': 2
-                                 }],
-                                 'inject-error': [{
-                                     'event': 'flush_to_disk',
-                                     'once': once,
-                                     'immediately': True,
-                                     'state': 2
-                                 }]}})
+                          {'node-name': 'target',
+                           'driver': iotests.imgfmt,
+                           'file': {
+                               'driver': 'blkdebug',
+                               'image': {
+                                   'driver': 'file',
+                                   'filename': target
+                               },
+                               'set-state': [{
+                                   'event': 'flush_to_disk',
+                                   'state': 1,
+                                   'new_state': 2
+                               }],
+                               'inject-error': [{
+                                   'event': 'flush_to_disk',
+                                   'once': once,
+                                   'immediately': True,
+                                   'state': 2
+                               }]}})
         self.assert_qmp(res, 'return', {})
 
     def start_mirror(self) -> None:
-- 
2.25.1


