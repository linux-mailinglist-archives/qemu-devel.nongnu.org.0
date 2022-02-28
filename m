Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7314C6F1C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:16:05 +0100 (CET)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgol-00044a-Rq
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:16:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn6-0001Ye-Ks; Mon, 28 Feb 2022 01:45:52 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn2-0003IP-Lm; Mon, 28 Feb 2022 01:45:51 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 37CDE11EF41;
 Mon, 28 Feb 2022 06:45:46 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 09:15:36 +0800
Subject: [PATCH qemu 4/7] hvf: rename struct hvf_slot to HVFSlot
Message-ID: <164603074537.20094.1732342403585879912-4@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:40 -0500
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
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Yan-Jie Wang <ubzeme@gmail.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yan-Jie Wang <ubzeme@gmail.com>

Follow the QEMU coding style. Structured type names are in CamelCase.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c      | 14 +++++++-------
 include/sysemu/hvf_int.h |  8 ++++----
 target/i386/hvf/hvf.c    |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index e8cd6b9251..36ae1abc06 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -30,11 +30,11 @@
=20
 #define HVF_NUM_SLOTS 32
=20
-static hvf_slot memslots[HVF_NUM_SLOTS];
+static HVFSlot memslots[HVF_NUM_SLOTS];
=20
-hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
+HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     int x;
     for (x =3D 0; x < HVF_NUM_SLOTS; ++x) {
         slot =3D &memslots[x];
@@ -46,9 +46,9 @@ hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
     return NULL;
 }
=20
-static hvf_slot *hvf_find_free_slot(void)
+static HVFSlot *hvf_find_free_slot(void)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     int x;
     for (x =3D 0; x < HVF_NUM_SLOTS; x++) {
         slot =3D &memslots[x];
@@ -91,7 +91,7 @@ static hwaddr hvf_align_section(MemoryRegionSection *sectio=
n,
=20
 static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     hwaddr start, size, offset, delta;
     uint8_t *host_addr;
     MemoryRegion *area =3D section->mr;
@@ -172,7 +172,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *section=
, bool add)
=20
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
=20
     slot =3D hvf_find_overlap_slot(
             section->offset_within_address_space,
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 2c4a97debe..0aafbc9357 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -17,17 +17,17 @@
 #include <Hypervisor/hv.h>
 #endif
=20
-/* hvf_slot flags */
+/* HVFSlot flags */
 #define HVF_SLOT_LOG (1 << 0)
 #define HVF_SLOT_READONLY (1 << 1)
=20
-typedef struct hvf_slot {
+typedef struct HVFSlot {
     hwaddr start;
     hwaddr size;  /* 0 if the slot is free */
     hwaddr offset;  /* offset within memory region */
     uint32_t flags;
     MemoryRegion *region;
-} hvf_slot;
+} HVFSlot;
=20
 typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_pinbased;
@@ -58,7 +58,7 @@ int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
-hvf_slot *hvf_find_overlap_slot(hwaddr, hwaddr);
+HVFSlot *hvf_find_overlap_slot(hwaddr, hwaddr);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab..2ddb4fc825 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -113,7 +113,7 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void=
 *buffer,
     }
 }
=20
-static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_q=
ual)
+static bool ept_emulation_fault(HVFSlot *slot, uint64_t gpa, uint64_t ept_qu=
al)
 {
     int read, write;
=20
@@ -469,7 +469,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         /* Need to check if MMIO or unmapped fault */
         case EXIT_REASON_EPT_FAULT:
         {
-            hvf_slot *slot;
+            HVFSlot *slot;
             uint64_t gpa =3D rvmcs(cpu->hvf->fd, VMCS_GUEST_PHYSICAL_ADDRESS=
);
=20
             if (((idtvec_info & VMCS_IDT_VEC_VALID) =3D=3D 0) &&
--=20
2.34.1


