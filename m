Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F1F16B282
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 22:32:44 +0100 (CET)
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6LLH-00012x-Eo
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 16:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1j6Knw-0001Rx-5M
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1j6Knr-0004rw-At
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:16 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:44124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1j6Knr-0004qT-2O
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:11 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKqV3c017584;
 Mon, 24 Feb 2020 20:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=SdLE47JD6InZD5kyVt26ll1iDHLPsBDVoVpfCrCe9es=;
 b=UgQm5wisoTSpT4xx6p7gCxi5Pj0BMtE9VxbSZ4qhK2dCGhfh/X8fKbe3Vtt339leY6DP
 AGjIjveCoPQOW5e+Vb0Te3T02cHvq+Bdu+MePwgdrmE0i3G60C7nygH8Bai94rLf2zZh
 GHey18TlBghbjCsUTZzKUUVVY1+U1dJvthczkwSYNIlCzzIzr9ft3W1nc4BB+A6N46kL
 FhljtqHJ1EG88CVg/RwE0m8xaENkkp9pix98LV1XCOXZXbIIk9D0zxGRgDVz/PgZa0CJ
 akwf+2kGGmJJ7so1aMQB4A9IyLGGGafutePbROVfWyfrr12D29XF2NuU1zA9tu/xf6NN Pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2yavxrhys3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:58:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKqoFH172448;
 Mon, 24 Feb 2020 20:56:03 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ybdshkr6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:56:03 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01OKu1be007726;
 Mon, 24 Feb 2020 20:56:01 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Feb 2020 12:56:01 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/50] multi-process: Add stub functions to facilate build
 of multi-process
Date: Mon, 24 Feb 2020 15:54:55 -0500
Message-Id: <965ba5bfe6f23afce2cbd3e9247692e132b1d990.1582576372.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=1 spamscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002240153
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=1 bulkscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002240153
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add stub functions that are needed during compile time but not in
runtime.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 accel/stubs/kvm-stub.c    |  5 +++
 accel/stubs/tcg-stub.c    | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 stubs/audio.c             | 12 ++++++
 stubs/machine-init-done.c |  4 ++
 stubs/monitor.c           | 41 ++++++++++++++++++++
 stubs/net-stub.c          | 31 +++++++++++++++
 stubs/replay.c            | 14 +++++++
 stubs/vl-stub.c           | 79 ++++++++++++++++++++++++++++++++++++++
 stubs/vmstate.c           | 19 ++++++++++
 stubs/xen-mapcache.c      | 22 +++++++++++
 10 files changed, 324 insertions(+)
 create mode 100644 stubs/audio.c
 create mode 100644 stubs/net-stub.c
 create mode 100644 stubs/vl-stub.c
 create mode 100644 stubs/xen-mapcache.c

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 82f118d..baa6b38 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -31,6 +31,7 @@ bool kvm_allowed;
 bool kvm_readonly_mem_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
