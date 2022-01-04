Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C5483D28
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:45:49 +0100 (CET)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4eVx-0006hC-1r
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:45:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIK-0005pd-TT; Tue, 04 Jan 2022 02:31:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51558
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIH-0008BS-QV; Tue, 04 Jan 2022 02:31:44 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2043DY6u001503; 
 Tue, 4 Jan 2022 07:31:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dce55ue36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:31 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2047L9N9013592;
 Tue, 4 Jan 2022 07:31:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dce55ue2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047O29i009531;
 Tue, 4 Jan 2022 07:31:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3daek9y5h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2047MgH429491646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:22:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 520474203F;
 Tue,  4 Jan 2022 07:31:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E28842042;
 Tue,  4 Jan 2022 07:31:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:25 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4E58A220144;
 Tue,  4 Jan 2022 08:31:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 04/26] pnv_phb3.c: do not set 'root-bus' as bus name
Date: Tue,  4 Jan 2022 08:30:59 +0100
Message-Id: <20220104073121.3784280-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ga5Fv4pn59-rQrcghpys7ZPkgrumRD__
X-Proofpoint-GUID: GrdvXnYsCmvLEQ71QWxfl_EbfWuIw3I6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1034 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

All pnv-phb3-root-bus buses are being created as 'root-bus'. This
makes it impossible to, for example, add a pnv-phb3-root-port in
a specific root bus, since they all have the same name. By default
the device will be parented by the pnv-phb3 device that precedeced it in
the QEMU command line.

Moreover, this doesn't all for custom bus naming. Libvirt, for instance,
likes to name these buses as 'pcie.N', where 'N' is the index value of
the controller in the domain XML, by using the 'id' command line
attribute. At this moment this is also being ignored - the created root
bus will always be named 'root-bus'.

This patch fixes both scenarios by removing the 'root-bus' name from the
pci_register_root_bus() call. If an "id" is provided, use that.
Otherwise use 'NULL' as bus name. The 'NULL' value will be handled in
qbus_init_internal() and it will defaulted as lowercase bus type + the
global bus_id value.

After this path we can define the bus name by using the 'id' attribute:

qemu-system-ppc64 -m 4G -machine powernv8,accel=3Dtcg \
    -device pnv-phb3,chip-id=3D0,index=3D1,id=3Dpcie.0

  dev: pnv-phb3, id "pcie.0"
    index =3D 1 (0x1)
    chip-id =3D 0 (0x0)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pcie.0
      type pnv-phb3-root-bus

And without an 'id' we will have the following default:

qemu-system-ppc64 -m 4G -machine powernv8,accel=3Dtcg \
    -device pnv-phb3,chip-id=3D0,index=3D1

  dev: pnv-phb3, id ""
    index =3D 1 (0x1)
    chip-id =3D 0 (0x0)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb3-root-bus.0
      type pnv-phb3-root-bus

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211228193806.1198496-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index c6e7871ecbf1..c78084cce795 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1045,7 +1045,8 @@ static void pnv_phb3_realize(DeviceState *dev, Erro=
r **errp)
     memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
                        PCI_MMIO_TOTAL_SIZE);
=20
-    pci->bus =3D pci_register_root_bus(dev, "root-bus",
+    pci->bus =3D pci_register_root_bus(dev,
+                                     dev->id ? dev->id : NULL,
                                      pnv_phb3_set_irq, pnv_phb3_map_irq,=
 phb,
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB3_ROOT_BUS);
--=20
2.31.1


