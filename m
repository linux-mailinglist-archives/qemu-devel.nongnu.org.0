Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7348C46B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:09:44 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dNm-0002WN-S5
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEz-0006X5-2l; Wed, 12 Jan 2022 06:56:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEw-0007Xa-E2; Wed, 12 Jan 2022 06:56:32 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CAefMt017139; 
 Wed, 12 Jan 2022 11:56:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhrdw0u8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:25 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBgK7R029301;
 Wed, 12 Jan 2022 11:56:25 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhrdw0u77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmHLW022853;
 Wed, 12 Jan 2022 11:56:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3df289h0yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:22 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuKZ739518518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7C71A4EC1;
 Wed, 12 Jan 2022 11:56:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C315A4EBA;
 Wed, 12 Jan 2022 11:56:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E0FA12201C6;
 Wed, 12 Jan 2022 12:56:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 25/34] pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
Date: Wed, 12 Jan 2022 12:55:42 +0100
Message-Id: <20220112115551.987666-26-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MZTBHDkkEvlnQ_t6BwdXMEjazU6ZEMyi
X-Proofpoint-GUID: PCB9zVQLQi_EUMy7xAwImambh6aBpPSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
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

The TYPE_PNV_PHB3_ROOT_BUS name is used as the default bus name when
the dev has no 'id'. However, pnv-phb3-root-bus is a bit too long to be
used as a bus name.

Most common QEMU buses and PCI controllers are named based on their bus
type (e.g. pSeries spapr-pci-host-bridge is called 'pci'). The most
common name for a PCIE bus controller in QEMU is 'pcie'. Naming it
'pcie' would break the documented use of the pnv-phb3 device, since
'pcie.0' would now refer to the root bus instead of the first root port.

There's nothing particularly wrong with the 'root-bus' name used before,
aside from the fact that 'root-bus' is being used for pnv-phb3 and
pnv-phb4 created buses, which is not quite correct since these buses
aren't implemented the same way in QEMU - you can't plug a
pnv-phb4-root-port into a pnv-phb3 root bus, for example.

This patch renames it as 'pnv-phb3-root', which is a compromise between
the existing and the previously used name. Creating 3 phbs without ID
will result in an "info qtree" output similar to this:

bus: main-system-bus
  type System
  dev: pnv-phb3, id ""
    index =3D 2 (0x2)
    chip-id =3D 0 (0x0)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb3-root.2
      type pnv-phb3-root
(...)
  dev: pnv-phb3, id ""
    index =3D 1 (0x1)
    chip-id =3D 0 (0x0)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb3-root.1
      type pnv-phb3-root
(...)
  dev: pnv-phb3, id ""
    index =3D 0 (0x0)
    chip-id =3D 0 (0x0)
    x-config-reg-migration-enabled =3D true
    bypass-iommu =3D false
    bus: pnv-phb3-root.0
      type pnv-phb3-root

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220105212338.49899-11-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb=
3.h
index 2e423c3890bc..af6ec83cf6cc 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -105,7 +105,7 @@ struct PnvPBCQState {
 /*
  * PHB3 PCIe Root port
  */
-#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root-bus"
+#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
=20
 #define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
=20
--=20
2.31.1


