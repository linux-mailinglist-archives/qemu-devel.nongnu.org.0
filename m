Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53143D5EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:55:08 +0200 (CEST)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82we-0006ZS-04
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m82uk-0003sn-5n
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:53:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m82uf-000306-Io
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627314784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOVxnxH4jLRd4XBrsp46XeNsK/LbJ38Nw7hf2N9ZYO0=;
 b=NCoci8+hjlz1A5uxos2qFHy51N1LvtWs9pmlcJ9TYsrIMSdQwrmD67HObYaNSaJlZUeIBB
 W1V4RNU7uo20cGykONpr0OTBrntbwFVsWYWd0m1JsH0W62UW5+Rug3ZlRFPRsSFK6Zt+mo
 kuFEw3bnrnIK+OMHkA3P4DU+lf95PsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-Hak-svUlMgGqvLJw-O8nSA-1; Mon, 26 Jul 2021 11:53:03 -0400
X-MC-Unique: Hak-svUlMgGqvLJw-O8nSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55BA71936B60;
 Mon, 26 Jul 2021 15:53:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D4441899A;
 Mon, 26 Jul 2021 15:52:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 81DA71800906; Mon, 26 Jul 2021 17:52:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] ci: build & store guest agent msi
Date: Mon, 26 Jul 2021 17:52:34 +0200
Message-Id: <20210726155235.2249878-3-kraxel@redhat.com>
In-Reply-To: <20210726155235.2249878-1-kraxel@redhat.com>
References: <20210726155235.2249878-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build guest agent windows msi install package in gitlab CI,
store the result as artifact.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml               | 3 ++-
 .gitlab-ci.d/crossbuilds.yml                       | 2 ++
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 7d3ad00a1eb9..12f78e81de0d 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -12,9 +12,10 @@
           mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
-      then make installer;
+      then make installer msi;
       version="$(git describe --match v[0-9]*)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
+      mv -v qga/*.msi $(basename qga/*.msi .msi)-${version}.msi;
       fi
 
 # Job to cross-build specific accelerators.
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 4ff3aa3cfcdd..fc14a1cf5c10 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -163,6 +163,7 @@ cross-win32-system:
   artifacts:
     paths:
       - build/qemu-setup*.exe
+      - build/qemu-ga*.msi
 
 cross-win64-system:
   extends: .cross_system_build_job
@@ -173,6 +174,7 @@ cross-win64-system:
   artifacts:
     paths:
       - build/qemu-setup*.exe
+      - build/qemu-ga*.msi
 
 cross-amd64-xen-only:
   extends: .cross_accel_build_job
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 5a03e1af43ac..f198927ef56b 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -28,6 +28,7 @@ ENV PACKAGES \
     mingw32-pixman \
     mingw32-pkg-config \
     mingw32-SDL2 \
+    msitools \
     perl \
     perl-Test-Harness \
     python3 \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index d3f13666e82e..fc0b3bf02eff 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -25,6 +25,7 @@ ENV PACKAGES \
     mingw64-libtasn1 \
     mingw64-pixman \
     mingw64-pkg-config \
+    msitools \
     perl \
     perl-Test-Harness \
     python3 \
-- 
2.31.1