+bool kvm_halt_in_kernel_allowed;
 
 int kvm_destroy_vcpu(CPUState *cpu)
 {
@@ -58,6 +59,10 @@ void kvm_cpu_synchronize_post_init(CPUState *cpu)
 {
 }
 
+void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu)
+{
+}
+
 int kvm_cpu_exec(CPUState *cpu)
 {
     abort();
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 677191a..9b55fb0 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -11,14 +11,111 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "cpu.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "translate-all.h"
+#include "exec/ram_addr.h"
+
+bool parallel_cpus;
 
 void tb_flush(CPUState *cpu)
 {
 }
 
+void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
+{
+}
+
+void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end)
+{
+}
+
+void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end)
+{
+}
+
+void tb_invalidate_phys_page_fast(struct page_collection *pages,
+                                  tb_page_addr_t start, int len,
+                                  uintptr_t retaddr)
+{
+}
+
+void tlb_init(CPUState *cpu)
+{
+}
+
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
+
+void tlb_flush(CPUState *cpu)
+{
+}
+
+void tlb_flush_page(CPUState *cpu, target_ulong addr)
+{
+}
+
+void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
+{
+}
+
+void tcg_region_init(void)
+{
+}
+
+void tcg_register_thread(void)
+{
+}
+
+void tcg_flush_softmmu_tlb(CPUState *cs)
+{
+}
+
+void cpu_loop_exit_noexc(CPUState *cpu)
+{
+    cpu->exception_index = -1;
+    cpu_loop_exit(cpu);
+}
+
+void cpu_loop_exit(CPUState *cpu)
+{
+    cpu->can_do_io = 1;
+    siglongjmp(cpu->jmp_env, 1);
+}
+
+void cpu_reloading_memory_map(void)
+{
+}
+
+int cpu_exec(CPUState *cpu)
+{
+    return 0;
+}
+
+void cpu_exec_step_atomic(CPUState *cpu)
+{
+}
+
+bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
+{
+    return false;
+}
+
+void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
+{
+    while (1) {
+    }
+}
+
+struct page_collection *
+page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
+{
+    return NULL;
+}
+
+void page_collection_unlock(struct page_collection *set)
+{
+}
diff --git a/stubs/audio.c b/stubs/audio.c
new file mode 100644
index 0000000..8ae3b0f
--- /dev/null
+++ b/stubs/audio.c
@@ -0,0 +1,12 @@
+#include "qemu/osdep.h"
+#include "audio/audio.h"
+
+AudioState *audio_state_by_name(const char *name)
+{
+    return NULL;
+}
+
+const char *audio_get_id(QEMUSoundCard *card)
+{
+    return NULL;
+}
diff --git a/stubs/machine-init-done.c b/stubs/machine-init-done.c
index cd8e813..3deabc9 100644
--- a/stubs/machine-init-done.c
+++ b/stubs/machine-init-done.c
@@ -6,3 +6,7 @@ bool machine_init_done = true;
 void qemu_add_machine_init_done_notifier(Notifier *notify)
 {
 }
+
+void qemu_remove_machine_init_done_notifier(Notifier *notify)
+{
+}
diff --git a/stubs/monitor.c b/stubs/monitor.c
index c3e9a2e..a34dc87 100644
--- a/stubs/monitor.c
+++ b/stubs/monitor.c
@@ -2,9 +2,19 @@
 #include "qapi/error.h"
 #include "qapi/qapi-emit-events.h"
 #include "monitor/monitor.h"
+#include "qapi/qapi-types-misc.h"
+#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-types-qom.h"
+#include "qapi/qapi-commands-qdev.h"
+#include "hw/qdev-core.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
+#include "monitor/hmp.h"
 
 __thread Monitor *cur_mon;
 
+#pragma weak hmp_handle_error
+
 int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap)
 {
     abort();
@@ -27,3 +37,34 @@ void monitor_init_hmp(Chardev *chr, bool use_readline)
 void qapi_event_emit(QAPIEvent event, QDict *qdict)
 {
 }
+
+int monitor_get_cpu_index(void)
+{
+    return -ENOSYS;
+}
+int monitor_printf(Monitor *mon, const char *fmt, ...)
+{
+    return -ENOSYS;
+}
+
+bool monitor_cur_is_qmp(void)
+{
+    return false;
+}
+
+ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
+                                                   Error **errp)
+{
+    return NULL;
+}
+
+VMChangeStateEntry *qdev_add_vm_change_state_handler(DeviceState *dev,
+                                                     VMChangeStateHandler *cb,
+                                                     void *opaque)
+{
+    return NULL;
+}
+
+void hmp_handle_error(Monitor *mon, Error *err)
+{
+}
diff --git a/stubs/net-stub.c b/stubs/net-stub.c
new file mode 100644
index 0000000..cb2274b
--- /dev/null
+++ b/stubs/net-stub.c
@@ -0,0 +1,31 @@
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "net/net.h"
+
+int qemu_find_net_clients_except(const char *id, NetClientState **ncs,
+                                 NetClientDriver type, int max)
+{
+    return -ENOSYS;
+}
+
+NetClientState *net_hub_port_find(int hub_id)
+{
+    return NULL;
+}
+
+int net_hub_id_for_client(NetClientState *nc, int *id)
+{
+    return -ENOSYS;
+}
+
+int qemu_show_nic_models(const char *arg, const char *const *models)
+{
+    return -ENOSYS;
+}
+
+int qemu_find_nic_model(NICInfo *nd, const char * const *models,
+                        const char *default_model)
+{
+    return -ENOSYS;
+}
+
diff --git a/stubs/replay.c b/stubs/replay.c
index 5974ec1..2e3feee 100644
--- a/stubs/replay.c
+++ b/stubs/replay.c
@@ -88,3 +88,17 @@ int replay_read_random(void *buf, size_t len)
 {
     return 0;
 }
