Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB528192
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:47:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpvu-0001IF-P1
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:47:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hTptu-0007tZ-NO
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hTptt-0006Gm-ON
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:45:02 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:52826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
	id 1hTptr-0006Ea-GF; Thu, 23 May 2019 11:44:59 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x4NFi1WG089921; Thu, 23 May 2019 15:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id : in-reply-to : references;
	s=corp-2018-07-02; 
	bh=oYQNiLLInCaatn1i0R555HgKyXewzttIoWAlCHlEROk=;
	b=gXUztAlZ6KmzK64r8eD8++oi8kcJLgouKwK9Rw9OzBMWLUMuXB4k1FO9by0Cpc+wIuke
	j5ZYBLoodloizxJBsnejD6Hsb2uwhFAVnKbdoR8I85lvo7Csd54jAHmgtchTkuzJT/RH
	5W7P5VQh8pRMPMpx3kItcC+P0byKdSn/RnYHBF9hK6J2k4UrK6zo74IwCPKLhD1qrGId
	YJ4n6kkUtA70kyHd6N23ab8ytxYo1ohdR5OLw6UsZdwm0jtRMw+M5o5m5dvuM/DA3LGR
	iwH+czaIFOIhdJ+A4SEZ52Hhwruc1EK+MzNubwDgUksBwHJ0EX//5DsxeQ07Pp/vuZye
	Tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2130.oracle.com with ESMTP id 2smsk5k9p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2019 15:44:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x4NFhb99021938; Thu, 23 May 2019 15:44:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 2smsgtat36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2019 15:44:58 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4NFiv3I002449;
	Thu, 23 May 2019 15:44:57 GMT
Received: from nexus.ravello.local (/213.57.127.2)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 23 May 2019 15:44:57 +0000
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
	mreitz@redhat.com
Date: Thu, 23 May 2019 18:44:42 +0300
Message-Id: <20190523154444.28783-2-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190523154444.28783-1-shmuel.eiderman@oracle.com>
References: <20190523154444.28783-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9265
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=926
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1905230107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9265
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=955
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1905230107
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.79
Subject: [Qemu-devel] [PATCH v4 1/3] qemu-img: rebase: Reuse parent
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
 qemu-img.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 28fba1e7a7..9bd0bb1e47 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3309,29 +3309,18 @@ static int img_rebase(int argc, char **argv)
 
     /* For safe rebasing we need to compare old and new backing file */
     if (!unsafe) {
-        char backing_name[PATH_MAX];
         QDict *options = NULL;
+        BlockDriverState *base_bs = backing_bs(bs);
 
-        if (bs->backing) {
-            if (bs->backing_format[0] != '\0') {
-                options = qdict_new();
-                qdict_put_str(options, "driver", bs->backing_format);
-            }
-
-            if (force_share) {
-                if (!options) {
-                    options = qdict_new();
-                }
-                qdict_put_bool(options, BDRV_OPT_FORCE_SHARE, true);
-            }
-            bdrv_get_backing_filename(bs, backing_name, sizeof(backing_name));
-            blk_old_backing = blk_new_open(backing_name, NULL,
-                                           options, src_flags, &local_err);
-            if (!blk_old_backing) {
+        if (base_bs) {
+            blk_old_backing = blk_new(BLK_PERM_CONSISTENT_READ,
+                                      BLK_PERM_ALL);
+            ret = blk_insert_bs(blk_old_backing, base_bs,
+                                &local_err);
+            if (ret < 0) {
                 error_reportf_err(local_err,
-                                  "Could not open old backing file '%s': ",
-                                  backing_name);
-                ret = -1;
+                                  "Could not reuse old backing file '%s': ",
+                                  base_bs->filename);
                 goto out;
             }
         } else {
-- 
2.13.3


