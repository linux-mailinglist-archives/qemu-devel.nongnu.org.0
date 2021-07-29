Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B693D9F81
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:26:03 +0200 (CEST)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91Mg-0003Lv-B1
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JG-0005PR-Mi
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JE-0007Fq-J2
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvd6XQmRFAg2JV5dv92wCGY919H32glmWzdGVm46LIc=;
 b=NrvLm4xLM0xu/aL5iFcPVkev0iMMBiYYrt1bhUGgjHPS/NKlDA98ESOZ5gioD+JqFU9Fny
 uUfOS6dXim7ZS5enG2Hm5dkkmLyYRU3MxhvEpBLb12+BVoRZY3NCmhWPyE/WXcADzWIUmO
 fA4MFeWw5Zt+a2116Nwi51yTPBid2lI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-_jrRY2qKMt6Uy8Y4I2EsGA-1; Thu, 29 Jul 2021 04:22:23 -0400
X-MC-Unique: _jrRY2qKMt6Uy8Y4I2EsGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DE196409B;
 Thu, 29 Jul 2021 08:22:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0E6D5D9DC;
 Thu, 29 Jul 2021 08:22:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/9] docs: Document GitLab custom CI/CD variables
Date: Thu, 29 Jul 2021 10:22:03 +0200
Message-Id: <20210729082211.532572-2-thuth@redhat.com>
In-Reply-To: <20210729082211.532572-1-thuth@redhat.com>
References: <20210729082211.532572-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.719, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
("gitlab: Run Avocado tests manually (except mainstream CI)"), but
forgot to document it properly. Do it now.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210727142431.1672530-2-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml    | 19 ++-----------------
 docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6dc5385e69..9762dda2ee 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,24 +16,9 @@
 # QEMU CI jobs are based on templates. Some templates provide
 # user-configurable options, modifiable via configuration variables.
 #
-# These variables can be set globally in the user's CI namespace
-# setting:
-# https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
-# or set manually each time a branch/tag is pushed, as a git-push
-# command line argument:
-# https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+# See https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
+# for more information.
 #
-# Example setting the QEMU_CI_EXAMPLE_VAR variable:
-#
-#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
-#
-# ----------------------------------------------------------------------
-#
-# List of environment variables that can be use to modify the set
-# of jobs selected:
-#
-# - QEMU_CI_AVOCADO_TESTING
-#   If set, tests using the Avocado framework will be run
 
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index b3bf3ef615..205572510c 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -8,6 +8,46 @@ found at::
 
    https://wiki.qemu.org/Testing/CI
 
+Custom CI/CD variables
+======================
+
+QEMU CI pipelines can be tuned by setting some CI environment variables.
+
+Set variable globally in the user's CI namespace
+------------------------------------------------
+
+Variables can be set globally in the user's CI namespace setting.
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project
+
+Set variable manually when pushing a branch or tag to the user's repository
+---------------------------------------------------------------------------
+
+Variables can be set manually when pushing a branch or tag, using
+git-push command line arguments.
+
+Example setting the QEMU_CI_EXAMPLE_VAR variable:
+
+.. code::
+
+   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+
+Here is a list of the most used variables:
+
+QEMU_CI_AVOCADO_TESTING
+~~~~~~~~~~~~~~~~~~~~~~~
+By default, tests using the Avocado framework are not run automatically in
+the pipelines (because multiple artifacts have to be downloaded, and if
+these artifacts are not already cached, downloading them make the jobs
+reach the timeout limit). Set this variable to have the tests using the
+Avocado framework run automatically.
+
 Jobs on Custom Runners
 ======================
 
-- 
2.27.0


