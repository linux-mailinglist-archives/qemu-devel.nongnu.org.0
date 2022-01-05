Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73248543A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:20:50 +0100 (CET)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n579g-0006sZ-LM
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:20:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56qB-0004fC-9s
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:36 -0500
Received: from [2a00:1450:4864:20::330] (port=51007
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q9-0006U0-3u
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id m20so1429320wmi.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MMlcDMWX7i/8NlFSGb6N2bBAn6uJ2qQ6KJW33Uocslo=;
 b=CcxGiP+8LbkBYlmxNnhqDyTojJLGm5OdX+8NSB+/wYNrhh0NTPhhBfgEmCyCfpftfC
 eIdp4J3bB8Zy/FKxYSXfL+B1hGnuImqI1+JOSOPCsxzIpRJy7F7pc1gFfDfCTlOBSwGI
 5QUv0JgBwGSl2EjN1dtXi+GsCJZPbnGU4Wfnz46ON8zybM38iHO52lAtElR+JgK5v5Ut
 g6FLcgVpTBG+4YQHIPmD+/zy+/aslNs1kb6Zy2tyQ6WjxqJjfJagWoDvT+MRNwdQNSOV
 ErJ8NI+fjFEN6NpCTycb8ZZN5u7wCwRDd8c+QLUVKV7M1bJM7vkZ0Z4XZ6dZY/e5mc+L
 /OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMlcDMWX7i/8NlFSGb6N2bBAn6uJ2qQ6KJW33Uocslo=;
 b=nH4cA+Le/qw8g4pvjKD5hKeWrJDetqLN8/l1u0okqwAuvmEiHznamA/eekSZaT4fsp
 XuMkEwkQ1+0QRko/RaF9Sg2HRxrbqQO6MidkjrXavI2bJwq9A2iaflQp0vqxLtKxYW0T
 iouRzGX0En8iBMvcI6Hiexc1GUDubHbmXbO6bigAhgCgUSBQ5ullblwAc8ivm6vqGRZv
 auKkFV9GKrU/0AMKjgMtvD17u/CFS7M94RK35CrFPUEfB69fsXLZKB3rYHM81MGwI7WD
 GmGhehrnqzjAsaUcwkS3G5k+2xIZ6GsPT4VmRxMiAEuK3waX+cdFuk4nccbXtnWEnKEa
 1Odg==
X-Gm-Message-State: AOAM531VWfk1afYchbgEG4L2Z5oezosJb/tcoBP9avXPoPwwxi4YPMa5
 0+5hIWWm51y0kx94sQRI88VwOw==
X-Google-Smtp-Source: ABdhPJzWwOS9B6eIAGNei0JaWgr1xOFATW1ewqRm78yJVhQzUfKrbE/unmjuf6LoYFGrPft8dM8A4g==
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr3050200wmk.13.1641391231776; 
 Wed, 05 Jan 2022 06:00:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e18sm49414216wrx.36.2022.01.05.06.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B03E31FFCA;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 18/34] tests/docker: auto-generate alpine.docker with
 lcitool
Date: Wed,  5 Jan 2022 13:49:53 +0000
Message-Id: <20220105135009.1584676-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-19-berrange@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 225 +++++++++++++------------
 tests/lcitool/refresh                  |   1 +
 2 files changed, 120 insertions(+), 106 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 0ac30c8014..97c7a88d1f 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,109 +1,122 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile alpine-edge qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
 
-FROM alpine:edge
+FROM docker.io/library/alpine:edge
 
