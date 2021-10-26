Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C731943AADB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 05:51:05 +0200 (CEST)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfDUO-0005wn-UG
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 23:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfDQd-0001NR-Ul
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 23:47:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfDQZ-0002K7-7z
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 23:47:11 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hdd1Z4w1KzbhMZ;
 Tue, 26 Oct 2021 11:42:26 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 11:47:03 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 11:47:02 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/2] tests/unit: Add an unit test for smp parsing
Date: Tue, 26 Oct 2021 11:46:59 +0800
Message-ID: <20211026034659.22040-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211026034659.22040-1-wangyanan55@huawei.com>
References: <20211026034659.22040-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have a generic parser smp_parse(), let's add an unit
test for the code. All possible valid/invalid SMP configurations
that the user can specify are covered.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 MAINTAINERS                 |   1 +
 tests/unit/meson.build      |   1 +
 tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
 3 files changed, 596 insertions(+)
 create mode 100644 tests/unit/test-smp-parse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 80ec27d76a..310a9512ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1633,6 +1633,7 @@ F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
 F: include/sysemu/numa.h
+F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Xtensa Machines
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 7c297d7e5c..5e81525bef 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -45,6 +45,7 @@ tests = {
   'test-uuid': [],
   'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
+  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
 }
 
 if have_system or have_tools
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
new file mode 100644
index 0000000000..e96abe9ba4
--- /dev/null
+++ b/tests/unit/test-smp-parse.c
@@ -0,0 +1,594 @@
+/*
+ * SMP parsing unit-tests
+ *
+ * Copyright (c) 2021 Huawei Technologies Co., Ltd
+ *
+ * Authors:
+ *  Yanan Wang <wangyanan55@huawei.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+
+#include "hw/boards.h"
+
+#define T true
+#define F false
+
+#define MIN_CPUS 1   /* set the min CPUs supported by the machine as 1 */
+#define MAX_CPUS 512 /* set the max CPUs supported by the machine as 512 */
+
+/*
+ * Used to define the generic 3-level CPU topology hierarchy
+ *  -sockets/cores/threads
+ */
+#define SMP_CONFIG_GENERIC(ha, a, hb, b, hc, c, hd, d, he, e) \
+        {                                                     \
+            .has_cpus    = ha, .cpus    = a,                  \
+            .has_sockets = hb, .sockets = b,                  \
+            .has_cores   = hc, .cores   = c,                  \
+            .has_threads = hd, .threads = d,                  \
+            .has_maxcpus = he, .maxcpus = e,                  \
+        }
+
+#define CPU_TOPOLOGY_GENERIC(a, b, c, d, e)                   \
+        {                                                     \
+            .cpus     = a,                                    \
+            .sockets  = b,                                    \
+            .cores    = c,                                    \
+            .threads  = d,                                    \
+            .max_cpus = e,                                    \
+        }
+
+/*
+ * Currently a 4-level topology hierarchy is supported on PC machines
+ *  -sockets/dies/cores/threads
+ */
+#define SMP_CONFIG_WITH_DIES(ha, a, hb, b, hc, c, hd, d, he, e, hf, f) \
+        {                                                     \
+            .has_cpus    = ha, .cpus    = a,                  \
+            .has_sockets = hb, .sockets = b,                  \
+            .has_dies    = hc, .dies    = c,                  \
+            .has_cores   = hd, .cores   = d,                  \
+            .has_threads = he, .threads = e,                  \
+            .has_maxcpus = hf, .maxcpus = f,                  \
+        }
+
+/**
+ * @config - the given SMP configuration
+ * @expect_prefer_sockets - the expected parsing result for the
+ * valid configuration, when sockets are preferred over cores
+ * @expect_prefer_cores - the expected parsing result for the
+ * valid configuration, when cores are preferred over sockets
+ * @expect_error - the expected error report when the given
+ * configuration is invalid
+ */
+typedef struct SMPTestData {
+    SMPConfiguration config;
+    CpuTopology expect_prefer_sockets;
+    CpuTopology expect_prefer_cores;
+    const char *expect_error;
+} SMPTestData;
+
+/* Type info of the tested machine */
+static const TypeInfo smp_machine_info = {
+    .name = TYPE_MACHINE,
+    .parent = TYPE_OBJECT,
+    .class_size = sizeof(MachineClass),
+    .instance_size = sizeof(MachineState),
+};
+
+/*
+ * List all the possible valid sub-collections of the generic 5
+ * topology parameters (i.e. cpus/maxcpus/sockets/cores/threads),
+ * then test the automatic calculation algorithm of the missing
+ * values in the parser.
+ */
+static struct SMPTestData data_generic_valid[] = {
+    {
+        /* config: no configuration provided
+         * expect: cpus=1,sockets=1,cores=1,threads=1,maxcpus=1 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
+    }, {
+        /* config: -smp 8
+         * prefer_sockets: cpus=8,sockets=8,cores=1,threads=1,maxcpus=8
+         * prefer_cores: cpus=8,sockets=1,cores=8,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 8, 1, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 8, 1, 8),
+    }, {
+        /* config: -smp sockets=2
+         * expect: cpus=2,sockets=2,cores=1,threads=1,maxcpus=2 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(2, 2, 1, 1, 2),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(2, 2, 1, 1, 2),
+    }, {
+        /* config: -smp cores=4
+         * expect: cpus=4,sockets=1,cores=4,threads=1,maxcpus=4 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(4, 1, 4, 1, 4),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(4, 1, 4, 1, 4),
+    }, {
+        /* config: -smp threads=2
+         * expect: cpus=2,sockets=1,cores=1,threads=2,maxcpus=2 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(2, 1, 1, 2, 2),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(2, 1, 1, 2, 2),
+    }, {
+        /* config: -smp maxcpus=16
+         * prefer_sockets: cpus=16,sockets=16,cores=1,threads=1,maxcpus=16
+         * prefer_cores: cpus=16,sockets=1,cores=16,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 16, 1, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 1, 16, 1, 16),
+    }, {
+        /* config: -smp 8,sockets=2
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,cores=4
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,threads=2
+         * prefer_sockets: cpus=8,sockets=4,cores=1,threads=2,maxcpus=8
+         * prefer_cores: cpus=8,sockets=1,cores=4,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 4, 1, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+    }, {
+        /* config: -smp 8,maxcpus=16
+         * prefer_sockets: cpus=8,sockets=16,cores=1,threads=1,maxcpus=16
+         * prefer_cores: cpus=8,sockets=1,cores=16,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 16, 1, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 16, 1, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp sockets=2,threads=2
+         * expect: cpus=4,sockets=2,cores=1,threads=2,maxcpus=4 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(4, 2, 1, 2, 4),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(4, 2, 1, 2, 4),
+    }, {
+        /* config: -smp sockets=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=8,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 8, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 8, 1, 16),
+    }, {
+        /* config: -smp cores=4,threads=2
+         * expect: cpus=8,sockets=1,cores=4,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+    }, {
+        /* config: -smp cores=4,maxcpus=16
+         * expect: cpus=16,sockets=4,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 4, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 4, 4, 1, 16),
+    }, {
+        /* config: -smp threads=2,maxcpus=16
+         * prefer_sockets: cpus=16,sockets=8,cores=1,threads=2,maxcpus=16
+         * prefer_cores: cpus=16,sockets=1,cores=8,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 8, 1, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 1, 8, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,sockets=2,threads=2
+         * expect: cpus=8,sockets=2,cores=2,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 2, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 2, 2, 8),
+    }, {
+        /* config: -smp 8,sockets=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=8,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 8, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 8, 1, 16),
+    }, {
+        /* config: -smp 8,cores=4,threads=2
+         * expect: cpus=8,sockets=1,cores=4,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+    }, {
+        /* config: -smp 8,cores=4,maxcpus=16
+         * expect: cpus=8,sockets=4,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 4, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 4, 4, 1, 16),
+    }, {
+        /* config: -smp 8,threads=2,maxcpus=16
+         * prefer_sockets: cpus=8,sockets=8,cores=1,threads=2,maxcpus=16
+         * prefer_cores: cpus=8,sockets=1,cores=8,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 8, 1, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 8, 2, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4,threads=2
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp sockets=2,threads=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp cores=4,threads=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4,threads=1
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 1, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,threads=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,cores=4,threads=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4,threads=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    },
+};
+
+static struct SMPTestData data_generic_invalid[] = {
+    {
+        /* config: -smp 2,dies=2 */
+        .config = SMP_CONFIG_WITH_DIES(T, 2, F, 0, T, 2, F, 0, F, 0, F, 0),
+        .expect_error = "dies not supported by this machine's CPU topology",
+    }, {
+        /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 2, T, 8),
+        .expect_error = "Invalid CPU topology: "
+                        "product of the hierarchy must match maxcpus: "
+                        "sockets (2) * cores (4) * threads (2) "
+                        "!= maxcpus (8)",
+    }, {
+        /* config: -smp 18,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 18, T, 2, T, 4, T, 2, T, 16),
+        .expect_error = "Invalid CPU topology: "
+                        "maxcpus must be equal to or greater than smp: "
+                        "sockets (2) * cores (4) * threads (2) "
+                        "== maxcpus (16) < smp_cpus (18)",
+    }, {
+        /* config: -smp 1
+         * should tweak the supported min CPUs to 2 for testing */
+        .config = SMP_CONFIG_GENERIC(T, 1, F, 0, F, 0, F, 0, F, 0),
+        .expect_error = "Invalid SMP CPUs 1. The min CPUs supported "
+                        "by machine '(null)' is 2",
+    }, {
+        /* config: -smp 512
+         * should tweak the supported max CPUs to 511 for testing */
+        .config = SMP_CONFIG_GENERIC(T, 512, F, 0, F, 0, F, 0, F, 0),
+        .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
+                        "by machine '(null)' is 511",
+    },
+};
+
+static struct SMPTestData data_with_dies_invalid[] = {
+    {
+        /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, T, 2, T, 16),
+        .expect_error = "Invalid CPU topology: "
+                        "product of the hierarchy must match maxcpus: "
+                        "sockets (2) * dies (2) * cores (4) * threads (2) "
+                        "!= maxcpus (16)",
+    }, {
+        /* config: -smp 34,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 34, T, 2, T, 2, T, 4, T, 2, T, 32),
+        .expect_error = "Invalid CPU topology: "
+                        "maxcpus must be equal to or greater than smp: "
+                        "sockets (2) * dies (2) * cores (4) * threads (2) "
+                        "== maxcpus (32) < smp_cpus (34)",
+    },
+};
+
+static char *smp_config_to_string(SMPConfiguration *config)
+{
+    return g_strdup_printf(
+        "(SMPConfiguration) {\n"
+        "    .has_cpus    = %5s, cpus    = %ld,\n"
+        "    .has_sockets = %5s, sockets = %ld,\n"
+        "    .has_dies    = %5s, dies    = %ld,\n"
+        "    .has_cores   = %5s, cores   = %ld,\n"
+        "    .has_threads = %5s, threads = %ld,\n"
+        "    .has_maxcpus = %5s, maxcpus = %ld,\n"
+        "}",
+        config->has_cpus ? "true" : "false", config->cpus,
+        config->has_sockets ? "true" : "false", config->sockets,
+        config->has_dies ? "true" : "false", config->dies,
+        config->has_cores ? "true" : "false", config->cores,
+        config->has_threads ? "true" : "false", config->threads,
+        config->has_maxcpus ? "true" : "false", config->maxcpus);
+}
+
+static char *cpu_topology_to_string(CpuTopology *topo)
+{
+    return g_strdup_printf(
+        "(CpuTopology) {\n"
+        "    .cpus     = %u,\n"
+        "    .sockets  = %u,\n"
+        "    .dies     = %u,\n"
+        "    .cores    = %u,\n"
+        "    .threads  = %u,\n"
+        "    .max_cpus = %u,\n"
+        "}",
+        topo->cpus, topo->sockets, topo->dies,
+        topo->cores, topo->threads, topo->max_cpus);
+}
+
+static void check_parse(MachineState *ms, SMPConfiguration *config,
+                        CpuTopology *expect_topo, const char *expect_err,
+                        bool is_valid)
+{
+    g_autofree char *config_str = smp_config_to_string(config);
+    g_autofree char *expect_topo_str = cpu_topology_to_string(expect_topo);
+    g_autofree char *output_topo_str = NULL;
+    Error *err = NULL;
+
+    /* call the generic parser smp_parse() */
+    smp_parse(ms, config, &err);
+
+    output_topo_str = cpu_topology_to_string(&ms->smp);
+
+    /* when the configuration is supposed to be valid */
+    if (is_valid) {
+        if ((err == NULL) &&
+            (ms->smp.cpus == expect_topo->cpus) &&
+            (ms->smp.sockets == expect_topo->sockets) &&
+            (ms->smp.dies == expect_topo->dies) &&
+            (ms->smp.cores == expect_topo->cores) &&
+            (ms->smp.threads == expect_topo->threads) &&
+            (ms->smp.max_cpus == expect_topo->max_cpus)) {
+            return;
+        }
+
+        if (err != NULL) {
+            g_printerr("Test smp_parse failed!\n"
+                       "Input configuration: %s\n"
+                       "Should be valid: yes\n"
+                       "Expected topology: %s\n\n"
+                       "Result is valid: no\n"
+                       "Output error report: %s\n",
+                       config_str, expect_topo_str, error_get_pretty(err));
+            goto end;
+        }
+
+        g_printerr("Test smp_parse failed!\n"
+                   "Input configuration: %s\n"
+                   "Should be valid: yes\n"
+                   "Expected topology: %s\n\n"
+                   "Result is valid: yes\n"
+                   "Output topology: %s\n",
+                   config_str, expect_topo_str, output_topo_str);
+        goto end;
+    }
+
+    /* when the configuration is supposed to be invalid */
+    if (err != NULL) {
+        if (expect_err == NULL ||
+            g_str_equal(expect_err, error_get_pretty(err))) {
+            error_free(err);
+            return;
+        }
+
+        g_printerr("Test smp_parse failed!\n"
+                   "Input configuration: %s\n"
+                   "Should be valid: no\n"
+                   "Expected error report: %s\n\n"
+                   "Result is valid: no\n"
+                   "Output error report: %s\n",
+                   config_str, expect_err, error_get_pretty(err));
+        goto end;
+    }
+
+    g_printerr("Test smp_parse failed!\n"
+               "Input configuration: %s\n"
+               "Should be valid: no\n"
+               "Expected error report: %s\n\n"
+               "Result is valid: yes\n"
+               "Output topology: %s\n",
+               config_str, expect_err, output_topo_str);
+
+end:
+    if (err != NULL) {
+        error_free(err);
+    }
+
+    abort();
+}
+
+static void smp_parse_test(MachineState *ms, SMPTestData *data, bool is_valid)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    mc->smp_props.prefer_sockets = true;
+    check_parse(ms, &data->config, &data->expect_prefer_sockets,
+                data->expect_error, is_valid);
+
+    mc->smp_props.prefer_sockets = false;
+    check_parse(ms, &data->config, &data->expect_prefer_cores,
+                data->expect_error, is_valid);
+}
+
+/* The parsed results of the unsupported parameters should be 1 */
+static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
+{
+    if (!mc->smp_props.dies_supported) {
+        data->expect_prefer_sockets.dies = 1;
+        data->expect_prefer_cores.dies = 1;
+    }
+}
+
+/* Reset the related machine properties before each sub-test */
+static void smp_machine_class_init(MachineClass *mc)
+{
+    mc->min_cpus = MIN_CPUS;
+    mc->max_cpus = MAX_CPUS;
+
+    mc->smp_props.prefer_sockets = true;
+    mc->smp_props.dies_supported = false;
+}
+
+static void test_generic(void)
+{
+    Object *obj = object_new(TYPE_MACHINE);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData *data = &(SMPTestData){0};
+    int i;
+
+    smp_machine_class_init(mc);
+
+    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
+        *data = data_generic_valid[i];
+        unsupported_params_init(mc, data);
+
+        smp_parse_test(ms, data, true);
+
+        /* Unsupported parameters can be provided with their values as 1 */
+        data->config.has_dies = true;
+        data->config.dies = 1;
+        smp_parse_test(ms, data, true);
+    }
+
+    /* Reset the supported min CPUs and max CPUs */
+    mc->min_cpus = 2;
+    mc->max_cpus = 511;
+
+    for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
+        *data = data_generic_invalid[i];
+        unsupported_params_init(mc, data);
+
+        smp_parse_test(ms, data, false);
+    }
+
+    object_unref(obj);
+}
+
+static void test_with_dies(void)
+{
+    Object *obj = object_new(TYPE_MACHINE);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData *data = &(SMPTestData){0};
+    unsigned int num_dies = 2;
+    int i;
+
+    smp_machine_class_init(mc);
+    mc->smp_props.dies_supported = true;
+
+    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
+        *data = data_generic_valid[i];
+        unsupported_params_init(mc, data);
+
+        /* when dies parameter is omitted, it will be set as 1 */
+        data->expect_prefer_sockets.dies = 1;
+        data->expect_prefer_cores.dies = 1;
+
+        smp_parse_test(ms, data, true);
+
+        /* when dies parameter is specified */
+        data->config.has_dies = true;
+        data->config.dies = num_dies;
+        if (data->config.has_cpus) {
+            data->config.cpus *= num_dies;
+        }
+        if (data->config.has_maxcpus) {
+            data->config.maxcpus *= num_dies;
+        }
+
+        data->expect_prefer_sockets.dies = num_dies;
+        data->expect_prefer_sockets.cpus *= num_dies;
+        data->expect_prefer_sockets.max_cpus *= num_dies;
+        data->expect_prefer_cores.dies = num_dies;
+        data->expect_prefer_cores.cpus *= num_dies;
+        data->expect_prefer_cores.max_cpus *= num_dies;
+
+        smp_parse_test(ms, data, true);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(data_with_dies_invalid); i++) {
+        *data = data_with_dies_invalid[i];
+        unsupported_params_init(mc, data);
+
+        smp_parse_test(ms, data, false);
+    }
+
+    object_unref(obj);
+}
+
+int main(int argc, char *argv[])
+{
+    g_test_init(&argc, &argv, NULL);
+
+    module_call_init(MODULE_INIT_QOM);
+    type_register_static(&smp_machine_info);
+
+    g_test_add_func("/test-smp-parse/generic", test_generic);
+    g_test_add_func("/test-smp-parse/with_dies", test_with_dies);
+
+    g_test_run();
+
+    return 0;
+}
-- 
2.19.1


