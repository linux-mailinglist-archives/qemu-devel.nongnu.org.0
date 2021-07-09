Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD22D3C2600
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:32:43 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rYY-0007Sf-Sf
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWB-0004bw-2V
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rW7-0005Uf-Pt
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k4so6122719wrc.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJ+a2HwSuRNejGfA9xMEuP+rnbpPniiuWoFoxeydpO0=;
 b=mraBFQRMnVVE8kt9oc7nef0ggzxeGVq9tutNkaHBssFAgBSeElspKSmKJXCT+vEEGm
 nh7/KFxpNRPUDQVX+V9Ha9Mm36NfTe1XbMF4pKfRkAn+/4g+BloogUISc7QZju5T4xFG
 DM3HIPq7MZ0+GX5QfsAIVhpkyGnG1UvV88BycCLdpZTChqvDuao+rmjh8f62Gi2xXv1N
 jpWMxKMMna3ZM7Hmwc7Y2KA6lFLipI0W4McYb92xUk0WHmH8riiB/8sX7JUO+EdRBZ34
 CHYluGhYA6KhcP+mzlA3l17LJDgissvRk1ivDG8I2OHvsFG4xd/s2JdFGNaWkG3r9iSQ
 FW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJ+a2HwSuRNejGfA9xMEuP+rnbpPniiuWoFoxeydpO0=;
 b=eaun7r6CBc3ITGQfYkIKgx1QaY/UCssB5S0ih+ijO/c+2WnINpPKaqZGDMvf9uegh2
 FG52Tk4H5agMNaexeoZgloKZPuDE1sKUSQXh3fzFa1nTaNDn6UpGiJTVgSoQTpdLDKRg
 XPO7o0/lCCzUPUbAYkT728tYmTla40pOTGcCcwPqtsF7k+Z6GtSvtd5tXtzAjtXkDxC2
 WaGkefF5yb2v9SbBok2lhGFZg3+2ARPC2/CkN+tLD6dT3M4yDz7SaU9JAUQazZ+An6FB
 tPrBAbS+uWLePUc8g9q6ZWteSwfoVnZU2tT5GoeF298FvzUATFayq4cgLYMUKnlrIvVD
 E9JQ==
X-Gm-Message-State: AOAM532LL7D6o32Yvy2dzKVpReZL7iXH0QbyODXupTiSDfXIG+etcIsm
 N1NjlMhVFFRMGJRoeuJpuSPBrQ==
X-Google-Smtp-Source: ABdhPJx7EFnDSsJas5TXmoc6jbVs0sszVYDEcPX3UszrB2GhdV8I8xYyAaGaYtxe3yKNLfR/mrMOXA==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr11185495wru.381.1625841010420; 
 Fri, 09 Jul 2021 07:30:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm11909218wms.7.2021.07.09.07.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 422921FF8C;
 Fri,  9 Jul 2021 15:30:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/40] Jobs based on custom runners: build environment docs
 and playbook
Date: Fri,  9 Jul 2021 15:29:27 +0100
Message-Id: <20210709143005.1554-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

To run basic jobs on custom runners, the environment needs to be
properly set up.  The most common requirement is having the right
packages installed.

The playbook introduced here covers the QEMU's project s390x and
aarch64 machines.  At the time this is being proposed, those machines
have already had this playbook applied to them.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210630012619.115262-3-crosa@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci.rst                      |  40 +++++++++
 scripts/ci/setup/.gitignore            |   2 +
 scripts/ci/setup/build-environment.yml | 116 +++++++++++++++++++++++++
 scripts/ci/setup/inventory.template    |   1 +
 4 files changed, 159 insertions(+)
 create mode 100644 scripts/ci/setup/.gitignore
 create mode 100644 scripts/ci/setup/build-environment.yml
 create mode 100644 scripts/ci/setup/inventory.template

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index 064ffa9988..bfedbb1025 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -30,3 +30,43 @@ The GitLab CI jobs definition for the custom runners are located under::
 Custom runners entail custom machines.  To see a list of the machines
 currently deployed in the QEMU GitLab CI and their maintainers, please
 refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
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
diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
new file mode 100644
index 0000000000..ee088604d1
--- /dev/null
+++ b/scripts/ci/setup/.gitignore
@@ -0,0 +1,2 @@
+inventory
+
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
new file mode 100644
index 0000000000..581c1c75d1
--- /dev/null
+++ b/scripts/ci/setup/build-environment.yml
@@ -0,0 +1,116 @@
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+#
+# This is an ansible playbook file.  Run it to set up systems with the
+# environment needed to build QEMU.
+---
+- name: Installation of basic packages to build QEMU
+  hosts: all
+  tasks:
+    - name: Check for suitable ansible version
+      delegate_to: localhost
+      assert:
+        that:
+          - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
+        msg: "Unsuitable ansible version, please use version 2.8.0 or later"
+
+    - name: Update apt cache / upgrade packages via apt
+      apt:
+        update_cache: yes
+        upgrade: yes
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
+      package:
+        name:
+        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
+          - ccache
+          - gcc
+          - gettext
+          - git
+          - glusterfs-common
+          - libaio-dev
+          - libattr1-dev
+          - libbrlapi-dev
+          - libbz2-dev
+          - libcacard-dev
+          - libcap-ng-dev
+          - libcurl4-gnutls-dev
+          - libdrm-dev
+          - libepoxy-dev
+          - libfdt-dev
+          - libgbm-dev
+          - libgtk-3-dev
+          - libibverbs-dev
+          - libiscsi-dev
+          - libjemalloc-dev
+          - libjpeg-turbo8-dev
+          - liblzo2-dev
+          - libncurses5-dev
+          - libncursesw5-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libnuma-dev
+          - libpixman-1-dev
+          - librados-dev
+          - librbd-dev
+          - librdmacm-dev
+          - libsasl2-dev
+          - libsdl2-dev
+          - libseccomp-dev
+          - libsnappy-dev
+          - libspice-protocol-dev
+          - libssh-dev
+          - libusb-1.0-0-dev
+          - libusbredirhost-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+          - libzstd-dev
+          - make
+          - python3-yaml
+          - python3-sphinx
+          - python3-sphinx-rtd-theme
+          - ninja-build
+          - sparse
+          - xfslibs-dev
+        state: present
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-s390x
+      package:
+        name:
+          - libspice-server-dev
+          - libxen-dev
+        state: present
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] != 's390x'
+
+    - name: Install basic packages to build QEMU on Ubuntu 18.04
+      package:
+        name:
+        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
+          - clang
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '18.04'
+
+    - name: Install basic packages to build QEMU on Ubuntu 20.04
+      package:
+        name:
+        # Originally from tests/docker/dockerfiles/ubuntu2004.docker
+          - clang-10
+          - genisoimage
+          - liblttng-ust-dev
+          - libslirp-dev
+          - netcat-openbsd
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '20.04'
diff --git a/scripts/ci/setup/inventory.template b/scripts/ci/setup/inventory.template
new file mode 100644
index 0000000000..2fbb50c4a8
--- /dev/null
+++ b/scripts/ci/setup/inventory.template
@@ -0,0 +1 @@
+localhost
-- 
2.20.1


