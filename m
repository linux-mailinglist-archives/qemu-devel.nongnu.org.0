Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8C8CBB6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 08:13:26 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxmXE-0003zo-Dc
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 02:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1hxmV3-0002QX-7Y
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 02:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1hxmV2-0006LT-16
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 02:11:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
 id 1hxmV1-0006JP-Mg
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 02:11:07 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E66r6D050432
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 02:11:06 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uc9s0ed0x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 02:11:05 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <aravinda@linux.vnet.ibm.com>;
 Wed, 14 Aug 2019 07:11:05 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 07:11:03 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7E6B2Kq47120668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 06:11:02 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EA206A04D;
 Wed, 14 Aug 2019 06:11:02 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 358AF6A047;
 Wed, 14 Aug 2019 06:11:00 +0000 (GMT)
Received: from [127.0.1.1] (unknown [9.124.31.79])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 06:10:59 +0000 (GMT)
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
To: aik@au1.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Date: Wed, 14 Aug 2019 11:40:58 +0530
In-Reply-To: <156576293464.29984.1631520917528142744.stgit@aravinda>
References: <156576293464.29984.1631520917528142744.stgit@aravinda>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081406-0016-0000-0000-000009DC0450
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011590; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01246559; UDB=6.00657833; IPR=6.01028066; 
 MB=3.00028170; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-14 06:11:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081406-0017-0000-0000-0000446B2F4D
Message-Id: <156576305894.29984.16040662309121781174.stgit@aravinda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=899 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140060
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [patch-for-4.2 PATCH v11 1/6] Wrapper function to wait
 on condition for the main loop mutex
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
Cc: paulus@ozlabs.org, aravinda@linux.vnet.ibm.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a wrapper function to wait on condition for
the main loop mutex. This function atomically releases
the main loop mutex and causes the calling thread to
block on the condition. This wrapper is required because
qemu_global_mutex is a static variable.

Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 cpus.c                   |    5 +++++
 include/qemu/main-loop.h |    8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/cpus.c b/cpus.c
index 927a00a..7dca2b7 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1867,6 +1867,11 @@ void qemu_mutex_unlock_iothread(void)
     qemu_mutex_unlock(&qemu_global_mutex);
 }
 
+void qemu_cond_wait_iothread(QemuCond *cond)
+{
+    qemu_cond_wait(cond, &qemu_global_mutex);
+}
+
 static bool all_vcpus_paused(void)
 {
     CPUState *cpu;
diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index f6ba78e..a6d20b0 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -295,6 +295,14 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
  */
 void qemu_mutex_unlock_iothread(void);
 
+/*
+ * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
+ *
+ * This function atomically releases the main loop mutex and causes
+ * the calling thread to block on the condition.
+ */
+void qemu_cond_wait_iothread(QemuCond *cond);
+
 /* internal interfaces */
 
 void qemu_fd_register(int fd);


