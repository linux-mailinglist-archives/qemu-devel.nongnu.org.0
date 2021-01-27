Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4396305785
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 10:57:03 +0100 (CET)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hZO-00011L-KW
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 04:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXl-0007it-Iy
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXj-0000Ga-EP
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvzDvrq1UMMHgygqzWp1Kvh+XEJnHp4rIrPCRPhyIpw=;
 b=iUrPvFgZtNuL6d8tv8kqJXrPnHI9B86esEO8bWHcnXeAUZAY4txF8fkQSFAi5ehqBwYRTf
 Q9IQddT46mIbAmU17uJ7JhKgnLO8HBV1F3obBSndxQ7SwNbc3Ey8Tox4FWou8tegTq6o/h
 eQYkhxF1mYpjfNZL+UAReng5mHKDB8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-exQgzM0BNAGSUN5AetVCTA-1; Wed, 27 Jan 2021 04:55:14 -0500
X-MC-Unique: exQgzM0BNAGSUN5AetVCTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A3DF801FD8;
 Wed, 27 Jan 2021 09:55:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EEFD5D9C6;
 Wed, 27 Jan 2021 09:55:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] docs/devel: Explain how acceptance tests can be skipped
Date: Wed, 27 Jan 2021 10:54:43 +0100
Message-Id: <20210127095444.114495-9-thuth@redhat.com>
In-Reply-To: <20210127095444.114495-1-thuth@redhat.com>
References: <20210127095444.114495-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Documented under the "Acceptance tests using the Avocado Framework"
section in testing.rst how environment variables are used to skip tests.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210115210022.417996-1-wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 0aa7a13bba..9f8b77c8ec 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -871,6 +871,68 @@ qemu_bin
 
 The exact QEMU binary to be used on QEMUMachine.
 
+Skipping tests
+--------------
+The Avocado framework provides Python decorators which allow for easily skip
+tests running under certain conditions. For example, on the lack of a binary
+on the test system or when the running environment is a CI system. For further
+information about those decorators, please refer to::
+
+  https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/writing.html#skipping-tests
+
+While the conditions for skipping tests are often specifics of each one, there
+are recurring scenarios identified by the QEMU developers and the use of
+environment variables became a kind of standard way to enable/disable tests.
+
+Here is a list of the most used variables:
+
+AVOCADO_ALLOW_LARGE_STORAGE
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Tests which are going to fetch or produce assets considered *large* are not
+going to run unless that `AVOCADO_ALLOW_LARGE_STORAGE=1` is exported on
+the environment.
+
+The definition of *large* is a bit arbitrary here, but it usually means an
+asset which occupies at least 1GB of size on disk when uncompressed.
+
+AVOCADO_ALLOW_UNTRUSTED_CODE
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+There are tests which will boot a kernel image or firmware that can be
+considered not safe to run on the developer's workstation, thus they are
+skipped by default. The definition of *not safe* is also arbitrary but
+usually it means a blob which either its source or build process aren't
+public available.
+
+You should export `AVOCADO_ALLOW_UNTRUSTED_CODE=1` on the environment in
+order to allow tests which make use of those kind of assets.
+
+AVOCADO_TIMEOUT_EXPECTED
+~~~~~~~~~~~~~~~~~~~~~~~~
+The Avocado framework has a timeout mechanism which interrupts tests to avoid the
+test suite of getting stuck. The timeout value can be set via test parameter or
+property defined in the test class, for further details::
+
+  https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/writing.html#setting-a-test-timeout
+
+Even though the timeout can be set by the test developer, there are some tests
+that may not have a well-defined limit of time to finish under certain
+conditions. For example, tests that take longer to execute when QEMU is
+compiled with debug flags. Therefore, the `AVOCADO_TIMEOUT_EXPECTED` variable
+has been used to determine whether those tests should run or not.
+
+GITLAB_CI
+~~~~~~~~~
+A number of tests are flagged to not run on the GitLab CI. Usually because
+they proved to the flaky or there are constraints on the CI environment which
+would make them fail. If you encounter a similar situation then use that
+variable as shown on the code snippet below to skip the test:
+
+.. code::
+
+  @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+  def test(self):
+      do_something()
+
 Uninstalling Avocado
 --------------------
 
-- 
2.27.0


