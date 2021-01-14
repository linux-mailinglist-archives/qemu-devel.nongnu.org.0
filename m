Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB582F61AD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:17:43 +0100 (CET)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02VS-0006bt-HN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02Hq-0001t8-C1
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02Hj-00087a-GD
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guLJi+KOCX+ZyFP96fV+O+VL1BQzsYXK6q44WGSSO2Y=;
 b=SWmlBFvGDkESE/JilTDYIxl6y216/mt/5aopcAtOQ4x+KbiPOSEVupbu2BiK/gsG9JoS9i
 lQzniFPc7KiimjfYu7p3prAUdtcsdQkWTY6xDJ81S1V3ux1T0RyEV1eXgOKu3E+X64RHAu
 U+WVKcIraATF8UXsloe7OCD92uSlqmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-zoLbxeOXPlenNkOfbwEgzA-1; Thu, 14 Jan 2021 08:03:27 -0500
X-MC-Unique: zoLbxeOXPlenNkOfbwEgzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5DD180A09E;
 Thu, 14 Jan 2021 13:03:26 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D297E5F708;
 Thu, 14 Jan 2021 13:03:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/25] tests/docker: expand opensuse-leap package list
Date: Thu, 14 Jan 2021 13:02:38 +0000
Message-Id: <20210114130245.1654081-19-berrange@redhat.com>
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

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index ed194125a7..30c6e4e7d0 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -2,52 +2,103 @@ FROM registry.opensuse.org/opensuse/leap:15.2
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    Mesa-devel \
+    alsa-lib-devel \
     bc \
     brlapi-devel \
     bzip2 \
+    ca-certificates \
+    ccache \
+    clang \
     cyrus-sasl-devel \
+    dbus-1 \
+    diffutils \
+    findutils \
     gcc \
     gcc-c++ \
     gettext-runtime \
     git \
     glib2-devel \
+    glibc-locale \
     glusterfs-devel \
     gtk3-devel \
+    hostname \
+    jemalloc-devel \
     libSDL2-devel \
     libSDL2_image-devel \
     libaio-devel \
+    libasan6 \
     libattr-devel \
+    libbz2-devel \
+    libcacard-devel \
     libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
+    libgcrypt-devel \
     libgnutls-devel \
     libiscsi-devel \
     libjpeg8-devel \
+    libndctl-devel \
+    libnettle-devel \
+    libnfs-devel \
     libnuma-devel \
     libpixman-1-0-devel \
     libpmem-devel \
     libpng16-devel \
+    libpulse-devel \
     librbd-devel \
     libseccomp-devel \
     libspice-server-devel \
     libssh-devel \
+    libtasn1-devel \
+    libubsan1 \
+    libudev-devel \
+    libusb-1_0-devel \
+    libxml2-devel \
+    libzstd-devel \
+    lttng-ust-devel \
     lzo-devel \
     make \
     mkisofs \
+    ncat \
     ncurses-devel \
     ninja \
+    openssh \
+    pam-devel \
     perl \
+    perl-Test-Harness \
+    pkgconfig \
+    python3-Pillow \
+    python3-PyYAML \
+    python3-Sphinx \
     python3-base \
+    python3-numpy \
+    python3-opencv \
+    python3-pip \
+    python3-setuptools \
     python3-virtualenv \
+    python3-wheel \
     rdma-core-devel \
+    rpm \
+    sed \
     snappy-devel \
+    sparse \
+    spice-protocol-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    texinfo \
     usbredir-devel \
+    vim \
     virglrenderer-devel \
     vte-devel \
+    which \
     xen-devel \
+    xfsprogs-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
 
-- 
2.29.2


