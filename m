Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B8C45C3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 03:58:32 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFTuQ-0002jd-5c
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 21:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRsf-00026n-VG
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:48:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRsW-0002ZJ-Kk
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:48:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13302
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iFRsQ-00020d-FN; Tue, 01 Oct 2019 19:48:23 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91NlQOw079000; Tue, 1 Oct 2019 19:47:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vcc4f013d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:47:56 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91NluaD079623;
 Tue, 1 Oct 2019 19:47:56 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vcc4f0134-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:47:56 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91NjkEW027150;
 Tue, 1 Oct 2019 23:47:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2v9y587bjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 23:47:55 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91NltOq16122740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 23:47:55 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E35F28058;
 Tue,  1 Oct 2019 23:47:55 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC6AD2805A;
 Tue,  1 Oct 2019 23:47:54 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 23:47:54 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 79/97] iotests: Restrict file Python tests to file
Date: Tue,  1 Oct 2019 18:45:58 -0500
Message-Id: <20191001234616.7825-80-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001234616.7825-1-mdroth@linux.vnet.ibm.com>
References: <20191001234616.7825-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010203
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Most of our Python unittest-style tests only support the file protocol.
You can run them with any other protocol, but the test will simply
ignore your choice and use file anyway.

We should let them signal that they require the file protocol so they
are skipped when you want to test some other protocol.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit 103cbc771e5660d1f5bb458be80aa9e363547ae0)
 Conflicts:
	tests/qemu-iotests/257
