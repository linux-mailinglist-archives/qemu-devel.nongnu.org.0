Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85846318474
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 06:06:51 +0100 (CET)
Received: from localhost ([::1]:43878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA4Bm-0004jx-BT
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 00:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lA40w-0004Jx-Nd
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lA40v-0002k4-6Y
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613019335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNE7BncB95i6JMmTbEekHByGTACwoPvN5gJIxzioYlU=;
 b=KRRurlP9Hw97MgG+oXTcYGF194x1EUjYP7QGKNMRTIdSlViXRVig73IxiiouhlwDOghkSD
 LNwMICiurtHBK+rOnklypdpmvcTqbq8DerIeejCIFD7/4MFll/dgfgGthd7fofglyjFLEY
 aotraelRwFDvkvJImrlWXL2GCKMTIYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-T11W1P6fPH2BpeE2sT115g-1; Wed, 10 Feb 2021 23:55:34 -0500
X-MC-Unique: T11W1P6fPH2BpeE2sT115g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C94100CCC2;
 Thu, 11 Feb 2021 04:55:32 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACAD460BF1;
 Thu, 11 Feb 2021 04:55:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 4/5] travis.yml: (Re-)move the --enable-debug jobs
Date: Thu, 11 Feb 2021 05:54:54 +0100
Message-Id: <20210211045455.456371-5-thuth@redhat.com>
In-Reply-To: <20210211045455.456371-1-thuth@redhat.com>
References: <20210211045455.456371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have similar jobs in the gitlab-CI ("build-some-softmmu" and
"build-user-plugins"), so let's switch one of them to use --enable-debug
instead of --enable-debug-tcg, then we can simply drop these jobs from
the Travis-CI.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml |  2 +-
 .travis.yml    | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index da2fad1249..e878cc0847 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -403,7 +403,7 @@ build-some-softmmu:
   <<: *native_build_job_definition
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --enable-debug-tcg
+    CONFIGURE_ARGS: --disable-tools --enable-debug
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
diff --git a/.travis.yml b/.travis.yml
index 7744ec3a2f..f0e2b1059c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -118,18 +118,6 @@ after_script:
 
 jobs:
   include:
-    # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
-    - name: "GCC debug (main-softmmu)"
-      env:
-        - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
-
-
-    # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
-    - name: "GCC debug (user)"
-      env:
-        - CONFIG="--enable-debug-tcg --disable-system"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
     # Using newer GCC with sanitizers
-- 
2.27.0


