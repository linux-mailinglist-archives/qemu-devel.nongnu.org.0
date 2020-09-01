Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83522588FD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 09:27:27 +0200 (CEST)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD0hT-0005f0-2A
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 03:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kD0dH-0005Bk-MP
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 03:23:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:50324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kD0dF-0008PW-Ea
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 03:23:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 677CEB1A8;
 Tue,  1 Sep 2020 07:22:54 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v6 13/16] hvf: remove hvf specific functions from global
 includes
Date: Tue,  1 Sep 2020 09:21:58 +0200
Message-Id: <20200901072201.7133-14-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901072201.7133-1-cfontana@suse.de>
References: <20200901072201.7133-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:13:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/stubs/hvf-stub.c     | 30 ------------------------------
 accel/stubs/meson.build    |  1 -
 include/sysemu/hvf.h       |  8 --------
 target/i386/hvf/hvf-cpus.h |  8 ++++++++
 target/i386/hvf/x86hvf.c   |  2 ++
 target/i386/hvf/x86hvf.h   |  1 -
 6 files changed, 10 insertions(+), 40 deletions(-)
 delete mode 100644 accel/stubs/hvf-stub.c

diff --git a/accel/stubs/hvf-stub.c b/accel/stubs/hvf-stub.c
deleted file mode 100644
index e81dfe888c..0000000000
--- a/accel/stubs/hvf-stub.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * QEMU HVF support
- *
- * Copyright 2017 Red Hat, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2 or later, as published by the Free Software Foundation,
- * and may be copied, distributed, and modified under those terms.
- *
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "sysemu/hvf.h"
-
-int hvf_init_vcpu(CPUState *cpu)
-{
-    return -ENOSYS;
-}
-
-int hvf_vcpu_exec(CPUState *cpu)
-{
-    return -ENOSYS;
-}
-
-void hvf_vcpu_destroy(CPUState *cpu)
-{
-}
diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 314e3cfff4..3fbe34e5bb 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
 specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
-specific_ss.add(when: 'CONFIG_HVF', if_false: files('hvf-stub.c'))
 specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
 specific_ss.add(when: 'CONFIG_WHPX', if_false: files('whpx-stub.c'))
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index 760d6c79a2..7324e59db6 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -25,14 +25,6 @@ extern bool hvf_allowed;
 #define hvf_get_supported_cpuid(func, idx, reg) 0
 #endif /* !CONFIG_HVF */
 
-int hvf_init_vcpu(CPUState *);
-int hvf_vcpu_exec(CPUState *);
-void hvf_cpu_synchronize_state(CPUState *);
-void hvf_cpu_synchronize_post_reset(CPUState *);
-void hvf_cpu_synchronize_post_init(CPUState *);
-void hvf_cpu_synchronize_pre_loadvm(CPUState *);
-void hvf_vcpu_destroy(CPUState *);
-
 #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
 
 typedef struct HVFState HVFState;
diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-cpus.h
index 262e449fd6..ced31b82c0 100644
--- a/target/i386/hvf/hvf-cpus.h
+++ b/target/i386/hvf/hvf-cpus.h
@@ -14,4 +14,12 @@
 
 extern const CpusAccel hvf_cpus;
 
+int hvf_init_vcpu(CPUState *);
+int hvf_vcpu_exec(CPUState *);
+void hvf_cpu_synchronize_state(CPUState *);
+void hvf_cpu_synchronize_post_reset(CPUState *);
+void hvf_cpu_synchronize_post_init(CPUState *);
+void hvf_cpu_synchronize_pre_loadvm(CPUState *);
+void hvf_vcpu_destroy(CPUState *);
+
 #endif /* HVF_CPUS_H */
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 5cbcb32ab6..b986213c0f 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -32,6 +32,8 @@
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
+#include "hvf-cpus.h"
+
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr)
 {
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index 79539f7282..4fabc6d582 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -35,5 +35,4 @@ void hvf_get_msrs(CPUState *cpu_state);
 void vmx_clear_int_window_exiting(CPUState *cpu);
 void hvf_get_segments(CPUState *cpu_state);
 void vmx_update_tpr(CPUState *cpu);
-void hvf_cpu_synchronize_state(CPUState *cpu_state);
 #endif
-- 
2.26.2