*drop changes for test 257, not present in 4.0
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 tests/qemu-iotests/030 | 3 ++-
 tests/qemu-iotests/040 | 3 ++-
 tests/qemu-iotests/041 | 3 ++-
 tests/qemu-iotests/044 | 3 ++-
 tests/qemu-iotests/045 | 3 ++-
 tests/qemu-iotests/055 | 3 ++-
 tests/qemu-iotests/056 | 3 ++-
 tests/qemu-iotests/057 | 3 ++-
 tests/qemu-iotests/065 | 3 ++-
 tests/qemu-iotests/096 | 3 ++-
 tests/qemu-iotests/118 | 3 ++-
 tests/qemu-iotests/124 | 3 ++-
 tests/qemu-iotests/129 | 3 ++-
 tests/qemu-iotests/132 | 3 ++-
 tests/qemu-iotests/139 | 3 ++-
 tests/qemu-iotests/148 | 3 ++-
 tests/qemu-iotests/151 | 3 ++-
 tests/qemu-iotests/152 | 3 ++-
 tests/qemu-iotests/155 | 3 ++-
 tests/qemu-iotests/163 | 3 ++-
 tests/qemu-iotests/165 | 3 ++-
 tests/qemu-iotests/169 | 3 ++-
 tests/qemu-iotests/196 | 3 ++-
 tests/qemu-iotests/199 | 3 ++-
 tests/qemu-iotests/245 | 3 ++-
 25 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index c6311d1825..cb550812a7 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -865,4 +865,5 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.cancel_and_wait(resume=True)
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2', 'qed'])
+    iotests.main(supported_fmts=['qcow2', 'qed'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index b81133a474..e2ca706117 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -395,4 +395,5 @@ class TestReopenOverlay(ImageCommitTestCase):
         self.run_commit_test(self.img1, self.img0)
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2', 'qed'])
+    iotests.main(supported_fmts=['qcow2', 'qed'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 26bf1701eb..ae6ed952c6 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1068,4 +1068,5 @@ class TestOrphanedSource(iotests.QMPTestCase):
         self.assert_qmp(result, 'error/class', 'GenericError')
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2', 'qed'])
+    iotests.main(supported_fmts=['qcow2', 'qed'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 9ec3dba734..05ea1f49c5 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -118,4 +118,5 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
         pass
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/045 b/tests/qemu-iotests/045
index d5484a0ee1..01cc038884 100755
--- a/tests/qemu-iotests/045
+++ b/tests/qemu-iotests/045
@@ -175,4 +175,5 @@ class TestSCMFd(iotests.QMPTestCase):
             "File descriptor named '%s' not found" % fdname)
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['raw'])
+    iotests.main(supported_fmts=['raw'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/055 b/tests/qemu-iotests/055
index 3437c11507..c732a112d6 100755
--- a/tests/qemu-iotests/055
+++ b/tests/qemu-iotests/055
@@ -563,4 +563,5 @@ class TestDriveCompression(iotests.QMPTestCase):
                                         target='drive1')
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['raw', 'qcow2'])
+    iotests.main(supported_fmts=['raw', 'qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/056 b/tests/qemu-iotests/056
index e5ac25127b..ce7adf9174 100755
--- a/tests/qemu-iotests/056
+++ b/tests/qemu-iotests/056
@@ -335,4 +335,5 @@ class BackupTest(iotests.QMPTestCase):
         self.dismissal_failure(True)
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2', 'qed'])
+    iotests.main(supported_fmts=['qcow2', 'qed'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/057 b/tests/qemu-iotests/057
index 9f0a5a3057..9fbba759b6 100755
--- a/tests/qemu-iotests/057
+++ b/tests/qemu-iotests/057
@@ -256,4 +256,5 @@ class TestSnapshotDelete(ImageSnapshotTestCase):
         self.assert_qmp(result, 'error/class', 'GenericError')
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 8bac383ea7..5b21eb96bd 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -129,4 +129,5 @@ TestQemuImgInfo = None
 TestQMP = None
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/096 b/tests/qemu-iotests/096
index a69439602d..ab9cb47822 100755
--- a/tests/qemu-iotests/096
+++ b/tests/qemu-iotests/096
@@ -67,4 +67,5 @@ class TestLiveSnapshot(iotests.QMPTestCase):
         self.checkConfig('target')
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index 603e10e8a2..c854378281 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -703,4 +703,5 @@ if __name__ == '__main__':
                        iotests.qemu_default_machine)
     # Need to support image creation
     iotests.main(supported_fmts=['vpc', 'parallels', 'qcow', 'vdi', 'qcow2',
-                                 'vmdk', 'raw', 'vhdx', 'qed'])
+                                 'vmdk', 'raw', 'vhdx', 'qed'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 3440f54781..ca40ba3be2 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -779,4 +779,5 @@ class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 9e87e1c8d9..cd6b9e9ce7 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -83,4 +83,5 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         self.do_test_stop("block-commit", device="drive0")
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=["qcow2"])
+    iotests.main(supported_fmts=["qcow2"],
+                 supported_protocols=["file"])
diff --git a/tests/qemu-iotests/132 b/tests/qemu-iotests/132
index f53ef6e391..0f2a106c81 100755
--- a/tests/qemu-iotests/132
+++ b/tests/qemu-iotests/132
@@ -56,4 +56,5 @@ class TestSingleDrive(iotests.QMPTestCase):
                         'target image does not match source after mirroring')
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['raw', 'qcow2'])
+    iotests.main(supported_fmts=['raw', 'qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/139 b/tests/qemu-iotests/139
index 933b45121a..8dc839ec7e 100755
--- a/tests/qemu-iotests/139
+++ b/tests/qemu-iotests/139
@@ -361,4 +361,5 @@ class TestBlockdevDel(iotests.QMPTestCase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=["qcow2"])
+    iotests.main(supported_fmts=["qcow2"],
+                 supported_protocols=["file"])
diff --git a/tests/qemu-iotests/148 b/tests/qemu-iotests/148
index e01b061fe7..8c11c53cba 100755
--- a/tests/qemu-iotests/148
+++ b/tests/qemu-iotests/148
@@ -137,4 +137,5 @@ class TestFifoQuorumEvents(TestQuorumEvents):
 
 if __name__ == '__main__':
     iotests.verify_quorum()
-    iotests.main(supported_fmts=["raw"])
+    iotests.main(supported_fmts=["raw"],
+                 supported_protocols=["file"])
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index ad7359fc8d..76ae265cc1 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -142,4 +142,5 @@ class TestActiveMirror(iotests.QMPTestCase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2', 'raw'])
+    iotests.main(supported_fmts=['qcow2', 'raw'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/152 b/tests/qemu-iotests/152
index fec546d033..732bf5f062 100755
--- a/tests/qemu-iotests/152
+++ b/tests/qemu-iotests/152
@@ -59,4 +59,5 @@ class TestUnaligned(iotests.QMPTestCase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['raw', 'qcow2'])
+    iotests.main(supported_fmts=['raw', 'qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index 63a5b5e2c0..e19485911c 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -258,4 +258,5 @@ BaseClass = None
 MirrorBaseClass = None
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index 158ba5d092..081ccc8ac1 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -170,4 +170,5 @@ class TestShrink1M(ShrinkBaseClass):
 ShrinkBaseClass = None
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['raw', 'qcow2'])
+    iotests.main(supported_fmts=['raw', 'qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index 88f62d3c6d..5650dc7c87 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -103,4 +103,5 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         self.vm.shutdown()
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/169
index 527aebd0cb..25924d68fc 100755
--- a/tests/qemu-iotests/169
+++ b/tests/qemu-iotests/169
@@ -222,4 +222,5 @@ for cmb in list(itertools.product((True, False), repeat=2)):
                      'do_test_migration_resume_source', *list(cmb))
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index 4116ebc92b..92fe9244f8 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -63,4 +63,5 @@ class TestInvalidateAutoclear(iotests.QMPTestCase):
             self.assertEqual(f.read(1), b'\x00')
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/199
index 651e8df5d9..a2c8ecab5a 100755
--- a/tests/qemu-iotests/199
+++ b/tests/qemu-iotests/199
@@ -115,4 +115,5 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         self.assert_qmp(result, 'return/sha256', sha256);
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'], supported_cache_modes=['none'])
+    iotests.main(supported_fmts=['qcow2'], supported_cache_modes=['none'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index a04c6235c1..fbfd624878 100644
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -994,4 +994,5 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'backing': 'hd2'})
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=["qcow2"])
+    iotests.main(supported_fmts=["qcow2"],
+                 supported_protocols=["file"])
-- 
2.17.1


