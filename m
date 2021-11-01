Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007E44202B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:39:08 +0100 (CET)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcD5-0007mc-Ci
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbCR-0007V0-1j
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbCP-0002jQ-2W
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635788060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gV6vgoYT6MbDRHrE9Z0zLk2wxLzMrREwSAfYcvEd2Xk=;
 b=W3R4faf4+ZWoJxdLUil03klPvQpFxu8YZ3uG1+yX/tJUY6xLN8/q7cizYV9hFLEcnZlWdG
 C431taCsRmsxHV7/zktR4+xs3UXzzVu3bzkIxQ8OwXYDOl4C6WUYFfUHZsBR5NqtfwOw0D
 w+Yv/LSJb7EkBDPYwq++8iUernWvaw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-AROhGOMnMcShET6HRxg4iQ-1; Mon, 01 Nov 2021 13:34:17 -0400
X-MC-Unique: AROhGOMnMcShET6HRxg4iQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2471A9126B;
 Mon,  1 Nov 2021 17:34:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E98F19C79;
 Mon,  1 Nov 2021 17:33:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/22] iotests/297: split test into sub-cases
Date: Mon,  1 Nov 2021 13:29:54 -0400
Message-Id: <20211101173006.656673-11-jsnow@redhat.com>
In-Reply-To: <20211101173006.656673-1-jsnow@redhat.com>
References: <20211101173006.656673-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Take iotest 297's main() test function and split it into two sub-cases
that can be skipped individually. We can also drop custom environment
setup from the pylint test as it isn't needed.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20211019144918.3159078-11-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 63 ++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b2ad8d1cbe0..b7d9d6077b3 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -82,36 +82,51 @@ def run_linter(
     )
 
 
+def check_linter(linter: str) -> bool:
+    try:
+        run_linter(linter, ['--version'], suppress_output=True)
+    except subprocess.CalledProcessError:
+        iotests.case_notrun(f"'{linter}' not found")
+        return False
+    return True
+
+
+def test_pylint(files: List[str]) -> None:
+    print('=== pylint ===')
+    sys.stdout.flush()
+
+    if not check_linter('pylint'):
+        return
+
+    run_linter('pylint', files)
+
+
+def test_mypy(files: List[str]) -> None:
+    print('=== mypy ===')
+    sys.stdout.flush()
+
+    if not check_linter('mypy'):
+        return
+
+    env = os.environ.copy()
+    env['MYPYPATH'] = env['PYTHONPATH']
+
+    run_linter('mypy', files, env=env, suppress_output=True)
+
+
 def main() -> None:
-    for linter in ('pylint', 'mypy'):
-        try:
-            run_linter(linter, ['--version'], suppress_output=True)
-        except subprocess.CalledProcessError:
-            iotests.notrun(f"'{linter}' not found")
-
     files = get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
 
-    env = os.environ.copy()
-    env['MYPYPATH'] = env['PYTHONPATH']
-
-    print('=== pylint ===')
-    sys.stdout.flush()
-    try:
-        run_linter('pylint', files, env=env)
-    except subprocess.CalledProcessError:
-        # pylint failure will be caught by diffing the IO.
-        pass
-
-    print('=== mypy ===')
-    sys.stdout.flush()
-    try:
-        run_linter('mypy', files, env=env, suppress_output=True)
-    except subprocess.CalledProcessError as exc:
-        if exc.output:
-            print(exc.output)
+    for test in (test_pylint, test_mypy):
+        try:
+            test(files)
+        except subprocess.CalledProcessError as exc:
+            # Linter failure will be caught by diffing the IO.
+            if exc.output:
+                print(exc.output)
 
 
 iotests.script_main(main)
-- 
2.31.1


