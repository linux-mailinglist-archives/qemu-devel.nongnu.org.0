Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E73B1C73
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:28:27 +0200 (CEST)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3re-0001XT-OA
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3nO-0001vn-Qj
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3nN-0006bm-2n
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624458240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nticOzzWWpsN5TTVUneCWtVTNH+d4VMEgRE01qInZc0=;
 b=NU9aheremHWnkxRFkS3G/aZ33bJvHSTUdsmTD1wiaFWvxjXen+tbmYaheIx5H7D4XTk7dp
 3yFG2uASfrUe69Hdsbq/ehrkVYOmDmRReFZG6H2vlBlM5In/sV/dn62fxoiISgiedJLfOn
 E+pMn+QpAhBojg5m7pHtSMPVPaoWfoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-IhmzDuHYPG6yqFbyihpWAg-1; Wed, 23 Jun 2021 10:23:59 -0400
X-MC-Unique: IhmzDuHYPG6yqFbyihpWAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2E8618D6A2A;
 Wed, 23 Jun 2021 14:23:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2164F60916;
 Wed, 23 Jun 2021 14:23:47 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/22] tests/docker: expand centos8 package list
Date: Wed, 23 Jun 2021 15:22:34 +0100
Message-Id: <20210623142245.307776-12-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
 tests/docker/dockerfiles/centos8.docker | 68 +++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 5f1c57b4ad..4cc4c0c8a1 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -3,36 +3,104 @@ FROM docker.io/centos:8
 RUN dnf -y update
 ENV PACKAGES \
     SDL2-devel \
+    alsa-lib-devel \
+    bc \
+    brlapi-devel \
     bzip2 \
     bzip2-devel \
+    ca-certificates \
+    capstone-devel \
+    ccache \
+    clang \
+    ctags \
+    cyrus-sasl-devel \
+    daxctl-devel \
     dbus-daemon \
+    device-mapper-multipath-devel \
     diffutils \
+    findutils \
     gcc \
     gcc-c++ \
     genisoimage \
     gettext \
     git \
     glib2-devel \
+    glibc-langpack-en \
+    glibc-static \
+    glusterfs-api-devel \
+    gnutls-devel \
+    gtk3-devel \
+    hostname \
+    jemalloc-devel \
     libaio-devel \
+    libasan \
+    libattr-devel \
     libbpf-devel \
+    libcacard-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
     libffi-devel \
     libgcrypt-devel \
+    libiscsi-devel \
+    libjpeg-devel \
+    libnfs-devel \
+    libpmem-devel \
+    libpng-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libslirp-devel \
+    libssh-devel \
+    libtasn1-devel \
+    libubsan \
+    libudev-devel \
+    libusbx-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
     lzo-devel \
     make \
     mesa-libgbm-devel \
+    ncurses-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
+    numactl-devel \
+    openssh-clients \
+    pam-devel \
+    perl \
     perl-Test-Harness \
     pixman-devel \
+    pkgconfig \
+    pulseaudio-libs-devel \
     python3 \
+    python3-PyYAML \
+    python3-numpy \
+    python3-pillow \
+    python3-pip \
+    python3-setuptools \
+    python3-sphinx \
+    python3-sphinx_rtd_theme \
+    python3-virtualenv \
+    python3-wheel \
     rdma-core-devel \
+    rpm \
+    sed \
+    snappy-devel \
     spice-protocol \
     spice-server-devel \
+    systemd-devel \
     systemtap-sdt-devel \
     tar \
+    texinfo \
+    usbredir-devel \
+    util-linux \
+    virglrenderer-devel \
+    vte291-devel \
+    which \
+    xfsprogs-devel \
     zlib-devel
 
 RUN dnf install -y dnf-plugins-core && \
-- 
2.31.1


