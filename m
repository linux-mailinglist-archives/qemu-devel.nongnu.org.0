Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298942ED8D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:26:06 +0200 (CEST)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJTZ-0002kT-3w
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJ4h-0003S5-Dh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJ4d-0001ct-TQ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634288418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2vbHT3rfO+uPbdTRjoN0DF8WcFCd8pUEBdeFT+mfJs4=;
 b=LrwmQZBkmf7SV/WfpkBS/0NTfyyV0HOYbIVz/WT1ZP3hgCq6BgT1aPfhnUpPHsN+UXLuTJ
 uyZd/77Mddca6BM9DlwXjqRAAVwpRVaG6e+CV6CcWpQaSkBbDJDb7yjIeSUPe/z0fKBejy
 DINRQcJP6gQ14glT1gcWwTJnHwz9YnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-f5ZcDDVHOEOIvphy6X24Tg-1; Fri, 15 Oct 2021 05:00:14 -0400
X-MC-Unique: f5ZcDDVHOEOIvphy6X24Tg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93D0910B3942;
 Fri, 15 Oct 2021 09:00:13 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B2E85BAFB;
 Fri, 15 Oct 2021 09:00:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Add a test for the bamboo ppc board
Date: Fri, 15 Oct 2021 11:00:08 +0200
Message-Id: <20211015090008.1299609-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-ppc@nongnu.org, clg@kaod.org,
 Cleber Rosa <crosa@redhat.com>, edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel and initrd from the "Aboriginal Linux" project can be
used to run some tests on the bamboo ppc machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                    |  1 +
 tests/acceptance/ppc_bamboo.py | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 tests/acceptance/ppc_bamboo.py

diff --git a/MAINTAINERS b/MAINTAINERS
index cfefe386ea..730867f129 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1247,6 +1247,7 @@ Bamboo
 L: qemu-ppc@nongnu.org
 S: Orphan
 F: hw/ppc/ppc440_bamboo.c
+F: tests/acceptance/ppc_bamboo.py
 
 e500
 L: qemu-ppc@nongnu.org
diff --git a/tests/acceptance/ppc_bamboo.py b/tests/acceptance/ppc_bamboo.py
new file mode 100644
index 0000000000..dd33bf66f3
--- /dev/null
+++ b/tests/acceptance/ppc_bamboo.py
@@ -0,0 +1,39 @@
+# Test that Linux kernel boots on the ppc bamboo board and check the console
+#
+# Copyright (c) 2021 Red Hat
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class BambooMachine(Test):
+
+    timeout = 90
+
+    def test_ppc_bamboo(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:bamboo
+        :avocado: tags=cpu:440epb
+        :avocado: tags=device:rtl8139
+        """
+        tar_url = ('http://landley.net/aboriginal/downloads/binaries/'
+                   'system-image-powerpc-440fp.tar.gz')
+        tar_hash = '53e5f16414b195b82d2c70272f81c2eedb39bad9'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir +
+                                   '/system-image-powerpc-440fp/linux',
+                         '-initrd', self.workdir +
+                                   '/system-image-powerpc-440fp/rootfs.cpio.gz',
+                         '-nic', 'user,model=rtl8139,restrict=on')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Type exit when done')
+        exec_command_and_wait_for_pattern(self, 'ping 10.0.2.2',
+                                          '10.0.2.2 is alive!')
+        exec_command_and_wait_for_pattern(self, 'halt', 'System Halted')
-- 
2.27.0


