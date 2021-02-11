Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034473192BA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:04:05 +0100 (CET)
Received: from localhost ([::1]:53806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHG0-0006y2-0c
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBn-0003m6-OB
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBk-0005OR-4u
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613069978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+1NQcILoM2YsVAepMGba1zUmQBAKCcKjoKeauMSJRY=;
 b=G/NTb0eLQpOt337itk04rdVdvU+NtnSVr+n1WS1W3Z+gE/HIBUqVLgG7iiqtxoBaGTp6Zx
 gW/b897tpoTA9zRby4Cuu8nagfBj0GtKFd9hLRIN1d7qgqlaXjatfcYcEYQTc+FlQn2vr3
 L97ZKIzNeMKV8WSyR9Ne/2sZH9XUw5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-2QAa84MhMzimVZe2-cwcvA-1; Thu, 11 Feb 2021 13:59:34 -0500
X-MC-Unique: 2QAa84MhMzimVZe2-cwcvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C8DCC623;
 Thu, 11 Feb 2021 18:59:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808887092D;
 Thu, 11 Feb 2021 18:59:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/24] python: create utils sub-package
Date: Thu, 11 Feb 2021 13:58:36 -0500
Message-Id: <20210211185856.3975616-5-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a space for miscellaneous things that don't belong strictly in
"qemu.machine" nor "qemu.qmp" packages.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/__init__.py         |  8 --------
 python/qemu/utils/__init__.py           | 23 +++++++++++++++++++++++
 python/qemu/{machine => utils}/accel.py |  0
 tests/acceptance/boot_linux.py          |  2 +-
 tests/acceptance/virtio-gpu.py          |  2 +-
 tests/acceptance/virtiofs_submounts.py  |  2 +-
 tests/vm/aarch64vm.py                   |  2 +-
 tests/vm/basevm.py                      |  3 ++-
 8 files changed, 29 insertions(+), 13 deletions(-)
 create mode 100644 python/qemu/utils/__init__.py
 rename python/qemu/{machine => utils}/accel.py (100%)

diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init__.py
index 27b0b19abd3..891a8f784b5 100644
--- a/python/qemu/machine/__init__.py
+++ b/python/qemu/machine/__init__.py
@@ -8,10 +8,6 @@
  - QEMUQtestMachine: VM class, with a qtest socket.
 
 - QEMUQtestProtocol: Connect to, send/receive qtest messages.
-
-- list_accel: List available accelerators
-- kvm_available: Probe for KVM support
-- tcg_available: Probe for TCG support
 """
 
 # Copyright (C) 2020 John Snow for Red Hat Inc.
@@ -26,15 +22,11 @@
 # the COPYING file in the top-level directory.
 #
 
-from .accel import kvm_available, list_accel, tcg_available
 from .machine import QEMUMachine
 from .qtest import QEMUQtestMachine, QEMUQtestProtocol
 
 
 __all__ = (
-    'list_accel',
-    'kvm_available',
-    'tcg_available',
     'QEMUMachine',
     'QEMUQtestProtocol',
     'QEMUQtestMachine',
diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
new file mode 100644
index 00000000000..edf807a93e5
--- /dev/null
+++ b/python/qemu/utils/__init__.py
@@ -0,0 +1,23 @@
+"""
+QEMU development and testing utilities
+
+This library provides a small handful of utilities for performing various tasks
+not directly related to the launching of a VM.
+
+The only module included at present is accel; its public functions are
+repeated here for your convenience:
+
+- list_accel: List available accelerators
+- kvm_available: Probe for KVM support
+- tcg_available: Prove for TCG support
+"""
+
+# pylint: disable=import-error
+from .accel import kvm_available, list_accel, tcg_available
+
+
+__all__ = (
+    'list_accel',
+    'kvm_available',
+    'tcg_available',
+)
diff --git a/python/qemu/machine/accel.py b/python/qemu/utils/accel.py
similarity index 100%
rename from python/qemu/machine/accel.py
rename to python/qemu/utils/accel.py
diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 212365fd185..824cf03d5f4 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -12,7 +12,7 @@
 
 from avocado_qemu import Test, BUILD_DIR
 
-from qemu.machine import kvm_available, tcg_available
+from qemu.utils import kvm_available, tcg_available
 
 from avocado.utils import cloudinit
 from avocado.utils import network
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 211f02932f2..73671476aa0 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -10,7 +10,7 @@
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import is_readable_executable_file
 
-from qemu.accel import kvm_available
+from qemu.utils import kvm_available
 
 import os
 import socket
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 949ca87a837..6b684253a60 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -9,7 +9,7 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
-from qemu.accel import kvm_available
+from qemu.utils import kvm_available
 
 from boot_linux import BootLinux
 
diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
index d70ab843b6b..b00cce07eb8 100644
--- a/tests/vm/aarch64vm.py
+++ b/tests/vm/aarch64vm.py
@@ -14,7 +14,7 @@
 import sys
 import subprocess
 import basevm
-from qemu.accel import kvm_available
+from qemu.utils import kvm_available
 
 # This is the config needed for current version of QEMU.
 # This works for both kvm and tcg.
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 12d08cf2b1b..a3867fdf88e 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -19,7 +19,8 @@
 import time
 import datetime
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.machine import kvm_available, QEMUMachine
+from qemu.machine import QEMUMachine
+from qemu.utils import kvm_available
 import subprocess
 import hashlib
 import argparse
-- 
2.29.2


