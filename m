Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F65640B732
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 20:51:38 +0200 (CEST)
Received: from localhost ([::1]:52404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDWr-0007gb-7m
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 14:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mQDUE-0005T1-HR
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mQDU9-0004AK-VC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631645328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhW91hycCC9/eNfFvCbBs3TmPTNDINojNAEBWprVJeY=;
 b=D5XUj9j9dUtarfNF4tN7BDb+uII0F8/XhFhH3ogib9S4h5N0Dss1fpByNur7xltOTMIrvz
 FnKoPBKLZHw8UL6/qBgs40xtoKGsbGIPpQ1AlN1XM7npY62Y8Pv4vyQ/p76BTaIu/XQJbD
 86HqeZlepWM2Ot03ER8K0ws9KWeYlP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-0fVx1AqsMRGzZLfuoIzi3A-1; Tue, 14 Sep 2021 14:48:46 -0400
X-MC-Unique: 0fVx1AqsMRGzZLfuoIzi3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C81CC62C;
 Tue, 14 Sep 2021 18:48:45 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.17.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E06D06608B;
 Tue, 14 Sep 2021 18:48:41 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/1] docs/deve/ci-plan: define a high-level plan for the QEMU
 GitLab CI
Date: Tue, 14 Sep 2021 15:48:30 -0300
Message-Id: <20210914184830.84454-2-willianr@redhat.com>
In-Reply-To: <20210914184830.84454-1-willianr@redhat.com>
References: <20210914184830.84454-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

This adds a high-level plan for the QEMU GitLab CI based on use cases.
The idea is to have a base for evolving the QEMU CI. It sets high-level
characteristics for the QEMU CI use cases, which helps guide its
development.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/ci-plan.rst | 77 ++++++++++++++++++++++++++++++++++++++++++
 docs/devel/ci.rst      |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 docs/devel/ci-plan.rst

diff --git a/docs/devel/ci-plan.rst b/docs/devel/ci-plan.rst
new file mode 100644
index 0000000000..5e95b6bcea
--- /dev/null
+++ b/docs/devel/ci-plan.rst
@@ -0,0 +1,77 @@
+The GitLab CI structure
+=======================
+
+This section describes the current state of the QEMU GitLab CI and the
+high-level plan for its future.
+
+Current state
+-------------
+
+The mainstream QEMU project considers the GitLab CI its primary CI system.
+Currently, it runs 120+ jobs, where ~36 are container build jobs, 69 are QEMU
+build jobs, ~22 are test jobs, 1  is a web page deploy job, and 1 is an
+external job covering Travis jobs execution.
+
+In the current state, every push a user does to its fork runs most of the jobs
+compared to the jobs running on the main repository. The exceptions are the
+acceptance tests jobs, which run automatically on the main repository only.
+Running most of the jobs in the user's fork or the main repository is not
+viable. The job number tends to increase, becoming impractical to run all of
+them on every single push.
+
+Future of QEMU GitLab CI
+------------------------
+
+Following is a proposal to establish a high-level plan and set the
+characteristics for the QEMU GitLab CI. The idea is to organize the CI by use
+cases, avoid wasting resources and CI minutes, anticipating the time GitLab
+starts to enforce minutes limits soon.
+
+Use cases
+^^^^^^^^^
+
+Below is a list of the most common use cases for the QEMU GitLab CI.
+
+Gating
+""""""
+
+The gating set of jobs runs on the maintainer's pull requests when the project
+leader pushes them to the staging branch of the project. The gating CI pipeline
+has the following characteristics:
+
+ * Jobs tagged as gating run as part of the gating CI pipeline;
+ * The gating CI pipeline consists of stable jobs;
+ * The execution duration of the gating CI pipeline should, as much as possible,
+   have an upper bound limit of 2 hours.
+
+Developers
+""""""""""
+
+A developer working on a new feature or fixing an issue may want to run/propose
+a specific set of tests. Those tests may, eventually, benefit other developers.
+A developer CI pipeline has the following characteristics:
+
+ * It is easy to run current tests available in the project;
+ * It is easy to add new tests or remove unneeded tests;
+ * It is flexible enough to allow changes in the current jobs.
+
+Maintainers
+"""""""""""
+
+When accepting developers' patches, a maintainer may want to run a specific
+test set. A maintainer CI pipeline has the following characteristics:
+
+ * It consists of tests that are valuable for the subsystem;
+ * It is easy to run a set of specific tests available in the project;
+ * It is easy to add new tests or remove unneeded tests.
+
+Scheduled / periodic pipelines
+""""""""""""""""""""""""""""""
+
+The scheduled CI pipeline runs periodically on the master/main branch of the
+project. It covers as many jobs as needed or allowed by the execution duration
+of GitLab CI. The main idea of this pipeline is to run jobs that are not part
+of any other use cases due to some limitations, like execution duration, or
+flakiness. This pipeline may be helpful, for example, to collect test/job
+statistics or to define test/job stability. The scheduled CI pipeline should
+not act as a gating CI pipeline.
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index 8d95247188..c9a43f997d 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -9,5 +9,6 @@ found at::
    https://wiki.qemu.org/Testing/CI
 
 .. include:: ci-definitions.rst
+.. include:: ci-plan.rst
 .. include:: ci-jobs.rst
 .. include:: ci-runners.rst
-- 
2.31.1


