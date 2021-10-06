Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30706423C89
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:20:18 +0200 (CEST)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4xy-0008Ak-E9
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4fE-0000xi-9N
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:00:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4f7-0006nK-Us
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633518037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snNxAVu7fW6ID8sHaoqM6PG8UPGOkohk42i3zANJr10=;
 b=Q+Av0AWzIymJfMUpyu8FVNXJN1FSM96KFdksjPHOtdVOPlzGcIMHz7qCv2k0AxAPp1IH7c
 c4VAzC5wN1RFHPaRY3OkGg/CfBu7bUOES2Pv0QyCP22ESGRzB9ZN1ZgP8+K7bdM0A47uKB
 ZDspJDqGMcKU5tOlPYORrKnFCszSON4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-nZoziBCPMpK63Ske1XuEsg-1; Wed, 06 Oct 2021 07:00:36 -0400
X-MC-Unique: nZoziBCPMpK63Ske1XuEsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00FA802C89;
 Wed,  6 Oct 2021 11:00:34 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FBE060BE5;
 Wed,  6 Oct 2021 11:00:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/13] iotests: Update for pylint 2.11.1
Date: Wed,  6 Oct 2021 12:59:23 +0200
Message-Id: <20211006105923.223549-14-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

1. Ignore the new f-strings warning, we're not interested in doing a
   full conversion at this time.

2. Just mute the unbalanced-tuple-unpacking warning, it's not a real
   error in this case and muting the dozens of callsites is just not
   worth it.

3. Add encodings to read_text().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210923180715.4168522-7-jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 7 ++++---
 tests/qemu-iotests/pylintrc      | 6 +++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 4a6ec421ed..a56b6da396 100644
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
diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index f2c0b522ac..8cb4e1d6a6 100644
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
 
-- 
2.31.1


