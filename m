Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0A4854C7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:41:55 +0100 (CET)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57UA-0005yu-RX
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:41:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56qI-0004iD-3i
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:43 -0500
Received: from [2a00:1450:4864:20::42c] (port=38828
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q8-0006TY-4W
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:38 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e5so83219665wrc.5
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xpubTJRH9lTxGw7zAmxBhHX9d2pKsib5VDfaaD1dp9c=;
 b=vXNwY/8+e4GOjaQueuQfscmRp5J6GTFZA6TqUK/JY6ajeELKh4ALcF+/HWqbR9+4iy
 IG4Cw/71OX4SxARCX9bx8c5MooXEYkc7LS7w+qilxcM/VIODWfZ/0ymsmcTshU9wr0Ow
 PyP/Ssbyo4S/GRHrxXLXF0VsFHzib4hBo8vMx2Uhl+QfY7Pe79oHTuBwdlnp5TIFttGt
 aW7aSeh9eDwAw6sWNBtnXnfSNIdv9jS6V/XS5jKN6yv8dYRukMPEylIcBkN0Mws6jxZd
 mZhZ7xbkHuJ6CzokBPDDbMLt96UZWcNPNQZzrnBYPToKms0um+6DfIBtT0Pudf5lusUT
 GoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xpubTJRH9lTxGw7zAmxBhHX9d2pKsib5VDfaaD1dp9c=;
 b=ZjmkIwaudqtwTJvjdptytJ03Hp1OcalNO4Bt4PiuPmPGk7/2TGSp7L2eniZvVbVx+h
 i8kf5+NNm/zu2uy0zQUzPZzd8vA0n2G4+bBp0isfrQz9dQcfJHlwesbZ2U4bxxw7tfRN
 Y8GjlDGqV7xlumvSw1D/bKW0BI4c4izPstUPsTMgMbMIlN8LdAoywkVuzc3brvr9ke6N
 jNkfT/8MwLsRGDoyhG2MiHARi4GRyCS2wExJpBMRKFvf73U6/d3NjpxGED4vs6Ujvui5
 qoDyupAk2DT2/MUeNjQV7jRAbQ/yD7kVaMR5+yDXxn3kgDHDe1W/wOiW60fm1J161iRK
 DcLg==
X-Gm-Message-State: AOAM53195GpFwOGX/r2oSAfpOCDyg2vd3aq9M5viBbded7o0lwnBbLSc
 YlVTDSoR0avcWh4edrXdrc+wFQ==
X-Google-Smtp-Source: ABdhPJycihCLjw2NfYhR8S6ja1iislmAXkfmQD48Vs+sDk4SZ7jLc3BmWYwqlEvBM0SBNCYvX55+xA==
X-Received: by 2002:a05:6000:1188:: with SMTP id
 g8mr38357637wrx.134.1641391230244; 
 Wed, 05 Jan 2022 06:00:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v13sm579350wmh.45.2022.01.05.06.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A03591FFC9;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 17/34] tests/docker: fully expand the alpine package list
Date: Wed,  5 Jan 2022 13:49:52 +0000
Message-Id: <20220105135009.1584676-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Add many extra alpine packages to cover the various optional QEMU build
dependencies pulled in by other dockerfiles.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-18-berrange@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 58 +++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

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


