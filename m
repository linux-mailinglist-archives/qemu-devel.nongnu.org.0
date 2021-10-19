Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED32433A7C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:32:10 +0200 (CEST)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr61-0007Wu-PO
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqR2-0001wZ-UY
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQy-0008HN-2U
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lumV0/BwsSQ54/O+yF70T3WvYgzrmN6eHP2QFSr4Zbs=;
 b=PbBwxOii2U7mJjnNrvvucbA/5UaT5jSkyYkQ4k3SFnH03QNIy6+gdXtOvjxNM7S62E4OSt
 3qDZI0NzVx4dAmses5WRKrhTw8bWjLoGKwzgMILFcn4TqPEwkwVotPhPx+AlXVHOX8w04F
 ACJWShlvfSjZyaiMlCuVVnIR7WyDa88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-fKkFN0DpNgyGQN4g9X1qzA-1; Tue, 19 Oct 2021 10:49:38 -0400
X-MC-Unique: fKkFN0DpNgyGQN4g9X1qzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B67EB1966321;
 Tue, 19 Oct 2021 14:49:37 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C29E262A41;
 Tue, 19 Oct 2021 14:49:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] iotests: [RFC] drop iotest 297
Date: Tue, 19 Oct 2021 10:49:18 -0400
Message-Id: <20211019144918.3159078-16-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 tests/qemu-iotests/297        | 82 -----------------------------------
 tests/qemu-iotests/297.out    |  2 -
 tests/qemu-iotests/linters.py | 14 +-----
 3 files changed, 2 insertions(+), 96 deletions(-)
 delete mode 100755 tests/qemu-iotests/297
 delete mode 100644 tests/qemu-iotests/297.out

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
deleted file mode 100755
index ee78a627359..00000000000
--- a/tests/qemu-iotests/297
+++ /dev/null
@@ -1,82 +0,0 @@
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
-import subprocess
-import sys
-from typing import List
-
-import iotests
-import linters
-
-
-# Looking for something?
-#
-#  List of files to exclude from linting: linters.py
-#  mypy configuration:                    mypy.ini
-#  pylint configuration:                  pylintrc
-
-
-def check_linter(linter: str) -> bool:
-    try:
-        linters.run_linter(linter, ['--version'], suppress_output=True)
-    except subprocess.CalledProcessError:
-        iotests.case_notrun(f"'{linter}' not found")
-        return False
-    return True
-
-
-def test_pylint(files: List[str]) -> None:
-    print('=== pylint ===')
-    sys.stdout.flush()
-
-    if not check_linter('pylint'):
-        return
-
-    linters.run_linter('pylint', files)
-
-
-def test_mypy(files: List[str]) -> None:
-    print('=== mypy ===')
-    sys.stdout.flush()
-
-    if not check_linter('mypy'):
-        return
-
-    env = os.environ.copy()
-    env['MYPYPATH'] = env['PYTHONPATH']
-
-    linters.run_linter('mypy', files, env=env, suppress_output=True)
-
-
-def main() -> None:
-    files = linters.get_test_files()
-
-    iotests.logger.debug('Files to be checked:')
-    iotests.logger.debug(', '.join(sorted(files)))
-
-    for test in (test_pylint, test_mypy):
-        try:
-            test(files)
-        except subprocess.CalledProcessError as exc:
-            # Linter failure will be caught by diffing the IO.
-            if exc.output:
-                print(exc.output)
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
index 65c4c4e8272..486b7125c1d 100644
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -17,7 +17,7 @@
 import re
 import subprocess
 import sys
-from typing import List, Mapping, Optional
+from typing import List
 
 
 # TODO: Empty this list!
@@ -55,25 +55,15 @@ def get_test_files() -> List[str]:
     return list(filter(is_python_file, check_tests))
 
 
-def run_linter(
-        tool: str,
-        args: List[str],
-        env: Optional[Mapping[str, str]] = None,
-        suppress_output: bool = False,
-) -> None:
+def run_linter(tool: str, args: List[str]) -> None:
     """
     Run a python-based linting tool.
 
-    :param suppress_output: If True, suppress all stdout/stderr output.
     :raise CalledProcessError: If the linter process exits with failure.
     """
     subprocess.run(
         ('python3', '-m', tool, *args),
-        env=env,
         check=True,
-        stdout=subprocess.PIPE if suppress_output else None,
-        stderr=subprocess.STDOUT if suppress_output else None,
-        universal_newlines=True,
     )
 
 
-- 
2.31.1


