Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7553C19A5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:12:15 +0200 (CEST)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZRW-0006GT-1o
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPH-0003PJ-B7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPA-0004ld-0c
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so4297512wmi.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=crTi4XNq+Ingn7CUQ5c/evQBVola36pTXX+nEdv6k1Y=;
 b=KLoYWHxugFZl1M+bps1v+BcrySfgim4ZvP2dNSKd/+cYxzJuVWLEqc8vRuktadWwiB
 mkj9rZ1K9yMZ1S4BQTJQt+nsDHoSvIFBvHe0XIk+GXYm/3qCSVDOSs0gIXXcQYuCkt0B
 15UVJw3rSEU0PC05KLV1STH4jNLQdAlDuL0UDnsVwaFsd7suSTSSTPgMOnPnMO52/aCj
 Z2YwZSmYmNdHTPFfZA2jicLSxUmRk1aFvDzyKPDIWDKWJht5U/1FxkLvV1kbGUEhpAqs
 h9jSOeAUjHdwEr6ALlzEtqc1bLdDT8vO9DjIuWVc8cuBR55qXOhs7fciGfV/PYSqhRwi
 KQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=crTi4XNq+Ingn7CUQ5c/evQBVola36pTXX+nEdv6k1Y=;
 b=FNUvkctE7OVYRlrJzmGxTUJZev0Lj6MTdL4AV92b6ZJ1mq84bVQR8MJ1tgAbZCyTJg
 PsU38TnmjCzv0dOefbU4S+oCx4bHf9hjWNdx4lkbXQRxCUWJYKDMan7cYkJ3eWygotTz
 Elx1g/H5AJj/bMeqSTV7GYJ3Nt94uSrPEbmettEkDvxcsHn1heOa/ySTpK9Djyx2Ctpz
 jNYsfxJnLmJ2LPTlgJ+aV/iUolkcNWjj2zVOlxIs+mzVgZEhjOY7kfgM21jytH0c4la9
 QpBZ3jaOAjjewXi6Kx1vwaYdBLBWp2WMW/XDwoj4LwkvmlJoua/wBZHDlB0xZEgX8+Nf
 ztjw==
X-Gm-Message-State: AOAM530NmD8pi8Jq+AIXP3KH9LrXC9DlhC6yFs1CeX03uXtm7E3QCW5b
 CQa7JiPzShpqpXxguBXXcr+d3A==
X-Google-Smtp-Source: ABdhPJwGcR2Rm7+kftNcH/iiW6sTHkRqu8jeJdCPtaFSXQV086mAwHRAgIWbJGcSYRPIdqcu+dg7Kg==
X-Received: by 2002:a1c:ac87:: with SMTP id v129mr7263223wme.45.1625771386693; 
 Thu, 08 Jul 2021 12:09:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h13sm3097122wrs.68.2021.07.08.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A4231FF8F;
 Thu,  8 Jul 2021 20:09:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/39] Jobs based on custom runners: docs and gitlab-runner
 setup playbook
Date: Thu,  8 Jul 2021 20:09:05 +0100
Message-Id: <20210708190941.16980-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

To have the jobs dispatched to custom runners, gitlab-runner must
be installed, active as a service and properly configured.  The
variables file and playbook introduced here should help with those
steps.

The playbook introduced here covers the Linux distributions and
has been primarily tested on OS/machines that the QEMU project
has available to act as runners, namely:

 * Ubuntu 20.04 on aarch64
 * Ubuntu 18.04 on s390x

But, it should work on all other Linux distributions.  Earlier
versions were tested on FreeBSD too, so chances of success are
high.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210630012619.115262-4-crosa@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci.rst                  | 55 +++++++++++++++++++++++
 scripts/ci/setup/.gitignore        |  2 +-
 scripts/ci/setup/gitlab-runner.yml | 71 ++++++++++++++++++++++++++++++
 scripts/ci/setup/vars.yml.template | 12 +++++
 4 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 scripts/ci/setup/gitlab-runner.yml
 create mode 100644 scripts/ci/setup/vars.yml.template

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index bfedbb1025..b3bf3ef615 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -70,3 +70,58 @@ privileges, such as those from the ``root`` account or those obtained
 by ``sudo``.  If necessary, please refer to ``ansible-playbook``
 options such as ``--become``, ``--become-method``, ``--become-user``
 and ``--ask-become-pass``.
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
diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
index ee088604d1..f4a6183f1f 100644
--- a/scripts/ci/setup/.gitignore
+++ b/scripts/ci/setup/.gitignore
@@ -1,2 +1,2 @@
 inventory
-
+vars.yml
diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
new file mode 100644
index 0000000000..1127db516f
--- /dev/null
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -0,0 +1,71 @@
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+#
+# This is an ansible playbook file.  Run it to set up systems with the
+# gitlab-runner agent.
+---
+- name: Installation of gitlab-runner
+  hosts: all
+  vars_files:
+    - vars.yml
+  tasks:
+    - debug:
+        msg: 'Checking for a valid GitLab registration token'
+      failed_when: "gitlab_runner_registration_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"
+
+    - name: Create a group for the gitlab-runner service
+      group:
+        name: gitlab-runner
+
+    - name: Create a user for the gitlab-runner service
+      user:
+        user: gitlab-runner
+        group: gitlab-runner
+        comment: GitLab Runner
+        home: /home/gitlab-runner
+        shell: /bin/bash
+
+    - name: Remove the .bash_logout file when on Ubuntu systems
+      file:
+        path: /home/gitlab-runner/.bash_logout
+        state: absent
+      when: "ansible_facts['distribution'] == 'Ubuntu'"
+
+    - name: Set the Operating System for gitlab-runner
+      set_fact:
+        gitlab_runner_os: "{{ ansible_facts[\"system\"]|lower }}"
+    - debug:
+        msg: gitlab-runner OS is {{ gitlab_runner_os }}
+
+    - name: Set the architecture for gitlab-runner
+      set_fact:
+        gitlab_runner_arch: "{{ ansible_to_gitlab_arch[ansible_facts[\"architecture\"]] }}"
+    - debug:
+        msg: gitlab-runner arch is {{ gitlab_runner_arch }}
+
+    - name: Download the matching gitlab-runner
+      get_url:
+        dest: /usr/local/bin/gitlab-runner
+        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
+        owner: gitlab-runner
+        group: gitlab-runner
+        mode: u=rwx,g=rwx,o=rx
+
+    - name: Register the gitlab-runner
+      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+
+    - name: Install the gitlab-runner service using its own functionality
+      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner
+      register: gitlab_runner_install_service_result
+      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
+
+    - name: Enable the gitlab-runner service
+      service:
+        name: gitlab-runner
+        state: started
+        enabled: yes
diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
new file mode 100644
index 0000000000..e48089761f
--- /dev/null
+++ b/scripts/ci/setup/vars.yml.template
@@ -0,0 +1,12 @@
+# The version of the gitlab-runner to use
+gitlab_runner_version: 13.12.0
+# The URL of the gitlab server to use, usually https://gitlab.com unless you're
+# using a private GitLab instance
+gitlab_runner_server_url: https://gitlab.com
+# A mapping of the ansible to gitlab architecture nomenclature
+ansible_to_gitlab_arch:
+  x86_64: amd64
+  aarch64: arm64
+  s390x: s390x
+# A unique token made available by GitLab to your project for registering runners
+gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN
-- 
2.20.1


