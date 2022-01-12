Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970FB48C441
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:56:13 +0100 (CET)
Received: from localhost ([::1]:38732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dAb-0007Es-Df
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:56:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFM-00074r-UH; Wed, 12 Jan 2022 06:56:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFI-0007YR-Eg; Wed, 12 Jan 2022 06:56:54 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CAuV7h006882; 
 Wed, 12 Jan 2022 11:56:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhwp723py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:27 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBuRXl028056;
 Wed, 12 Jan 2022 11:56:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhwp723n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBl0N9018324;
 Wed, 12 Jan 2022 11:56:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3df289ap3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuLwh44106178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EF3E11C064;
 Wed, 12 Jan 2022 11:56:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 469E011C09D;
 Wed, 12 Jan 2022 11:56:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8BD9622016C;
 Wed, 12 Jan 2022 12:56:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 26/34] pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name
Date: Wed, 12 Jan 2022 12:55:43 +0100
Message-Id: <20220112115551.987666-27-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KfMKHOaLeDnZPHQma0koEDeoHtkHKnLM
X-Proofpoint-ORIG-GUID: LhLoUHcQt5OcCNm5nk8_Ng2eyLNzkGeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
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

Similar to what was happening with pnv-phb3 buses,
TYPE_PNV_PHB4_ROOT_BUS set to "pnv-phb4-root-bus" is a bit too long for
a default root bus name. The usual default name for theses buses in QEMU
are 'pcie', but we want to make a distinction between pnv-phb4 buses and
other PCIE buses, at least as far as default name goes, because not all
PCIE devices are attachable to a pnv-phb4 root-bus type.

Changing the default to 'pnv-phb4-root' allow us to have a shorter name
while making this bus distinct, and the user can always set its own bus
naming via the "id" attribute anyway.

This is the 'info qtree' output after this change, using a powernv9
domain with 2 sockets and default settings enabled:

qemu-system-ppc64 -m 4G -machine powernv9,accel=3Dtcg \
     -smp 2,sockets=3D2,cores=3D1,threads=3D1

  dev: pnv-phb4, id ""
    index =3D 5 (0x5)
    chip-id =3D 1 (0x1)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb4-root.11
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index =3D 0 (0x0)
    chip-id =3D 1 (0x1)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb4-root.6
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(..)
  dev: pnv-phb4, id ""
    index =3D 5 (0x5)
    chip-id =3D 0 (0x0)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb4-root.5
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index =3D 0 (0x0)
    chip-id =3D 0 (0x0)
    version =3D 704374636546 (0xa400000002)
    device-id =3D 1217 (0x4c1)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb4-root.0
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220110143346.455901-11-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index ea63df967678..88dc6abb1ca7 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -46,7 +46,7 @@ typedef struct PnvPhb4DMASpace {
 /*
  * PHB4 PCIe Root port
  */
-#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root-bus"
+#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
 #define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
=20
 typedef struct PnvPHB4RootPort {
--=20
2.31.1


