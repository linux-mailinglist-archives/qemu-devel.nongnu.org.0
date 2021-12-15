Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4BA476488
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:26:06 +0100 (CET)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbmn-0007j6-JZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXI-0004u6-RL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXH-0006ik-6R
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uRjOqlmPZXLOIHWEEPirWvCEyHD7SBDJMiOIq/roHQ=;
 b=AFQl445UlcY0ldUMmvWsoNhSjE0Hpj10tS/UKkwjMWZhJyOjDbFAuwiQpzEPQ/imbjVQhJ
 tL2B+OxrlNXksgNCTUOTnCmYJagWcLwOpSifT4YE4MsGfHhx9ut5gLGccrOf/xPcLNWVQZ
 eXRQSQrrnnacsXRNEtEiZ7OVvv3IeQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-t7HiOCM3OxqFGYCFpqp02A-1; Wed, 15 Dec 2021 16:09:56 -0500
X-MC-Unique: t7HiOCM3OxqFGYCFpqp02A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 134D310766DD;
 Wed, 15 Dec 2021 21:09:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29A145F4EA;
 Wed, 15 Dec 2021 21:09:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 15/24] GitLab CI: Publish python packages to
 GitLab package repo
Date: Wed, 15 Dec 2021 16:06:25 -0500
Message-Id: <20211215210634.3779791-16-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/index.yml         |  2 ++
 .gitlab-ci.d/publish.yml       | 11 +++++++++++
 .gitlab-ci.d/python.Dockerfile |  1 +
 3 files changed, 14 insertions(+)
 create mode 100644 .gitlab-ci.d/publish.yml

diff --git a/.gitlab-ci.d/index.yml b/.gitlab-ci.d/index.yml
index cd6a65e..564308c 100644
--- a/.gitlab-ci.d/index.yml
+++ b/.gitlab-ci.d/index.yml
@@ -5,8 +5,10 @@ stages:
   - containers
   - build
   - test
+  - publish
 
 include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/build.yml'
   - local: '/.gitlab-ci.d/test.yml'
+  - local: '/.gitlab-ci.d/publish.yml'
\ No newline at end of file
diff --git a/.gitlab-ci.d/publish.yml b/.gitlab-ci.d/publish.yml
new file mode 100644
index 0000000..8d05e05
--- /dev/null
+++ b/.gitlab-ci.d/publish.yml
@@ -0,0 +1,11 @@
+publish-package:
+  stage: publish
+  image: $CI_REGISTRY_IMAGE/python:latest
+  needs:
+    job: build-package
+  script:
+    - TWINE_PASSWORD=${CI_JOB_TOKEN} TWINE_USERNAME=gitlab-ci-token
+      python3 -m twine upload
+      --verbose
+      --repository-url "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/pypi"
+      dist/*
diff --git a/.gitlab-ci.d/python.Dockerfile b/.gitlab-ci.d/python.Dockerfile
index 9501ed4..35d84f3 100644
--- a/.gitlab-ci.d/python.Dockerfile
+++ b/.gitlab-ci.d/python.Dockerfile
@@ -25,6 +25,7 @@ RUN dnf --setopt=install_weak_deps=False install -y \
     && python3 -m pip install --upgrade \
         build \
         pip \
+        twine \
     && dnf clean all \
     && rm -rf ~/.cache/pip \
     && rm -rf /var/cache/dnf \
-- 
2.31.1


