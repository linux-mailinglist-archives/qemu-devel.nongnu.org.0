Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775F4B52E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 11:46:07 +0200 (CEST)
Received: from localhost ([::1]:36270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdXAM-00026Y-Ke
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 05:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hdWv0-0005GS-0L
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 05:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hdWuw-00005n-9e
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 05:30:13 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41206)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hdWuj-0007rk-56; Wed, 19 Jun 2019 05:29:59 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9SV4u081454;
 Wed, 19 Jun 2019 09:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=7xrUoYOu+9ElvUB5L88vzyRFGdPo+spBEQlM3TkzjbI=;
 b=k3DS82HoJ+NNom7371+8RIKbP8KMlKzFpbWtOBNcSShpJ/fExiOG7j8/rb3wD2q8m+yn
 MkA2Sah0MUoe71jGtg+RyFIRFRQNDUcnItFj0JP5RqSwDr+q7QSqsuHZLR+UytvBWqVo
 CqjqBI8jQ0+/PsWx0INB89fA3BrU5H+E2B7y/pad2OzqacOU2Kj5uP+BCckU4rBCHr/j
 gL342f2bkrTHqodAqfqxhW1nnU1fcezg4YjLSFaU7028vCtdv5B7OOAR23488Ju9zS98
 Bk+tSwLPYQDLo7c4Xxk/5DgM1PSYBrapnruUVyrpCAOtcxKPcwhfy2N2sIX1SkDQjBT3 xA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2t7809a8w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:29:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9TbhM001124;
 Wed, 19 Jun 2019 09:29:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2t77ymytw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:29:37 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5J9TXta005122;
 Wed, 19 Jun 2019 09:29:33 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 02:29:33 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Wed, 19 Jun 2019 12:29:01 +0300
Message-Id: <20190619092905.24029-5-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190619092905.24029-1-shmuel.eiderman@oracle.com>
References: <20190619092905.24029-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=971
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190078
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.78
Subject: [Qemu-devel] [QEMU] [PATCH v4 4/8] scsi: Propagate unrealize()
 callback to scsi-hd
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
Cc: liran.alon@oracle.com, shmuel.eiderman@oracle.com, karl.heubaum@oracle.com,
 arbel.moshe@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need to add LCHS removal logic to scsi-hd's unrealize() in the
next commit.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 hw/scsi/scsi-bus.c     | 15 +++++++++++++++
 include/hw/scsi/scsi.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index c480553083..f6fe497a1a 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -55,6 +55,14 @@ static void scsi_device_realize(SCSIDevice *s, Error **errp)
     }
 }
 
+static void scsi_device_unrealize(SCSIDevice *s, Error **errp)
+{
+    SCSIDeviceClass *sc = SCSI_DEVICE_GET_CLASS(s);
+    if (sc->unrealize) {
+        sc->unrealize(s, errp);
+    }
+}
+
 int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                        void *hba_private)
 {
@@ -213,11 +221,18 @@ static void scsi_qdev_realize(DeviceState *qdev, Error **errp)
 static void scsi_qdev_unrealize(DeviceState *qdev, Error **errp)
 {
     SCSIDevice *dev = SCSI_DEVICE(qdev);
+    Error *local_err = NULL;
 
     if (dev->vmsentry) {
         qemu_del_vm_change_state_handler(dev->vmsentry);
     }
 
+    scsi_device_unrealize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     scsi_device_purge_requests(dev, SENSE_CODE(NO_SENSE));
     blockdev_mark_auto_del(dev->conf.blk);
 }
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 426566a5c6..8cf71f910d 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -59,6 +59,7 @@ struct SCSIRequest {
 typedef struct SCSIDeviceClass {
     DeviceClass parent_class;
     void (*realize)(SCSIDevice *dev, Error **errp);
+    void (*unrealize)(SCSIDevice *dev, Error **errp);
     int (*parse_cdb)(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                      void *hba_private);
     SCSIRequest *(*alloc_req)(SCSIDevice *s, uint32_t tag, uint32_t lun,
-- 
2.13.3


