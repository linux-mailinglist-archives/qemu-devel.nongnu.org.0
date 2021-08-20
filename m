Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D93F35EA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 23:13:09 +0200 (CEST)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHBp6-0002Jm-L6
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 17:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mHBmA-0007q2-Qb
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mHBm8-0000wq-4i
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629493803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6a14eLv9HwAW0RjLrx+l3Eb9PFyspfhx/4TGY4iq7o=;
 b=hYHSLNMKUSThyirFwygDEwpc/g3F6JbftoZEAfV+xBDE8Frx4zQDZZGZYCDHwPRQpCKybk
 DrhAKrKZyC+SidmdEulxDU7QmNztUPznnNV+YpttM8/g6zerd5WGReD316Tk1GLK5YcLaB
 pMmwObRACYc/yxTZPNUTglnVzb1QW0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-9h-lRZK1MByqlREiMQ5Z0g-1; Fri, 20 Aug 2021 17:09:57 -0400
X-MC-Unique: 9h-lRZK1MByqlREiMQ5Z0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C26F9180FCD2;
 Fri, 20 Aug 2021 21:09:56 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED7A5610D0;
 Fri, 20 Aug 2021 21:09:53 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] docs: split the CI docs into two files
Date: Fri, 20 Aug 2021 18:09:45 -0300
Message-Id: <20210820210946.291335-2-willianr@redhat.com>
In-Reply-To: <20210820210946.291335-1-willianr@redhat.com>
References: <20210820210946.291335-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This splits the CI docs into one file talking about job setup and usage
and another file describing provisioning of custom runners.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210812180403.4129067-2-berrange@redhat.com>
---
 docs/devel/ci-jobs.rst    |  40 ++++++++++
 docs/devel/ci-runners.rst | 117 ++++++++++++++++++++++++++++
 docs/devel/ci.rst         | 159 +-------------------------------------
 3 files changed, 159 insertions(+), 157 deletions(-)
 create mode 100644 docs/devel/ci-jobs.rst
 create mode 100644 docs/devel/ci-runners.rst

