Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8F476461
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:13:26 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbaW-0008FN-VA
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbWD-0003rm-5U
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbW9-0006aM-FR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9B3OITeijFYQcc5hK/JPoO4TyY/4Jm/044b+1lyKbdg=;
 b=UHQjzLhLbpML1WVrbrTvWepMU2JEEK13xKnIZRcPqZZO49gvaVZ8Isk07FHfA1LXxyqsRO
 lWxxseUmRLIe3LGY30c26Mo8sCz9KXNmxwvthMXe2GD2+svK1QkkEOFjMDSqrUmKrspJyB
 UWTb8lzRDPkYMFgtahu9KLv6wtMzcl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-1u0gJNI3OrCkUMZn6FmfJQ-1; Wed, 15 Dec 2021 16:08:51 -0500
X-MC-Unique: 1u0gJNI3OrCkUMZn6FmfJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A6C760C4;
 Wed, 15 Dec 2021 21:08:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFABB5F4EA;
 Wed, 15 Dec 2021 21:08:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 10/24] Add build and test container to gitlab CI
 configuration
Date: Wed, 15 Dec 2021 16:06:20 -0500
Message-Id: <20211215210634.3779791-11-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Heavily copy-pasted from the QEMU source tree, with bits and pieces not
needed for this repository trimmed down.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/containers.yml    | 28 ++++++++++++++++++++++++++++
 .gitlab-ci.d/index.yml         |  8 ++++++++
 .gitlab-ci.d/python.Dockerfile | 31 +++++++++++++++++++++++++++++++
 .gitlab-ci.yml                 |  3 +++
 INDEX.rst                      |  2 ++
 5 files changed, 72 insertions(+)
 create mode 100644 .gitlab-ci.d/containers.yml
 create mode 100644 .gitlab-ci.d/index.yml
 create mode 100644 .gitlab-ci.d/python.Dockerfile
 create mode 100644 .gitlab-ci.yml

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
new file mode 100644
index 0000000..fdcbbe4
--- /dev/null
+++ b/.gitlab-ci.d/containers.yml
@@ -0,0 +1,28 @@
+# Heavily inspired-by/copy-pasted-from the
+# container template from the QEMU source tree.
+
+.container_job_template:
+  image: docker:stable
+  stage: containers
+  services:
+    - docker:dind
+  before_script:
+    - export TAG="$NAME"
+    - export FQTAG="$CI_REGISTRY_IMAGE/$TAG:latest"
+    - docker info
+    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+  script:
+    - echo "TAG:$TAG"
+    - echo "FQTAG:$FQTAG"
+    - cd .gitlab-ci.d
+    - docker pull "$FQTAG"
+    - docker build --cache-from "$FQTAG" -t "$TAG" -f "$NAME.Dockerfile" .
+    - docker tag "$TAG" "$FQTAG"
+    - docker push "$FQTAG"
+  after_script:
+    - docker logout
+
+python-container:
+  extends: .container_job_template
+  variables:
+    NAME: python
diff --git a/.gitlab-ci.d/index.yml b/.gitlab-ci.d/index.yml
new file mode 100644
index 0000000..5ef8fcf
--- /dev/null
+++ b/.gitlab-ci.d/index.yml
@@ -0,0 +1,8 @@
+# This file contains the set of jobs run by this project:
+# https://gitlab.com/jsnow/qemu.qmp/-/pipelines
+
+stages:
+  - containers
+
+include:
+  - local: '/.gitlab-ci.d/containers.yml'
diff --git a/.gitlab-ci.d/python.Dockerfile b/.gitlab-ci.d/python.Dockerfile
new file mode 100644
index 0000000..9501ed4
--- /dev/null
+++ b/.gitlab-ci.d/python.Dockerfile
@@ -0,0 +1,31 @@
+# Python library build & testing environment.
+
+# Fedora is convenient, as it allows us to easily access multiple
+# versions of the python interpreter, which is great for tox testing.
+FROM fedora:latest
+
+# 「はじめまして！」
+MAINTAINER John Snow <jsnow@redhat.com>
+
+# Please keep the packages sorted alphabetically.
+RUN dnf --setopt=install_weak_deps=False install -y \
+        gcc \
+        git \
+        make \
+        pipenv \
+        python3 \
+        python3-pip \
+        python3-tox \
+        python3-virtualenv \
+        python3.10 \
+        python3.6 \
+        python3.7 \
+        python3.8 \
+        python3.9 \
+    && python3 -m pip install --upgrade \
+        build \
+        pip \
+    && dnf clean all \
+    && rm -rf ~/.cache/pip \
+    && rm -rf /var/cache/dnf \
+    ;
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 0000000..f93a1e1
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,3 @@
+# Hello, is it me you're looking for?
+include:
+  - local: '/.gitlab-ci.d/index.yml'
diff --git a/INDEX.rst b/INDEX.rst
index 9c45740..8b7a56a 100644
--- a/INDEX.rst
+++ b/INDEX.rst
@@ -47,6 +47,8 @@ Files in this directory
 
 - ``qemu/`` Python 'qemu' namespace package source directory.
 - ``tests/`` Python package tests directory.
+- ``.gitlab-ci.d/`` Files used for GitLab CI configuration.
+- ``.gitlab-ci.yml`` Primary GitLab CI configuration file.
 - ``avocado.cfg`` Configuration for the Avocado test-runner.
   Used by ``make check`` et al.
 - ``INDEX.rst`` you are here!
-- 
2.31.1


