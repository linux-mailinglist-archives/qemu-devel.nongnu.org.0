Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AEE475FF2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:55:43 +0100 (CET)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYVC-00009R-RK
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiK-0004yf-F9; Wed, 15 Dec 2021 12:05:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiI-0004j7-A1; Wed, 15 Dec 2021 12:05:12 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbwS024029; 
 Wed, 15 Dec 2021 17:04:45 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfrp7erd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3KVs024948;
 Wed, 15 Dec 2021 17:04:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:42 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4e5D30540148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 697DF52071;
 Wed, 15 Dec 2021 17:04:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 30CEB52065;
 Wed, 15 Dec 2021 17:04:40 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7F52A220295;
 Wed, 15 Dec 2021 18:04:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 066/102] ppc/ppc405: Change ppc405ep_init() return value
Date: Wed, 15 Dec 2021 18:03:21 +0100
Message-Id: <20211215170357.321643-54-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LoQX7otky69eugoTYiG1OMVQeXIBDGmE
X-Proofpoint-ORIG-GUID: LoQX7otky69eugoTYiG1OMVQeXIBDGmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1034 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=643
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I will be useful to rework the boot from Linux.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211206103712.1866296-7-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        | 2 +-
 hw/ppc/ppc405_boards.c | 6 +++++-
 hw/ppc/ppc405_uc.c     | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 4cb77aca5690..ad5f4026b5db 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -61,7 +61,7 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx=
_bd_info_t *bd);
 void ppc4xx_plb_init(CPUPPCState *env);
 void ppc405_ebc_init(CPUPPCState *env);
=20
-CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
+PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 2ac38c86a643..fcdb6d4cf8a0 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -145,6 +145,7 @@ static void ref405ep_init(MachineState *machine)
     const char *initrd_filename =3D machine->initrd_filename;
     char *filename;
     ppc4xx_bd_info_t bd;
+    PowerPCCPU *cpu;
     CPUPPCState *env;
     DeviceState *dev;
     SysBusDevice *s;
@@ -180,8 +181,11 @@ static void ref405ep_init(MachineState *machine)
     memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
     ram_bases[1] =3D 0x00000000;
     ram_sizes[1] =3D 0x00000000;
-    env =3D ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
+
+    cpu =3D ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &uicdev, kernel_filename =3D=3D NULL ?=
 0 : 1);
+    env =3D &cpu->env;
+
     /* allocate SRAM */
     sram_size =3D 512 * KiB;
     memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size,
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 6806d6be31d5..4ad81695e80a 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1391,7 +1391,7 @@ static void ppc405ep_cpc_init (CPUPPCState *env, cl=
k_setup_t clk_setup[8],
 #endif
 }
=20
-CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
+PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
@@ -1490,5 +1490,5 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_sp=
ace_mem,
     /* CPU control */
     ppc405ep_cpc_init(env, clk_setup, sysclk);
=20
-    return env;
+    return cpu;
 }
--=20
2.31.1


