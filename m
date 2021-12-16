Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFAA477E90
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:17:00 +0100 (CET)
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxy7X-0007HP-TS
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:16:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLq-0003cK-17; Thu, 16 Dec 2021 15:27:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLo-0007Sv-A5; Thu, 16 Dec 2021 15:27:41 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDXuL038650; 
 Thu, 16 Dec 2021 20:27:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cymkwfkrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDDZx019543;
 Thu, 16 Dec 2021 20:27:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78ek0re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:02 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKR0G446465458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37CD4AE04D;
 Thu, 16 Dec 2021 20:27:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC0B8AE045;
 Thu, 16 Dec 2021 20:26:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3DAC9220238;
 Thu, 16 Dec 2021 21:26:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 065/101] ppc/ppc405: Drop flag parameter in
 ppc405_set_bootinfo()
Date: Thu, 16 Dec 2021 21:25:38 +0100
Message-Id: <20211216202614.414266-66-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wF6KmfEXqmGt5r1BhR4vmAOzCYpOZ54s
X-Proofpoint-ORIG-GUID: wF6KmfEXqmGt5r1BhR4vmAOzCYpOZ54s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1034 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=725 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was introduced in commit b8d3f5d12642 ("Add flags to support
PowerPC 405 bootinfos variations.") but since its value has always
been set to '1'.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20211206103712.1866296-6-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        | 3 +--
 hw/ppc/ppc405_boards.c | 2 +-
 hw/ppc/ppc405_uc.c     | 8 +++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index c58f739886a6..4cb77aca5690 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -56,8 +56,7 @@ struct ppc4xx_bd_info_t {
 };
=20
 /* PowerPC 405 core */
-ram_addr_t ppc405_set_bootinfo (CPUPPCState *env, ppc4xx_bd_info_t *bd,
-                                uint32_t flags);
+ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd);
=20
 void ppc4xx_plb_init(CPUPPCState *env);
 void ppc405_ebc_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index f1623aa622a6..2ac38c86a643 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -261,7 +261,7 @@ static void ref405ep_init(MachineState *machine)
         bd.bi_plb_busfreq =3D 33333333;
         bd.bi_pci_busfreq =3D 33333333;
         bd.bi_opbfreq =3D 33333333;
-        bdloc =3D ppc405_set_bootinfo(env, &bd, 0x00000001);
+        bdloc =3D ppc405_set_bootinfo(env, &bd);
         env->gpr[3] =3D bdloc;
         kernel_base =3D KERNEL_LOAD_ADDR;
         /* now we can load the kernel */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index e14d61e9b899..6806d6be31d5 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -41,8 +41,7 @@
 #include "qapi/error.h"
 #include "trace.h"
=20
-ram_addr_t ppc405_set_bootinfo (CPUPPCState *env, ppc4xx_bd_info_t *bd,
-                                uint32_t flags)
+ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
 {
     CPUState *cs =3D env_cpu(env);
     ram_addr_t bdloc;
@@ -81,9 +80,8 @@ ram_addr_t ppc405_set_bootinfo (CPUPPCState *env, ppc4x=
x_bd_info_t *bd,
         stb_phys(cs->as, bdloc + 0x64 + i, bd->bi_pci_enetaddr[i]);
     }
     n =3D 0x6A;
-    if (flags & 0x00000001) {
-        for (i =3D 0; i < 6; i++)
-            stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
+    for (i =3D 0; i < 6; i++) {
+        stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
     }
     stl_be_phys(cs->as, bdloc + n, bd->bi_opbfreq);
     n +=3D 4;
--=20
2.31.1


