Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1262D531
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 07:45:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVrOo-0000nn-73
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 01:45:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hVrKr-0006W5-PC
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:41:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hVrKq-0005VC-Fz
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:41:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
	id 1hVrKm-0005SA-H7; Wed, 29 May 2019 01:41:09 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4T5XlHj079877; Wed, 29 May 2019 01:41:02 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
	[169.63.214.131])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sskw8gg5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 29 May 2019 01:41:02 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x4SNceDf022435; Tue, 28 May 2019 23:45:52 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
	[9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2spwb8w5bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 28 May 2019 23:45:52 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
	[9.57.199.108])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x4T5f07I30867618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 29 May 2019 05:41:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94EF2B2066;
	Wed, 29 May 2019 05:41:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B241DB2065;
	Wed, 29 May 2019 05:40:58 +0000 (GMT)
Received: from [127.0.1.1] (unknown [9.124.31.56])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed, 29 May 2019 05:40:58 +0000 (GMT)
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
To: aik@au1.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	david@gibson.dropbear.id.au
Date: Wed, 29 May 2019 11:10:57 +0530
Message-ID: <155910845769.13149.8097972239187020170.stgit@aravinda>
In-Reply-To: <155910829070.13149.5215948335633966328.stgit@aravinda>
References: <155910829070.13149.5215948335633966328.stgit@aravinda>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-29_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905290037
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v9 6/6] migration: Include migration support
 for machine check handling
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: paulus@ozlabs.org, aravinda@linux.vnet.ibm.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch includes migration support for machine check
handling. Especially this patch blocks VM migration
requests until the machine check error handling is
complete as (i) these errors are specific to the source
hardware and is irrelevant on the target hardware,
(ii) these errors cause data corruption and should
be handled before migration.

Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
---
 hw/ppc/spapr.c         |   20 ++++++++++++++++++++
 hw/ppc/spapr_events.c  |   17 +++++++++++++++++
 hw/ppc/spapr_rtas.c    |    4 ++++
 include/hw/ppc/spapr.h |    2 ++
 4 files changed, 43 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e8a77636..31c4850 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2104,6 +2104,25 @@ static const VMStateDescription vmstate_spapr_dtb = {
     },
 };
 
+static bool spapr_fwnmi_needed(void *opaque)
+{
+    SpaprMachineState *spapr = (SpaprMachineState *)opaque;
+
+    return (spapr->guest_machine_check_addr == -1) ? 0 : 1;
+}
+
+static const VMStateDescription vmstate_spapr_machine_check = {
+    .name = "spapr_machine_check",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = spapr_fwnmi_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
+        VMSTATE_INT32(mc_status, SpaprMachineState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_spapr = {
     .name = "spapr",
     .version_id = 3,
@@ -2137,6 +2156,7 @@ static const VMStateDescription vmstate_spapr = {
         &vmstate_spapr_dtb,
         &vmstate_spapr_cap_large_decr,
         &vmstate_spapr_cap_ccf_assist,
+        &vmstate_spapr_machine_check,
         NULL
     }
 };
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 573c0b7..35e21e4 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -41,6 +41,7 @@
 #include "qemu/bcd.h"
 #include "hw/ppc/spapr_ovec.h"
 #include <libfdt.h>
+#include "migration/blocker.h"
 
 #define RTAS_LOG_VERSION_MASK                   0xff000000
 #define   RTAS_LOG_VERSION_6                    0x06000000
@@ -855,6 +856,22 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
 void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+    int ret;
+    Error *local_err = NULL;
+
+    error_setg(&spapr->fwnmi_migration_blocker,
+            "Live migration not supported during machine check handling");
+    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_err);
+    if (ret < 0) {
+        /*
+         * We don't want to abort and let the migration to continue. In a
+         * rare case, the machine check handler will run on the target
+         * hardware. Though this is not preferable, it is better than aborting
+         * the migration or killing the VM.
+         */
+        error_free(spapr->fwnmi_migration_blocker);
+        warn_report_err(local_err);
+    }
 
     while (spapr->mc_status != -1) {
         /*
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 91a7ab9..c849223 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -50,6 +50,7 @@
 #include "target/ppc/mmu-hash64.h"
 #include "target/ppc/mmu-book3s-v3.h"
 #include "kvm_ppc.h"
+#include "migration/blocker.h"
 
 static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                    uint32_t token, uint32_t nargs,
@@ -404,6 +405,9 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
         spapr->mc_status = -1;
         qemu_cond_signal(&spapr->mc_delivery_cond);
         rtas_st(rets, 0, RTAS_OUT_SUCCESS);
+        migrate_del_blocker(spapr->fwnmi_migration_blocker);
+        error_free(spapr->fwnmi_migration_blocker);
+        spapr->fwnmi_migration_blocker = NULL;
     }
 }
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bd75d4b..6c0cfd8 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -214,6 +214,8 @@ struct SpaprMachineState {
     SpaprCapabilities def, eff, mig;
 
     unsigned gpu_numa_id;
+
+    Error *fwnmi_migration_blocker;
 };
 
 #define H_SUCCESS         0


