Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F111AB6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 16:03:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMCJT-0005Hy-PW
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 10:03:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hMCH1-0003wg-GC
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hMCGw-0001Q4-Mk
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:01:19 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:37802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
	id 1hMCGp-0001Hf-L4; Thu, 02 May 2019 10:01:07 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x42Drlcw044213; Thu, 2 May 2019 14:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id : in-reply-to : references;
	s=corp-2018-07-02; 
	bh=9ccw3z6s2hPMEok4793CteM3gasxj/Ia2H+u0wiDWIc=;
	b=f1PrdpiTYAcV8GxxUsZ1nVNuf/qJ05TNmikZsnmi2q5g9wKJpqYoSjJE9oX0JDFcARa5
	5oU/CYFA5gZNlHOpfh/782GQsl33+iGGkniSIyUDHHzup0DalWBHJP0Y9a2Q6ldJKeY7
	6pT4+8yEsKp1jnRa8jUG+jKbmXTsQ3wjrmkNWtKmNacJ56Wl1VjslCeYL7NX3d8YZJtJ
	WWq1/YIRXortjVeFq/vDNMIF5aNPd6m4aJtvNW3Z5p/vmYvTNbCEkH5nrU1py4+CNE1P
	zrC4zDIpOXL++ZmVp7f+NHxUQWQQXw5e1uxJ+6GA6GuxfiJR0qLkLhknmNsHLrqCB1Oy
	TA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 2s6xhygtdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 May 2019 14:01:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x42DwtIr147312; Thu, 2 May 2019 13:59:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 2s6xhgtnfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 May 2019 13:59:06 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x42Dx5Hj004439;
	Thu, 2 May 2019 13:59:05 GMT
Received: from nexus.ravello.local (/213.57.127.2)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 02 May 2019 06:59:05 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, mreitz@redhat.com, qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  2 May 2019 16:58:26 +0300
Message-Id: <20190502135828.42797-2-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190502135828.42797-1-shmuel.eiderman@oracle.com>
References: <20190502085029.30776-1-shmuel.eiderman@oracle.com>
	<20190502135828.42797-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9244
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=965
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1905020095
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9244
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=986
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1905020095
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.79
Subject: [Qemu-devel] [PATCH v2 1/3] qemu-img: rebase: Reuse parent
 BlockDriverState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eyal.moscovici@oracle.com, arbel.moshe@oracle.com, liran.alon@oracle.com,
	shmuel.eiderman@oracle.com, sagi.amit@oracle.com, karl.heubaum@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In safe mode we open the entire chain, including the parent backing
file of the rebased file.
Do not open a new BlockBackend for the parent backing file, which
saves opening the rest of the chain twice, which for long chains
saves many "pricy" bdrv_open() calls.

Permissions for blk_new() were copied from blk_new_open() when
flags = 0.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Eyal Moscovici <eyal.moscovici@oracle.com>
Signed-off-by: Sagi Amit <sagi.amit@oracle.com>
Co-developed-by: Sagi Amit <sagi.amit@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 qemu-img.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 8ee63daeae..d9b609b3f0 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3297,28 +3297,23 @@ static int img_rebase(int argc, char **argv)
 
     /* For safe rebasing we need to compare old and new backing file */
     if (!unsafe) {
-        char backing_name[PATH_MAX];
         QDict *options = NULL;
+        BlockDriverState *base_bs = backing_bs(bs);
 
-        if (bs->backing_format[0] != '\0') {
-            options = qdict_new();
-            qdict_put_str(options, "driver", bs->backing_format);
+        if (!base_bs) {
+            error_setg(&local_err, "Image does not have a backing file");
+            ret = -1;
+            goto out;
         }
 
-        if (force_share) {
-            if (!options) {
-                options = qdict_new();
-            }
-            qdict_put_bool(options, BDRV_OPT_FORCE_SHARE, true);
-        }
-        bdrv_get_backing_filename(bs, backing_name, sizeof(backing_name));
-        blk_old_backing = blk_new_open(backing_name, NULL,
-                                       options, src_flags, &local_err);
-        if (!blk_old_backing) {
+        blk_old_backing = blk_new(BLK_PERM_CONSISTENT_READ,
+                                  BLK_PERM_ALL);
+        ret = blk_insert_bs(blk_old_backing, base_bs,
+                            &local_err);
+        if (ret < 0) {
             error_reportf_err(local_err,
-                              "Could not open old backing file '%s': ",
-                              backing_name);
-            ret = -1;
+                              "Could not reuse old backing file '%s': ",
+                              base_bs->filename);
             goto out;
         }
 
-- 
2.13.3


