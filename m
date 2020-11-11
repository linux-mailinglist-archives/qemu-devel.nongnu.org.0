Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A62AE897
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 07:02:32 +0100 (CET)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcjDD-0000eF-VK
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 01:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcj07-0006K0-Gt
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:59 -0500
Received: from mga14.intel.com ([192.55.52.115]:60780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcj04-0008P5-Tn
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:59 -0500
IronPort-SDR: p3k8vT6/SeblDkf2euv4eI1megcdLoy73KfcWn/r382RZKUqUwrxEFsLWdMtQIaiG4xQHFg/a0
 APjDo35wnTjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314701"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314701"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:44 -0800
IronPort-SDR: KhaP5zGEvtoXTn5bFvjVU+lRl+/JyV+lvwxxnX0UQof8s59qTQdGJRdAub7w5fpVY8rs87U4Nj
 SWrPRwLqZ4oQ==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710513"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:43 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/25] qtest/cxl: Add very basic sanity tests
Date: Tue, 10 Nov 2020 21:47:24 -0800
Message-Id: <20201111054724.794888-26-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Ben Widawsky <ben.widawsky@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 tests/qtest/cxl-test.c  | 93 +++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |  4 ++
 2 files changed, 97 insertions(+)
 create mode 100644 tests/qtest/cxl-test.c

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
new file mode 100644
index 0000000000..00eca14faa
--- /dev/null
+++ b/tests/qtest/cxl-test.c
@@ -0,0 +1,93 @@
+/*
+ * QTest testcase for CXL
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+#define QEMU_PXB_CMD "-machine q35 -object memory-backend-file,id=cxl-mem1," \
+                     "share,mem-path=%s,size=512M "                          \
+                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,"  \
+                     "len-window-base=1,window-base[0]=0x4c0000000,memdev[0]=cxl-mem1"
+#define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,addr=0.0,chassis=0,slot=0"
+
+#define QEMU_T3D "-device cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
+
+static void cxl_basic_hb(void)
+{
+    qtest_start("-machine q35,cxl");
+    qtest_end();
+}
+
+static void cxl_basic_pxb(void)
+{
+    qtest_start("-machine q35 -device pxb-cxl,bus=pcie.0,uid=0");
+    qtest_end();
+}
+
+static void cxl_pxb_with_window(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_PXB_CMD, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
+}
+
+static void cxl_root_port(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_PXB_CMD " %s", tmpfs, QEMU_RP);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
+}
+
+static void cxl_t3d(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_PXB_CMD " %s %s", tmpfs, QEMU_RP, QEMU_T3D);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
+    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
+    qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
+    qtest_add_func("/pci/cxl/root_port", cxl_root_port);
+    qtest_add_func("/pci/cxl/type3_device", cxl_t3d);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c19f1c8503..7c6439b45c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -22,6 +22,9 @@ qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
 
+qtests_cxl = \
+  (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
+
 qtests_i386 = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
@@ -47,6 +50,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   qtests_pci +                                                                              \
+  qtests_cxl +                                                                              \
   ['fdc-test',
    'ide-test',
    'hd-geo-test',
-- 
2.29.2