-RUN apk update
-RUN apk upgrade
+RUN apk update && \
+    apk upgrade && \
+    apk add \
+        alsa-lib-dev \
+        attr-dev \
+        bash \
+        bc \
+        bzip2 \
+        bzip2-dev \
+        ca-certificates \
+        capstone-dev \
+        ccache \
+        cdrkit \
+        ceph-dev \
+        clang \
+        ctags \
+        curl-dev \
+        cyrus-sasl-dev \
+        dbus \
+        diffutils \
+        dtc-dev \
+        eudev-dev \
+        findutils \
+        g++ \
+        gcc \
+        gcovr \
+        gettext \
+        git \
+        glib-dev \
+        glib-static \
+        gnutls-dev \
+        gtk+3.0-dev \
+        libaio-dev \
+        libbpf-dev \
+        libcap-ng-dev \
+        libdrm-dev \
+        libepoxy-dev \
+        libffi-dev \
+        libgcrypt-dev \
+        libjpeg-turbo-dev \
+        libnfs-dev \
+        libpng-dev \
+        libseccomp-dev \
+        libselinux-dev \
+        libslirp-dev \
+        libssh-dev \
+        libtasn1-dev \
+        liburing-dev \
+        libusb-dev \
+        libxml2-dev \
+        linux-pam-dev \
+        llvm11 \
+        lttng-ust-dev \
+        lzo-dev \
+        make \
+        mesa-dev \
+        meson \
+        multipath-tools \
+        ncurses-dev \
+        ndctl-dev \
+        net-tools \
+        nettle-dev \
+        nmap-ncat \
+        numactl-dev \
+        openssh-client \
+        pcre-dev \
+        perl \
+        perl-test-harness \
+        pixman-dev \
+        pkgconf \
+        pulseaudio-dev \
+        py3-numpy \
+        py3-pillow \
+        py3-pip \
+        py3-sphinx \
+        py3-sphinx_rtd_theme \
+        py3-virtualenv \
+        py3-yaml \
+        python3 \
+        rpm2cpio \
+        samurai \
+        sdl2-dev \
+        sdl2_image-dev \
+        sed \
+        snappy-dev \
+        sparse \
+        spice-dev \
+        spice-protocol \
+        tar \
+        tesseract-ocr \
+        texinfo \
+        usbredir-dev \
+        util-linux \
+        vde2-dev \
+        virglrenderer-dev \
+        vte3-dev \
+        which \
+        xen-dev \
+        xfsprogs-dev \
+        zlib-dev \
+        zlib-static \
+        zstd-dev && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-	alsa-lib-dev \
-	attr-dev \
-	bash \
-	bc \
-	bzip2 \
-	bzip2-dev \
-	ca-certificates \
-	capstone-dev \
-	ccache \
-	cdrkit \
-	ceph-dev \
-	clang \
-	ctags \
-	curl-dev \
-	cyrus-sasl-dev \
-	dbus \
-	diffutils \
-	dtc-dev \
-	eudev-dev \
-	findutils \
-	g++ \
-	gcc \
-	gcovr \
-	gettext \
-	git \
-	glib-dev \
-	glib-static \
-	gnutls-dev \
-	gtk+3.0-dev \
-	libaio-dev \
-	libbpf-dev \
-	libcap-ng-dev \
-	libdrm-dev \
-	libepoxy-dev \
-	libffi-dev \
-	libgcrypt-dev \
-	libjpeg-turbo-dev \
-	libnfs-dev \
-	libpng-dev \
-	libseccomp-dev \
-	libselinux-dev \
-	libslirp-dev \
-	libssh-dev \
-	libtasn1-dev \
-	liburing-dev \
-	libusb-dev \
-	libxml2-dev \
-	linux-pam-dev \
-	llvm11 \
-	lttng-ust-dev \
-	lzo-dev \
-	make \
-	mesa-dev \
-	meson \
-	multipath-tools \
-	ncurses-dev \
-	ndctl-dev \
-	net-tools \
-	nettle-dev \
-	nmap-ncat \
-	numactl-dev \
-	openssh-client \
-	pcre-dev \
-	perl \
-	perl-test-harness \
-	pixman-dev \
-	pkgconf \
-	pulseaudio-dev \
-	py3-numpy \
-	py3-pillow \
-	py3-pip \
-	py3-sphinx \
-	py3-sphinx_rtd_theme \
-	py3-virtualenv \
-	py3-yaml \
-	python3 \
-	rpm2cpio \
-	samurai \
-	sdl2-dev \
-	sdl2_image-dev \
-	sed \
-	snappy-dev \
-	sparse \
-	spice-dev \
-	spice-protocol \
-	tar \
-	tesseract-ocr \
-	texinfo \
-	usbredir-dev \
-	util-linux \
-	vde2-dev \
-	virglrenderer-dev \
-	vte3-dev \
-	which \
-	xen-dev \
-	xfsprogs-dev \
-	zlib-dev \
-	zlib-static \
-	zstd-dev
-
-RUN apk add $PACKAGES
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index b8cf0a7386..033120e223 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -84,6 +84,7 @@ try:
    generate_dockerfile("ubuntu2004", "ubuntu-2004",
                        trailer="".join(ubuntu2004_tsanhack))
    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
+   generate_dockerfile("alpine", "alpine-edge")
 
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
-- 
2.30.2


