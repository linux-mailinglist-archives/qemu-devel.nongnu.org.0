Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA6C4548
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 03:08:08 +0200 (CEST)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFT7e-0002aJ-NO
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 21:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRsb-00020l-JF
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRsW-0002a1-MO
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:48:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11282)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iFRsS-00021H-Bb; Tue, 01 Oct 2019 19:48:24 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91NlQrm107943; Tue, 1 Oct 2019 19:47:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vcgaurpcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:47:57 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91NlvqD108674;
 Tue, 1 Oct 2019 19:47:57 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vcgaurpcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:47:57 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91NjmNd029395;
 Tue, 1 Oct 2019 23:47:56 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 2v9y59fakb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 23:47:56 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91NltIV4129460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 23:47:55 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83EFB2805A;
 Tue,  1 Oct 2019 23:47:55 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6877228058;
 Tue,  1 Oct 2019 23:47:55 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 23:47:55 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 80/97] iotests: Restrict nbd Python tests to nbd
Date: Tue,  1 Oct 2019 18:45:59 -0500
Message-Id: <20191001234616.7825-81-mdroth@linux.vnet.ibm.com>
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
X-Received-From: 148.163.156.1
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

We have two Python unittest-style tests that test NBD.  As such, they
should specify supported_protocols=['nbd'] so they are skipped when the
user wants to test some other protocol.

Furthermore, we should restrict their choice of formats to 'raw'.  The
idea of a protocol/format combination is to use some format over some
protocol; but we always use the raw format over NBD.  It does not really
matter what the NBD server uses on its end, and it is not a useful test
of the respective format driver anyway.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit 7c932a1d69a6d6ac5c0b615c11d191da3bbe9aa8)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 tests/qemu-iotests/147 | 5 ++---
 tests/qemu-iotests/205 | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 82513279b0..ce1f5b459d 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -287,6 +287,5 @@ class BuiltinNBD(NBDBlockdevAddBase):
 
 
 if __name__ == '__main__':
-    # Need to support image creation
-    iotests.main(supported_fmts=['vpc', 'parallels', 'qcow', 'vdi', 'qcow2',
-                                 'vmdk', 'raw', 'vhdx', 'qed'])
+    iotests.main(supported_fmts=['raw'],
+                 supported_protocols=['nbd'])
diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index 31b2f5707a..1cf2215730 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -153,4 +153,5 @@ class TestNbdServerRemove(iotests.QMPTestCase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['generic'])
+    iotests.main(supported_fmts=['raw'],
+                 supported_protocols=['nbd'])
-- 
2.17.1


