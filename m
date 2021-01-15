Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4E2F870C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:02:44 +0100 (CET)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WF1-0002dD-5z
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0WD4-0001vB-9u
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:00:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0WD0-0002os-SE
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610744436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wt0L3RfPk23csPkYawDkJDgMu0olShjZpwN7Am+HGnM=;
 b=etGAnZmNOO52PbfUIJlmrzpg1/grS1PCkzL4nHEdIXyG6vSJaVYyHfxDw6wM4EX9GjPKFO
 wDln/g3y+3NRnyLVr/8JgExC5Fw1MbZPeIKQEnp0B64Y6Ye5+ROkQRhJvBrjghvCNtksB3
 bSR3QE4X+AhLSd/ecdDos6Kz8FOHW60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-nWnlFisYMh6HSqaJkfu7Kg-1; Fri, 15 Jan 2021 16:00:33 -0500
X-MC-Unique: nWnlFisYMh6HSqaJkfu7Kg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC405107ACF7;
 Fri, 15 Jan 2021 21:00:32 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6CA060C84;
 Fri, 15 Jan 2021 21:00:27 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs/devel: Explain how acceptance tests can be skipped
Date: Fri, 15 Jan 2021 18:00:22 -0300
Message-Id: <20210115210022.417996-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: philmd@redhat.com, thuth@redhat.com, alex.bennee@linaro.org,
 wrampazz@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documented under the "Acceptance tests using the Avocado Framework"
section in testing.rst how environment variables are used to skip tests.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
v2:
 - Made the changes Thomas pointed out.

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
2.28.0


