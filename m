Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F916EA71C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:36:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9S-00005D-Lu; Fri, 21 Apr 2023 05:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9R-0008Vl-2x
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9N-00035g-4t
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+PTFHqqlU3/xSLss1G2SG/vMkPEIyxDAqDr4X3EZpbY=;
 b=dLE+gj5Tr7tkFONq06CB/WvKRQ4dLfzyQXPZ5D2NK1FMRFNF8xuFL2oUL9zF8uBfZGGDIv
 OKVjf2U6p2K/eTVhxBRIL2aYAQg74SX5A+4zcbGkGI/cQVgyMiL497Qaquuy+x0nLEtJQL
 j4NPyGIqw1ovqAoKmGkO7O6vUI8T6rc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-a_-NOxrbPyCSXw4hp0q1mw-1; Fri, 21 Apr 2023 05:33:50 -0400
X-MC-Unique: a_-NOxrbPyCSXw4hp0q1mw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94f2d9389afso116958366b.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069628; x=1684661628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PTFHqqlU3/xSLss1G2SG/vMkPEIyxDAqDr4X3EZpbY=;
 b=eGVswDa9F78dxFv486nQwtEYfYai/ChXXpRx08/O/vl8Bg32XMKzj4NYIpV7ccb41g
 thbbrfZDW57Vh8IXPvIs9KPNCV4XrYMVLyyJ8vKZMESsHRjF61Kzkh3/EDwmNSsFTcmK
 cAgmEHDHEp9/Bv/CWFDa9CJsoCb2dyhvC5PpHMO/1duzQzF9dLDzNc10eBnbOH8apeN0
 dGV7e/SEfpUO/G2DkCfuHiHDkaYJiRFsVYyb9OC0V2FbvDW75njiCxM46rGfR2fSK+cx
 8g5IeS+uPzEDhr1QlfnILbgI7l+DQLvM+6gPBjNwi4dUU0Z1yOy47T2oa+JLFQ5BU9HZ
 C/0w==
X-Gm-Message-State: AAQBX9eE72eR/fMmd3Ciqhk7TBgFNtTP1N7/hgQcumc/IswG0YVxWu0H
 y7+pVqv2npzGNG4l8saVHuu8HnRQ3rk90GBzBAKvZfleO1xqFk/EsvXsgcdSBEZA43LawsBc/Yb
 D0AvQisPxJqn7SWMEH+t7MU64ivM0OuNOTMLzZWSIOIHpuUqMgoip7tOgYUPLvWNmqwpkZBxX4q
 S8sQ==
X-Received: by 2002:a17:906:3fc4:b0:94e:be0:97 with SMTP id
 k4-20020a1709063fc400b0094e0be00097mr1583819ejj.26.1682069628633; 
 Fri, 21 Apr 2023 02:33:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKb/QoEtC04whwvfimUGuvoOdMQ31YvfVrngXcWYeev3FNJVlcmudv7xVD77rQ+Y6tAOzsow==
X-Received: by 2002:a17:906:3fc4:b0:94e:be0:97 with SMTP id
 k4-20020a1709063fc400b0094e0be00097mr1583812ejj.26.1682069628304; 
 Fri, 21 Apr 2023 02:33:48 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a170906494500b0094eaa31aa63sm1824418ejt.77.2023.04.21.02.33.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/25] coverity: unify Fedora dockerfiles
Date: Fri, 21 Apr 2023 11:33:13 +0200
Message-Id: <20230421093316.17941-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Fedora CI and coverity runs are using a slightly different set of
packages.  Copy most of the content over from tests/docker while
keeping the commands at the end that unpack the tools.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230331174844.376300-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/coverity-scan.docker | 250 ++++++++++++---------
 1 file changed, 145 insertions(+), 105 deletions(-)

diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index 6f60a52d2315..a349578526da 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -15,112 +15,152 @@
 # The work of actually doing the build is handled by the
 # run-coverity-scan script.
 
