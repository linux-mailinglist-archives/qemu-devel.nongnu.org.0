Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91F37A7B3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:33:33 +0200 (CEST)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSVw-00086u-9M
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSR2-0000Dj-0N
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQz-00016y-I5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620739705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nIlbxyQsMUyY8h/WtrFC4FDGoycPbkHNL6GOI7oEKc=;
 b=DnEkpgx4wjZ1CHSzrWC+rHQ98/itMHgyQzYj+XgAsrMe/fFh3tmH5LmyYskalVaLw/imBp
 7YHW//GBZVs0pNoAwv/TbgW8RfInpwQFEPqoyDxIlP0uBWaYMyzLOcTRVc0OYhYmchVifU
 C8qgic6ae81eX3XtX9mDGz4bSYfFGAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-WesPgEcTMDmvUu_Z4BleaQ-1; Tue, 11 May 2021 09:28:23 -0400
X-MC-Unique: WesPgEcTMDmvUu_Z4BleaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55618803622;
 Tue, 11 May 2021 13:28:22 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7145946E;
 Tue, 11 May 2021 13:28:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] tests/docker: drop CentOS 7 container
Date: Tue, 11 May 2021 14:26:38 +0100
Message-Id: <20210511132641.1022161-10-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/containers.yml             |  5 ---
 tests/docker/dockerfiles/centos7.docker | 43 -------------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/centos7.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e23..0fd792dbe7 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -26,11 +26,6 @@ amd64-alpine-container:
   variables:
     NAME: alpine
 
-amd64-centos7-container:
-  <<: *container_job_definition
-  variables:
-    NAME: centos7
-
 amd64-centos8-container:
   <<: *container_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
deleted file mode 100644
index 75fdb53c7c..0000000000
--- a/tests/docker/dockerfiles/centos7.docker
+++ /dev/null
@@ -1,43 +0,0 @@
-FROM centos:7
-RUN yum install -y epel-release centos-release-xen-48
-
-RUN yum -y update
-
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    bzip2 \
-    bzip2-devel \
-    ccache \
-    csnappy-devel \
-    dbus-daemon \
-    gcc-c++ \
-    gcc \
-    gettext \
-    git \
-    glib2-devel \
-    glibc-static \
-    gnutls-devel \
-    libaio-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libgcrypt-devel \
-    librdmacm-devel \
-    libzstd-devel \
-    lzo-devel \
-    make \
-    mesa-libEGL-devel \
-    mesa-libgbm-devel \
-    nettle-devel \
-    ninja-build \
-    perl-Test-Harness \
-    pixman-devel \
-    python3 \
-    SDL2-devel \
-    spice-glib-devel \
-    spice-server-devel \
-    tar \
-    vte-devel \
-    xen-devel \
-    zlib-devel
-RUN yum install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.31.1


