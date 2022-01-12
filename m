Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B1F48C469
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:07:59 +0100 (CET)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dM7-0001UA-01
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFM-00074o-Uh; Wed, 12 Jan 2022 06:56:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFJ-0007Yy-6i; Wed, 12 Jan 2022 06:56:55 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CB5v1q017168; 
 Wed, 12 Jan 2022 11:56:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhrdw0u6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:22 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CAXDg6026419;
 Wed, 12 Jan 2022 11:56:22 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhrdw0u55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:22 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmReT031224;
 Wed, 12 Jan 2022 11:56:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3df289h2u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuFvk42467604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5947A4E00;
 Wed, 12 Jan 2022 11:56:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C3ADA4DF7;
 Wed, 12 Jan 2022 11:56:15 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:15 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C21F22201C6;
 Wed, 12 Jan 2022 12:56:14 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 19/34] pnv_phb4.c: make pnv-phb4-root-port user creatable
Date: Wed, 12 Jan 2022 12:55:36 +0100
Message-Id: <20220112115551.987666-20-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rSyb17sn4wFeeS_Fy7X65cUG4n7c6_qI
X-Proofpoint-GUID: hZ1Fq6LmVmS80iS6TFosqTr9HhaeuT56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=782
 malwarescore=0 bulkscore=0 clxscore=1034 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

We want to create only the absolutely minimal amount of devices when
running with -nodefaults. The root port is something that the machine
can boot up without. But, to do that, we need to provide a way for the
user to add them by hand.

This patch makes pnv-phb4-root-port user creatable and then uses the
pnv_phb_attach_root_port() helper to add a pnv_phb4_root_port only when
running with default settings.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220105212338.49899-5-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  2 --
 hw/pci-host/pnv_phb4.c         | 18 +++++++-----------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 4a19338db35e..ea63df967678 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -78,8 +78,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
 struct PnvPHB4 {
     PCIExpressHost parent_obj;
=20
-    PnvPHB4RootPort root;
-
     uint32_t chip_id;
     uint32_t phb_id;
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 836b0c156cc8..14827f846434 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
=20
 #define phb_error(phb, fmt, ...)                                        =
\
@@ -1159,12 +1160,6 @@ static void pnv_phb4_instance_init(Object *obj)
=20
     /* XIVE interrupt source object */
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE)=
;
-
-    /* Root Port */
-    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB4_ROOT_=
PORT);
-
-    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
-    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
 }
=20
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
@@ -1208,10 +1203,11 @@ static void pnv_phb4_realize(DeviceState *dev, Er=
ror **errp)
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
=20
-    /* Add a single Root port */
-    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
+    /* Add a single Root port if running with defaults */
+    if (defaults_enabled()) {
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
+                                 TYPE_PNV_PHB4_ROOT_PORT);
+    }
=20
     /* Setup XIVE Source */
     if (phb->big_phb) {
@@ -1369,7 +1365,7 @@ static void pnv_phb4_root_port_class_init(ObjectCla=
ss *klass, void *data)
     PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_CLASS(klass);
=20
     dc->desc     =3D "IBM PHB4 PCIE Root Port";
-    dc->user_creatable =3D false;
+    dc->user_creatable =3D true;
=20
     device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
                                     &rpc->parent_realize);
--=20
2.31.1


