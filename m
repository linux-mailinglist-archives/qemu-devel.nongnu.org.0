Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F727CDA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 14:27:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTmox-0001W7-5d
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 08:27:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmorel@linux.ibm.com>) id 1hTmmY-0008GY-Fk
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmorel@linux.ibm.com>) id 1hTmmW-0002Tr-Qe
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:25:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pmorel@linux.ibm.com>)
	id 1hTmmW-0002SP-Ga
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:25:12 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4NCARJK140885
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 08:25:09 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2snsjhwe20-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 08:25:09 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <pmorel@linux.ibm.com>;
	Thu, 23 May 2019 13:25:06 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 23 May 2019 13:25:04 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4NCP2Uq44040372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 23 May 2019 12:25:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD0DEA4065;
	Thu, 23 May 2019 12:25:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 821F9A4060;
	Thu, 23 May 2019 12:25:02 +0000 (GMT)
Received: from morel-ThinkPad-W530.boeblingen.de.ibm.com (unknown
	[9.152.222.40])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2019 12:25:02 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: cohuck@redhat.com
Date: Thu, 23 May 2019 14:25:00 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558614300-24574-1-git-send-email-pmorel@linux.ibm.com>
References: <1558614300-24574-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19052312-0028-0000-0000-00000370B03A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052312-0029-0000-0000-000024306257
Message-Id: <1558614300-24574-6-git-send-email-pmorel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-23_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=925 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905230087
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v2 5/5] s390: vfio_pci: Get zPCI function info
 from host
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
Cc: pasic@linux.vnet.ibm.com, mst@redhat.com, qemu-s390x@nongnu.org,
	david@redhat.com, walling@linux.ibm.com, qemu-devel@nongnu.org,
	borntraeger@de.ibm.com, alex.williamson@redhat.com,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use the VFIO_REGION_SUBTYPE_ZDEV_CLP subregion of
PCI_VENDOR_ID_IBM to retrieve the CLP information the
kernel exports.

To be compatible with previous kernel versions we fall back
on previous predefined values, same as the emulation values,
when the region is not found or when any problem happens
during the search for the information.

Once we retrieved the host device information, we take care to
- use the virtual UID and FID
- Disable all the IOMMU flags we do not support yet.
  Just keeping the refresh bit.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++--
 hw/s390x/s390-pci-bus.h |  2 ++
 2 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 6df80aa..c4f4b2a 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -16,6 +16,8 @@
 #include "qapi/visitor.h"
 #include "qemu-common.h"
 #include "cpu.h"
+#include "s390-pci-clp.h"
+#include <linux/vfio_zdev.h>
 #include "s390-pci-bus.h"
 #include "s390-pci-inst.h"
 #include "hw/pci/pci_bus.h"
@@ -23,6 +25,9 @@
 #include "hw/pci/msi.h"
 #include "qemu/error-report.h"
 
+#include "hw/vfio/pci.h"
+#include <sys/ioctl.h>
+
 #ifndef DEBUG_S390PCI_BUS
 #define DEBUG_S390PCI_BUS  0
 #endif
@@ -780,6 +785,75 @@ static void set_pbdev_info(S390PCIBusDevice *pbdev)
     pbdev->pci_grp = s390_grp_find(ZPCI_DEFAULT_FN_GRP);
 }
 
