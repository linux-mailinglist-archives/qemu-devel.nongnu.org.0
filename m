Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8F415126
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:09:01 +0200 (CEST)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8Y7-0002GA-4T
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT8TG-0004Wy-Ez
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT8TF-0002cr-2X
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632341036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyGv+jUkaiNZrkCbm48yg6N6bqxMZJ08FZ5CDm1k5KU=;
 b=LI52FJQAB5pjs26C6nDLmgRAdSmn+PgJldO8IRhxi2vt4Gl0thi3nQiSqs/99lvyTZQjMK
 7dARh7lYln5P6hpNKZFep1sYquyfLU+EYrtGhIb8l0nlz2ABn/ghLwPHZ1/pOUlqZvXrJX
 bLPtFicgPTfjJHpQl+MSLmlSYao0zSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-DLISKzLYPeq-1Wfhv61kFw-1; Wed, 22 Sep 2021 16:03:55 -0400
X-MC-Unique: DLISKzLYPeq-1Wfhv61kFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1731084683;
 Wed, 22 Sep 2021 20:03:54 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC0CD5F707;
 Wed, 22 Sep 2021 20:03:51 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] docs/devel/testing: add instruction to run a single
 acceptance test
Date: Wed, 22 Sep 2021 17:03:39 -0300
Message-Id: <20210922200340.196329-2-willianr@redhat.com>
In-Reply-To: <20210922200340.196329-1-willianr@redhat.com>
References: <20210922200340.196329-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add instructions to the Acceptance tests section about running a
single test file or a test within the test file.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/testing.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4a0abbf23d..b03df34f7b 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -740,6 +740,20 @@ may be invoked by running:
 
   tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
 
+It is also possible to run tests from a single file or a single test
+within a test file. To run tests from a single file within the build
+tree, use:
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
 Manual Installation
 -------------------
 
-- 
2.31.1


