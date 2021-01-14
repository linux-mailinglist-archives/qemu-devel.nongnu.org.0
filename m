Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5A2F61C4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:21:31 +0100 (CET)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02Z8-0001mF-1W
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02Hy-0002Ev-ON
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02Hw-0008Ch-5i
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBAJRddmGsx/0+bc0fByKDmssYmqTpweE8RoPGGqb1M=;
 b=bNL9RRin3YYuFtIAM/0xI9liU2oA5Ne9C8wissvcQXGhqcVslbq2CzWhNTIzTgqSOvlgba
 pS68yne4UFo9nGk0pLWOUkw5ewNkBp4eNRdS9ycZPDRLypYwFpE5bjY1ffCpDerFWDvhDp
 gGvjdHkPf6Hzs6dM35ZNUKO7otqsPwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-6BG1wCN_MkywixW6xg1QsA-1; Thu, 14 Jan 2021 08:03:41 -0500
X-MC-Unique: 6BG1wCN_MkywixW6xg1QsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F97CCE642;
 Thu, 14 Jan 2021 13:03:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F29A15F9B5;
 Thu, 14 Jan 2021 13:03:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/25] tests/docker: remove ubuntu container
Date: Thu, 14 Jan 2021 13:02:45 +0000
Message-Id: <20210114130245.1654081-26-berrange@redhat.com>
In-Reply-To: <20210114130245.1654081-1-berrange@redhat.com>
References: <20210114130245.1654081-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This duplicates the ubuntu2004 container but with an inconsistent set of
packages.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/containers.yml            |  5 --
 tests/docker/dockerfiles/ubuntu.docker | 69 --------------------------
 2 files changed, 74 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 910754a699..fbc259f91e 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -242,11 +242,6 @@ amd64-ubuntu2004-container:
   variables:
     NAME: ubuntu2004
 
-amd64-ubuntu-container:
-  <<: *container_job_definition
-  variables:
-    NAME: ubuntu
-
 amd64-opensuse-leap-container:
   <<: *container_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
deleted file mode 100644
index 752e1aa105..0000000000
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ /dev/null
@@ -1,69 +0,0 @@
-#
-# Latest Ubuntu Release
-#
-# Useful for testing against relatively bleeding edge libraries and
-# compilers. We also have seperate recipe for the most recent LTS
-# release.
-#
-# When updating use the full tag not :latest otherwise the build
-# system won't pick up that it has changed.
-#
-
-FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES \
-    ccache \
-    clang \
-    dbus \
-    gcc \
-    gettext \
-    git \
-    glusterfs-common \
-    libaio-dev \
-    libattr1-dev \
-    libbrlapi-dev \
-    libbz2-dev \
-    libcacard-dev \
-    libcap-ng-dev \
-    libcurl4-gnutls-dev \
-    libdrm-dev \
-    libepoxy-dev \
-    libfdt-dev \
-    libgbm-dev \
-    libgnutls28-dev \
-    libgtk-3-dev \
-    libibverbs-dev \
-    libiscsi-dev \
-    libjemalloc-dev \
-    libjpeg-turbo8-dev \
-    liblzo2-dev \
-    libncurses5-dev \
-    libncursesw5-dev \
-    libnfs-dev \
-    libnuma-dev \
-    libpixman-1-dev \
-    libpng-dev \
-    librados-dev \
-    librbd-dev \
-    librdmacm-dev \
-    libsasl2-dev \
-    libsdl2-dev \
-    libseccomp-dev \
-    libsnappy-dev \
-    libspice-protocol-dev \
-    libspice-server-dev \
-    libssh-dev \
-    libusb-1.0-0-dev \
-    libusbredirhost-dev \
-    libvdeplug-dev \
-    libvte-2.91-dev \
-    libxen-dev \
-    libzstd-dev \
-    make \
-    ninja-build \
-    python3-yaml \
-    python3-sphinx \
-    sparse \
-    xfslibs-dev
-RUN apt-get update && \
-    DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.29.2