-FROM fedora:30
-ENV PACKAGES \
-    alsa-lib-devel \
-    bc \
-    brlapi-devel \
-    bzip2 \
-    bzip2-devel \
-    ccache \
-    clang \
-    curl \
-    cyrus-sasl-devel \
-    dbus-daemon \
-    device-mapper-multipath-devel \
-    findutils \
-    gcc \
-    gcc-c++ \
-    gettext \
-    git \
-    glib2-devel \
-    glusterfs-api-devel \
-    gnutls-devel \
-    gtk3-devel \
-    hostname \
-    libaio-devel \
-    libasan \
-    libattr-devel \
-    libblockdev-mpath-devel \
-    libcap-devel \
-    libcap-ng-devel \
-    libcurl-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libgbm-devel \
-    libiscsi-devel \
-    libjpeg-devel \
-    libpmem-devel \
-    libnfs-devel \
-    libpng-devel \
-    librbd-devel \
-    libseccomp-devel \
-    libssh-devel \
-    libubsan \
-    libudev-devel \
-    libusbx-devel \
-    libzstd-devel \
-    llvm \
-    lzo-devel \
-    make \
-    mingw32-bzip2 \
-    mingw32-curl \
-    mingw32-glib2 \
-    mingw32-gmp \
-    mingw32-gnutls \
-    mingw32-gtk3 \
-    mingw32-libjpeg-turbo \
-    mingw32-libpng \
-    mingw32-libtasn1 \
-    mingw32-nettle \
-    mingw32-nsis \
-    mingw32-pixman \
-    mingw32-pkg-config \
-    mingw32-SDL2 \
-    mingw64-bzip2 \
-    mingw64-curl \
-    mingw64-glib2 \
-    mingw64-gmp \
-    mingw64-gnutls \
-    mingw64-gtk3 \
-    mingw64-libjpeg-turbo \
-    mingw64-libpng \
-    mingw64-libtasn1 \
-    mingw64-nettle \
-    mingw64-pixman \
-    mingw64-pkg-config \
-    mingw64-SDL2 \
-    ncurses-devel \
-    nettle-devel \
-    numactl-devel \
-    perl \
-    perl-Test-Harness \
-    pixman-devel \
-    pulseaudio-libs-devel \
-    python3 \
-    python3-sphinx \
-    PyYAML \
-    rdma-core-devel \
-    SDL2-devel \
-    snappy-devel \
-    sparse \
-    spice-server-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    usbredir-devel \
-    virglrenderer-devel \
-    vte291-devel \
-    wget \
-    which \
-    xen-devel \
-    xfsprogs-devel \
-    zlib-devel
-ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
+FROM registry.fedoraproject.org/fedora:37
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
-ENV PATH $PATH:/usr/libexec/python3-sphinx/
+RUN dnf install -y nosync && \
+    echo -e '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               SDL2-devel \
+               SDL2_image-devel \
+               alsa-lib-devel \
+               bash \
+               bc \
+               bison \
+               brlapi-devel \
+               bzip2 \
+               bzip2-devel \
+               ca-certificates \
+               capstone-devel \
+               ccache \
+               clang \
+               ctags \
+               cyrus-sasl-devel \
+               daxctl-devel \
+               dbus-daemon \
+               device-mapper-multipath-devel \
+               diffutils \
+               findutils \
+               flex \
+               fuse3-devel \
+               gcc \
+               gcc-c++ \
+               gcovr \
+               genisoimage \
+               gettext \
+               git \
+               glib2-devel \
+               glib2-static \
+               glibc-langpack-en \
+               glibc-static \
+               glusterfs-api-devel \
+               gnutls-devel \
+               gtk3-devel \
+               hostname \
+               jemalloc-devel \
+               json-c-devel \
+               libaio-devel \
+               libasan \
+               libattr-devel \
+               libbpf-devel \
+               libcacard-devel \
+               libcap-ng-devel \
+               libcmocka-devel \
+               libcurl-devel \
+               libdrm-devel \
+               libepoxy-devel \
+               libfdt-devel \
+               libffi-devel \
+               libgcrypt-devel \
+               libiscsi-devel \
+               libjpeg-devel \
+               libnfs-devel \
+               libpmem-devel \
+               libpng-devel \
+               librbd-devel \
+               libseccomp-devel \
+               libselinux-devel \
+               libslirp-devel \
+               libssh-devel \
+               libtasn1-devel \
+               libubsan \
+               liburing-devel \
+               libusbx-devel \
+               libzstd-devel \
+               llvm \
+               lttng-ust-devel \
+               lzo-devel \
+               make \
+               mesa-libgbm-devel \
+               meson \
+               ncurses-devel \
+               nettle-devel \
+               ninja-build \
+               nmap-ncat \
+               numactl-devel \
+               openssh-clients \
+               pam-devel \
+               pcre-static \
+               pixman-devel \
+               pkgconfig \
+               pulseaudio-libs-devel \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               rdma-core-devel \
+               rpm \
+               sed \
+               snappy-devel \
+               socat \
+               sparse \
+               spice-protocol \
+               spice-server-devel \
+               systemd-devel \
+               systemtap-sdt-devel \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               usbredir-devel \
+               util-linux \
+               virglrenderer-devel \
+               vte291-devel \
+               which \
+               xen-devel \
+               xfsprogs-devel \
+               zlib-devel \
+               zlib-static \
+               zstd && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV QEMU_CONFIGURE_OPTS --meson=internal
+
+RUN dnf install -y curl wget
 ENV COVERITY_TOOL_BASE=/coverity-tools
 COPY coverity_tool.tgz coverity_tool.tgz
 RUN mkdir -p /coverity-tools/coverity_tool && cd /coverity-tools/coverity_tool && tar xf /coverity_tool.tgz
-- 
2.40.0


