Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCEC45B6F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 13:29:42 +0200 (CEST)
Received: from localhost ([::1]:50310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbkOr-0004a2-Cw
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 07:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hbkCW-0002RV-2p
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 07:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hbk55-0002ze-V8
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 07:09:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hbk55-0002qN-GR
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 07:09:15 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EB75x0136582
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 07:09:07 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t48cudcha-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 07:09:07 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Fri, 14 Jun 2019 12:09:05 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Jun 2019 12:09:02 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5EB91ds55443668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 11:09:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 496944C059;
 Fri, 14 Jun 2019 11:09:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21F1E4C044;
 Fri, 14 Jun 2019 11:09:01 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.152.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jun 2019 11:09:01 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Fri, 14 Jun 2019 13:09:00 +0200
In-Reply-To: <156051052402.224162.13664250996245267046.stgit@bahia.lan>
References: <156051052402.224162.13664250996245267046.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061411-0028-0000-0000-0000037A454D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061411-0029-0000-0000-0000243A41CB
Message-Id: <156051054077.224162.9332715375637801197.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906140093
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH 3/7] hw/ppc/mac_newworld: Drop useless
 CONFIG_KVM ifdefery
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_enabled() expands to (0) when CONFIG_KVM is not defined. The first
CONFIG_KVM guard is thus useless and it is likely that the compiler
will optimize the code out in the case of the second guard. And even
if it doesn't, we have a stub for kvmppc_get_hypercall().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/mac_newworld.c |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 4d835f32b536..c8d324552470 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -437,13 +437,11 @@ static void ppc_core99_init(MachineState *machine)
     }
 
     /* The NewWorld NVRAM is not located in the MacIO device */
-#ifdef CONFIG_KVM
     if (kvm_enabled() && getpagesize() > 4096) {
         /* We can't combine read-write and read-only in a single page, so
            move the NVRAM out of ROM again for KVM */
         nvram_addr = 0xFFE00000;
     }
-#endif
     dev = qdev_create(NULL, TYPE_MACIO_NVRAM);
     qdev_prop_set_uint32(dev, "size", 0x2000);
     qdev_prop_set_uint32(dev, "it_shift", 1);
@@ -488,14 +486,12 @@ static void ppc_core99_init(MachineState *machine)
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_IS_KVM, kvm_enabled());
     if (kvm_enabled()) {
-#ifdef CONFIG_KVM
         uint8_t *hypercall;
 
         hypercall = g_malloc(16);
         kvmppc_get_hypercall(env, hypercall, 16);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_PPC_KVM_HC, hypercall, 16);
         fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_KVM_PID, getpid());
-#endif
     }
     fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_TBFREQ, tbfreq);
     /* Mac OS X requires a "known good" clock-frequency value; pass it one. */


