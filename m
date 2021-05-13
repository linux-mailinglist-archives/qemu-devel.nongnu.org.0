Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41EA37F5A1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:32:07 +0200 (CEST)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8dS-00034m-PJ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh85l-00018y-7F
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh85Y-0007Pp-Lo
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9Al9z3vKdyL88IvdJppFBSY4pY47JlH+BjFm2p/x0M=;
 b=UqPJVtBV/zTG1uJWoQo/fonbOwJHHMQI6AAzoSWo3bpN0zvr+pneScpwtSgEmLRIVrJKwr
 qWso+pTOhSliutNBwOXM/7bsb5lX2XrbUqsw+UDtQ957KRJ4R9YUNKglNhEjV0Emk3wRnB
 4RLlzfvohIIYyZDs75y6CIQ7Suxa5eU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-KY6Bt7gTM7qPFXFqvYbDCA-1; Thu, 13 May 2021 05:57:02 -0400
X-MC-Unique: KY6Bt7gTM7qPFXFqvYbDCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B3331860C80;
 Thu, 13 May 2021 09:57:01 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9882A10074E5;
 Thu, 13 May 2021 09:56:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/22] tests/docker: remove ubuntu container
Date: Thu, 13 May 2021 10:55:19 +0100
Message-Id: <20210513095519.1213675-23-berrange@redhat.com>
In-Reply-To: <20210513095519.1213675-1-berrange@redhat.com>
References: <20210513095519.1213675-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This duplicates the ubuntu2004 container but with an inconsistent set of
packages.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/containers.yml            |  5 --
 tests/docker/dockerfiles/ubuntu.docker | 69 --------------------------
 2 files changed, 74 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e23..ed31ba2e2c 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -240,11 +240,6 @@ amd64-ubuntu2004-container:
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
2.31.1


