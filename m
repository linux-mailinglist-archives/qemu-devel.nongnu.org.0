Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58252B59C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:14:35 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFlK-000847-Ts
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFby-0008Fe-Sf
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004N8-5Y
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5QoxONeJCcY+Ymq+2bbsjVD3pVw+gch9C8gnLYyXR4=;
 b=eeuBMO94GAUMGp9rQoZ893t8I4gx6gNZG7R3HMpQZG4NZuorhOvOOxCVyodciFLEH/hnUP
 jCVmN0mYn7FY18NLJNRGLJhKamyreQMAEo/5l7+qN/kCckiQFmhh1KFb7dl0VuDBqv+d4V
 Bp2Uruz7Zgyl1RTSV/qpnsZNLVAtCTk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-F1_aKAr5N2asVH69Yf2sDg-1; Wed, 18 May 2022 05:04:41 -0400
X-MC-Unique: F1_aKAr5N2asVH69Yf2sDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D5D63AF42B0;
 Wed, 18 May 2022 09:04:41 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB3C01410DD5;
 Wed, 18 May 2022 09:04:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 1/8] gitlab-ci: Switch the container of the 'check-patch' &
 'check-dco' jobs
Date: Wed, 18 May 2022 11:04:31 +0200
Message-Id: <20220518090438.158475-2-thuth@redhat.com>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Message-Id: <20220516082310.33876-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
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


