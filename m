Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B8449985
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:23:21 +0100 (CET)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7QX-0000Rl-3D
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Lg-0001uo-3j
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Le-0000rG-1x
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kig7GyB9MliSxk4dpCwMT9fFAcU2KC7uvJYsdHZHBGs=;
 b=HhKUpBcdcZ+DC8CYG5asQECizjef5UOG1V++eW8ehsAEfxGZZeAvWp0ypIcooDeU47xx/I
 v5iiivO7HMma6BMYcHkou9iyWRX7EUKyt894mbLHics73rv98GLNd2HvUfFTSxs1DLaL+r
 ZEbWXOw8lSOSnYmR8qI53+jf0YaVJTw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-I8NFYKfdOD-FpxkWn2--JA-1; Mon, 08 Nov 2021 11:18:15 -0500
X-MC-Unique: I8NFYKfdOD-FpxkWn2--JA-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso10322505wme.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kig7GyB9MliSxk4dpCwMT9fFAcU2KC7uvJYsdHZHBGs=;
 b=J2PT+Ves4OxJguTNCg1r6Hik8yOXUvQarPwK3MNJNDkYifsjSiJducYJG3abdnPIhm
 Sum8B24YYXUaq8jY7WeYWtEMFwzozhDXT3Dm+E0qW/QSGJQZijbCpCDf5KazF2rK4czW
 VD+pgl0he99FWxdajDmLz/JUdom/l+5fmHmDacq9Buf96RKka0FEulrJJQYNqoUaSM/m
 odXSKENar9f1XPwj5HXW0g1hizi4tgiwg6m5IlUFme80iq0+cw34Cge3Eq3lUDdrplcr
 NYIXvhiUVjl8ksKRUUAa2wsKwt7awtv3ULvDOIkoYNkKHRpLk5sYa+JDby0SDGdufaoX
 pBSg==
X-Gm-Message-State: AOAM530e0rHd1ihN1TeAP6VYATkN1DCchf3ymJsfhe+snJd4jZ1XOPlq
 6XRAXCxTMAb3e2YYPpTT5aY+IBqHSchY3tWwQhzXBxeCM+1fgxLCfJOf3lu6SyQdar7WT1v/UjG
 LCXjVKuSMeWCKhmOa1VO234V4m7TGolSdmE3i0iAMjfpctWTcDHCPC/yZaV2IuFhd
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr341710wrd.323.1636388294337; 
 Mon, 08 Nov 2021 08:18:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynbI3mbrMXZduZeg+EvCyMLLcq2njFLlgNhupiViSOWgSOf+YYtWqM9GWEwVlmYDsU9ZTvNg==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr341660wrd.323.1636388294060; 
 Mon, 08 Nov 2021 08:18:14 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id o9sm17308511wrs.4.2021.11.08.08.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:18:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] tests/avocado: Share useful helpers from
 virtiofs_submounts test
Date: Mon,  8 Nov 2021 17:17:36 +0100
Message-Id: <20211108161739.1371503-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108161739.1371503-1-philmd@redhat.com>
References: <20211108161739.1371503-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Move the useful has_cmd()/has_cmds() helpers from the virtiofs
test to the avocado_qemu public class.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211105143416.148332-5-f4bug@amsat.org>
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


