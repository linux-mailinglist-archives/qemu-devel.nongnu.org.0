Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C982331EFFF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:39:49 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCp9Q-000462-II
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoxu-0002RI-SL
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoxs-0003RE-Pd
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCktBe60QT28m3wZtekksBElR167ZW94IifUBB8Ps04=;
 b=g4WcBhc6p074s54O+2svcYOzg6NUp9Z4vtRUC6ljsIFzqY3IVBFRtuvY8TGORfG28UTN1W
 6H98PWRQe0Juutnb2/y+eU2qqetgG+egcyt0088v5oRdkNgQMFCT0r35+hHeS7SGsZAezM
 86OOAVWumrF21HphAZS+v9o/B95E3aU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-mR-RpdAnObueMoOIHEXWqg-1; Thu, 18 Feb 2021 14:27:48 -0500
X-MC-Unique: mR-RpdAnObueMoOIHEXWqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10B1E80196C;
 Thu, 18 Feb 2021 19:27:47 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C202560BE5;
 Thu, 18 Feb 2021 19:27:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/25] python: create utils sub-package
Date: Thu, 18 Feb 2021 14:27:12 -0500
Message-Id: <20210218192733.370968-5-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a space for miscellaneous things that don't belong strictly in
"qemu.machine" nor "qemu.qmp" packages.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/__init__.py           |  8 --------
 python/qemu/utils/__init__.py             | 23 +++++++++++++++++++++++
 python/qemu/{machine => utils}/accel.py   |  0
 tests/acceptance/avocado_qemu/__init__.py |  4 ++--
 tests/acceptance/virtio-gpu.py            |  2 +-
 tests/vm/aarch64vm.py                     |  2 +-
 tests/vm/basevm.py                        |  3 ++-
 7 files changed, 29 insertions(+), 13 deletions(-)
 create mode 100644 python/qemu/utils/__init__.py
 rename python/qemu/{machine => utils}/accel.py (100%)

diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init__.py
index 0ac6c1e36e3..98302ea31e7 100644
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
 
 # Copyright (C) 2020-2021 John Snow for Red Hat Inc.
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
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index cdd597ae0c4..5e072e738cf 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -41,8 +41,8 @@
 sys.path.append(os.path.join(SOURCE_DIR, 'python'))
 
 from qemu.machine import QEMUMachine
-from qemu.machine import kvm_available
-from qemu.machine import tcg_available
+from qemu.utils import kvm_available
+from qemu.utils import tcg_available
 
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index a2f044d3f00..7023c0953db 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -10,7 +10,7 @@
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import is_readable_executable_file
 
-from qemu.machine import kvm_available
+from qemu.utils import kvm_available
 
 import os
 import socket
diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
index 39ff99b0859..b00cce07eb8 100644
--- a/tests/vm/aarch64vm.py
+++ b/tests/vm/aarch64vm.py
@@ -14,7 +14,7 @@
 import sys
 import subprocess
 import basevm
-from qemu.machine import kvm_available
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


