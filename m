Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA24880A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 17:57:07 +0200 (CEST)
Received: from localhost ([::1]:48770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcu0J-0007jJ-4A
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 11:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55541)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctBx-000726-Ir
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:05:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctBv-0005pQ-LF
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:05:05 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:51374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctBs-0005jk-HM; Mon, 17 Jun 2019 11:05:00 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3j5g008673;
 Mon, 17 Jun 2019 15:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=AHpQmog86BPC1eT3XUEskufqXnj+rJVeOHWbUO5moAo=;
 b=qVv9tEoBCpwUpl6FG6q1H8qGHeQuflgIU4O/bQ9k/jDg67IFU/56Z/WI7yyrRUNg2evh
 46P93dr+drs2Ner8gPFzW77tUzBjEX1LVMhEu9RKMzVSvKE12X24JKCTAk7AE2R8UKos
 hIA6fiHrrXYfr2Rc5BqSgq/288ElWHWVlRxD8aZclpw92TZeQxLobVkLjJIlkXBAADsb
 +2O/wsOv41JpuE7lfPGDaBGwV1zCQ8tG6QI72in5R7Eb8V1X29r36wTp/0EAFv0W9Ysp
 mCzmCv4X+CmVwKU1vm/QnX+Fu/NiHNYvldmmiE9z6njwLi3dfpFmm9qJZZeivMD28DXV jA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2t4saq72h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:04:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3XBl061731;
 Mon, 17 Jun 2019 15:04:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2t59gd97n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:04:56 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5HF4tPN017481;
 Mon, 17 Jun 2019 15:04:55 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:04:55 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:04:18 +0300
Message-Id: <20190617150419.4953-5-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190617150419.4953-1-shmuel.eiderman@oracle.com>
References: <20190617150419.4953-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
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
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [SeaBIOS] [PATCH v2 4/5] config: Add toggle for
 bootdevice information
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

Add the "BIOS_GEOMETRY" toggle to remove boot device information received
through fw_cfg.

We will use this toggle in QEMU to reduce the size of the 128k SeaBIOS
rom, which is only used in old compat versions, where this boot device
information does not exist.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 src/Kconfig | 7 +++++++
 src/boot.c  | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/src/Kconfig b/src/Kconfig
index 55a87cb7..0b4c1c0d 100644
--- a/src/Kconfig
+++ b/src/Kconfig
@@ -72,6 +72,13 @@ endchoice
         help
             Support controlling of the boot order via the fw_cfg/CBFS
             "bootorder" file.
+    config BIOS_GEOMETRY
+        depends on BOOT
+        bool "Boot device bios geometry override"
+        default y
+        help
+            Support overriding bios (logical) geometry of boot devices via the
+            fw_cfg/CBFS "bios-geometry" file.
 
     config COREBOOT_FLASH
         depends on COREBOOT
diff --git a/src/boot.c b/src/boot.c
index 8162cb74..695bc189 100644
--- a/src/boot.c
+++ b/src/boot.c
@@ -95,6 +95,8 @@ static int BiosGeometryCount;
 static void
 loadBiosGeometry(void)
 {
+    if (!CONFIG_BIOS_GEOMETRY)
+        return;
     BiosGeometryCount = 0;
     int fsize;
     char *f = romfile_loadfile("bios-geometry", &fsize);
@@ -163,6 +165,8 @@ boot_lchs_find(const char *glob)
 
 int boot_lchs_find_pci_device(struct pci_device *pci, struct chs_s *chs)
 {
+    if (!CONFIG_BIOS_GEOMETRY)
+        return -1;
     char desc[256];
     build_pci_path(desc, sizeof(desc), "*", pci);
     BootDeviceLCHS *b = boot_lchs_find(desc);
@@ -177,6 +181,8 @@ int boot_lchs_find_pci_device(struct pci_device *pci, struct chs_s *chs)
 int boot_lchs_find_scsi_device(struct pci_device *pci, int target, int lun,
                                struct chs_s *chs)
 {
+    if (!CONFIG_BIOS_GEOMETRY)
+        return -1;
     if (!pci)
         // support only pci machine for now
         return -1;
@@ -196,6 +202,8 @@ int boot_lchs_find_scsi_device(struct pci_device *pci, int target, int lun,
 int boot_lchs_find_ata_device(struct pci_device *pci, int chanid, int slave,
                               struct chs_s *chs)
 {
+    if (!CONFIG_BIOS_GEOMETRY)
+        return -1;
     if (!pci)
         // support only pci machine for now
         return -1;
-- 
2.13.3