+static int get_pbdev_info(S390PCIBusDevice *pbdev)
+{
+    VFIOPCIDevice *vfio_pci;
+    VFIODevice *vdev;
+    struct vfio_region_info *info;
+    CLPRegion *clp_region;
+    int size;
+    int ret;
+
+    vfio_pci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+    vdev = &vfio_pci->vbasedev;
+
+    if (vdev->num_regions < VFIO_PCI_NUM_REGIONS + 1) {
+        /* Fall back to old handling */
+        return -ENODEV;
+    }
+
+    ret = vfio_get_dev_region_info(vdev,
+                                   PCI_VENDOR_ID_IBM |
+                                   VFIO_REGION_TYPE_PCI_VENDOR_TYPE,
+                                   VFIO_REGION_SUBTYPE_ZDEV_CLP, &info);
+    if (ret) {
+        /* Fall back to old handling */
+        return -EIO;
+    }
+
+    if (info->size != sizeof(CLPRegion)) {
+        /* Fall back to old handling */
+        g_free(info);
+        return -ENOMEM;
+    }
+    clp_region = g_malloc0(sizeof(*clp_region));
+    size = pread(vdev->fd, clp_region, sizeof(*clp_region), info->offset);
+    if (size != sizeof(*clp_region)) {
+        goto end;
+    }
+
+    pbdev->zpci_fn.fid = pbdev->fid;
+    pbdev->zpci_fn.uid = pbdev->uid;
+    pbdev->zpci_fn.sdma = clp_region->start_dma;
+    pbdev->zpci_fn.edma = clp_region->end_dma;
+    pbdev->zpci_fn.pchid = clp_region->pchid;
+    pbdev->zpci_fn.ug = clp_region->gid;
+    pbdev->pci_grp = s390_grp_find(clp_region->gid);
+
+    if (!pbdev->pci_grp) {
+        ClpRspQueryPciGrp *resgrp;
+
+        pbdev->pci_grp = s390_grp_create(clp_region->gid);
+
+        resgrp = &pbdev->pci_grp->zpci_grp;
+        if (clp_region->flags & VFIO_PCI_ZDEV_FLAGS_REFRESH) {
+            resgrp->fr = 1;
+        }
+        stq_p(&resgrp->dasm, clp_region->dasm);
+        stq_p(&resgrp->msia, clp_region->msi_addr);
+        stw_p(&resgrp->mui, clp_region->mui);
+        stw_p(&resgrp->i, clp_region->noi);
+        /* These two must be queried in a next iteration */
+        stw_p(&resgrp->maxstbl, 128);
+        resgrp->version = 0;
+    }
+
+end:
+    g_free(info);
+    g_free(clp_region);
+    return ret;
+}
+
 static void s390_pcihost_realize(DeviceState *dev, Error **errp)
 {
     PCIBus *b;
@@ -852,7 +926,8 @@ static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
     name = g_strdup_printf("msix-s390-%04x", pbdev->uid);
     memory_region_init_io(&pbdev->msix_notify_mr, OBJECT(pbdev),
                           &s390_msi_ctrl_ops, pbdev, name, PAGE_SIZE);
-    memory_region_add_subregion(&pbdev->iommu->mr, ZPCI_MSI_ADDR,
+    memory_region_add_subregion(&pbdev->iommu->mr,
+                                pbdev->pci_grp->zpci_grp.msia,
                                 &pbdev->msix_notify_mr);
     g_free(name);
 
@@ -1002,12 +1077,15 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         pbdev->iommu = s390_pci_get_iommu(s, pci_get_bus(pdev), pdev->devfn);
         pbdev->iommu->pbdev = pbdev;
         pbdev->state = ZPCI_FS_DISABLED;
-        set_pbdev_info(pbdev);
 
         if (object_dynamic_cast(OBJECT(dev), "vfio-pci")) {
             pbdev->fh |= FH_SHM_VFIO;
+            if (get_pbdev_info(pbdev) != 0) {
+                set_pbdev_info(pbdev);
+            }
         } else {
             pbdev->fh |= FH_SHM_EMUL;
+            set_pbdev_info(pbdev);
         }
 
         if (s390_pci_msix_init(pbdev)) {
diff --git a/hw/s390x/s390-pci-bus.h b/hw/s390x/s390-pci-bus.h
index 8c969d1..151e2d0 100644
--- a/hw/s390x/s390-pci-bus.h
+++ b/hw/s390x/s390-pci-bus.h
@@ -320,6 +320,8 @@ typedef struct S390PCIGroup {
 } S390PCIGroup;
 S390PCIGroup *s390_grp_find(int ug);
 
+typedef struct vfio_region_zpci_info CLPRegion;
+
 struct S390PCIBusDevice {
     DeviceState qdev;
     PCIDevice *pdev;
-- 
2.7.4


