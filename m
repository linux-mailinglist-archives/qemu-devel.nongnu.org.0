Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB82F9A4C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:01:51 +0100 (CET)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OXu-0008Lc-IW
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OC8-0002qV-CA; Mon, 18 Jan 2021 01:39:20 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:48055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OC4-0007ZF-7t; Mon, 18 Jan 2021 01:39:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 318C615DB;
 Mon, 18 Jan 2021 01:39:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 01:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yDi3rR9AlpqoZ
 Pff7ititIXIq7aDJehwY82Gzczm7E0=; b=Xs1Xs32fAu+tIcIncKODym0Mbvxkv
 w4hiLo05Xll3jpwwYmrU9heNJn6jnJNXVHXIo3NPoVcRN00CDuNZstGfAwP85HXE
 WiymN5G6K0C8HSAT5tvAkEjIdoxyTDs6MmpqG2W/XfhcYMSSlJ0D2eedTJA7gemQ
 /tMg4Lztl/h5+zKirk5iIBq5bzCDFoiZ+HVqQJYzwHJqNaU8p2DR27X+o7zrfM1/
 fUXHeLZ5umI0KpBBIdrUQqGJVT2Zt019Pe/N2IAMYPzZuJDBYeQ168Zf0pe1hVdN
 kYmUjgHPaeY6RZ0JDOpqw8JIzEL24b9khvGYvJKODrmfggIHD97FCdFBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yDi3rR9AlpqoZPff7ititIXIq7aDJehwY82Gzczm7E0=; b=GbbUBH5e
 xFrVODVI70fe2WsmMF5YADHM+VCKPr7LdJH0ilRa7dxRbX664HU7EGHPDrRzfWk8
 jAG3S1CYDTClCTr4Gc+WK577qdhyCmlZgFOidkjsRJgZI1/PX/OtwliJE4ohjWrL
 /6PA42tqtq4Phxh+KTwFYApJbbUyxQRSjpXFdCxXWEBk3lok6iMrucOwItbvkWpl
 qJMzUm6bcAOJuljexvsbXuPIXpdJp+2ihgI+1mpFZyz0EIlBDbQtsht3jYeHMlGd
 Yn4jOEIZ3CpFCRxe4jKTVc1ZiLAuEXEIevHHgGpvmFgNT4HxbEtpxu96x4Z+28Pv
 nWcDjMPIsoHlMA==
X-ME-Sender: <xms:Dy0FYAM3KZeQyKQ5_r98gQLmRtWsc5WQAJLxiY4v2nIEAdXHNY8esQ>
 <xme:Dy0FYLQJVVKmO0GGtkn-xlrGduJVMKELAno2O666EB18CrfWBjWYy5uXey_f5X84m
 a1nk2ESjgrKE1DNDtk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeejuefhkeegheehffetgfeuveeuvdeukeevkeeigeduhffhgfdvvdeh
 hefhfffhudenucffohhmrghinheprghlphhinhgvlhhinhhugidrohhrghenucfkphepud
 duiedrvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Dy0FYGaMcVpS_GvjPteAHeVa01fJvyXKGSeOyRKz62xqrJZaCD6DBg>
 <xmx:Dy0FYA1jVhpbIi4j0RwMDnf5E6mxJbZq4_ecqxCz8tUayBWdhaNHIg>
 <xmx:Dy0FYOXiP55YfThQoV3kEQgLQ5QPCXFdmfYFRnr3a4j1WbnIRzm4og>
 <xmx:EC0FYA3PfCH4s5O1JJhIjhx60iXNwqMGf3ozt6_SY54gl_JWsqxfwRfdj5bV2IPD>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 090C524005B;
 Mon, 18 Jan 2021 01:39:05 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] tests/docker: Add dockerfile for Alpine Linux
Date: Mon, 18 Jan 2021 14:38:07 +0800
Message-Id: <20210118063808.12471-9-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alpine Linux[1] is a security-oriented, lightweight Linux distribution
based on musl libc and busybox.

It it popular among Docker guests and embedded applications.

Adding it to test against different libc.

[1]: https://alpinelinux.org/

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 tests/docker/dockerfiles/alpine.docker | 57 ++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 tests/docker/dockerfiles/alpine.docker

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
new file mode 100644
index 0000000000..5be5198d00
--- /dev/null
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -0,0 +1,57 @@
+
+FROM alpine:edge
+
+RUN apk update
+RUN apk upgrade
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+	alsa-lib-dev \
+	bash \
+	bison \
+	build-base \
+	coreutils \
+	curl-dev \
+	flex \
+	git \
+	glib-dev \
+	glib-static \
+	gnutls-dev \
+	gtk+3.0-dev \
+	libaio-dev \
+	libcap-dev \
+	libcap-ng-dev \
+	libjpeg-turbo-dev \
+	libnfs-dev \
+	libpng-dev \
+	libseccomp-dev \
+	libssh-dev \
+	libusb-dev \
+	libxml2-dev \
+	linux-headers \
+	lzo-dev \
+	mesa-dev \
+	mesa-egl \
+	mesa-gbm \
+	meson \
+	ncurses-dev \
+	ninja \
+	paxmark \
+	perl \
+	pulseaudio-dev \
+	python3 \
+	py3-sphinx \
+	shadow \
+	snappy-dev \
+	spice-dev \
+	texinfo \
+	usbredir-dev \
+	util-linux-dev \
+	vde2-dev \
+	virglrenderer-dev \
+	vte3-dev \
+	xfsprogs-dev \
+	zlib-dev \
+	zlib-static
+
+RUN apk add $PACKAGES
-- 
2.30.0


