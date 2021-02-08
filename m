Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19510313F06
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:32:49 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CHA-0001hq-0m
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jr-00035g-W5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jc-000522-7v
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66bSMIFkIkZmQrm1Ry+JjRCtbU2MWpZ0aOcsnJln2cc=;
 b=isYX7/XHycy4Yr74RYPcYd2Zxi01sj7ccbLOKITtHM6NpavvPeDeBFQ4bdi1u//N2rHK4f
 3RjW0E00YWOe/uAiKbnanVwNm7WoEyaqRPDy84gBaT8PiHB7h4OMqZfX4FUABs5X7UKi5b
 A+wjyM6a68XBYBtyGGhYLY2ahcyhdz4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-nb9ElE5nM-GKEkj61RS3Sw-1; Mon, 08 Feb 2021 08:37:41 -0500
X-MC-Unique: nb9ElE5nM-GKEkj61RS3Sw-1
Received: by mail-wm1-f70.google.com with SMTP id x20so8772846wmc.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=66bSMIFkIkZmQrm1Ry+JjRCtbU2MWpZ0aOcsnJln2cc=;
 b=bQR+jntpSUU0iawTVoLu9YyZnwCaXkFvz9OCxRt45Z6y1iV8bey+YeeuGE0+BEiLIf
 jqMSyXUybVNw6qTkiTqB2ScgUpjqwlmpi0DZ74hbVtA/9/lnFAuTt/CC797wJjETDl/w
 lEgOD7Lze3vfJuteEjMSPO+bUmV9DBWE2R4SRfwSjROm/ib13OdJZcFXh5bDxbd7vMMC
 eUU/2vu+YNyxQUcnipOU+DeWxf+zVw1mFHbG5XiWi46lkL35TDt74Bu4Iyp1lm4sqnXp
 ze7Kj0E1PQG5QNBrBhrvyVpdEgLycA2YIU6adie4crrb2aUCnZRyiyvFhTLZmWk/k1Lr
 uKkg==
X-Gm-Message-State: AOAM5336ND53G0RJpJpWnT/afWywVUD7os2pfrm5v8pMYm4VIffk+c+z
 0AIRIcfkQYoqopFDb4BaV43OH2wrOUaKdt74dnXa2vie1ULJpM3lbCbkDNCk6giya2IvzAL12KK
 BL+7OE1Jvxie3zLpC/a40LxZmJdBuc74Ny5w7dd1IbfmRMwNnf20BcoWEt/9V3MSO
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr14479020wmq.156.1612791460227; 
 Mon, 08 Feb 2021 05:37:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsBq+lcYGmTUQVztfszMvYcCDvOfBb6kqcOWcCB4n54EZU/Wtcl3iuQbEDOEW1OYEea/gv1w==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr14478997wmq.156.1612791459918; 
 Mon, 08 Feb 2021 05:37:39 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d5sm9034515wrb.14.2021.02.08.05.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] tests/acceptance: Move the pseries test to a separate
 file
Date: Mon,  8 Feb 2021 14:36:58 +0100
Message-Id: <20210208133711.2596075-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Let's gather the POWER-related tests in a separate file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210112164045.98565-2-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS                            |  1 +
 tests/acceptance/boot_linux_console.py | 19 --------------
 tests/acceptance/machine_ppc.py        | 34 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 19 deletions(-)
 create mode 100644 tests/acceptance/machine_ppc.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d8b0bf966d..9543d7c44a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -281,6 +281,7 @@ F: target/ppc/
 F: hw/ppc/
 F: include/hw/ppc/
 F: disas/ppc.c
+F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 128ed5500fa..c34075d5378 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1004,25 +1004,6 @@ def test_alpha_clipper(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    def test_ppc64_pseries(self):
-        """
-        :avocado: tags=arch:ppc64
-        :avocado: tags=machine:pseries
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
-                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
-                      '/ppc/ppc64/vmlinuz')
-        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
-        self.vm.add_args('-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-
     def test_m68k_q800(self):
         """
         :avocado: tags=arch:m68k
diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
new file mode 100644
index 00000000000..51bbfd411ca
--- /dev/null
+++ b/tests/acceptance/machine_ppc.py
@@ -0,0 +1,34 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class PpcMachine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc64_pseries(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:pseries
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
+                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
+                      '/ppc/ppc64/vmlinuz')
+        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        wait_for_console_pattern(self, console_pattern, self.panic_message)
-- 
2.26.2


