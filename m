Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67E423C72
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:16:13 +0200 (CEST)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4uC-00038w-MW
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4ed-0000fh-Mz
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eb-0006MK-3t
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633518004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGwXJCtgsMBfZ3SWMmYmTKdHAsSUGa8sfMS0Kz7Sfio=;
 b=fLGfthEsEim35WJlHnE5gj9i1g7mqVRhaqE/yVYCm1IuZlDTJ2fNLH5A3anAY4L0vDagbX
 DSUvtziLjLOuQUd0B3YgTY3oN98skKS1ggDT4micNPZgLPSwmsDJf7SQkux48lSs/OH6cX
 4Gw28RJ0Rk4iDf42x9wbuRi9MK9uNew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-rSc8AAnyMw2rds5kI6ktOg-1; Wed, 06 Oct 2021 07:00:00 -0400
X-MC-Unique: rSc8AAnyMw2rds5kI6ktOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABCDF362F9;
 Wed,  6 Oct 2021 10:59:59 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91B4F60BE5;
 Wed,  6 Oct 2021 10:59:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/13] iotests/linters: check mypy files all at once
Date: Wed,  6 Oct 2021 12:59:20 +0200
Message-Id: <20211006105923.223549-11-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

We can circumvent the '__main__' redefinition problem by passing
--scripts-are-modules. Take mypy out of the loop per-filename and check
everything in one go: it's quite a bit faster.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210923180715.4168522-4-jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/297 | 46 +++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 467b712280..91ec34d952 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -74,32 +74,28 @@ def run_linters():
     print('=== mypy ===')
     sys.stdout.flush()
 
-    # We have to call mypy separately for each file.  Otherwise, it
-    # will interpret all given files as belonging together (i.e., they
-    # may not both define the same classes, etc.; most notably, they
-    # must not both define the __main__ module).
     env['MYPYPATH'] = env['PYTHONPATH']
-    for filename in files:
-        p = subprocess.run(('mypy',
-                            '--warn-unused-configs',
-                            '--disallow-subclassing-any',
-                            '--disallow-any-generics',
-                            '--disallow-incomplete-defs',
-                            '--disallow-untyped-decorators',
-                            '--no-implicit-optional',
-                            '--warn-redundant-casts',
-                            '--warn-unused-ignores',
-                            '--no-implicit-reexport',
-                            '--namespace-packages',
-                            filename),
-                           env=env,
-                           check=False,
-                           stdout=subprocess.PIPE,
-                           stderr=subprocess.STDOUT,
-                           universal_newlines=True)
-
-        if p.returncode != 0:
-            print(p.stdout)
+    p = subprocess.run(('mypy',
+                        '--warn-unused-configs',
+                        '--disallow-subclassing-any',
+                        '--disallow-any-generics',
+                        '--disallow-incomplete-defs',
+                        '--disallow-untyped-decorators',
+                        '--no-implicit-optional',
+                        '--warn-redundant-casts',
+                        '--warn-unused-ignores',
+                        '--no-implicit-reexport',
+                        '--namespace-packages',
+                        '--scripts-are-modules',
+                        *files),
+                       env=env,
+                       check=False,
+                       stdout=subprocess.PIPE,
+                       stderr=subprocess.STDOUT,
+                       universal_newlines=True)
+
+    if p.returncode != 0:
+        print(p.stdout)
 
 
 for linter in ('pylint-3', 'mypy'):
-- 
2.31.1


