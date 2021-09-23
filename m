Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA3416322
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:23:38 +0200 (CEST)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRVZ-0005ez-6x
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKQ-0008Bw-SG
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKK-00061T-Ix
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632413519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mvxwrlu2+7qKGKbJP24I5ZFLnwqjJ/I0DT43uKpezxU=;
 b=WdSguwQUhBPGR6ZlT82d49rZsVxTvomFlUJaJ9m2D8rdv67dS8UoEQP2OjQA26i603Gs8Z
 DYFJYR5u1y0YD4etogWAELhdvWMotCekwqjsJv1/F7pJECyuW2pBz63raA617fMfa5g8aj
 dGGLcvLKpx7hf0jfRueUhv3FiLWDf7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-nCgCv5e1Nzqokv75gJ14MA-1; Thu, 23 Sep 2021 12:11:58 -0400
X-MC-Unique: nCgCv5e1Nzqokv75gJ14MA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7915010151E2;
 Thu, 23 Sep 2021 16:11:57 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BFC81002EF0;
 Thu, 23 Sep 2021 16:11:54 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] docs/devel/testing: add instruction to run a single
 acceptance test
Date: Thu, 23 Sep 2021 13:11:40 -0300
Message-Id: <20210923161141.232208-3-willianr@redhat.com>
In-Reply-To: <20210923161141.232208-1-willianr@redhat.com>
References: <20210923161141.232208-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add instructions to the Acceptance tests section about running a
single test file or a test within the test file.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/testing.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index d1841e35d5..c9f6b97f87 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -754,6 +754,34 @@ may be invoked by running:
 
   tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
 
+Note that if ``make check-acceptance`` was not executed before, it is
+possible to create the Python virtual environment with the dependencies
+needed running:
+
+ .. code::
+
+  make check-venv
+
+It is also possible to run tests from a single file or a single test within
+a test file. To run tests from a single file within the build tree, use:
+
+ .. code::
+
+  tests/venv/bin/avocado run tests/acceptance/$TESTFILE
+
+To run a single test within a test file, use:
+
+ .. code::
+
+  tests/venv/bin/avocado run tests/acceptance/$TESTFILE:$TESTCLASS.$TESTNAME
+
+Valid test names are visible in the output from any previous execution
+of Avocado or ``make check-acceptance``, and can also be queried using:
+
+ .. code::
+
+  tests/venv/bin/avocado list tests/acceptance
+
 Manual Installation
 -------------------
 
-- 
2.31.1


