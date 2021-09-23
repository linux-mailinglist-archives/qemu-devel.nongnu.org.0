Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC741651D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:18:41 +0200 (CEST)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTIu-0001YK-Re
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT8N-0005Ru-VL
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT8J-0003dY-CT
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632420461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOfI6MlNj4jDk0jYu//dcGMOJrF2E1EN/J3ZcCDNs2s=;
 b=BFSPXtoyGLZQH0uHAYeQ9fcT4t80X9ac8IkhteyMIyGENsdTP/+eeqXGttTqnJxuJsgkB9
 q6aOZF3EBNiq+LqaxMI7JgEg0PkrtvpMPh+QmIWlCmOYIkXILzEcOrxo/FoSBv9ewAMJyY
 tTahT4G+28iqoPdhhY/7tdJdgFirl/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-KardLKk7Nm6fKxi_n1T5kQ-1; Thu, 23 Sep 2021 14:07:40 -0400
X-MC-Unique: KardLKk7Nm6fKxi_n1T5kQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B5984A5E4;
 Thu, 23 Sep 2021 18:07:39 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEADD60BE5;
 Thu, 23 Sep 2021 18:07:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] iotests: Update for pylint 2.11.1
Date: Thu, 23 Sep 2021 14:07:15 -0400
Message-Id: <20210923180715.4168522-7-jsnow@redhat.com>
In-Reply-To: <20210923180715.4168522-1-jsnow@redhat.com>
References: <20210923180715.4168522-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. Ignore the new f-strings warning, we're not interested in doing a
   full conversion at this time.

2. Just mute the unbalanced-tuple-unpacking warning, it's not a real
   error in this case and muting the dozens of callsites is just not
   worth it.

3. Add encodings to read_text().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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


