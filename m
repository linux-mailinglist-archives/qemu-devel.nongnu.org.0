Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE99A33B3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 11:22:18 +0200 (CEST)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3d6m-0000ok-08
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 05:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1i3cyv-0003X6-Dn
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 05:14:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1i3cyt-0008BS-FK
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 05:14:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22274)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
 id 1i3cyn-0007u3-Ei; Fri, 30 Aug 2019 05:14:01 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7U97NL7016101; Fri, 30 Aug 2019 05:13:56 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uq0em9e6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2019 05:13:56 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7U99PHR024190;
 Fri, 30 Aug 2019 09:13:54 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 2ujvv71tvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2019 09:13:54 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7U9DrNE23331312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Aug 2019 09:13:53 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AAC0C605A;
 Fri, 30 Aug 2019 09:13:53 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64AA9C6059;
 Fri, 30 Aug 2019 09:13:51 +0000 (GMT)
Received: from [127.0.1.1] (unknown [9.85.75.15])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Aug 2019 09:13:51 +0000 (GMT)
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
To: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Date: Fri, 30 Aug 2019 14:43:50 +0530
Message-ID: <156715643020.27761.6478380064885992450.stgit@aravinda>
In-Reply-To: <156715632966.27761.8190459106519248668.stgit@aravinda>
References: <156715632966.27761.8190459106519248668.stgit@aravinda>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908300099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v12 3/6] target/ppc: Handle NMI guest exit
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
Cc: paulus@ozlabs.org, aravinda@linux.vnet.ibm.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Memory error such as bit flips that cannot be corrected
by hardware are passed on to the kernel for handling.
If the memory address in error belongs to guest then
the guest kernel is responsible for taking suitable action.
Patch [1] enhances KVM to exit guest with exit reason
set to KVM_EXIT_NMI in such cases. This patch handles
KVM_EXIT_NMI exit.

[1] https://www.spinics.net/lists/kvm-ppc/msg12637.html
    (e20bbd3d and related commits)

Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c          |    8 ++++++++
 hw/ppc/spapr_events.c   |   24 ++++++++++++++++++++++++
 include/hw/ppc/spapr.h  |   10 ++++++++++
 target/ppc/kvm.c        |   14 ++++++++++++++
 target/ppc/kvm_ppc.h    |    2 ++
 target/ppc/trace-events |    1 +
 6 files changed, 59 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8288e8b..76ed988 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1823,6 +1823,12 @@ static void spapr_machine_reset(MachineState *machine)
     first_ppc_cpu->env.gpr[5] = 0;
 
     spapr->cas_reboot = false;
+
+    spapr->mc_status = -1;
+    spapr->guest_machine_check_addr = -1;
+
+    /* Signal all vCPUs waiting on this condition */
+    qemu_cond_broadcast(&spapr->mc_delivery_cond);
 }
 
 static void spapr_create_nvram(SpaprMachineState *spapr)
@@ -3099,6 +3105,8 @@ static void spapr_machine_init(MachineState *machine)
 
         kvmppc_spapr_enable_inkernel_multitce();
     }
+
+    qemu_cond_init(&spapr->mc_delivery_cond);
 }
 
 static int spapr_kvm_type(MachineState *machine, const char *vm_type)
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0e4c195..e76c1a7 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -40,6 +40,7 @@
 #include "hw/ppc/spapr_drc.h"
 #include "qemu/help_option.h"
 #include "qemu/bcd.h"
+#include "qemu/main-loop.h"
 #include "hw/ppc/spapr_ovec.h"
 #include <libfdt.h>
 
@@ -621,6 +622,29 @@ void spapr_hotplug_req_remove_by_count_indexed(SpaprDrcType drc_type,
                             RTAS_LOG_V6_HP_ACTION_REMOVE, drc_type, &drc_id);
 }
 
+void spapr_mce_req_event(PowerPCCPU *cpu)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+
+    while (spapr->mc_status != -1) {
+        /*
+         * Check whether the same CPU got machine check error
+         * while still handling the mc error (i.e., before
+         * that CPU called "ibm,nmi-interlock")
+         */
+        if (spapr->mc_status == cpu->vcpu_id) {
+            qemu_system_guest_panicked(NULL);
+            return;
+        }
+        qemu_cond_wait_iothread(&spapr->mc_delivery_cond);
+        /* Meanwhile if the system is reset, then just return */
+        if (spapr->guest_machine_check_addr == -1) {
+            return;
+        }
+    }
+    spapr->mc_status = cpu->vcpu_id;
+}
+
 static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
                             uint32_t token, uint32_t nargs,
                             target_ulong args,
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 66049ac..99a2966 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -192,6 +192,15 @@ struct SpaprMachineState {
      * occurs during the unplug process. */
     QTAILQ_HEAD(, SpaprDimmState) pending_dimm_unplugs;
 
+    /* State related to "ibm,nmi-register" and "ibm,nmi-interlock" calls */
+    target_ulong guest_machine_check_addr;
+    /*
+     * mc_status is set to -1 if mc is not in progress, else is set to the CPU
+     * handling the mc.
+     */
+    int mc_status;
+    QemuCond mc_delivery_cond;
+
     /*< public >*/
     char *kvm_type;
     char *host_model;
@@ -805,6 +814,7 @@ void spapr_clear_pending_events(SpaprMachineState *spapr);
 int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
+void spapr_mce_req_event(PowerPCCPU *cpu);
 
 /* DRC callbacks. */
 void spapr_core_release(DeviceState *dev);
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index c055fc1..4e282f6 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1704,6 +1704,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         ret = 0;
         break;
 
+    case KVM_EXIT_NMI:
+        trace_kvm_handle_nmi_exception();
+        ret = kvm_handle_nmi(cpu, run);
+        break;
+
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
@@ -2807,6 +2812,15 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
     return data & 0xffff;
 }
 
+int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run)
+{
+    cpu_synchronize_state(CPU(cpu));
+
+    spapr_mce_req_event(cpu);
+
+    return 0;
+}
+
 int kvmppc_enable_hwrng(void)
 {
     if (!kvm_enabled() || !kvm_check_extension(kvm_state, KVM_CAP_PPC_HWRNG)) {
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 2990898..173c000 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -84,6 +84,8 @@ void kvm_check_mmu(PowerPCCPU *cpu, Error **errp);
 void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu, unsigned int online);
 void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset);
 
+int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
+
 #else
 
 static inline uint32_t kvmppc_get_tbfreq(void)
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 3dc6740..6d15aa9 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -28,3 +28,4 @@ kvm_handle_papr_hcall(void) "handle PAPR hypercall"
 kvm_handle_epr(void) "handle epr"
 kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
 kvm_handle_debug_exception(void) "handle debug exception"
+kvm_handle_nmi_exception(void) "handle NMI exception"


