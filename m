Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7D48C56C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:03:13 +0100 (CET)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eDZ-00047b-3W
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:03:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cYH-0007AL-3E; Wed, 12 Jan 2022 07:16:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17982
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cYC-0002v8-IB; Wed, 12 Jan 2022 07:16:27 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBVimW002444; 
 Wed, 12 Jan 2022 12:16:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dht3ffvdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 12:16:08 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBvo6q031750;
 Wed, 12 Jan 2022 12:16:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dht3ffvcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 12:16:07 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CCC0TL025923;
 Wed, 12 Jan 2022 12:16:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjbbsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 12:16:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CCG2rh29426004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 12:16:03 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7424A4E7D;
 Wed, 12 Jan 2022 11:56:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C96AA4E6F;
 Wed, 12 Jan 2022 11:56:06 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:06 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B4A9322016C;
 Wed, 12 Jan 2022 12:56:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 06/34] MAINTAINERS: Improve the PowerPC machines section
Date: Wed, 12 Jan 2022 12:55:23 +0100
Message-Id: <20220112115551.987666-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lCtw3Iv-DrS13rCodXvDf6-MxNWycTLi
X-Proofpoint-ORIG-GUID: pQcKPv3eBeJnGGmhzv9Kp5X1wMXnUrQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=823 phishscore=0
 spamscore=0 clxscore=1034 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120079
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Add some documentation files to the corresponding machine sections
and mention the machine names in the section titles where it is
not so obvious (e.g. that "taihu" is a 405 machine).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220105104800.407570-1-thuth@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c98a61caeeed..6ccdec7f0207 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1245,7 +1245,7 @@ F: hw/openrisc/openrisc_sim.c
=20
 PowerPC Machines
 ----------------
-405
+405 (ref405ep and taihu)
 L: qemu-ppc@nongnu.org
 S: Orphan
 F: hw/ppc/ppc405_boards.c
@@ -1281,6 +1281,7 @@ New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
+F: docs/system/ppc/powermac.rst
 F: hw/ppc/mac_newworld.c
 F: hw/pci-host/uninorth.c
 F: hw/pci-bridge/dec.[hc]
@@ -1299,6 +1300,7 @@ Old World (g3beige)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
+F: docs/system/ppc/powermac.rst
 F: hw/ppc/mac_oldworld.c
 F: hw/pci-host/grackle.c
 F: hw/misc/macio/
@@ -1312,6 +1314,7 @@ PReP
 M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
+F: docs/system/ppc/prep.rst
 F: hw/ppc/prep.c
 F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
@@ -1324,7 +1327,7 @@ F: include/hw/isa/pc87312.h
 F: include/hw/rtc/m48t59.h
 F: tests/avocado/ppc_prep_40p.py
=20
-sPAPR
+sPAPR (pseries)
 M: C=C3=A9dric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: David Gibson <david@gibson.dropbear.id.au>
@@ -1336,8 +1339,8 @@ F: include/hw/*/spapr*
 F: hw/*/xics*
 F: include/hw/*/xics*
 F: pc-bios/slof.bin
-F: docs/specs/ppc-spapr-hcalls.txt
-F: docs/specs/ppc-spapr-hotplug.txt
+F: docs/system/ppc/pseries.rst
+F: docs/specs/ppc-spapr-*
 F: tests/qtest/spapr*
 F: tests/qtest/libqos/*spapr*
 F: tests/qtest/rtas*
@@ -1348,6 +1351,7 @@ PowerNV (Non-Virtualized)
 M: C=C3=A9dric Le Goater <clg@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
+F: docs/system/ppc/powernv.rst
 F: hw/ppc/pnv*
 F: hw/intc/pnv*
 F: hw/intc/xics_pnv.c
--=20
2.31.1


