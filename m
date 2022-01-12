Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A650648C387
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:48:45 +0100 (CET)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c7Q-0005Mf-OG
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnK-00034M-NK
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:58 -0500
Received: from [2a00:1450:4864:20::435] (port=42717
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnJ-0003RV-1s
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id k30so3596451wrd.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ehf0xXT63ysDfIWbppUAeTK3EH4Vw7sIpy2PbV84xo=;
 b=gTaptAPUt4iUczEvxnmjQR9kaB3JZoat2yENf9nIxjhfYq22HUk2ZocwiFIGiAxMD3
 1mqdX3U12ap9ZFeKHuSQa4aULLZwfzCokMDh3bTQtAH+bz+SErMuXh2qx5xzzk0tJyrj
 oE1EY0IMREAq7iai0H3b9LEbd44BKGf59ecR2yX9M/djmCWgWAO2xY7gXG1+jcPbHOA4
 7jMW7ioFGOA7Tbj2uOYGEZhJF7vyANCYIM0GdtlQnx9H5CBipt7FgzEzXkw7zmwCcuOA
 ItAJroYQxKHuJFTn7vhB6ZdW2QstKhpwO5vXuMrXtP/LWCUdZZkByBT5gaJzjAFNt6v3
 5vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ehf0xXT63ysDfIWbppUAeTK3EH4Vw7sIpy2PbV84xo=;
 b=BswZr0OR+J4fhZ3jSOKwiGLv+CP/DmUVvrXlI86DVIFdxVnUHvMtqhjSPLYP9iwTur
 Wlhb9yAh7+8wZFF1mYsr862s2RycYbpspy8RcG/CJkPXPiLwBk2uEDfBkdhAU5aXxD3o
 KR9cxi6MjnqP0MRTclbwM10ZTV3XU4JjibTd+QkIMMSbdNoClyQZJEIySMvE8q9yTq7/
 8ScGpjjlW+ifNzqweMo7qpr31cYaBsWKY5Jcj1Y3uq8B7DPyjhwUpwWGocMsNZ0APhef
 efwvq0/qSkFhk7fjXbdMRx01HmTim9jzsrzrtIp1ZXANipgVrzOEvFSYGbVwTaBadMog
 bLZw==
X-Gm-Message-State: AOAM5329145MpR4siJlIX554X+Y/BAYxhqmPoLTmoJX0wswleyazTSX/
 jN+2PyJif0tXoljhTdBG0MDIbQ==
X-Google-Smtp-Source: ABdhPJwnpiVlEh/sZgNy0RHjEpA0uWJ+vXnfvR3XSwOhAmsXOIhhi48ydJle75n9vWpwefL1kuDy/w==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr7420992wrk.606.1641986875569; 
 Wed, 12 Jan 2022 03:27:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm3990052wmh.35.2022.01.12.03.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C64751FFC9;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/31] tests/docker: fully expand the alpine package list
Date: Wed, 12 Jan 2022 11:27:08 +0000
Message-Id: <20220112112722.3641051-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Add many extra alpine packages to cover the various optional QEMU build
dependencies pulled in by other dockerfiles.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-18-berrange@redhat.com>
Message-Id: <20220105135009.1584676-18-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index ca4b3b58d2..0ac30c8014 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -7,11 +7,29 @@ RUN apk upgrade
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
 	alsa-lib-dev \
+	attr-dev \
 	bash \
+	bc \
+	bzip2 \
+	bzip2-dev \
+	ca-certificates \
+	capstone-dev \
 	ccache \
+	cdrkit \
+	ceph-dev \
+	clang \
+	ctags \
 	curl-dev \
+	cyrus-sasl-dev \
+	dbus \
+	diffutils \
+	dtc-dev \
+	eudev-dev \
+	findutils \
 	g++ \
 	gcc \
+	gcovr \
+	gettext \
 	git \
 	glib-dev \
 	glib-static \
@@ -20,34 +38,72 @@ ENV PACKAGES \
 	libaio-dev \
 	libbpf-dev \
 	libcap-ng-dev \
+	libdrm-dev \
+	libepoxy-dev \
 	libffi-dev \
+	libgcrypt-dev \
 	libjpeg-turbo-dev \
 	libnfs-dev \
 	libpng-dev \
 	libseccomp-dev \
+	libselinux-dev \
+	libslirp-dev \
 	libssh-dev \
+	libtasn1-dev \
+	liburing-dev \
 	libusb-dev \
 	libxml2-dev \
+	linux-pam-dev \
+	llvm11 \
+	lttng-ust-dev \
 	lzo-dev \
 	make \
 	mesa-dev \
 	meson \
+	multipath-tools \
 	ncurses-dev \
+	ndctl-dev \
+	net-tools \
+	nettle-dev \
+	nmap-ncat \
+	numactl-dev \
+	openssh-client \
+	pcre-dev \
 	perl \
+	perl-test-harness \
+	pixman-dev \
+	pkgconf \
 	pulseaudio-dev \
+	py3-numpy \
+	py3-pillow \
+	py3-pip \
 	py3-sphinx \
 	py3-sphinx_rtd_theme \
+	py3-virtualenv \
+	py3-yaml \
 	python3 \
+	rpm2cpio \
 	samurai \
+	sdl2-dev \
+	sdl2_image-dev \
+	sed \
 	snappy-dev \
+	sparse \
 	spice-dev \
+	spice-protocol \
+	tar \
+	tesseract-ocr \
 	texinfo \
 	usbredir-dev \
+	util-linux \
 	vde2-dev \
 	virglrenderer-dev \
 	vte3-dev \
+	which \
+	xen-dev \
 	xfsprogs-dev \
 	zlib-dev \
-	zlib-static
+	zlib-static \
+	zstd-dev
 
 RUN apk add $PACKAGES
-- 
2.30.2


