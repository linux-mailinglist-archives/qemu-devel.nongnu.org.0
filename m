Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF735483D0B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:39:08 +0100 (CET)
Received: from localhost ([::1]:54992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ePT-0000ZO-5s
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIK-0005pb-Qf; Tue, 04 Jan 2022 02:31:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eII-0008DF-GG; Tue, 04 Jan 2022 02:31:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2046pQjf009836; 
 Tue, 4 Jan 2022 07:31:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc7j6gmb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:32 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2047JmX1030847;
 Tue, 4 Jan 2022 07:31:31 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc7j6gmaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047OQWY013417;
 Tue, 4 Jan 2022 07:31:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3dae7jq7fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2047MgdU36176330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:22:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00FAAA4054;
 Tue,  4 Jan 2022 07:31:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B21A1A4062;
 Tue,  4 Jan 2022 07:31:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:26 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F2F8A2201F1;
 Tue,  4 Jan 2022 08:31:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 05/26] pnv_phb4.c: do not set 'root-bus' as bus name
Date: Tue,  4 Jan 2022 08:31:00 +0100
Message-Id: <20220104073121.3784280-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yUgSZnDId8KaX9yD5ugSLvxnr_HYbawx
X-Proofpoint-GUID: -5H2D51YBufkaVJkRcw4q854c6M4eDSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1034
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040049
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
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

This change has the same motivation as the one done for pnv-phb3-root-bus
buses previously. Defaulting every bus to 'root-bus' makes it impossible =
to attach
root ports to specific buses and it doesn't allow for custom bus
naming because we're ignoring the 'id' value when registering the root
bus.

After this patch, creating pnv-phb4 devices with 'id' being set will
result in the following qtree:

qemu-system-ppc64 -m 4G -machine powernv9,accel=3Dtcg \
   -device pnv-phb4,chip-id=3D0,index=3D0,id=3Dpcie.0 \
   -device pnv-phb4,chip-id=3D1,index=3D4,id=3Dpcie.1

bus: main-system-bus
  type System
  dev: pnv-phb4, id "pcie.1"
    index =3D 4 (0x4)
    chip-id =3D 1 (0x1)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pcie.1
      type pnv-phb4-root-bus
  dev: pnv-phb4, id "pcie.0"
    index =3D 0 (0x0)
    chip-id =3D 0 (0x0)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pcie.0
      type pnv-phb4-root-bus

And without setting any ids:

qemu-system-ppc64 -m 4G -machine powernv9,accel=3Dtcg \
   -device pnv-phb4,chip-id=3D0,index=3D0,id=3Dpcie.0 \
   -device pnv-phb4,chip-id=3D1,index=3D4,id=3Dpcie.1

bus: main-system-bus
  type System
  dev: pnv-phb4, id ""
    index =3D 4 (0x4)
    chip-id =3D 1 (0x1)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb4-root-bus.1
      type pnv-phb4-root-bus
  dev: pnv-phb4, id ""
    index =3D 0 (0x0)
    chip-id =3D 0 (0x0)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb4-root-bus.0
      type pnv-phb4-root-bus

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211228193806.1198496-17-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 371abda5c6e9..5ba26e250a1f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1201,7 +1201,7 @@ static void pnv_phb4_realize(DeviceState *dev, Erro=
r **errp)
     memory_region_init(&phb->pci_mmio, OBJECT(phb), name,
                        PCI_MMIO_TOTAL_SIZE);
=20
-    pci->bus =3D pci_register_root_bus(dev, "root-bus",
+    pci->bus =3D pci_register_root_bus(dev, dev->id,
                                      pnv_phb4_set_irq, pnv_phb4_map_irq,=
 phb,
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
--=20
2.31.1


