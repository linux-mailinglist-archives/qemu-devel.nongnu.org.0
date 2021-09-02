Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA43FEE31
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:58:17 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmIK-0005xR-7H
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9q-00056j-Oh
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9m-00072G-GL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1XKetSn7zGWk6BbknG6wzhcjHofX8CpmP6t2I8CKMo=;
 b=d21dxVj77PCiHeHpWGOPfYfJggarKf29QX/4rcRAmW4wvkSeJhrB2DmyN4bObP/lkcpyUn
 o7++1lrtDUXsgwdV+hCtg1zQhYRpk6Ouhpv3CjM+bhpXp51jEXanzrbsjoUjthSz6Kro/Z
 nqLT+gC5chv3dpZ0EGkXeWUUt6Ynf5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-77_DeY3eOHqZAdgJE4XpOw-1; Thu, 02 Sep 2021 08:49:22 -0400
X-MC-Unique: 77_DeY3eOHqZAdgJE4XpOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE77B835DE1;
 Thu,  2 Sep 2021 12:49:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F384310016F2;
 Thu,  2 Sep 2021 12:49:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/13] docs: add definitions of terms for CI/testing
Date: Thu,  2 Sep 2021 14:48:59 +0200
Message-Id: <20210902124911.822423-2-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

To understand the current state of QEMU CI/testing and have a base to
discuss the plans for the future, it is important to define some usual
terms. This patch defines the terms for "Automated tests", "Unit
testing", "Functional testing", "System testing", "Flaky tests",
"Gating", and "Continuous Integration".

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210831152939.97570-2-willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/ci-definitions.rst | 121 ++++++++++++++++++++++++++++++++++
 docs/devel/ci.rst             |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 docs/devel/ci-definitions.rst

diff --git a/docs/devel/ci-definitions.rst b/docs/devel/ci-definitions.rst
new file mode 100644
index 0000000000..32e22ff468
--- /dev/null
+++ b/docs/devel/ci-definitions.rst
@@ -0,0 +1,121 @@
+Definition of terms
+===================
+
+This section defines the terms used in this document and correlates them with
+what is currently used on QEMU.
+
+Automated tests
+---------------
+
+An automated test is written on a test framework using its generic test
+functions/classes. The test framework can run the tests and report their
+success or failure [1]_.
+
+An automated test has essentially three parts:
+
+1. The test initialization of the parameters, where the expected parameters,
+   like inputs and expected results, are set up;
+2. The call to the code that should be tested;
+3. An assertion, comparing the result from the previous call with the expected
+   result set during the initialization of the parameters. If the result
+   matches the expected result, the test has been successful; otherwise, it has
+   failed.
+
+Unit testing
+------------
+
+A unit test is responsible for exercising individual software components as a
+unit, like interfaces, data structures, and functionality, uncovering errors
+within the boundaries of a component. The verification effort is in the
+smallest software unit and focuses on the internal processing logic and data
+structures. A test case of unit tests should be designed to uncover errors due
+to erroneous computations, incorrect comparisons, or improper control flow [2]_.
+
+On QEMU, unit testing is represented by the 'check-unit' target from 'make'.
+
+Functional testing
+------------------
+
+A functional test focuses on the functional requirement of the software.
+Deriving sets of input conditions, the functional tests should fully exercise
+all the functional requirements for a program. Functional testing is
+complementary to other testing techniques, attempting to find errors like
+incorrect or missing functions, interface errors, behavior errors, and
+initialization and termination errors [3]_.
+
+On QEMU, functional testing is represented by the 'check-qtest' target from
+'make'.
+
+System testing
+--------------
+
+System tests ensure all application elements mesh properly while the overall
+functionality and performance are achieved [4]_. Some or all system components
+are integrated to create a complete system to be tested as a whole. System
+testing ensures that components are compatible, interact correctly, and
+transfer the right data at the right time across their interfaces. As system
+testing focuses on interactions, use case-based testing is a practical approach
+to system testing [5]_. Note that, in some cases, system testing may require
+interaction with third-party software, like operating system images, databases,
+networks, and so on.
+
+On QEMU, system testing is represented by the 'check-acceptance' target from
+'make'.
+
+Flaky tests
+-----------
+
+A flaky test is defined as a test that exhibits both a passing and a failing
+result with the same code on different runs. Some usual reasons for an
+intermittent/flaky test are async wait, concurrency, and test order dependency
+[6]_.
+
+Gating
+------
+
+A gate restricts the move of code from one stage to another on a
+test/deployment pipeline. The step move is granted with approval. The approval
+can be a manual intervention or a set of tests succeeding [7]_.
+
+On QEMU, the gating process happens during the pull request. The approval is
+done by the project leader running its own set of tests. The pull request gets
+merged when the tests succeed.
+
+Continuous Integration (CI)
+---------------------------
+
+Continuous integration (CI) requires the builds of the entire application and
+the execution of a comprehensive set of automated tests every time there is a
+need to commit any set of changes [8]_. The automated tests can be composed of
+the unit, functional, system, and other tests.
+
+Keynotes about continuous integration (CI) [9]_:
+
+1. System tests may depend on external software (operating system images,
+   firmware, database, network).
+2. It may take a long time to build and test. It may be impractical to build
+   the system being developed several times per day.
+3. If the development platform is different from the target platform, it may
+   not be possible to run system tests in the developer’s private workspace.
+   There may be differences in hardware, operating system, or installed
+   software. Therefore, more time is required for testing the system.
+
+References
+----------
+
+.. [1] Sommerville, Ian (2016). Software Engineering. p. 233.
+.. [2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering,
+       A Practitioner’s Approach. p. 48, 376, 378, 381.
+.. [3] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering,
+       A Practitioner’s Approach. p. 388.
+.. [4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering,
+       A Practitioner’s Approach. Software Engineering, p. 377.
+.. [5] Sommerville, Ian (2016). Software Engineering. p. 59, 232, 240.
+.. [6] Luo, Qingzhou, et al. An empirical analysis of flaky tests.
+       Proceedings of the 22nd ACM SIGSOFT International Symposium on
+       Foundations of Software Engineering. 2014.
+.. [7] Humble, Jez & Farley, David (2010). Continuous Delivery:
+       Reliable Software Releases Through Build, Test, and Deployment, p. 122.
+.. [8] Humble, Jez & Farley, David (2010). Continuous Delivery:
+       Reliable Software Releases Through Build, Test, and Deployment, p. 55.
+.. [9] Sommerville, Ian (2016). Software Engineering. p. 743.
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index a6a650968b..8d95247188 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -8,5 +8,6 @@ found at::
 
    https://wiki.qemu.org/Testing/CI
 
+.. include:: ci-definitions.rst
 .. include:: ci-jobs.rst
 .. include:: ci-runners.rst
-- 
2.27.0


