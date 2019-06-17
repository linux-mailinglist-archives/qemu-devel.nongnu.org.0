Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2D1488F5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:30:52 +0200 (CEST)
Received: from localhost ([::1]:49130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuWx-0002xu-J3
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctH4-00037r-Cg
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctH3-0001KC-8Y
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:22 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctH0-0001Gv-Hu; Mon, 17 Jun 2019 11:10:18 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3w3o194656;
 Mon, 17 Jun 2019 15:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=7xrUoYOu+9ElvUB5L88vzyRFGdPo+spBEQlM3TkzjbI=;
 b=GCcE6ysNroabrI5ZmrZk/ajyt8IUOLZq3CTMpSU5CnQYcwc510PzGoKSOGa5x49MUauB
 4SYQH/5ASDHmwExp9kFspQtU+eEhw3ivfC7V5K5vNqJfUsMXcMJMV2N7iGJ9gpVZmX7Y
 st78uMGATUBF2P7hmzIMNLNrlgYSXO5EUHZPSqJmCaP6HZpn6VMIWFq6/EzllS20VbTY
 ddpNFUJV21jur2jdBpZ8A7sQA2cD6NuOLlh5hZzvZ2JOyXkB+3lJQoFRVL6BsxpeLoEC
 lEyeYPITeDdzvrb23o6yzAYqda0FNQgfj+CW4UZmAeiFTOk7FRUOk86LIbIpzuV+dCVy XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t4r3tf6v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF99ki015861;
 Mon, 17 Jun 2019 15:10:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2t5cpdgee1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:15 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5HFAF0Z020660;
 Mon, 17 Jun 2019 15:10:15 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:10:15 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:09:46 +0300
Message-Id: <20190617150950.5264-5-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
References: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=971
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: [Qemu-devel] [QEMU] [PATCH v3 4/8] scsi: Propagate unrealize()
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


