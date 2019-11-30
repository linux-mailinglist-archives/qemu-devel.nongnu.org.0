Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C380710DD3E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 10:01:01 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iayce-0002O8-Fj
	for lists+qemu-devel@lfdr.de; Sat, 30 Nov 2019 04:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iayWn-00050T-5k
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:54:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iayWl-0006bu-Pd
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:54:57 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iayWl-0006bG-JN
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:54:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u18so16303072wmc.3
 for <qemu-devel@nongnu.org>; Sat, 30 Nov 2019 00:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fd9ZwTx/nGTAxWisTrByxsrJjTVOwFrJUX5QQ3jkZWE=;
 b=Z2rrHSvjFwfyKMqBEjkSiH+8Dt8YI/tBWGk00gp3XmfNWw9Jziu7+6OVnskpWPJWtA
 +sLGypFfsMkELOZOrhj7UBYzI20FF0STS6RoIewJAB4DN9i5x7q2zxwKy8K3npD3flVD
 KcnoDEmgc3c2slHvHEdoRjaj3OBizsrKcyTelz8GgdjcvplnGYGqvb/0CROnc3JlQm7s
 tc7HliCSYERZzH8na0zBKJoHVMjfynz9cqPJjA5lufeJhgd6yCsBH2noujw69mT7TpI7
 XQgPhmG2oz7aCece1QwtqXy8orWgpfe2C5xf8AEIVZmaxIG7t/M7e1qygFApDUob7/2/
 xq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fd9ZwTx/nGTAxWisTrByxsrJjTVOwFrJUX5QQ3jkZWE=;
 b=pXne2Rorn6TVzUoL4xaYOJF/m1qEdA5PYSvnlwp5ipmOZrd7snyj2GW1+btYyqmjCZ
 cDWKD4iTwE0GclFnYOYFL7uo5QCT5oAE46xAsjO/8vpNUNWg0yxrWNYUMyIP0VY29APw
 WnAv3UnOenxXJ0kUKZ9mOEPmF5R7g73weIlpA30iYL71/64d1rbXApRKqEzFDcsXq4EZ
 0/WY6yRoFjBCHpNm24yFx8GjV1BpYAdGhBD+uuKhB9vQtVN60PsWfTBtB/gzvRJssNF3
 yQcyfteBMfz1qEM1phZsXbc18Uk60o4evMryqNrf5uXuAtel+K4qbZp0huftFa7WnQhL
 UnNg==
X-Gm-Message-State: APjAAAWe4njMsoq4rhIUkPyQfmZ9IEmxj8CztLFS/GlFpXGuFY/aiUaY
 ZmZRwleEsHcENI7QcMrlCWhPb3AvHso=
X-Google-Smtp-Source: APXvYqy3Nm1bkH1yGVmJVGD8mNGJHPRrgmlrib+Ux9QaTnx6N+6NbgC2JRAUoV5beMudbzyRWHOSfw==
X-Received: by 2002:a05:600c:218c:: with SMTP id
 e12mr18693679wme.30.1575104093819; 
 Sat, 30 Nov 2019 00:54:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b186sm15661063wmb.21.2019.11.30.00.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 00:54:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 040ED1FF9C;
 Sat, 30 Nov 2019 08:46:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 13/14] tests/guest-debug: add a simple test runner
Date: Sat, 30 Nov 2019 08:46:01 +0000
Message-Id: <20191130084602.10818-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130084602.10818-1-alex.bennee@linaro.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
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
Cc: damien.hedde@greensocs.com, luis.machado@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test runners job is to start QEMU with guest debug enabled and
then spawn a gdb process running a test script that exercises the
functionality it wants to test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100755 tests/guest-debug/run-test.py

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
new file mode 100755
index 00000000000..8c49ee2f225
--- /dev/null
+++ b/tests/guest-debug/run-test.py
@@ -0,0 +1,57 @@
+#!/usr/bin/env python3
+#
+# Run a gdbstub test case
+#
+# Copyright (c) 2019 Linaro
+#
+# Author: Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import argparse
+import subprocess
+import shutil
+import shlex
+
+def get_args():
+    parser = argparse.ArgumentParser(description="A gdbstub test runner")
+    parser.add_argument("--qemu", help="Qemu binary for test",
+                        required=True)
+    parser.add_argument("--qargs", help="Qemu arguments for test")
+    parser.add_argument("--binary", help="Binary to debug",
+                        required=True)
+    parser.add_argument("--test", help="GDB test script",
+                        required=True)
+    parser.add_argument("--gdb", help="The gdb binary to use", default=None)
+
+    return parser.parse_args()
+
+if __name__ == '__main__':
+    args = get_args()
+
+    # Search for a gdb we can use
+    if not args.gdb:
+        args.gdb = shutil.which("gdb-multiarch")
+    if not args.gdb:
+        args.gdb = shutil.which("gdb")
+    if not args.gdb:
+        print("We need gdb to run the test")
+        exit(-1)
+
+    # Launch QEMU with binary
+    if "system" in args.qemu:
+        cmd = "%s %s %s -s -S" % (args.qemu, args.qargs, args.binary)
+    else:
+        cmd = "%s %s -g 1234 %s" % (args.qemu, args.qargs, args.binary)
+
+    inferior = subprocess.Popen(shlex.split(cmd))
+
+    # Now launch gdb with our test and collect the result
+    gdb_cmd = "%s %s -ex 'target remote localhost:1234' -x %s" % (args.gdb, args.binary, args.test)
+
+    result = subprocess.call(gdb_cmd, shell=True);
+
+    exit(result)
-- 
2.20.1


