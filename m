Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FF40D290
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:31:50 +0200 (CEST)
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj3t-00005g-SR
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijT-0007sO-U1
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijQ-0000vJ-6f
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=an1qGz9el9qAinieV8+Owr2ua9KInO64MhvEmIIhIW4=;
 b=S594C3d24qlyrJbjtmCvtXhkPDEQEGDdc0ifNSHFzaK/5A7+oyOnK/AUqg89nL0OYpFZNm
 NUAGfrsal4mTpNcGz3Ui31tKMBfRZqF1OTNZ+es0VuPSJ3udDQPFz8PQYj5jMRqvYvRbw9
 r9Uue3b4k0rVWtnMHwNMS7sJqc7Cyso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-G0lfBaVYNaOKN0dbcco-KQ-1; Thu, 16 Sep 2021 00:10:36 -0400
X-MC-Unique: G0lfBaVYNaOKN0dbcco-KQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50BE7362F9;
 Thu, 16 Sep 2021 04:10:35 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67F2196E5;
 Thu, 16 Sep 2021 04:10:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/16] iotests/linters: check mypy files all at once
Date: Thu, 16 Sep 2021 00:09:55 -0400
Message-Id: <20210916040955.628560-17-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can circumvent the '__main__' redefinition problem by passing
--scripts-are-modules. Take mypy out of the loop per-filename and check
everything in one go: it's quite a bit faster.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/linters.py | 62 ++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index 9c97324e87..ac9f77c5ac 100755
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -82,40 +82,36 @@ def run_linters(
     print('=== mypy ===')
     sys.stdout.flush()
 
-    # We have to call mypy separately for each file.  Otherwise, it
-    # will interpret all given files as belonging together (i.e., they
-    # may not both define the same classes, etc.; most notably, they
-    # must not both define the __main__ module).
-    for filename in files:
-        p = subprocess.run(
-            (
-                'python3', '-m', 'mypy',
-                '--warn-unused-configs',
-                '--disallow-subclassing-any',
-                '--disallow-any-generics',
-                '--disallow-incomplete-defs',
-                '--disallow-untyped-decorators',
-                '--no-implicit-optional',
-                '--warn-redundant-casts',
-                '--warn-unused-ignores',
-                '--no-implicit-reexport',
-                '--namespace-packages',
-                # Until we can use mypy >= 0.920, see
-                # https://github.com/python/mypy/issues/9852
-                '--no-incremental',
-                filename,
-            ),
-            cwd=directory,
-            env=env,
-            check=False,
-            stdout=subprocess.PIPE,
-            stderr=subprocess.STDOUT,
-            universal_newlines=True
-        )
+    p = subprocess.run(
+        (
+            'python3', '-m', 'mypy',
+            '--warn-unused-configs',
+            '--disallow-subclassing-any',
+            '--disallow-any-generics',
+            '--disallow-incomplete-defs',
+            '--disallow-untyped-decorators',
+            '--no-implicit-optional',
+            '--warn-redundant-casts',
+            '--warn-unused-ignores',
+            '--no-implicit-reexport',
+            '--namespace-packages',
+            # Until we can use mypy >= 0.920, see
+            # https://github.com/python/mypy/issues/9852
+            '--no-incremental',
+            '--scripts-are-modules',
+            *files,
+        ),
+        cwd=directory,
+        env=env,
+        check=False,
+        stdout=subprocess.PIPE,
+        stderr=subprocess.STDOUT,
+        universal_newlines=True
+    )
 
-        ret += p.returncode
-        if p.returncode != 0:
-            print(p.stdout)
+    ret += p.returncode
+    if p.returncode != 0:
+        print(p.stdout)
 
     return ret
 
-- 
2.31.1