diff --git a/docs/devel/ci-jobs.rst b/docs/devel/ci-jobs.rst
new file mode 100644
index 0000000000..9cd9819786
--- /dev/null
+++ b/docs/devel/ci-jobs.rst
@@ -0,0 +1,40 @@
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
diff --git a/docs/devel/ci-runners.rst b/docs/devel/ci-runners.rst
new file mode 100644
index 0000000000..7817001fb2
--- /dev/null
+++ b/docs/devel/ci-runners.rst
@@ -0,0 +1,117 @@
+Jobs on Custom Runners
+======================
+
+Besides the jobs run under the various CI systems listed before, there
+are a number additional jobs that will run before an actual merge.
+These use the same GitLab CI's service/framework already used for all
+other GitLab based CI jobs, but rely on additional systems, not the
+ones provided by GitLab as "shared runners".
+
+The architecture of GitLab's CI service allows different machines to
+be set up with GitLab's "agent", called gitlab-runner, which will take
+care of running jobs created by events such as a push to a branch.
+Here, the combination of a machine, properly configured with GitLab's
+gitlab-runner, is called a "custom runner".
+
+The GitLab CI jobs definition for the custom runners are located under::
+
+  .gitlab-ci.d/custom-runners.yml
+
+Custom runners entail custom machines.  To see a list of the machines
+currently deployed in the QEMU GitLab CI and their maintainers, please
+refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
+
+Machine Setup Howto
+-------------------
+
+For all Linux based systems, the setup can be mostly automated by the
+execution of two Ansible playbooks.  Create an ``inventory`` file
+under ``scripts/ci/setup``, such as this::
+
+  fully.qualified.domain
+  other.machine.hostname
+
+You may need to set some variables in the inventory file itself.  One
+very common need is to tell Ansible to use a Python 3 interpreter on
+those hosts.  This would look like::
+
+  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
+  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
+
+Build environment
+~~~~~~~~~~~~~~~~~
+
+The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
+set up machines with the environment needed to perform builds and run
+QEMU tests.  This playbook consists on the installation of various
+required packages (and a general package update while at it).  It
+currently covers a number of different Linux distributions, but it can
+be expanded to cover other systems.
+
+The minimum required version of Ansible successfully tested in this
+playbook is 2.8.0 (a version check is embedded within the playbook
+itself).  To run the playbook, execute::
+
+  cd scripts/ci/setup
+  ansible-playbook -i inventory build-environment.yml
+
+Please note that most of the tasks in the playbook require superuser
+privileges, such as those from the ``root`` account or those obtained
+by ``sudo``.  If necessary, please refer to ``ansible-playbook``
+options such as ``--become``, ``--become-method``, ``--become-user``
+and ``--ask-become-pass``.
+
+gitlab-runner setup and registration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The gitlab-runner agent needs to be installed on each machine that
+will run jobs.  The association between a machine and a GitLab project
+happens with a registration token.  To find the registration token for
+your repository/project, navigate on GitLab's web UI to:
+
+ * Settings (the gears-like icon at the bottom of the left hand side
+   vertical toolbar), then
+ * CI/CD, then
+ * Runners, and click on the "Expand" button, then
+ * Under "Set up a specific Runner manually", look for the value under
+   "And this registration token:"
+
+Copy the ``scripts/ci/setup/vars.yml.template`` file to
+``scripts/ci/setup/vars.yml``.  Then, set the
+``gitlab_runner_registration_token`` variable to the value obtained
+earlier.
+
+To run the playbook, execute::
+
+  cd scripts/ci/setup
+  ansible-playbook -i inventory gitlab-runner.yml
+
+Following the registration, it's necessary to configure the runner tags,
+and optionally other configurations on the GitLab UI.  Navigate to:
+
+ * Settings (the gears like icon), then
+ * CI/CD, then
+ * Runners, and click on the "Expand" button, then
+ * "Runners activated for this project", then
+ * Click on the "Edit" icon (next to the "Lock" Icon)
+
+Tags are very important as they are used to route specific jobs to
+specific types of runners, so it's a good idea to double check that
+the automatically created tags are consistent with the OS and
+architecture.  For instance, an Ubuntu 20.04 aarch64 system should
+have tags set as::
+
+  ubuntu_20.04,aarch64
+
+Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
+would contain::
+
+  ubuntu-20.04-aarch64-all:
+   tags:
+   - ubuntu_20.04
+   - aarch64
+
+It's also recommended to:
+
+ * increase the "Maximum job timeout" to something like ``2h``
+ * give it a better Description
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index 205572510c..a6a650968b 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -8,160 +8,5 @@ found at::
 
    https://wiki.qemu.org/Testing/CI
 