+
+bool replay_has_checkpoint(void)
+{
+    return false;
+}
+
+int replay_get_instructions(void)
+{
+    return 0;
+}
+
+void replay_account_executed_instructions(void)
+{
+}
diff --git a/stubs/vl-stub.c b/stubs/vl-stub.c
new file mode 100644
index 0000000..fff72be
--- /dev/null
+++ b/stubs/vl-stub.c
@@ -0,0 +1,79 @@
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/uuid.h"
+#include "sysemu/sysemu.h"
+#include "exec/cpu-common.h"
+#include "exec/gdbstub.h"
+#include "sysemu/replay.h"
+#include "disas/disas.h"
+#include "sysemu/runstate.h"
+
+bool tcg_allowed;
+bool xen_allowed;
+bool boot_strict;
+bool qemu_uuid_set;
+
+int mem_prealloc;
+int smp_cpus;
+int vga_interface_type = VGA_NONE;
+int smp_cores = 1;
+int smp_threads = 1;
+int icount_align_option;
+int boot_menu;
+
+unsigned int max_cpus;
+const uint32_t arch_type;
+const char *mem_path;
+uint8_t qemu_extra_params_fw[2];
+uint8_t *boot_splash_filedata;
+size_t boot_splash_filedata_size;
+struct syminfo *syminfos;
+
+ram_addr_t ram_size;
+MachineState *current_machine;
+QemuUUID qemu_uuid;
+
+int runstate_is_running(void)
+{
+    return 0;
+}
+
+void runstate_set(RunState new_state)
+{
+}
+
+void vm_state_notify(int running, RunState state)
+{
+}
+
+bool qemu_vmstop_requested(RunState *r)
+{
+    return false;
+}
+
+void qemu_system_debug_request(void)
+{
+}
+
+char *qemu_find_file(int type, const char *name)
+{
+    return NULL;
+}
+
+void gdb_set_stop_cpu(CPUState *cpu)
+{
+}
+
+void replay_enable_events(void)
+{
+}
+
+void replay_disable_events(void)
+{
+}
+
+#ifdef TARGET_I386
+void x86_cpu_list(void)
+{
+}
+#endif
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index cc4fe41..c7c015a 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -1,7 +1,9 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
+#include "migration/misc.h"
 
 const VMStateDescription vmstate_dummy = {};
+const VMStateInfo vmstate_info_timer;
 
 int vmstate_register_with_alias_id(VMStateIf *obj,
                                    uint32_t instance_id,
@@ -23,3 +25,20 @@ bool vmstate_check_only_migratable(const VMStateDescription *vmsd)
 {
     return true;
 }
+
+void vmstate_register_ram(MemoryRegion *mr, DeviceState *dev)
+{
+}
+
+void vmstate_unregister_ram(MemoryRegion *mr, DeviceState *dev)
+{
+}
+
+void vmstate_register_ram_global(MemoryRegion *mr)
+{
+}
+
+bool migration_is_idle(void)
+{
+    return true;
+}
diff --git a/stubs/xen-mapcache.c b/stubs/xen-mapcache.c
new file mode 100644
index 0000000..af5c031
--- /dev/null
+++ b/stubs/xen-mapcache.c
@@ -0,0 +1,22 @@
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
+#include "sysemu/xen-mapcache.h"
+
+#ifdef CONFIG_XEN
+
+void xen_invalidate_map_cache_entry(uint8_t *buffer)
+{
+}
+
+uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size, uint8_t lock, bool dma)
+{
+    return NULL;
+}
+
+ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+{
+    return 0;
+}
+
+#endif
-- 
1.8.3.1


