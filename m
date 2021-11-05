Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269E544651C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:37:09 +0100 (CET)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0L5-0005yO-WE
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0In-000325-9R
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0Ih-00075N-Qw
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:43 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i5so14098436wrb.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lc2f1q4l/nL1bJkK+RlDBtmqxziFnRAo/1XneAHzrMw=;
 b=fe9+h2vjuCBdfw5II2Co1byAUwOAyZPXhihwbfPoHJxy5HcH7+Ajo0UMkh/ZjuIWhA
 r4tfiI4yRbdzUpvVJ2KSx8gyXLFbqF6cU5zCiv33Lp5SprJa6yZfISR6kMndyy2h58nc
 ICx2/tl8qZLAKdbsKyxbqcj2UWBaQCxV6rdI4nixRXXb9BhH3Pz9rBY16Cnz+QVVTXdU
 s9+owyf4bhu8550eEjwcam7pbY5mYBtwZj4ADWGkkkw2abRKL+lVdQ+H/ByT5L8o4i4+
 54HO9qYhse2aTW5PUKIkFSRvJ/7La+JUAp8C+6+4HCckzlFsUHbIEFXxAGEVc8DiSwes
 Qbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lc2f1q4l/nL1bJkK+RlDBtmqxziFnRAo/1XneAHzrMw=;
 b=G2NqfATUCaZFdUF7XM99LCyPk2i4REwsKGbbfCX5SlvAvTmYOfbaUt02a7iJT2yHhK
 Vbntcc9PNJE/YDrAevKqsyia1NmnGV6opT/NgMVKrehmKH6iP7GPjpKigZMm28KnEkzm
 FQ7DMHiNia+t80pmJspE88y82yF1JGTz6uUYU/vbiIVHkvQy+4JrCaPGeCsaUmhZa6eZ
 rPzpyuRcoWcgHGzIPPOW96zWVr5A5Mz72Ve9lVHPiZ6pnMHKWVbggvde7M6Xwys7cPJE
 PMy3DiBxATPS3Po0a8bCiV/+8fqaizJWNDMPsKnvuKfLt8qwQ46OVq3ilPNqhxcvLeZ7
 HBhw==
X-Gm-Message-State: AOAM530/bXpJBM2zFRZRT9QqOnFJBP0FdshNXJXDFgr2R4vrf1RyC1r0
 I7LYChn1S8E6YOeUVZojEcVnhfmLrrk=
X-Google-Smtp-Source: ABdhPJyiyIgxOt7SCBY4Xj8FvSdFeIe+ptpD6jbsZ/7xFkwif5Oe6lTKOvD+X6y6XK/eghOXp+0v3Q==
X-Received: by 2002:a5d:6501:: with SMTP id x1mr46076836wru.390.1636122878204; 
 Fri, 05 Nov 2021 07:34:38 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r15sm8468177wru.9.2021.11.05.07.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:34:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/6] tests/acceptance: Share useful helpers from
 virtiofs_submounts test
Date: Fri,  5 Nov 2021 15:34:14 +0100
Message-Id: <20211105143416.148332-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105143416.148332-1-f4bug@amsat.org>
References: <20211105143416.148332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the useful has_cmd()/has_cmds() helpers from the virtiofs
test to the avocado_qemu public class.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211102084232.2965062-5-f4bug@amsat.org>
---
 tests/avocado/avocado_qemu/__init__.py | 57 +++++++++++++++++++++++++
 tests/avocado/virtiofs_submounts.py    | 59 +-------------------------
 2 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index e46b3ecb89e..1efc22dabfa 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -11,6 +11,7 @@
 import logging
 import os
 import shutil
+import subprocess
 import sys
 import tempfile
 import time
@@ -41,6 +42,62 @@
                         tcg_available)
 
 
+def has_cmd(name, args=None):
+    """
+    This function is for use in a @avocado.skipUnless decorator, e.g.:
+
+        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
+        def test_something_that_needs_sudo(self):
+            ...
+    """
+
+    if args is None:
+        args = ('which', name)
+
+    try:
+        _, stderr, exitcode = run_cmd(args)
+    except Exception as e:
+        exitcode = -1
+        stderr = str(e)
+
+    if exitcode != 0:
+        cmd_line = ' '.join(args)
+        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
+        return (False, err)
+    else:
+        return (True, '')
+
+def has_cmds(*cmds):
+    """
+    This function is for use in a @avocado.skipUnless decorator and
+    allows checking for the availability of multiple commands, e.g.:
+
+        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
+                              'cmd2', 'cmd3'))
+        def test_something_that_needs_cmd1_and_cmd2(self):
+            ...
+    """
+
+    for cmd in cmds:
+        if isinstance(cmd, str):
+            cmd = (cmd,)
+
+        ok, errstr = has_cmd(*cmd)
+        if not ok:
+            return (False, errstr)
+
+    return (True, '')
+
+def run_cmd(args):
+    subp = subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=subprocess.PIPE,
+                            universal_newlines=True)
+    stdout, stderr = subp.communicate()
+    ret = subp.returncode
+
+    return (stdout, stderr, ret)
+
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
diff --git a/tests/avocado/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
index 21ad7d792e7..e6dc32ffd4e 100644
--- a/tests/avocado/virtiofs_submounts.py
+++ b/tests/avocado/virtiofs_submounts.py
@@ -6,67 +6,12 @@
 
 from avocado import skipUnless
 from avocado_qemu import LinuxTest, BUILD_DIR
+from avocado_qemu import has_cmds
+from avocado_qemu import run_cmd
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
 
-def run_cmd(args):
-    subp = subprocess.Popen(args,
-                            stdout=subprocess.PIPE,
-                            stderr=subprocess.PIPE,
-                            universal_newlines=True)
-    stdout, stderr = subp.communicate()
-    ret = subp.returncode
-
-    return (stdout, stderr, ret)
-
-def has_cmd(name, args=None):
-    """
-    This function is for use in a @avocado.skipUnless decorator, e.g.:
-
-        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
-        def test_something_that_needs_sudo(self):
-            ...
-    """
-
-    if args is None:
-        args = ('which', name)
-
-    try:
-        _, stderr, exitcode = run_cmd(args)
-    except Exception as e:
-        exitcode = -1
-        stderr = str(e)
-
-    if exitcode != 0:
-        cmd_line = ' '.join(args)
-        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
-        return (False, err)
-    else:
-        return (True, '')
-
-def has_cmds(*cmds):
-    """
-    This function is for use in a @avocado.skipUnless decorator and
-    allows checking for the availability of multiple commands, e.g.:
-
-        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
-                              'cmd2', 'cmd3'))
-        def test_something_that_needs_cmd1_and_cmd2(self):
-            ...
-    """
-
-    for cmd in cmds:
-        if isinstance(cmd, str):
-            cmd = (cmd,)
-
-        ok, errstr = has_cmd(*cmd)
-        if not ok:
-            return (False, errstr)
-
-    return (True, '')
-
-
 class VirtiofsSubmountsTest(LinuxTest):
     """
     :avocado: tags=arch:x86_64
-- 
2.31.1


