Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3553107B5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:24:39 +0100 (CET)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xLy-00075Y-BE
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGq-0002sQ-G4
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGo-0007rg-VZ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJwNUMO6ucmG9R8HejdpIocYJaqaPf7Ij8L/zvJvnzM=;
 b=ez0dLu1a8QhA5AZgV413jMVhk8FCX32O1kSCFtFBofkVUH0+9IBu7lDsdk+h2HR6SX1Muj
 aWWGxlZIUJd5EJf+LQKDLBLAsVYl5f5k8W1JNdM4dyRA09XZ7acSpYwL4dF9qT46sb09A8
 bh431G1YwPYTUyUabbIJzWbD85QT+AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-cE0QNYZuNYmGnBWpuZOWbA-1; Fri, 05 Feb 2021 04:19:14 -0500
X-MC-Unique: cE0QNYZuNYmGnBWpuZOWbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B63100A8E9;
 Fri,  5 Feb 2021 09:19:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 393385D9CC;
 Fri,  5 Feb 2021 09:19:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 4/5] travis.yml: (Re-)move the --enable-debug jobs
Date: Fri,  5 Feb 2021 10:18:56 +0100
Message-Id: <20210205091857.845389-5-thuth@redhat.com>
In-Reply-To: <20210205091857.845389-1-thuth@redhat.com>
References: <20210205091857.845389-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have similar jobs in the gitlab-CI ("build-some-softmmu" and
"build-user-plugins"), so let's switch one of them to use --enable-debug
instead of --enable-debug-tcg, then we can simply drop these jobs from
the Travis-CI.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml |  2 +-
 .travis.yml    | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 94c22ced7b..5926ec02a7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -404,7 +404,7 @@ build-some-softmmu:
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


