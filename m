Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE939837C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:47:01 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLae-0006rR-60
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQj-0000P0-SX
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQg-0003zg-Vt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tk7gOjNMAoq9H82e9hUgPYM7etsgjR/Q+zBY/+tUdPo=;
 b=UQLR1Y1SPzdLworPCBTCzX00HP2yV+F6SJUrQc3Pf+V3amYgrx9NxL1++4QT5bIkTlNRGR
 eIC7GMa2uGa1AjHrv+FCbNjsR9IRyCLyvQqLUDWizmgeBqAUxMs/heB7RZAcBDYDumAUa6
 Ain3eUm3Ew2gPSpg8Zn5CNXmXjulbNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-2WtaLs19NCyHgm_2NMk7Yg-1; Wed, 02 Jun 2021 03:36:39 -0400
X-MC-Unique: 2WtaLs19NCyHgm_2NMk7Yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51AFD801106;
 Wed,  2 Jun 2021 07:36:38 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233B95C648;
 Wed,  2 Jun 2021 07:36:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/17] tests/docker: drop CentOS 7 container
Date: Wed,  2 Jun 2021 09:36:03 +0200
Message-Id: <20210602073606.338994-15-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210514120415.1368922-10-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/containers.yml             |  5 ---
 tests/docker/dockerfiles/centos7.docker | 43 -------------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/centos7.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index bd01ae8f80..a369bb16aa 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -7,11 +7,6 @@ amd64-alpine-container:
   variables:
     NAME: alpine
 
-amd64-centos7-container:
-  extends: .container_job_template
-  variables:
-    NAME: centos7
-
 amd64-debian11-container:
   extends: .container_job_template
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
2.27.0


