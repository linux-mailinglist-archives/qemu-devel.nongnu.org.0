Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCF2F61F5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:28:55 +0100 (CET)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02gI-0000Jb-V5
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02Hd-0001mJ-Ko
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HW-00082J-Ql
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pco3wd892b3rPiQXleEnRz3Fn+ErX56/c8FFSNaznBU=;
 b=eICG0hI6e/A5m+qsnMHmS4qA98YEP2rLgNWAL87bUnb2t5c/pzWQB/UjGyJtHdR11QVXhO
 POs0D8h7CchNaVJ+aCMa+geFoA84POanfcEXtCB0UQyJz6iwGKRzKeD5MQ8dgSgqd0SVyU
 n3vLVduuFMgmhwjNIkH3lvK5z2GJwO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-azoLjFGqPzChCVIVanUcqQ-1; Thu, 14 Jan 2021 08:03:16 -0500
X-MC-Unique: azoLjFGqPzChCVIVanUcqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483881005D58;
 Thu, 14 Jan 2021 13:03:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91C4E5C276;
 Thu, 14 Jan 2021 13:03:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/25] tests/docker: expand centos7 package list
Date: Thu, 14 Jan 2021 13:02:33 +0000
Message-Id: <20210114130245.1654081-14-berrange@redhat.com>
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
 tests/docker/dockerfiles/centos7.docker | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 1eb3455144..d2daaae25b 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -6,37 +6,95 @@ RUN yum -y update
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     SDL2-devel \
+    alsa-lib-devel \
+    bc \
+    brlapi-devel \
     bzip2 \
     bzip2-devel \
+    ca-certificates \
+    capstone-devel \
     ccache \
+    clang \
+    cyrus-sasl-devel \
+    daxctl-devel \
     dbus \
+    device-mapper-multipath-devel \
+    diffutils \
+    findutils \
     gcc \
     gcc-c++ \
+    genisoimage \
     gettext \
     git \
     glib2-devel \
+    glibc-common \
+    glusterfs-api-devel \
     gnutls-devel \
+    gtk3-devel \
+    hostname \
     libaio-devel \
+    libasan \
+    libattr-devel \
     libcacard-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
     libgcrypt-devel \
+    libiscsi-devel \
+    libjpeg-devel \
+    libnfs-devel \
+    libpmem-devel \
+    libpng-devel \
+    librbd1-devel \
+    libseccomp-devel \
+    libssh-devel \
+    libtasn1-devel \
+    libudev-devel \
+    libusbx-devel \
+    libxml2-devel \
     libzstd-devel \
     lzo-devel \
     make \
     mesa-libgbm-devel \
+    ncurses-devel \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
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
+    python3-virtualenv \
+    python3-wheel \
     rdma-core-devel \
+    rpm \
+    sed \
     snappy-devel \
     spice-protocol \
     spice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
     tar \
+    texinfo \
+    usbredir-devel \
+    vim-minimal \
     vte291-devel \
+    which \
     xen-devel \
+    xfsprogs-devel \
     zlib-devel
 RUN yum install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.29.2


