Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032B2CA9DC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:38:54 +0100 (CET)
Received: from localhost ([::1]:59174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9c5-0007l9-2u
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9J6-0004dq-0x
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9J3-000271-4q
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TtKhmk//A5RBodrNm8UWDEEHvTBB3U7lvD5DVNUqLk=;
 b=Ji/l1eqDN0w0KKNH4Y7NL0ydvE1a0/sX/NgIln9XynvoKiYyGXgq2hMVJwFomWMP2jffvu
 1FIk4JXx+pwlab1AssWVevvvvaa+e8um1QPOYxV/VOWv5ULvHbMeOgb2x33fYS2omsU5EW
 obsewaC6AiBT6lKgCqec1X/B914dqUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-PCd7XnWjPdma-DI46l8ljA-1; Tue, 01 Dec 2020 12:19:08 -0500
X-MC-Unique: PCd7XnWjPdma-DI46l8ljA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB1BA101AFA9;
 Tue,  1 Dec 2020 17:19:06 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B84A5D9C2;
 Tue,  1 Dec 2020 17:19:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/23] tests/docker: expand fedora package list
Date: Tue,  1 Dec 2020 17:18:17 +0000
Message-Id: <20201201171825.2243775-16-berrange@redhat.com>
In-Reply-To: <20201201171825.2243775-1-berrange@redhat.com>
References: <20201201171825.2243775-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 566be0ee2b..318d5211b9 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -3,13 +3,17 @@ FROM registry.fedoraproject.org/fedora:32
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     SDL2-devel \
+    alsa-lib-devel \
     bc \
     brlapi-devel \
     bzip2 \
     bzip2-devel \
+    ca-certificates \
+    capstone-devel \
     ccache \
     clang \
     cyrus-sasl-devel \
+    daxctl-devel \
     dbus-daemon \
     device-mapper-multipath-devel \
     diffutils \
@@ -20,40 +24,55 @@ ENV PACKAGES \
     gettext \
     git \
     glib2-devel \
+    glibc-langpack-en \
     glusterfs-api-devel \
     gnutls-devel \
     gtk3-devel \
     hostname \
+    jemalloc-devel \
     libaio-devel \
     libasan \
     libattr-devel \
     libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
+    libgcrypt-devel \
     libiscsi-devel \
     libjpeg-devel \
+    libnfs-devel \
     libpmem-devel \
     libpng-devel \
     librbd-devel \
     libseccomp-devel \
+    libslirp-devel \
     libssh-devel \
+    libtasn1-devel \
     libubsan \
     libudev-devel \
+    liburing-devel \
     libusbx-devel \
     libxml2-devel \
     libzstd-devel \
+    lttng-ust-devel \
     lzo-devel \
     make \
+    mesa-libgbm-devel \
+    meson \
     ncurses-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
     numactl-devel \
+    openssh-clients \
+    pam-devel \
     perl \
     perl-Test-Harness \
     pixman-devel \
+    pkgconfig \
+    pulseaudio-libs-devel \
     python3 \
     python3-PyYAML \
     python3-numpy \
@@ -63,19 +82,24 @@ ENV PACKAGES \
     python3-sphinx \
     python3-virtualenv \
     rdma-core-devel \
+    rpm \
     snappy-devel \
     sparse \
+    spice-protocol \
     spice-server-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
     tesseract \
     tesseract-langpack-eng \
+    texinfo \
     usbredir-devel \
+    vim-minimal \
     virglrenderer-devel \
     vte291-devel \
     which \
     xen-devel \
+    xfsprogs-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
 
-- 
2.28.0


