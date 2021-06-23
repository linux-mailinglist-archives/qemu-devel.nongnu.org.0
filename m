Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBF3B1C81
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:30:21 +0200 (CEST)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3tU-00077x-Oy
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3nd-0002Hq-Cy
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3nX-0006eY-MP
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624458249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaN2m5JiQIVdrJvMPUrC1RRlEFFL1/zV3RqkzWAqnuE=;
 b=eQku+NxmGU01b+LmqWxhfD39zpSnF6bUP322XtP0Ifs88KWjKtNXTRt2qBZHBySLWANCYW
 bkQXG2JzV1RQgiWgySlTpL+Sq+qUMefQ1VC/VZZfLIep2h59K+WUdcAFVHYJJO11ermQPZ
 O1YmEYZeIT7ijr6thpyqXTzF0pPLE6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-uXG858IcOtyOssLM-l6WVg-1; Wed, 23 Jun 2021 10:24:08 -0400
X-MC-Unique: uXG858IcOtyOssLM-l6WVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DA4D18D6A2C;
 Wed, 23 Jun 2021 14:24:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96B1A60871;
 Wed, 23 Jun 2021 14:24:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/22] tests/docker: expand ubuntu2004 package list
Date: Wed, 23 Jun 2021 15:22:37 +0100
Message-Id: <20210623142245.307776-15-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-1-berrange@redhat.com>
References: <20210623142245.307776-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/ubuntu2004.docker | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 25f56adfb2..39de63d012 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,25 +1,44 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
+    bc \
     bsdmainutils \
+    bzip2 \
+    ca-certificates \
     ccache \
     clang \
+    dbus \
+    debianutils \
+    diffutils \
+    exuberant-ctags \
+    findutils \
+    g++ \
     gcc \
     gcovr \
     genisoimage \
     gettext \
     git \
+    hostname \
     libaio-dev \
+    libasan5 \
+    libasound2-dev \
     libattr1-dev \
     libbrlapi-dev \
     libbz2-dev \
+    libc6-dev \
     libcacard-dev \
     libcap-ng-dev \
+    libcapstone-dev \
     libcurl4-gnutls-dev \
+    libdaxctl-dev \
     libdrm-dev \
     libepoxy-dev \
     libfdt-dev \
     libffi-dev \
     libgbm-dev \
+    libgcrypt20-dev \
+    libglib2.0-dev \
+    libglusterfs-dev \
+    libgnutls28-dev \
     libgtk-3-dev \
     libibverbs-dev \
     libiscsi-dev \
@@ -30,39 +49,66 @@ ENV PACKAGES \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
+    libpam0g-dev \
     libpixman-1-dev \
+    libpmem-dev \
+    libpng-dev \
+    libpulse-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
     libsdl2-dev \
+    libsdl2-image-dev \
     libseccomp-dev \
     libslirp-dev \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
     libssh-dev \
+    libsystemd-dev \
+    libtasn1-6-dev \
+    libtest-harness-perl \
+    libubsan1 \
+    libudev-dev \
     libusb-1.0-0-dev \
     libusbredirhost-dev \
     libvdeplug-dev \
+    libvirglrenderer-dev \
     libvte-2.91-dev \
     libxen-dev \
+    libxml2-dev \
     libzstd-dev \
+    llvm \
+    locales \
     make \
+    multipath-tools \
     ncat \
+    nettle-dev \
     ninja-build \
+    openssh-client \
+    perl-base \
+    pkgconf \
+    python3 \
     python3-numpy \
     python3-opencv \
-    python3-pil \
+    python3-pillow \
     python3-pip \
+    python3-setuptools \
     python3-sphinx \
     python3-sphinx-rtd-theme \
     python3-venv \
+    python3-wheel \
     python3-yaml \
     rpm2cpio \
+    sed \
     sparse \
+    systemtap-sdt-dev \
+    tar \
     tesseract-ocr \
     tesseract-ocr-eng \
-    xfslibs-dev
+    texinfo \
+    xfslibs-dev \
+    zlib1g-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.31.1


