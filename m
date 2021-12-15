Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A599D4760AF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:27:18 +0100 (CET)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYzl-0001g5-Q9
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:27:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiJ-0004xP-LT; Wed, 15 Dec 2021 12:05:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiH-0004is-1P; Wed, 15 Dec 2021 12:05:11 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbqg019551; 
 Wed, 15 Dec 2021 17:04:45 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyh6nw3y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:45 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH400A024510;
 Wed, 15 Dec 2021 17:04:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78h78x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4fCW44695964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20E3852071;
 Wed, 15 Dec 2021 17:04:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id DE7FF5204E;
 Wed, 15 Dec 2021 17:04:40 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2C3B1220247;
 Wed, 15 Dec 2021 18:04:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 067/102] ppc/ppc405: Add some address space definitions
Date: Wed, 15 Dec 2021 18:03:22 +0100
Message-Id: <20211215170357.321643-55-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ojFXeQl3cToJzZ_pU6PS8AHsp6aENi6P
X-Proofpoint-GUID: ojFXeQl3cToJzZ_pU6PS8AHsp6aENi6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=765 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1034 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20211206103712.1866296-8-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        |  7 +++++++
 hw/ppc/ppc405_boards.c | 16 +++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index ad5f4026b5db..ea48c3626908 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -27,6 +27,13 @@
=20
 #include "hw/ppc/ppc4xx.h"
=20
+#define PPC405EP_SDRAM_BASE 0x00000000
+#define PPC405EP_NVRAM_BASE 0xF0000000
+#define PPC405EP_FPGA_BASE  0xF0300000
+#define PPC405EP_SRAM_BASE  0xFFF00000
+#define PPC405EP_SRAM_SIZE  (512 * KiB)
+#define PPC405EP_FLASH_BASE 0xFFF80000
+
 /* Bootinfo as set-up by u-boot */
 typedef struct ppc4xx_bd_info_t ppc4xx_bd_info_t;
 struct ppc4xx_bd_info_t {
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index fcdb6d4cf8a0..60dc81fa4880 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -154,7 +154,6 @@ static void ref405ep_init(MachineState *machine)
     ram_addr_t bdloc;
     MemoryRegion *ram_memories =3D g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
-    target_ulong sram_size;
     long bios_size;
     //int phy_addr =3D 0;
     //static int phy_addr =3D 1;
@@ -187,10 +186,9 @@ static void ref405ep_init(MachineState *machine)
     env =3D &cpu->env;
=20
     /* allocate SRAM */
-    sram_size =3D 512 * KiB;
-    memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size,
+    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZ=
E,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, 0xFFF00000, sram);
+    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
     /* allocate and load BIOS */
 #ifdef USE_FLASH_BIOS
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
@@ -230,24 +228,24 @@ static void ref405ep_init(MachineState *machine)
         }
     }
     /* Register FPGA */
-    ref405ep_fpga_init(sysmem, 0xF0300000);
+    ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
     /* Register NVRAM */
     dev =3D qdev_new("sysbus-m48t08");
     qdev_prop_set_int32(dev, "base-year", 1968);
     s =3D SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, 0xF0000000);
+    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
     /* Load kernel */
     linux_boot =3D (kernel_filename !=3D NULL);
     if (linux_boot) {
         memset(&bd, 0, sizeof(bd));
-        bd.bi_memstart =3D 0x00000000;
+        bd.bi_memstart =3D PPC405EP_SDRAM_BASE;
         bd.bi_memsize =3D machine->ram_size;
         bd.bi_flashstart =3D -bios_size;
         bd.bi_flashsize =3D -bios_size;
         bd.bi_flashoffset =3D 0;
-        bd.bi_sramstart =3D 0xFFF00000;
-        bd.bi_sramsize =3D sram_size;
+        bd.bi_sramstart =3D PPC405EP_SRAM_BASE;
+        bd.bi_sramsize =3D PPC405EP_SRAM_SIZE;
         bd.bi_bootflags =3D 0;
         bd.bi_intfreq =3D 133333333;
         bd.bi_busfreq =3D 33333333;
--=20
2.31.1


