Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9E476470
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:18:00 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbex-0002sK-Dh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXD-0004q2-Jw
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXB-0006iD-KR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9YGDsCcD+Hr248NtDgvV+ExNK4Rb8mWKaYWzORXfg8=;
 b=Va95m+k2mQ3ARqGZqkN5DjJRZ1fwp3kxnfm6hgJQoOeR7Nsl43fqvnlrEvmUHkDEZnN18K
 hDyDRtw5r7LIaRHVo8PhupQhv8s51+5XIn9hKQZN49PiWpJuslcvnCEqJnuktTKFMrfZca
 JPVf5gBXbLGrhhH3DuBMg3smmkElJgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-Xmjx9BaOO0iEeavBtGbk3Q-1; Wed, 15 Dec 2021 16:09:56 -0500
X-MC-Unique: Xmjx9BaOO0iEeavBtGbk3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03679835E22;
 Wed, 15 Dec 2021 21:09:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0115F4E1;
 Wed, 15 Dec 2021 21:09:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 14/24] GitLab CI: Add avocado junit XML output to
 tests
Date: Wed, 15 Dec 2021 16:06:24 -0500
Message-Id: <20211215210634.3779791-15-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 .gitlab-ci.d/test.yml | 16 ++++++++++++++++
 Makefile              |  1 +
 avocado.cfg           |  7 +++++++
 3 files changed, 24 insertions(+)

diff --git a/.gitlab-ci.d/test.yml b/.gitlab-ci.d/test.yml
index 19e0c37..3b2a142 100644
--- a/.gitlab-ci.d/test.yml
+++ b/.gitlab-ci.d/test.yml
@@ -14,7 +14,23 @@ check-dco:
       when: never
     - when: on_success
 
+.avocado:
+  before_script:
+    - echo "" >> avocado.cfg
+    - echo "[datadir.paths]" >> avocado.cfg
+    - echo "logs_dir = ./test-results/" >> avocado.cfg
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG-$CI_COMMIT_SHORT_SHA"
+    when: always
+    expire_in: 7 days
+    paths:
+      - test-results/latest/results.xml
+      - test-results/latest/test-results
+    reports:
+      junit: test-results/latest/results.xml
+
 .python_test:
+  extends: .avocado
   stage: test
   image: $CI_REGISTRY_IMAGE/python:latest
   variables:
diff --git a/Makefile b/Makefile
index a2d2f2c..97d737a 100644
--- a/Makefile
+++ b/Makefile
@@ -109,3 +109,4 @@ distclean: clean
 	rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
 	rm -f .coverage .coverage.*
 	rm -rf htmlcov/
+	rm -rf test-results/
diff --git a/avocado.cfg b/avocado.cfg
index c7722e7..a7b9935 100644
--- a/avocado.cfg
+++ b/avocado.cfg
@@ -11,3 +11,10 @@ output.testlogs.logfiles = ['stdout', 'stderr']
 
 # Show full stdout/stderr only on tests that FAIL
 output.testlogs.statuses = ['FAIL']
+
+# NOTE: Various gitlab CI jobs will append configuration
+# similar to the following, in order to keep test output
+# inside of the project root:
+#
+# [datadir.paths]
+# logs_dir = ./test-results/
-- 
2.31.1


