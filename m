Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B52F15D7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:47:10 +0100 (CET)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxXJ-0004Sh-4r
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUF-0002gI-8Q
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxU3-00081p-UU
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lx7yfzIAsc+j44VKdD2TmI9qqKawn4ktirjHWj5aQeg=;
 b=app7J/+fvvNIQ/yy13yGi0sm1ACdtTlVQjm6U2jI26sNI7MTj1CYzMm/teGiN8700waTEq
 mQkl7T3nUv/+HaeKo9OeFMWzJZLOrg8z3JsnMOWt4o+JAlN4PuIkIGm2mYcmuS6fTd+Q4f
 6CotVIufuu9xzulHmnP0clNvvJU/eF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-W9H7ap9QNvOaVyHtyQYlYQ-1; Mon, 11 Jan 2021 08:43:42 -0500
X-MC-Unique: W9H7ap9QNvOaVyHtyQYlYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5AC5835DE0;
 Mon, 11 Jan 2021 13:43:40 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE2017C5F;
 Mon, 11 Jan 2021 13:43:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/15] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
Date: Mon, 11 Jan 2021 14:43:14 +0100
Message-Id: <20210111134328.157775-2-thuth@redhat.com>
In-Reply-To: <20210111134328.157775-1-thuth@redhat.com>
References: <20210111134328.157775-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Cho, Yu-Chen via" <qemu-devel@nongnu.org>

Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
Use openSUSE Leap 15.2 container image in the gitlab-CI.

Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201229085046.8536-1-acho@suse.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/containers.yml                   |  5 ++
 .gitlab-ci.yml                                | 31 +++++++++++
 tests/docker/dockerfiles/opensuse-leap.docker | 55 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 892ca8d838..910754a699 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -246,3 +246,8 @@ amd64-ubuntu-container:
   <<: *container_job_definition
   variables:
     NAME: ubuntu
+
+amd64-opensuse-leap-container:
+  <<: *container_job_definition
+  variables:
+    NAME: opensuse-leap
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 01c9e46410..4532f1718a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -200,6 +200,37 @@ acceptance-system-centos:
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
 
+build-system-opensuse:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: opensuse-leap
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensuse:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensuse:
+   <<: *native_test_job_definition
+   needs:
+     - job: build-system-opensuse
+       artifacts: true
+   variables:
+     IMAGE: opensuse-leap
+     MAKE_CHECK_ARGS: check-acceptance
+   <<: *acceptance_definition
+
+
 build-disabled:
   <<: *native_build_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
new file mode 100644
index 0000000000..0e64893e4a
--- /dev/null
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -0,0 +1,55 @@
+FROM opensuse/leap:15.2
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    cyrus-sasl-devel \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    libaio-devel \
+    libattr-devel \
+    libcap-ng-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    lzo-devel \
+    make \
+    libSDL2_image-devel \
+    ncurses-devel \
+    ninja \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python3-base \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    usbredir-devel \
+    virglrenderer-devel \
+    xen-devel \
+    vte-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
+
+RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.27.0


