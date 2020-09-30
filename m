Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7D27E62F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 12:05:01 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNYyq-0002Qt-Rp
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 06:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kNYov-0007qI-Lb; Wed, 30 Sep 2020 05:54:49 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4773 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kNYoi-0004Pv-Ry; Wed, 30 Sep 2020 05:54:45 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B4F5ACEB68B4A294FAD9;
 Wed, 30 Sep 2020 17:54:29 +0800 (CST)
Received: from localhost (10.174.185.186) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 30 Sep 2020
 17:54:20 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH RFC 10/14] i386/: fix some comment spelling errors
Date: Wed, 30 Sep 2020 17:53:17 +0800
Message-ID: <20200930095321.2006-11-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200930095321.2006-1-zhaolichang@huawei.com>
References: <20200930095321.2006-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.186]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 05:54:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhaolichang <zhaolichang@huawei.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu/target/i386.
I used spellcheck to check the spelling errors and found some errors in the folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
---
 target/i386/cpu.c           | 4 ++--
 target/i386/hax-interface.h | 4 ++--
 target/i386/hax-windows.c   | 2 +-
 target/i386/kvm.c           | 2 +-
 target/i386/machine.c       | 6 +++---
 target/i386/translate.c     | 8 ++++----
 target/i386/whpx-all.c      | 2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3ffd877..23851e5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4677,7 +4677,7 @@ static const char *x86_cpu_feature_name(FeatureWord w, int bitnr)
     return name;
 }
 
-/* Compatibily hack to maintain legacy +-feat semantic,
+/* Compatibility hack to maintain legacy +-feat semantic,
  * where +-feat overwrites any feature set by
  * feat=on|feat even if the later is parsed after +-feat
  * (i.e. "-x2apic,x2apic=on" will result in x2apic disabled)
@@ -6896,7 +6896,7 @@ static void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
     GuestPanicInformation *panic_info;
 
     if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occured");
+        error_setg(errp, "No crash occurred");
         return;
     }
 
diff --git a/target/i386/hax-interface.h b/target/i386/hax-interface.h
index 537ae08..edef4fd 100644
--- a/target/i386/hax-interface.h
+++ b/target/i386/hax-interface.h
@@ -238,7 +238,7 @@ enum exit_status {
     HAX_EXIT_UNKNOWN_VMEXIT,
     /* HALT from guest */
     HAX_EXIT_HLT,
-    /* Reboot request, like because of tripple fault in guest */
+    /* Reboot request, like because of triple fault in guest */
     HAX_EXIT_STATECHANGE,
     /* the vcpu is now only paused when destroy, so simply return to hax */
     HAX_EXIT_PAUSED,
@@ -295,7 +295,7 @@ struct hax_qemu_version {
     uint32_t min_version;
 } __attribute__ ((__packed__));
 
