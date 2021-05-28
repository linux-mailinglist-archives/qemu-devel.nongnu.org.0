Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D45393BC8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:59:46 +0200 (CEST)
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSiv-0002JS-I2
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLh-0007S1-GG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLd-0001Qa-OE
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xalu/Fm+Q5+oLb0c33FcdY9LQ66QefTILl0dD1AhE3c=;
 b=DczOFgmDspGM1i2UnZ1ztiuuCBsOdnak/3L113Npn65vi92H+N7ojapHNo6ZlbS2SZFAjO
 2cGbfqBOO3mezGNUvOSv63f89zuIAVBBgHs+4L69a2cOQMaVxuMLakWolJBOQDBAhGLXRT
 /1j7/OAbGQkdegmUftwGKcSx+omtXjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-g_IR9599OsWQDjIz2izBQA-1; Thu, 27 May 2021 22:35:39 -0400
X-MC-Unique: g_IR9599OsWQDjIz2izBQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B254107ACE6;
 Fri, 28 May 2021 02:35:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABAA51F0C0;
 Fri, 28 May 2021 02:35:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/44] gitlab: add python linters to CI
Date: Thu, 27 May 2021 22:32:20 -0400
Message-Id: <20210528023220.417057-45-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a Python container that has just enough juice for us to run the
Python code quality analysis tools. Base this container on Fedora,
because Fedora has very convenient packaging for testing multiple Python
versions.

We need python3, pip (for pulling packages), pipenv and virtualenv for
creating virtual environments, and tox for running tests. make is needed
for running 'make check-tox' and 'make venv-check' targets. Python3.10
is needed explicitly because the tox package only pulls in 3.6-3.9, but
we wish to test the forthcoming release of Python as well to help
predict any problems. Lastly, we need gcc to compile PyPI packages that
may not have a binary distribution available.

Add two tests:

check-python-pipenv uses pipenv to test a frozen, very explicit set of
packages against our minimum supported python version, Python 3.6. This
test is not allowed to fail. The dependencies this test uses do not
change unless python/Pipfile.lock is changed.

check-python-tox uses tox to install the latest versions of required
python dependencies against a wide array of Python versions from 3.6 to
3.9, even including the yet-to-be-released Python 3.10. This test is
allowed to fail with a warning.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-32-jsnow@redhat.com
[Fix rebase conflict over .gitlab-ci.yml --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/containers.yml            |  5 +++++
 .gitlab-ci.d/static_checks.yml         | 21 +++++++++++++++++++++
 tests/docker/dockerfiles/python.docker | 18 ++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 tests/docker/dockerfiles/python.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index bd01ae8f802..1ca455f8e10 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -43,3 +43,8 @@ amd64-opensuse-leap-container:
   extends: .container_job_template
   variables:
     NAME: opensuse-leap
+
+python-container:
+  extends: .container_job_template
+  variables:
+    NAME: python
diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 91247a6f670..8e308721640 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -24,3 +24,24 @@ check-dco:
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
       when: never
     - when: on_success
+
+check-python-pipenv:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/python:latest
+  script:
+    - make -C python venv-check
+  variables:
+    GIT_DEPTH: 1
+  needs:
+    job: python-container
+
+check-python-tox:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/python:latest
+  script:
+    - make -C python check-tox
+  variables:
+    GIT_DEPTH: 1
+  needs:
+    job: python-container
+  allow_failure: true
diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
new file mode 100644
index 00000000000..56d88417df4
--- /dev/null
+++ b/tests/docker/dockerfiles/python.docker
@@ -0,0 +1,18 @@
+# Python library testing environment
+
+FROM fedora:latest
+MAINTAINER John Snow <jsnow@redhat.com>
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    gcc \
+    make \
+    pipenv \
+    python3 \
+    python3-pip \
+    python3-tox \
+    python3-virtualenv \
+    python3.10
+
+RUN dnf install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.31.1


