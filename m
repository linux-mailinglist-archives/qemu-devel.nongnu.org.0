Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C4488AC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:16:27 +0200 (CEST)
Received: from localhost ([::1]:49002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuJ0-0007yH-Iz
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctHB-0003DR-AW
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctH6-0001OX-Tj
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:27 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctH3-0001Jy-Gr; Mon, 17 Jun 2019 11:10:21 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3jZT008683;
 Mon, 17 Jun 2019 15:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=LGrComxyqN1TLgk8Bo9iKZ5zTEqxz7KVof3cokKzZBY=;
 b=UV1/vxkTflPpgcGuVroPQl8PEzmYkvG1M8jPI4mNxfvbPRuVZcgu6YvNgqOUq1IfJdnO
 stri79mkHwSrzT1ys49T+VT9J1RyzaqSl6k4dIorU45woIB+XJl/IO6MG/wyJUbHb1RE
 ehihHN6YzzOgLa4rVCUYT1q7zmcu4Sd+e8945J1Xbwk7rxp/vNuP6JN3CdukFh8uW6E8
 NPNFM4NDe5ZnnzD8FeX8duDCwNxhxWmsb9ElCivTYO3G3Ihl76BznuT1Mz+veVjL0W1m
 KGKzkeP05YvLH10idMMQntdIOruEkqua3Puj0gSiLylDmnSA2B/rT1vJ96jdM32vcWe1 tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2t4saq73fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF99AV015910;
 Mon, 17 Jun 2019 15:10:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2t5cpdgeew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:18 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HFAIOc025733;
 Mon, 17 Jun 2019 15:10:18 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:10:18 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:09:47 +0300
Message-Id: <20190617150950.5264-6-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
References: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=889
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=932 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [QEMU] [PATCH v3 5/8] bootdevice: Gather LCHS from all
 relevant devices
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

Relevant devices are:
    * ide-hd (and ide-cd, ide-drive)
    * scsi-hd (and scsi-cd, scsi-disk, scsi-block)
    * virtio-blk-pci

We do not call del_boot_device_lchs() for ide-* since we don't need to -
IDE block devices do not support unplugging.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 hw/block/virtio-blk.c |  6 ++++++
 hw/ide/qdev.c         |  5 +++++
 hw/scsi/scsi-disk.c   | 14 ++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 06e57a4d39..787bbd768a 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1182,6 +1182,11 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     blk_set_guest_block_size(s->blk, s->conf.conf.logical_block_size);
 
     blk_iostatus_enable(s->blk);
+
+    add_boot_device_lchs(dev, "/disk@0,0",
+                         (&conf->conf)->lcyls,
+                         (&conf->conf)->lheads,
+                         (&conf->conf)->lsecs);
 }
 
 static void virtio_blk_device_unrealize(DeviceState *dev, Error **errp)
@@ -1189,6 +1194,7 @@ static void virtio_blk_device_unrealize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOBlock *s = VIRTIO_BLK(dev);
 
+    del_boot_device_lchs(dev, "/disk@0,0");
     virtio_blk_data_plane_destroy(s->dataplane);
     s->dataplane = NULL;
     qemu_del_vm_change_state_handler(s->change);
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 9cae3205df..07f429d5e3 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -215,6 +215,11 @@ static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **errp)
 
     add_boot_device_path(dev->conf.bootindex, &dev->qdev,
                          dev->unit ? "/disk@1" : "/disk@0");
+
+    add_boot_device_lchs(&dev->qdev, dev->unit ? "/disk@1" : "/disk@0",
+                         (&dev->conf)->lcyls,
+                         (&dev->conf)->lheads,
+                         (&dev->conf)->lsecs);
 }
 
 static void ide_dev_get_bootindex(Object *obj, Visitor *v, const char *name,
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 7b89ac798b..3451aefdea 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2390,6 +2390,16 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
     blk_set_guest_block_size(s->qdev.conf.blk, s->qdev.blocksize);
 
     blk_iostatus_enable(s->qdev.conf.blk);
+
+    add_boot_device_lchs(&dev->qdev, NULL,
+                         (&dev->conf)->lcyls,
+                         (&dev->conf)->lheads,
+                         (&dev->conf)->lsecs);
+}
+
+static void scsi_unrealize(SCSIDevice *dev, Error **errp)
+{
+    del_boot_device_lchs(&dev->qdev, NULL);
 }
 
 static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
@@ -2988,6 +2998,7 @@ static void scsi_hd_class_initfn(ObjectClass *klass, void *data)
     SCSIDeviceClass *sc = SCSI_DEVICE_CLASS(klass);
 
     sc->realize      = scsi_hd_realize;
+    sc->unrealize    = scsi_unrealize;
     sc->alloc_req    = scsi_new_request;
     sc->unit_attention_reported = scsi_disk_unit_attention_reported;
     dc->desc = "virtual SCSI disk";
@@ -3019,6 +3030,7 @@ static void scsi_cd_class_initfn(ObjectClass *klass, void *data)
     SCSIDeviceClass *sc = SCSI_DEVICE_CLASS(klass);
 
     sc->realize      = scsi_cd_realize;
+    sc->unrealize    = scsi_unrealize;
     sc->alloc_req    = scsi_new_request;
     sc->unit_attention_reported = scsi_disk_unit_attention_reported;
     dc->desc = "virtual SCSI CD-ROM";
@@ -3054,6 +3066,7 @@ static void scsi_block_class_initfn(ObjectClass *klass, void *data)
     SCSIDiskClass *sdc = SCSI_DISK_BASE_CLASS(klass);
 
     sc->realize      = scsi_block_realize;
+    sc->unrealize    = scsi_unrealize;
     sc->alloc_req    = scsi_block_new_request;
     sc->parse_cdb    = scsi_block_parse_cdb;
     sdc->dma_readv   = scsi_block_dma_readv;
@@ -3095,6 +3108,7 @@ static void scsi_disk_class_initfn(ObjectClass *klass, void *data)
     SCSIDeviceClass *sc = SCSI_DEVICE_CLASS(klass);
 
     sc->realize      = scsi_disk_realize;
+    sc->unrealize    = scsi_unrealize;
     sc->alloc_req    = scsi_new_request;
     sc->unit_attention_reported = scsi_disk_unit_attention_reported;
     dc->fw_name = "disk";
-- 
2.13.3


