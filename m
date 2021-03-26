Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E934AF78
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:45:14 +0100 (CET)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsOP-000624-DX
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGd-0005la-RN
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:45164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGa-0000jU-GA
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2FD04AF26;
 Fri, 26 Mar 2021 19:37:07 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 02/65] target/arm: move helpers to tcg/
Date: Fri, 26 Mar 2021 20:35:58 +0100
Message-Id: <20210326193701.5981-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                          |  1 +
 target/arm/{ => tcg}/op_addsub.h     |  0
 target/arm/tcg/trace.h               |  1 +
 target/arm/{ => tcg}/vec_internal.h  |  0
 target/arm/{ => tcg}/crypto_helper.c |  0
 target/arm/{ => tcg}/debug_helper.c  |  0
 target/arm/{ => tcg}/helper-a64.c    |  0
 target/arm/{ => tcg}/helper.c        |  0
 target/arm/{ => tcg}/iwmmxt_helper.c |  0
 target/arm/{ => tcg}/m_helper.c      |  0
 target/arm/{ => tcg}/mte_helper.c    |  0
 target/arm/{ => tcg}/neon_helper.c   |  0
 target/arm/{ => tcg}/op_helper.c     |  0
 target/arm/{ => tcg}/pauth_helper.c  |  0
 target/arm/{ => tcg}/sve_helper.c    |  0
 target/arm/{ => tcg}/tlb_helper.c    |  0
 target/arm/{ => tcg}/vec_helper.c    |  0
 target/arm/{ => tcg}/vfp_helper.c    |  0
 target/arm/meson.build               | 14 --------------
 target/arm/tcg/meson.build           | 14 ++++++++++++++
 target/arm/tcg/trace-events          | 10 ++++++++++
 target/arm/trace-events              |  9 ---------
 22 files changed, 26 insertions(+), 23 deletions(-)
 rename target/arm/{ => tcg}/op_addsub.h (100%)
 create mode 100644 target/arm/tcg/trace.h
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (100%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 rename target/arm/{ => tcg}/helper.c (100%)
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m_helper.c (100%)
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (100%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vfp_helper.c (100%)
 create mode 100644 target/arm/tcg/trace-events

diff --git a/meson.build b/meson.build
index 3be616e39b..53f2650907 100644
--- a/meson.build
+++ b/meson.build
@@ -1845,6 +1845,7 @@ if have_system or have_user
     'accel/tcg',
     'hw/core',
     'target/arm',
+    'target/arm/tcg',
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
diff --git a/target/arm/op_addsub.h b/target/arm/tcg/op_addsub.h
similarity index 100%
rename from target/arm/op_addsub.h
rename to target/arm/tcg/op_addsub.h
diff --git a/target/arm/tcg/trace.h b/target/arm/tcg/trace.h
new file mode 100644
index 0000000000..c6e89d018b
--- /dev/null
+++ b/target/arm/tcg/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_arm_tcg.h"
diff --git a/target/arm/vec_internal.h b/target/arm/tcg/vec_internal.h
similarity index 100%
rename from target/arm/vec_internal.h
rename to target/arm/tcg/vec_internal.h
diff --git a/target/arm/crypto_helper.c b/target/arm/tcg/crypto_helper.c
similarity index 100%
rename from target/arm/crypto_helper.c
rename to target/arm/tcg/crypto_helper.c
diff --git a/target/arm/debug_helper.c b/target/arm/tcg/debug_helper.c
similarity index 100%
rename from target/arm/debug_helper.c
rename to target/arm/tcg/debug_helper.c
diff --git a/target/arm/helper-a64.c b/target/arm/tcg/helper-a64.c
similarity index 100%
rename from target/arm/helper-a64.c
rename to target/arm/tcg/helper-a64.c
diff --git a/target/arm/helper.c b/target/arm/tcg/helper.c
similarity index 100%
rename from target/arm/helper.c
rename to target/arm/tcg/helper.c
diff --git a/target/arm/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
similarity index 100%
rename from target/arm/iwmmxt_helper.c
rename to target/arm/tcg/iwmmxt_helper.c
diff --git a/target/arm/m_helper.c b/target/arm/tcg/m_helper.c
similarity index 100%
rename from target/arm/m_helper.c
rename to target/arm/tcg/m_helper.c
diff --git a/target/arm/mte_helper.c b/target/arm/tcg/mte_helper.c
similarity index 100%
rename from target/arm/mte_helper.c
rename to target/arm/tcg/mte_helper.c
diff --git a/target/arm/neon_helper.c b/target/arm/tcg/neon_helper.c
similarity index 100%
rename from target/arm/neon_helper.c
rename to target/arm/tcg/neon_helper.c
diff --git a/target/arm/op_helper.c b/target/arm/tcg/op_helper.c
similarity index 100%
rename from target/arm/op_helper.c
rename to target/arm/tcg/op_helper.c
diff --git a/target/arm/pauth_helper.c b/target/arm/tcg/pauth_helper.c
similarity index 100%
rename from target/arm/pauth_helper.c
rename to target/arm/tcg/pauth_helper.c
diff --git a/target/arm/sve_helper.c b/target/arm/tcg/sve_helper.c
similarity index 100%
rename from target/arm/sve_helper.c
rename to target/arm/tcg/sve_helper.c
diff --git a/target/arm/tlb_helper.c b/target/arm/tcg/tlb_helper.c
similarity index 100%
rename from target/arm/tlb_helper.c
rename to target/arm/tcg/tlb_helper.c
diff --git a/target/arm/vec_helper.c b/target/arm/tcg/vec_helper.c
similarity index 100%
rename from target/arm/vec_helper.c
rename to target/arm/tcg/vec_helper.c
diff --git a/target/arm/vfp_helper.c b/target/arm/tcg/vfp_helper.c
similarity index 100%
rename from target/arm/vfp_helper.c
rename to target/arm/tcg/vfp_helper.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 229ec7fa11..0172937b40 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,17 +1,7 @@
 arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
-  'helper.c',
-  'iwmmxt_helper.c',
-  'm_helper.c',
-  'neon_helper.c',
-  'op_helper.c',
-  'tlb_helper.c',
-  'vec_helper.c',
-  'vfp_helper.c',
   'cpu_tcg.c',
 ))
 arm_ss.add(zlib)
@@ -21,10 +11,6 @@ arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: fil
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
-  'helper-a64.c',
-  'mte_helper.c',
-  'pauth_helper.c',
-  'sve_helper.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5a7c9b95d8..0bd4e9d954 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -16,9 +16,23 @@ arm_ss.add(gen)
 
 arm_ss.add(files(
   'translate.c',
+  'helper.c',
+  'iwmmxt_helper.c',
+  'm_helper.c',
+  'neon_helper.c',
+  'op_helper.c',
+  'tlb_helper.c',
+  'vec_helper.c',
+  'vfp_helper.c',
+  'crypto_helper.c',
+  'debug_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'translate-a64.c',
   'translate-sve.c',
+  'helper-a64.c',
+  'mte_helper.c',
+  'pauth_helper.c',
+  'sve_helper.c',
 ))
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
new file mode 100644
index 0000000000..755373a5b1
--- /dev/null
+++ b/target/arm/tcg/trace-events
@@ -0,0 +1,10 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# helper.c
+arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
+arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
+arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value 0x%" PRIx64
+arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%" PRIx64
+arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
+arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
+arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 41c63d7570..b1bc061a0e 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -1,13 +1,4 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
-# helper.c
-arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
-arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
-arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value 0x%" PRIx64
-arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%" PRIx64
-arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
-arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
-arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
-
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
-- 
2.26.2


