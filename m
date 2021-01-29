Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53430885F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:42:04 +0100 (CET)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SA8-0008UL-0O
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5RmV-000333-1Z; Fri, 29 Jan 2021 06:17:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5RmT-0005be-8d; Fri, 29 Jan 2021 06:17:38 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10TB3RHG038526; Fri, 29 Jan 2021 06:17:27 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36cgp4h461-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 06:17:27 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10TBHONW024524;
 Fri, 29 Jan 2021 11:17:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 368b2h5s0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 11:17:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10TBHMe923069084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 11:17:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F942AE051;
 Fri, 29 Jan 2021 11:17:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BAB4AE045;
 Fri, 29 Jan 2021 11:17:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 29 Jan 2021 11:17:22 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-8-231.uk.ibm.com [9.145.8.231])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5F83C220186;
 Fri, 29 Jan 2021 12:17:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2] ppc/pnv: Set default RAM size to 1 GB
Date: Fri, 29 Jan 2021 12:17:19 +0100
Message-Id: <20210129111719.790692-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_04:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=577 impostorscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101290052
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory layout of the PowerNV machine is defined as :

  #define KERNEL_LOAD_BASE	((void *)0x20000000)
  #define KERNEL_LOAD_SIZE	0x08000000

  #define INITRAMFS_LOAD_BASE	KERNEL_LOAD_BASE + KERNEL_LOAD_SIZE
  #define INITRAMFS_LOAD_SIZE	0x08000000

  #define SKIBOOT_BASE		0x30000000
  #define SKIBOOT_SIZE		0x01c10000

  #define CPU_STACKS_BASE	(SKIBOOT_BASE + SKIBOOT_SIZE)
  #define STACK_SHIFT		15
  #define STACK_SIZE		(1 << STACK_SHIFT)

The overall size of the CPU stacks is (max PIR + 1) * 32K and the
machine easily reaches 800MB of minimum required RAM.

Any value below will result in a skiboot crash :

    [    0.034949905,3] MEM: Partial overlap detected between regions:
    [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] =
(new)
    [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x3=
8400000]
    [    0.034980367,3] Out of memory adding skiboot reserved areas
    [    0.035074945,3] ***********************************************
    [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
    [    0.035104247,3]     .
    [    0.035108025,3]      .
    [    0.035111651,3]       .
    [    0.035115231,3]         OO__)
    [    0.035119198,3]        <"__/
    [    0.035122980,3]         ^ ^

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 50810df83815..77af846cdfea 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
@@ -725,8 +726,11 @@ static void pnv_init(MachineState *machine)
     DeviceState *dev;
=20
     /* allocate RAM */
-    if (machine->ram_size < (1 * GiB)) {
-        warn_report("skiboot may not work with < 1GB of RAM");
+    if (machine->ram_size < mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be bigger than %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
     }
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
=20
@@ -1994,7 +1998,7 @@ static void pnv_machine_class_init(ObjectClass *oc,=
 void *data)
      * RAM defaults to less than 2048 for 32-bit hosts, and large
      * enough to fit the maximum initrd size at it's load address
      */
-    mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
+    mc->default_ram_size =3D 1 * GiB;
     mc->default_ram_id =3D "pnv.ram";
     ispc->print_info =3D pnv_pic_print_info;
     nc->nmi_monitor_handler =3D pnv_nmi;
--=20
2.26.2


