Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B599E48913
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:36:34 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcucT-00074U-UF
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57059)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctHK-0003IH-SC
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctHJ-0001YA-E8
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:38 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52474)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctHB-0001QK-ED; Mon, 17 Jun 2019 11:10:31 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF40Uq111722;
 Mon, 17 Jun 2019 15:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=PKzeRX1Xe90EljPuSSNOIM0esxmcvYWoK+vqK7UPLwA=;
 b=of9ww6JYRVmatt+DTXdocMwEjQue8FvICzB3mMMHZ8Meo8ICnSx/uqH+c3GpfKswRiGe
 DtUENvakwzhexNuLPB53/IFKYtPbhRZr+CbM68Isu9Wya7Qe6/GrlVd/Q5gZJCatOxl0
 HYiieFJVbfuAWPnn4NYh+Ucnn0lxXzaDN3bHnrh5gVpq7Zjkrf3uWFKOeZypgphFiqq6
 waCi4w/0iXTAXfsNgDRxppGp3iJoqAZmoOg22lsAzLmnyn63C3gg0b7eXCwuZCTjk5GZ
 rCllzEFbIkYoTz7Q45z9E3Er/yAfEz0Bguqazpa+EbD3uaprAnFoXzkK7H5pYkmWU+gl Dw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2t4rmny4ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF9WbR082262;
 Mon, 17 Jun 2019 15:10:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2t59gd9ba5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:25 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HFAOPd025798;
 Mon, 17 Jun 2019 15:10:24 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:10:24 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:09:49 +0300
Message-Id: <20190617150950.5264-8-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
References: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.78
Subject: [Qemu-devel] [QEMU] [PATCH v3 7/8] bootdevice: FW_CFG interface for
 LCHS values
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

Using fw_cfg, supply logical CHS values directly from QEMU to the BIOS.

Non-standard logical geometries break under QEMU.

A virtual disk which contains an operating system which depends on
logical geometries (consistent values being reported from BIOS INT13
AH=08) will most likely break under QEMU/SeaBIOS if it has non-standard
logical geometries - for example 56 SPT (sectors per track).
No matter what QEMU will report - SeaBIOS, for large enough disks - will
use LBA translation, which will report 63 SPT instead.

In addition we cannot force SeaBIOS to rely on physical geometries at
all. A virtio-blk-pci virtual disk with 255 phyiscal heads cannot
report more than 16 physical heads when moved to an IDE controller,
since the ATA spec allows a maximum of 16 heads - this is an artifact of
virtualization.

By supplying the logical geometries directly we are able to support such
"exotic" disks.

We serialize this information in a similar way to the "bootorder"
interface.
The new fw_cfg entry is "bios-geometry".

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 bootdevice.c            | 38 ++++++++++++++++++++++++++++++++++++++
 hw/nvram/fw_cfg.c       | 14 +++++++++++---
 include/sysemu/sysemu.h |  1 +
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/bootdevice.c b/bootdevice.c
index 2b12fb85a4..5cd88f7fbf 100644
--- a/bootdevice.c
+++ b/bootdevice.c
@@ -405,3 +405,41 @@ void del_boot_device_lchs(DeviceState *dev, const char *suffix)
         }
     }
 }
+
+typedef struct QEMU_PACKED FWLCHSEntrySerialized {
+    /* Little-endian. */
+    uint32_t lcyls;
+    uint32_t lheads;
+    uint32_t lsecs;
+} FWLCHSEntrySerialized;
+
+/* Serialized as: (device name\0 + lchs struct) x devices */
+char *get_boot_devices_lchs_list(size_t *size)
+{
+    FWLCHSEntry *i;
+    FWLCHSEntrySerialized s;
+    size_t total = 0;
+    char *list = NULL;
+
+    QTAILQ_FOREACH(i, &fw_lchs, link) {
+        char *bootpath;
+        size_t len;
+
+        bootpath = get_boot_device_path(i->dev, false, i->suffix);
+        s.lcyls = cpu_to_le32(i->lcyls);
+        s.lheads = cpu_to_le32(i->lheads);
+        s.lsecs = cpu_to_le32(i->lsecs);
+
+        len = strlen(bootpath) + 1;
+        list = g_realloc(list, total + len + sizeof(s));
+        memcpy(&list[total], bootpath, len);
+        memcpy(&list[total + len], &s, sizeof(s));
+        total += len + sizeof(s);
+
+        g_free(bootpath);
+    }
+
+    *size = total;
+
+    return list;
+}
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9f7b7789bc..c1230fe11c 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -916,13 +916,21 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
 
 static void fw_cfg_machine_reset(void *opaque)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+    FWCfgState *s = opaque;
     void *ptr;
     size_t len;
-    FWCfgState *s = opaque;
-    char *bootindex = get_boot_devices_list(&len);
+    char *buf;
 
-    ptr = fw_cfg_modify_file(s, "bootorder", (uint8_t *)bootindex, len);
+    buf = get_boot_devices_list(&len);
+    ptr = fw_cfg_modify_file(s, "bootorder", (uint8_t *)buf, len);
     g_free(ptr);
+
+    if (!mc->legacy_fw_cfg_order) {
+        buf = get_boot_devices_lchs_list(&len);
+        ptr = fw_cfg_modify_file(s, "bios-geometry", (uint8_t *)buf, len);
+        g_free(ptr);
+    }
 }
 
 static void fw_cfg_machine_ready(struct Notifier *n, void *data)
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 173dfbb539..1ca8799588 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -174,6 +174,7 @@ void validate_bootdevices(const char *devices, Error **errp);
 void add_boot_device_lchs(DeviceState *dev, const char *suffix,
                           uint32_t lcyls, uint32_t lheads, uint32_t lsecs);
 void del_boot_device_lchs(DeviceState *dev, const char *suffix);
+char *get_boot_devices_lchs_list(size_t *size);
 
 /* handler to set the boot_device order for a specific type of MachineClass */
 typedef void QEMUBootSetHandler(void *opaque, const char *boot_order,
-- 
2.13.3