-Custom CI/CD variables
-======================
-
-QEMU CI pipelines can be tuned by setting some CI environment variables.
-
-Set variable globally in the user's CI namespace
-------------------------------------------------
-
-Variables can be set globally in the user's CI namespace setting.
-
-For further information about how to set these variables, please refer to::
-
-  https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project
-
-Set variable manually when pushing a branch or tag to the user's repository
----------------------------------------------------------------------------
-
-Variables can be set manually when pushing a branch or tag, using
-git-push command line arguments.
-
-Example setting the QEMU_CI_EXAMPLE_VAR variable:
-
-.. code::
-
-   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
-
-For further information about how to set these variables, please refer to::
-
-  https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
-
-Here is a list of the most used variables:
-
-QEMU_CI_AVOCADO_TESTING
-~~~~~~~~~~~~~~~~~~~~~~~
-By default, tests using the Avocado framework are not run automatically in
-the pipelines (because multiple artifacts have to be downloaded, and if
-these artifacts are not already cached, downloading them make the jobs
-reach the timeout limit). Set this variable to have the tests using the
-Avocado framework run automatically.
-
-Jobs on Custom Runners
-======================
-
-Besides the jobs run under the various CI systems listed before, there
-are a number additional jobs that will run before an actual merge.
-These use the same GitLab CI's service/framework already used for all
-other GitLab based CI jobs, but rely on additional systems, not the
-ones provided by GitLab as "shared runners".
-
-The architecture of GitLab's CI service allows different machines to
-be set up with GitLab's "agent", called gitlab-runner, which will take
-care of running jobs created by events such as a push to a branch.
-Here, the combination of a machine, properly configured with GitLab's
-gitlab-runner, is called a "custom runner".
-
-The GitLab CI jobs definition for the custom runners are located under::
-
-  .gitlab-ci.d/custom-runners.yml
-
-Custom runners entail custom machines.  To see a list of the machines
-currently deployed in the QEMU GitLab CI and their maintainers, please
-refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
-
-Machine Setup Howto
--------------------
-
-For all Linux based systems, the setup can be mostly automated by the
-execution of two Ansible playbooks.  Create an ``inventory`` file
-under ``scripts/ci/setup``, such as this::
-
-  fully.qualified.domain
-  other.machine.hostname
-
-You may need to set some variables in the inventory file itself.  One
-very common need is to tell Ansible to use a Python 3 interpreter on
-those hosts.  This would look like::
-
-  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
-  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
-
-Build environment
-~~~~~~~~~~~~~~~~~
-
-The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
-set up machines with the environment needed to perform builds and run
-QEMU tests.  This playbook consists on the installation of various
-required packages (and a general package update while at it).  It
-currently covers a number of different Linux distributions, but it can
-be expanded to cover other systems.
-
-The minimum required version of Ansible successfully tested in this
-playbook is 2.8.0 (a version check is embedded within the playbook
-itself).  To run the playbook, execute::
-
-  cd scripts/ci/setup
-  ansible-playbook -i inventory build-environment.yml
-
-Please note that most of the tasks in the playbook require superuser
-privileges, such as those from the ``root`` account or those obtained
-by ``sudo``.  If necessary, please refer to ``ansible-playbook``
-options such as ``--become``, ``--become-method``, ``--become-user``
-and ``--ask-become-pass``.
-
-gitlab-runner setup and registration
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The gitlab-runner agent needs to be installed on each machine that
-will run jobs.  The association between a machine and a GitLab project
-happens with a registration token.  To find the registration token for
-your repository/project, navigate on GitLab's web UI to:
-
- * Settings (the gears-like icon at the bottom of the left hand side
-   vertical toolbar), then
- * CI/CD, then
- * Runners, and click on the "Expand" button, then
- * Under "Set up a specific Runner manually", look for the value under
-   "And this registration token:"
-
-Copy the ``scripts/ci/setup/vars.yml.template`` file to
-``scripts/ci/setup/vars.yml``.  Then, set the
-``gitlab_runner_registration_token`` variable to the value obtained
-earlier.
-
-To run the playbook, execute::
-
-  cd scripts/ci/setup
-  ansible-playbook -i inventory gitlab-runner.yml
-
-Following the registration, it's necessary to configure the runner tags,
-and optionally other configurations on the GitLab UI.  Navigate to:
-
- * Settings (the gears like icon), then
- * CI/CD, then
- * Runners, and click on the "Expand" button, then
- * "Runners activated for this project", then
- * Click on the "Edit" icon (next to the "Lock" Icon)
-
-Tags are very important as they are used to route specific jobs to
-specific types of runners, so it's a good idea to double check that
-the automatically created tags are consistent with the OS and
-architecture.  For instance, an Ubuntu 20.04 aarch64 system should
-have tags set as::
-
-  ubuntu_20.04,aarch64
-
-Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
-would contain::
-
-  ubuntu-20.04-aarch64-all:
-   tags:
-   - ubuntu_20.04
-   - aarch64
-
-It's also recommended to:
-
- * increase the "Maximum job timeout" to something like ``2h``
- * give it a better Description
+.. include:: ci-jobs.rst
+.. include:: ci-runners.rst
-- 
2.31.1