-/* The mac specfic interface to qemu, mostly is ioctl related */
+/* The mac specific interface to qemu, mostly is ioctl related */
 struct hax_tunnel_info {
     uint64_t va;
     uint64_t io_va;
diff --git a/target/i386/hax-windows.c b/target/i386/hax-windows.c
index 863c2bc..881089b 100644
--- a/target/i386/hax-windows.c
+++ b/target/i386/hax-windows.c
@@ -174,7 +174,7 @@ int hax_mod_version(struct hax_state *hax, struct hax_module_version *version)
     if (!ret) {
         err = GetLastError();
         if (err == ERROR_INSUFFICIENT_BUFFER || err == ERROR_MORE_DATA) {
-            fprintf(stderr, "hax module verion is too long to hold.\n");
+            fprintf(stderr, "hax module version is too long to hold.\n");
         }
         fprintf(stderr, "Failed to get Hax module version:%lu\n", err);
         return -EFAULT;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 9efb07e..fbdbb49 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1179,7 +1179,7 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
 /*
  * Fill in Hyper-V CPUIDs. Returns the number of entries filled in cpuid_ent in
  * case of success, errno < 0 in case of failure and 0 when no Hyper-V
- * extentions are enabled.
+ * extensions are enabled.
  */
 static int hyperv_handle_properties(CPUState *cs,
                                     struct kvm_cpuid_entry2 *cpuid_ent)
diff --git a/target/i386/machine.c b/target/i386/machine.c
index b1acf7d..90e6139 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -264,12 +264,12 @@ static int cpu_pre_save(void *opaque)
      * hypervisor, its exception payload (CR2/DR6 on #PF/#DB)
      * should not be set yet in the respective vCPU register.
      * Thus, in case an exception is pending, it is
-     * important to save the exception payload seperately.
+     * important to save the exception payload separately.
      *
      * Therefore, if an exception is not in a pending state
      * or vCPU is not in guest-mode, it is not important to
      * distinguish between a pending and injected exception
-     * and we don't need to store seperately the exception payload.
+     * and we don't need to store separately the exception payload.
      *
      * In order to preserve better backwards-compatible migration,
      * convert a pending exception to an injected exception in
@@ -1138,7 +1138,7 @@ static int nested_state_post_load(void *opaque, int version_id)
         return -EINVAL;
     }
     if (nested_state->size > max_nested_state_len) {
-        error_report("Recieved unsupported nested state size: "
+        error_report("Received unsupported nested state size: "
                      "nested_state->size=%d, max=%d",
                      nested_state->size, max_nested_state_len);
         return -EINVAL;
diff --git a/target/i386/translate.c b/target/i386/translate.c
index caea6f5..5cdfe0e 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -893,7 +893,7 @@ static CCPrepare gen_prepare_eflags_z(DisasContext *s, TCGv reg)
 }
 
 /* perform a conditional store into register 'reg' according to jump opcode
-   value 'b'. In the fast case, T0 is guaranted not to be used. */
+   value 'b'. In the fast case, T0 is guaranteed not to be used. */
 static CCPrepare gen_prepare_cc(DisasContext *s, int b, TCGv reg)
 {
     int inv, jcc_op, cond;
@@ -1026,7 +1026,7 @@ static inline void gen_compute_eflags_c(DisasContext *s, TCGv reg)
 }
 
 /* generate a conditional jump to label 'l1' according to jump opcode
-   value 'b'. In the fast case, T0 is guaranted not to be used. */
+   value 'b'. In the fast case, T0 is guaranteed not to be used. */
 static inline void gen_jcc1_noeob(DisasContext *s, int b, TCGLabel *l1)
 {
     CCPrepare cc = gen_prepare_cc(s, b, s->T0);
@@ -1043,7 +1043,7 @@ static inline void gen_jcc1_noeob(DisasContext *s, int b, TCGLabel *l1)
 }
 
 /* Generate a conditional jump to label 'l1' according to jump opcode
-   value 'b'. In the fast case, T0 is guaranted not to be used.
+   value 'b'. In the fast case, T0 is guaranteed not to be used.
    A translation block must end soon.  */
 static inline void gen_jcc1(DisasContext *s, int b, TCGLabel *l1)
 {
@@ -6841,7 +6841,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->prefix & PREFIX_LOCK) {
             switch (op) {
             case 0: /* bt */
-                /* Needs no atomic ops; we surpressed the normal
+                /* Needs no atomic ops; we suppressed the normal
                    memory load for LOCK above so do it now.  */
                 gen_op_ld_v(s, ot, s->T0, s->A0);
                 break;
diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index 5a0f337..661f9c7 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -1214,7 +1214,7 @@ int whpx_init_vcpu(CPUState *cpu)
     vcpu = g_malloc0(sizeof(struct whpx_vcpu));
 
     if (!vcpu) {
-        error_report("WHPX: Failed to allocte VCPU context.");
+        error_report("WHPX: Failed to allocate VCPU context.");
         return -ENOMEM;
     }
 
-- 
2.26.2.windows.1


