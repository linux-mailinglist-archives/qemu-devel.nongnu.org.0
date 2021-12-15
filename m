Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEDB476064
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:13:26 +0100 (CET)
Received: from localhost ([::1]:44406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYmK-0004H3-Hn
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiP-0005FQ-8F; Wed, 15 Dec 2021 12:05:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51664
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiN-0004mP-Ct; Wed, 15 Dec 2021 12:05:16 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaCe019523; 
 Wed, 15 Dec 2021 17:04:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cym1w0ke1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2jQC024839;
 Wed, 15 Dec 2021 17:04:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78e7kxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4h9J43319644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A46911C05C;
 Wed, 15 Dec 2021 17:04:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E49C911C058;
 Wed, 15 Dec 2021 17:04:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:42 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2B681220295;
 Wed, 15 Dec 2021 18:04:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 070/102] ppc/ppc405: Introduce ppc405_set_default_bootinfo()
Date: Wed, 15 Dec 2021 18:03:25 +0100
Message-Id: <20211215170357.321643-58-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1v3HmsDArdeLsG-H-XMiua-zD0mxfWtc
X-Proofpoint-GUID: 1v3HmsDArdeLsG-H-XMiua-zD0mxfWtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=763 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1034 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This routine is a small helper to cleanup the code. The update of the
flash fields were removed because there are not of any use when booting
from a Linux kernel image. It should be functionally equivalent.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211206103712.1866296-11-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        |  2 +-
 hw/ppc/ppc405_boards.c | 28 +---------------------------
 hw/ppc/ppc405_uc.c     | 41 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index ea48c3626908..6fb8b41bbc77 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,7 +63,7 @@ struct ppc4xx_bd_info_t {
 };
=20
 /* PowerPC 405 core */
-ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd);
+ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
=20
 void ppc4xx_plb_init(CPUPPCState *env);
 void ppc405_ebc_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index cfed43dba2f3..71a652e2d846 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -142,7 +142,6 @@ static void ref405ep_init(MachineState *machine)
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
-    ppc4xx_bd_info_t bd;
     PowerPCCPU *cpu;
     CPUPPCState *env;
     DeviceState *dev;
@@ -221,32 +220,7 @@ static void ref405ep_init(MachineState *machine)
     /* Load kernel */
     linux_boot =3D (kernel_filename !=3D NULL);
     if (linux_boot) {
-        memset(&bd, 0, sizeof(bd));
-        bd.bi_memstart =3D PPC405EP_SDRAM_BASE;
-        bd.bi_memsize =3D machine->ram_size;
-        bd.bi_flashstart =3D -bios_size;
-        bd.bi_flashsize =3D -bios_size;
-        bd.bi_flashoffset =3D 0;
-        bd.bi_sramstart =3D PPC405EP_SRAM_BASE;
-        bd.bi_sramsize =3D PPC405EP_SRAM_SIZE;
-        bd.bi_bootflags =3D 0;
-        bd.bi_intfreq =3D 133333333;
-        bd.bi_busfreq =3D 33333333;
-        bd.bi_baudrate =3D 115200;
-        bd.bi_s_version[0] =3D 'Q';
-        bd.bi_s_version[1] =3D 'M';
-        bd.bi_s_version[2] =3D 'U';
-        bd.bi_s_version[3] =3D '\0';
-        bd.bi_r_version[0] =3D 'Q';
-        bd.bi_r_version[1] =3D 'E';
-        bd.bi_r_version[2] =3D 'M';
-        bd.bi_r_version[3] =3D 'U';
-        bd.bi_r_version[4] =3D '\0';
-        bd.bi_procfreq =3D 133333333;
-        bd.bi_plb_busfreq =3D 33333333;
-        bd.bi_pci_busfreq =3D 33333333;
-        bd.bi_opbfreq =3D 33333333;
-        bdloc =3D ppc405_set_bootinfo(env, &bd);
+        bdloc =3D ppc405_set_bootinfo(env, machine->ram_size);
         env->gpr[3] =3D bdloc;
         kernel_base =3D KERNEL_LOAD_ADDR;
         /* now we can load the kernel */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 4ad81695e80a..303af584443d 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -41,7 +41,35 @@
 #include "qapi/error.h"
 #include "trace.h"
=20
-ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
+static void ppc405_set_default_bootinfo(ppc4xx_bd_info_t *bd,
+                                        ram_addr_t ram_size)
+{
+        memset(bd, 0, sizeof(*bd));
+
+        bd->bi_memstart =3D PPC405EP_SDRAM_BASE;
+        bd->bi_memsize =3D ram_size;
+        bd->bi_sramstart =3D PPC405EP_SRAM_BASE;
+        bd->bi_sramsize =3D PPC405EP_SRAM_SIZE;
+        bd->bi_bootflags =3D 0;
+        bd->bi_intfreq =3D 133333333;
+        bd->bi_busfreq =3D 33333333;
+        bd->bi_baudrate =3D 115200;
+        bd->bi_s_version[0] =3D 'Q';
+        bd->bi_s_version[1] =3D 'M';
+        bd->bi_s_version[2] =3D 'U';
+        bd->bi_s_version[3] =3D '\0';
+        bd->bi_r_version[0] =3D 'Q';
+        bd->bi_r_version[1] =3D 'E';
+        bd->bi_r_version[2] =3D 'M';
+        bd->bi_r_version[3] =3D 'U';
+        bd->bi_r_version[4] =3D '\0';
+        bd->bi_procfreq =3D 133333333;
+        bd->bi_plb_busfreq =3D 33333333;
+        bd->bi_pci_busfreq =3D 33333333;
+        bd->bi_opbfreq =3D 33333333;
+}
+
+static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info=
_t *bd)
 {
     CPUState *cs =3D env_cpu(env);
     ram_addr_t bdloc;
@@ -93,6 +121,17 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4=
xx_bd_info_t *bd)
     return bdloc;
 }
=20
+ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
+{
+    ppc4xx_bd_info_t bd;
+
+    memset(&bd, 0, sizeof(bd));
+
+    ppc405_set_default_bootinfo(&bd, ram_size);
+
+    return __ppc405_set_bootinfo(env, &bd);
+}
+
 /***********************************************************************=
******/
 /* Shared peripherals */
=20
--=20
2.31.1


