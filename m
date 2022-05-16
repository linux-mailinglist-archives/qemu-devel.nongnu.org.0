Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE6527FCD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:36:52 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWDj-0003Oh-GE
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqW0e-0001OC-7b
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:23:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqW0c-0000oe-Ie
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652689397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZRicUOO3AccBC88DkLK6HcffNFeB6Gmv8i3PTtZQ2po=;
 b=Cf9OyolicUFcIn1G4IESxoZ3TbE4JiRLI1ral12pHkUzbv5Ljc5tNWm+7Pi5Z+6iV+WJxk
 eKaXoe0iwQg0kRpA8jdFxl+zC5H1jdIAnBcyfJ3hyEZkr1TKkPn/GpeySMWksFLVyQ1IgX
 jCts+AbAsInEQnsdStKPdZ6S9FxtyKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-wjuLvBfSO2yGeYBvguTqRg-1; Mon, 16 May 2022 04:23:14 -0400
X-MC-Unique: wjuLvBfSO2yGeYBvguTqRg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4A7780A0B9;
 Mon, 16 May 2022 08:23:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3AD573C24;
 Mon, 16 May 2022 08:23:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2] gitlab-ci: Switch the container of the 'check-patch' &
 'check-dco' jobs
Date: Mon, 16 May 2022 10:23:10 +0200
Message-Id: <20220516082310.33876-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'check-patch' and 'check-dco' jobs only need Python and git for
checking the patches, so it's not really necessary to use a container
here that has all the other build dependencies installed. By using a
lightweight Alpine container, we can improve the runtime here quite a
bit, cutting it down from ca. 1:30 minutes to ca. 45 seconds.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use python:alpine for even quicker execution

 .gitlab-ci.d/static_checks.yml | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 5e955540d3..94858e3272 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -1,12 +1,13 @@
 check-patch:
   stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-  needs:
-    job: amd64-centos8-container
+  image: python:3.10-alpine
+  needs: []
   script:
     - .gitlab-ci.d/check-patch.py
   variables:
     GIT_DEPTH: 1000
+  before_script:
+    - apk -U add git perl
   rules:
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
       when: never
@@ -15,12 +16,13 @@ check-patch:
 
 check-dco:
   stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-  needs:
-    job: amd64-centos8-container
+  image: python:3.10-alpine
+  needs: []
   script: .gitlab-ci.d/check-dco.py
   variables:
     GIT_DEPTH: 1000
+  before_script:
+    - apk -U add git
   rules:
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
       when: never
-- 
2.27.0


