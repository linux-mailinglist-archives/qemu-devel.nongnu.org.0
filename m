Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2C47CD31
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 07:57:16 +0100 (CET)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvYp-0000oe-AC
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 01:57:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvGu-0007im-8B; Wed, 22 Dec 2021 01:38:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvGl-0002vd-UE; Wed, 22 Dec 2021 01:38:38 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM4X2lg017000; 
 Wed, 22 Dec 2021 06:38:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3w35sry2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:26 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6Vo8t017176;
 Wed, 22 Dec 2021 06:38:25 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3w35srxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6auEY016628;
 Wed, 22 Dec 2021 06:38:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3d16wjujb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BM6U6AP42336674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:30:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00310AE04D;
 Wed, 22 Dec 2021 06:38:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3484AE053;
 Wed, 22 Dec 2021 06:38:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Dec 2021 06:38:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3429C22010B;
 Wed, 22 Dec 2021 07:38:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/5] ppc/pnv: Remove PHB4 reset handler
Date: Wed, 22 Dec 2021 07:38:14 +0100
Message-Id: <20211222063817.1541058-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222063817.1541058-1-clg@kaod.org>
References: <20211222063817.1541058-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yQRdDyqtt5KNNjeqBWW7aPOI2TyuOy8-
X-Proofpoint-ORIG-GUID: Zxz_1W21XKE7ZdjghRRqBU1sMQqZBDO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1034
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220038
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PHB4 reset handler was preparing ground for PHB5 to set
appropriately the device id. We don't need it for the PHB4 since the
device id is already set in the root port complex. PH5 will introduce
its own.

"device-id" property is now useless. It should be removed.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 40b793201a34..4caf03310fab 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1229,18 +1229,6 @@ static void pnv_phb4_realize(DeviceState *dev, Err=
or **errp)
     phb->qirqs =3D qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->n=
r_irqs);
 }
=20
-static void pnv_phb4_reset(DeviceState *dev)
-{
-    PnvPHB4 *phb =3D PNV_PHB4(dev);
-    PCIDevice *root_dev =3D PCI_DEVICE(&phb->root);
-
-    /*
-     * Configure PCI device id at reset using a property.
-     */
-    pci_config_set_vendor_id(root_dev->config, PCI_VENDOR_ID_IBM);
-    pci_config_set_device_id(root_dev->config, phb->device_id);
-}
-
 static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
                                           PCIBus *rootbus)
 {
@@ -1290,7 +1278,6 @@ static void pnv_phb4_class_init(ObjectClass *klass,=
 void *data)
     device_class_set_props(dc, pnv_phb4_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->user_creatable  =3D false;
-    dc->reset           =3D pnv_phb4_reset;
=20
     xfc->notify         =3D pnv_phb4_xive_notify;
 }
--=20
2.31.1


