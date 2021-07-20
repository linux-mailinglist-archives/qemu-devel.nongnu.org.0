Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C134C3D00D3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:48:34 +0200 (CEST)
Received: from localhost ([::1]:55376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tr7-0006AR-S8
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5td7-0006RT-7L
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5td5-0005mN-Ch
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bT2JRCelTLmpuKyrWpH94ls7oTdNseuKE9FQE08O8G4=;
 b=EdWmzKLKbJfHfJv5nzozr/pxQt/q/xzF5RSggUwOEkLjxtH59zAiEQRF+94pdNpR25N5Cz
 eU3bDblMsAzXMBYHq4xLt1F7pTF39bbYngAJ9xJ7QPFRc8nnsAoNR5K5aJK1pVMlw76Gkz
 eZbSwjHEcGrl6FYFqP+kTKHPH0aLh4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-paKxyZL2PiOQOc3ethAfzg-1; Tue, 20 Jul 2021 13:34:01 -0400
X-MC-Unique: paKxyZL2PiOQOc3ethAfzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BC441868408;
 Tue, 20 Jul 2021 17:34:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05E181962F;
 Tue, 20 Jul 2021 17:33:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/17] iotests/linters: check mypy files all at once
Date: Tue, 20 Jul 2021 13:33:36 -0400
Message-Id: <20210720173336.1876937-18-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
References: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can circumvent the '__main__' redefinition problem by passing
--scripts-are-modules. Take mypy out of the loop per-filename and check
everything in one go: it's quite a bit faster.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/linters.py | 56 ++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index 242cb9c3e69..b95425e81aa 100755
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -86,37 +86,33 @@ def run_linters(
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


