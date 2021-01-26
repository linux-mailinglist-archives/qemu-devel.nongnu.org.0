Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF923046D3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 19:44:29 +0100 (CET)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4TKF-0007oU-05
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 13:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1l4T0a-0000zp-Gd
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:24:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1l4T0Y-00063V-KY
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:24:08 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QI50DV002426
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 13:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EMm1nMNptac2dk34ry6cpJXB5dy6t2iniQtUEiV2+/s=;
 b=hxToWbHPbfr+ZobYa6IgbaUSAbrGY9L/P6rBpVNr7cRLRC3vS7khMgTA6IZs8V/xXlZa
 /aXisL3CdhhK3v/7lDT5DCGc6p7SPZIkSo4DXBCEFABwTQqClUggaiHcmIsqb9cG2uEl
 KlUi81Cvg4yBPbB6nOaNq3ltBN0x29Sa6ftc8J4b0th0NGIjJKUnC66GICYW6s7NfDmB
 qhZ7hTTb126gC6G+VovDUGKhcdHLPVoqTjTv5p4jNr6INg0tzSkdqWLKdv1FWhEoZ7Ny
 ozE99YU9+e+PeS+qVrlK7kd6H2hzMphCOY+dV21xrAZA/PlVyFBuU7LFMDMStp7rwQa5 /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36amnnqk1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 13:24:03 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QI5Neq004498
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 13:24:03 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36amnnqk1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 13:24:03 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QIHl1o020847;
 Tue, 26 Jan 2021 18:24:02 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 36a0t2g5ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 18:24:02 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QIO2bi26149120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 18:24:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15AA8C6057;
 Tue, 26 Jan 2021 18:24:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBC69C605B;
 Tue, 26 Jan 2021 18:24:00 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.85.165.159])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jan 2021 18:24:00 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-devel@nongnu.org
Subject: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
Date: Tue, 26 Jan 2021 15:23:38 -0300
Message-Id: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_09:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260094
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Jan 2021 13:41:22 -0500
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, dgilbert@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Currently, as IOMMU and ATS are not supported, if a user mistakenly set
any of them and tries to mount the vhost-user filesystem inside the
guest, whenever the user tries to access the mount point, the system
will hang forever.

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 hw/virtio/vhost-user-fs-pci.c | 7 +++++++
 hw/virtio/vhost-user-fs.c     | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index 2ed8492b3f..564d1fd108 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -11,6 +11,8 @@
  * top-level directory.
  */
 
+#include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-fs.h"
@@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
     }
 
+    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
+        error_setg(errp, "ATS is currently not supported with vhost-user-fs-pci");
+        return;
+    }
+
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index ac4fc34b36..914d68b3ee 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
+        error_setg(errp, "IOMMU is currently not supported with vhost-user-fs");
+        return;
+    }
+
     if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
         return;
     }
-- 
2.29.2


