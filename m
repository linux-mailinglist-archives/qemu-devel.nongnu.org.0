Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296142DF74C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 01:55:37 +0100 (CET)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9U8-0007s7-6z
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 19:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9SJ-0006g4-RA; Sun, 20 Dec 2020 19:53:43 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9SI-0005Iw-4n; Sun, 20 Dec 2020 19:53:43 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1AB015803F8;
 Sun, 20 Dec 2020 19:53:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 20 Dec 2020 19:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ld7CKW5vB77WI
 lvV4wV47qN/agE7Mm627Lyt8Dw6I+8=; b=VbDRe6BhmOr/FLXZ04jZwqRWcsiSE
 +mZ5syHy6w3ggZ2WvyAIvV+UGj2dwVPGx5lUgGnZFoNQcIv7Wn/o8AjOwvMOoerr
 tzeDagLJ2Yfc1uoR3krKhWLWVdW83zaC2ifhxVT7ojsyDFOczjFlH4ATPKrzYm7x
 Rk3esHNtiRPaJaFcDTxsZ3vE7yf0ElFrClmMVadSnwIc7TFTy/8bIUFoQCD4E6q+
 vkzswXkYNBsHxKFExC+1WCRFcdVE2pWkAqCDhC+LBogClPaDUP4VEY9IzypBdh/S
 aLjjADp8KPv7s3me94Z+7IVeyt55nBXL/ip94GP+3VsZkn56UYUBlkNKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ld7CKW5vB77WIlvV4wV47qN/agE7Mm627Lyt8Dw6I+8=; b=DP8AhrES
 wUBmG1vdl7vtLE97r+OrKSVGunFvkFQQbgdiFf4RKmhIHlyyDRh2msAjWlAFD2mB
 O8iFSsCckNMRGEfNODCRv5CeuF3L0z+q0eeQn0CN6NLsIuPt/QmuMLPkRk2aw1oi
 5Hopcb/w8yfR+25IrBXn/a6+rJncsGTaEVDuiuzmTOO8MGmFG9QkM7jKdcBBVRk0
 iSCrlIW6BP2JOuXCsExvVw51pn+D+Xpl4U8Ndt0wA6FooHxjUobzi/bOnX7SeeZX
 NaL2Z17EJdYz8ob1nE7aMGeIUb48kMinTu1N9tn4RSx15lthfA8sTfooWzgyGrCI
 obshvFFBdZvdkQ==
X-ME-Sender: <xms:FPLfX24a8VisuVr_LPH-sqUNNoxM06by7-F2y8phaJmzRbFPazA2dw>
 <xme:FPLfX_4wxYWX6nR0zZ1idZkYflGWi1lYBhSWVM0qPe61CjPq9t6vjsK4nMC9YKUDs
 VijTEhWCjhTlkW0GKY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeuhfekgeehhefftefgueevuedvueekveekieegudfhhffgvddv
 heehhfffhfdunecuffhomhgrihhnpegrlhhpihhnvghlihhnuhigrdhorhhgnecukfhppe
 eghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:FPLfX1dogoQ3mhTe_E3EtuRa1puwsO-A0JH-D8IDh4G2rTdA1tTVSg>
 <xmx:FPLfXzIDXHzP4lH9w-JwSz_kCE1opnrjgx_Yy7Is316RO-VPzV6uuQ>
 <xmx:FPLfX6IMaChvbEp2_6a2XZCLcOV68e7IEzHuQ3rdQ9EYPMPCw_Q2Og>
 <xmx:FPLfX8j1NJSusrn0wJNIDurb048IU7JL5JaihxM6LwD6voiTzv7c5mdE26P2YMP1>
Received: from strike.U-LINK.com (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id A112F24005C;
 Sun, 20 Dec 2020 19:53:33 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] tests/docker: Add dockerfile for Alpine Linux
Date: Mon, 21 Dec 2020 08:53:10 +0800
Message-Id: <20201221005318.11866-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
 tests/docker/dockerfiles/alpine.docker | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 tests/docker/dockerfiles/alpine.docker

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
new file mode 100644
index 0000000000..a1b80f08d2
--- /dev/null
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -0,0 +1,56 @@
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
2.29.2


