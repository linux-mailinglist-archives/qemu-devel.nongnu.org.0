Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FF2C3B2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 11:58:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVYs2-00044B-No
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 05:58:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYkC-0006KI-8d
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:50:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYkB-0000D1-8C
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:50:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hVYkB-0000Ah-23
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:50:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b18so19436593wrq.12
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YDNzQhJzHpYWtPYJ/WfzD9Kmonh+P1NhdBxQx7bYzps=;
	b=qpePDlx73KMab03AZXzKxDpXvxURte1hnolFvszFU3PC+7C+35vW1YYt8Vq3j/8ru0
	l5NDBx0ZIWznm69lLQhj1y6HnuewWOY2oyBOoogdFz23uW7Cg6AeHbOEXo4z1DXVE0nW
	AYO42/KikUzVBJcjdVPwotwF/IgyARoAAEmD3vWiZASkolE8XMHFCClPo5i1/YG4PJMf
	hrT4Ir5DRbvssDLmBAqOBwjR2P99WarhBim7EBrE7dsxghn1NO1fuqNQaV2qiwD0oqQV
	JIhcdRQ+G/ZV8tECK6BDvjZLvnqR3pMTOMWPH5kIfPtl5Fxgb3bazWkzG6l1+qeNuChn
	MULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YDNzQhJzHpYWtPYJ/WfzD9Kmonh+P1NhdBxQx7bYzps=;
	b=Kg9uE5y0l81NpKhtlMrBb7QJc1XQSAjc5sRWJaOV7C2J4esNaio0bWwCcHGVbIgJ5R
	smXlyGJBDk94MdXX28PbwkUrrpGd/PMJIpEUCgLlsQyVdUXFSJAfB80HVDEAOG0KEoyA
	svSuGja7hTKd9H/JQZ+IXS8KNWIw7cJiTVqlON9WGDCLV2MqXyU5N3K0v/cgq42QOHwh
	P3gSbIY0p4P76uySbblK1rSEO7OUPMhmmL2hivxaKmNtUekpVG0mdlVX8M79BQypqE9W
	oPewk6wrVAqNJSV5eDwetjsXv80oDzeNbFl2pJelpdKP9K9bylTCc5kA8RzfCy74adIx
	BSQw==
X-Gm-Message-State: APjAAAXiBd2Giz55C/FvbQaSX2G04IUn3L+jvzWwZXDa/YIstWw5nzmm
	BnTEyXSU/AG/s2cr/M4SjZEMqA==
X-Google-Smtp-Source: APXvYqxuMHVG433BX001IrLMFPvmW/Pw94/kFHZoUInJMVLZBiHZvlJ8LEswAOejwvs7mZqqYBEC9w==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr12625819wrv.354.1559037004886;
	Tue, 28 May 2019 02:50:04 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id f2sm4479998wrq.48.2019.05.28.02.49.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 02:50:02 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 94E6C1FF9C;
	Tue, 28 May 2019 10:49:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 28 May 2019 10:49:38 +0100
Message-Id: <20190528094953.14898-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528094953.14898-1-alex.bennee@linaro.org>
References: <20190528094953.14898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42f
Subject: [Qemu-devel] [PULL 13/28] tests/docker: Test more components on the
 Fedora default image
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Install optional dependencies of QEMU to get better coverage.

The following components are now enabled:

  $ ./configure
  ...
  Multipath support yes
  VNC SASL support  yes
  RDMA support      yes
  PVRDMA support    yes
  libiscsi support  yes
  seccomp support   yes
  libpmem support   yes
  libudev           yes

Note: The udev-devel package is provided by systemd-devel.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190504055440.20406-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Marcel Apfelbaum<marcel.apfelbaum@gmail.com>

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 69d4a7f5d75..afbba29adaa 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -8,6 +8,7 @@ ENV PACKAGES \
     bzip2-devel \
     ccache \
     clang \
+    cyrus-sasl-devel \
     device-mapper-multipath-devel \
     findutils \
     flex \
@@ -23,13 +24,17 @@ ENV PACKAGES \
     libaio-devel \
     libasan \
     libattr-devel \
+    libblockdev-mpath-devel \
     libcap-devel \
     libcap-ng-devel \
     libcurl-devel \
     libfdt-devel \
+    libiscsi-devel \
     libjpeg-devel \
+    libpmem-devel \
     libpng-devel \
     librbd-devel \
+    libseccomp-devel \
     libssh2-devel \
     libubsan \
     libusbx-devel \
@@ -74,10 +79,12 @@ ENV PACKAGES \
     pixman-devel \
     python3 \
     PyYAML \
+    rdma-core-devel \
     SDL2-devel \
     snappy-devel \
     sparse \
     spice-server-devel \
+    systemd-devel \
     systemtap-sdt-devel \
     tar \
     usbredir-devel \
-- 
2.20.1


