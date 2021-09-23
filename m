Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B5415498
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:24:18 +0200 (CEST)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCXC-0003wR-27
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPr-0001fr-3L
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPn-0000yL-M3
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632356199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNj5lBvqK98wFV/T6evKJ8hd9rkKBxhaDQ0OU1OkuHU=;
 b=HyiZdgeaXiMM1ra2J8Wsy5IbJa1Ev66tYlJcx0148mYsS0Ft/S0cHur0MVtOPsdYLWUgOg
 O/CNOGgj+S12bq6U8bQY8ucgQUp2XVd8p5Fse9KehCy85ZjX7oqJXK1mv+bDxvC5D5d5U7
 j4JY4UgAGHAEkYyA57kxJQ4tJ6Z5zCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-0CaBL7XbMUeqEmONEa3QJQ-1; Wed, 22 Sep 2021 20:16:37 -0400
X-MC-Unique: 0CaBL7XbMUeqEmONEa3QJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4E31084683;
 Thu, 23 Sep 2021 00:16:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ED0C10023AB;
 Thu, 23 Sep 2021 00:16:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] iotests: Update for pylint 2.11.1
Date: Wed, 22 Sep 2021 20:16:25 -0400
Message-Id: <20210923001625.3996451-7-jsnow@redhat.com>
In-Reply-To: <20210923001625.3996451-1-jsnow@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. Ignore the new f-strings warning, we're not interested in doing a
   full conversion at this time.

2. Just mute the unbalanced-tuple-unpacking warning, it's not a real
   error in this case and muting the dozens of callsites is just not
   worth it.

3. Add encodings to read_text().

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/pylintrc      | 6 +++++-
 tests/qemu-iotests/testrunner.py | 7 ++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index f2c0b522ac0..8cb4e1d6a6d 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -19,13 +19,17 @@ disable=invalid-name,
         too-many-public-methods,
         # pylint warns about Optional[] etc. as unsubscriptable in 3.9
         unsubscriptable-object,
+        # pylint's static analysis causes false positivies for file_path();
+        # If we really care to make it statically knowable, we'll use mypy.
+        unbalanced-tuple-unpacking,
         # Sometimes we need to disable a newly introduced pylint warning.
         # Doing so should not produce a warning in older versions of pylint.
         bad-option-value,
         # These are temporary, and should be removed:
         missing-docstring,
         too-many-return-statements,
-        too-many-statements
+        too-many-statements,
+        consider-using-f-string,
 
 [FORMAT]
 
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 4a6ec421ed6..a56b6da3968 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -266,12 +266,13 @@ def do_run_test(self, test: str) -> TestResult:
                               diff=file_diff(str(f_reference), str(f_bad)))
 
         if f_notrun.exists():
-            return TestResult(status='not run',
-                              description=f_notrun.read_text().strip())
+            return TestResult(
+                status='not run',
+                description=f_notrun.read_text(encoding='utf-8').strip())
 
         casenotrun = ''
         if f_casenotrun.exists():
-            casenotrun = f_casenotrun.read_text()
+            casenotrun = f_casenotrun.read_text(encoding='utf-8')
 
         diff = file_diff(str(f_reference), str(f_bad))
         if diff:
-- 
2.31.1


