Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B930442191F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:18:55 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVMM-0005sS-0i
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9c-0000Jl-Tq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9Z-0007e1-Np
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2URwBssOV4F5yamcvI+h90YNpy4zMea5kx+WDfRvN8=;
 b=PF08+lm1ldVo7xGmkeXDnjIZgbrWQ+S63XXMQ39mhLoR/RSdAyRlFV+at65jWGb/PATvbV
 Sc1MTuQyZeZGU23Kj3HS+92u2HoLGvGciGIiDk5nzm5BBaLEiEWVTEyKo6qfvLnJUc739Z
 VE8Xr0PRVjGMkxiwOP0LFedsebH9RXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-QSophn58NmSpvHsssbe8Eg-1; Mon, 04 Oct 2021 17:05:39 -0400
X-MC-Unique: QSophn58NmSpvHsssbe8Eg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2572F835DE0;
 Mon,  4 Oct 2021 21:05:38 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B9319723;
 Mon,  4 Oct 2021 21:05:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/13] iotests: [RFC] drop iotest 297
Date: Mon,  4 Oct 2021 17:05:03 -0400
Message-Id: <20211004210503.1455391-14-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(This is highlighting a what-if, which might make it clear why any
special infrastructure is still required at all. It's not intended to
actually be merged at this step -- running JUST the iotest linters from
e.g. 'make check' is not yet accommodated, so there's no suitable
replacement for 297 for block test authors.)

Drop 297. As a consequence, we no longer need to pass an environment
variable to the mypy/pylint invocations, so that can be dropped. We also
now no longer need to hide output-except-on-error, so that can be
dropped as well.

The only thing that necessitates any special running logic anymore is
the skip list and the python-test-detection code. Without those, we
could easily codify the tests as simply:

[pylint|mypy] *.py tests/*.py

... and drop this entire file. We're not quite there yet, though.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297        | 52 -----------------------------------
 tests/qemu-iotests/297.out    |  2 --
 tests/qemu-iotests/linters.py | 20 ++------------
 3 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100755 tests/qemu-iotests/297
 delete mode 100644 tests/qemu-iotests/297.out

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
deleted file mode 100755
index f79c80216bf..00000000000
--- a/tests/qemu-iotests/297
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/usr/bin/env python3
-# group: meta
-#
-# Copyright (C) 2020 Red Hat, Inc.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-
-import os
-import shutil
-import sys
-
-import iotests
-import linters
-
-
-# Looking for the list of files to exclude from linting? See linters.py.
-
-
-def main() -> None:
-    for linter in ('pylint-3', 'mypy'):
-        if shutil.which(linter) is None:
-            iotests.notrun(f'{linter} not found')
-
-    files = linters.get_test_files()
-
-    iotests.logger.debug('Files to be checked:')
-    iotests.logger.debug(', '.join(sorted(files)))
-
-    env = os.environ.copy()
-    env['MYPYPATH'] = env['PYTHONPATH']
-
-    print('=== pylint ===')
-    sys.stdout.flush()
-    linters.run_linter('pylint', files, env=env)
-
-    print('=== mypy ===')
-    sys.stdout.flush()
-    linters.run_linter('mypy', files, env=env, suppress_output=True)
-
-
-iotests.script_main(main)
diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
deleted file mode 100644
index f2e1314d104..00000000000
--- a/tests/qemu-iotests/297.out
+++ /dev/null
@@ -1,2 +0,0 @@
-=== pylint ===
-=== mypy ===
diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index 83fcc5a960c..ca90604d8d9 100644
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -17,7 +17,7 @@
 import re
 import subprocess
 import sys
-from typing import List, Mapping, Optional
+from typing import List
 
 
 # TODO: Empty this list!
@@ -55,31 +55,15 @@ def get_test_files() -> List[str]:
     return list(filter(is_python_file, check_tests))
 
 
-def run_linter(
-        tool: str,
-        args: List[str],
-        env: Optional[Mapping[str, str]] = None,
-        suppress_output: bool = False,
-) -> int:
+def run_linter(tool: str, args: List[str]) -> int:
     """
     Run a python-based linting tool.
-
-    If suppress_output is True, capture stdout/stderr of the child
-    process and only print that information back to stdout if the child
-    process's return code was non-zero.
     """
     p = subprocess.run(
         ('python3', '-m', tool, *args),
-        env=env,
         check=False,
-        stdout=subprocess.PIPE if suppress_output else None,
-        stderr=subprocess.STDOUT if suppress_output else None,
-        universal_newlines=True,
     )
 
-    if suppress_output and p.returncode != 0:
-        print(p.stdout)
-
     return p.returncode
 
 
-- 
2.31.1


