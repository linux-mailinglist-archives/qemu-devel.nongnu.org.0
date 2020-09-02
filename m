Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A625ABD7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:13:05 +0200 (CEST)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSZU-0006zx-K1
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMW-0006F5-DC
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMT-00079N-8B
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599051576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnhNI53pp0I160tRA3kVNiu0HLRb2ej6NXMxcodi4J4=;
 b=c1WAq9gS69lh8JRmE60FHf8hkKZDGBZ4KcpdnWMMWkPcna9OCE/pzM7Frs6Cy6R8eKp9u7
 X4XxAc5lCD45hR32OBCMwsfylxnqarCf67ujg1h67RNhJo19LpPEbExuCJRSIsv2FHy3k4
 RUVaefrpBWcfj/hBIqFEC2JlRuUqWUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-0rE1HoluPYy_z2gOAYiQOw-1; Wed, 02 Sep 2020 08:59:25 -0400
X-MC-Unique: 0rE1HoluPYy_z2gOAYiQOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 485CC80046A
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ABE65D9CC
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/39] mtest2make: hide output of successful tests
Date: Wed,  2 Sep 2020 08:58:42 -0400
Message-Id: <20200902125917.26021-5-pbonzini@redhat.com>
In-Reply-To: <20200902125917.26021-1-pbonzini@redhat.com>
References: <20200902125917.26021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 01:13:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The softfloat tests are quite noisy; before the Meson conversion
they buffered the output in a file and emitted the output only
if the test failed.  Tweak mtest2make.py so that the courtesy
is extended to all non-TAP tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/mtest2make.py  |  2 +-
 scripts/test-driver.py | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 scripts/test-driver.py

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index c709b37f28..27425080cf 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -21,7 +21,7 @@ SPEED = quick
 
 # $1 = environment, $2 = test command, $3 = test name, $4 = dir
 .test-human-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only)
-.test-human-exitcode = $1 $(if $4,(cd $4 && $2),$2) < /dev/null
+.test-human-exitcode = $1 $(PYTHON) scripts/test-driver.py $(if $4,-C$4) $(if $(V),--verbose) -- $2 < /dev/null
 .test-tap-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | sed "s/^[a-z][a-z]* [0-9]*/& $3/" || true
 .test-tap-exitcode = printf "%s\\n" 1..1 "`$1 $(if $4,(cd $4 && $2),$2) < /dev/null > /dev/null || echo "not "`ok 1 $3"
 .test.print = echo $(if $(V),'$1 $2','Running test $3') >&3
diff --git a/scripts/test-driver.py b/scripts/test-driver.py
new file mode 100644
index 0000000000..eef74b29a8
--- /dev/null
+++ b/scripts/test-driver.py
@@ -0,0 +1,35 @@
+#! /usr/bin/env python3
+
+# Wrapper for tests that hides the output if they succeed.
+# Used by "make check"
+#
+# Copyright (C) 2020 Red Hat, Inc.
+#
+# Author: Paolo Bonzini <pbonzini@redhat.com>
+
+import subprocess
+import sys
+import os
+import argparse
+
+parser = argparse.ArgumentParser(description='Test driver for QEMU')
+parser.add_argument('-C', metavar='DIR', dest='dir', default='.',
+                    help='change to DIR before doing anything else')
+parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
+                    help='be more verbose')
+parser.add_argument('test_args', nargs=argparse.REMAINDER)
+
+args = parser.parse_args()
+os.chdir(args.dir)
+
+test_args = args.test_args
+if test_args[0] == '--':
+    test_args = test_args[1:]
+
+if args.verbose:
+    result = subprocess.run(test_args, stdout=None, stderr=None)
+else:
+    result = subprocess.run(test_args, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+    if result.returncode:
+        sys.stdout.buffer.write(result.stdout)
+sys.exit(result.returncode)
-- 
2.26.2



