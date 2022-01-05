Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4848547D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:27:44 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57GS-0007kP-2X
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:27:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gU-0008HK-1B
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:34 -0500
Received: from [2a00:1450:4864:20::530] (port=46927
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gS-0004Gf-Ev
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:33 -0500
Received: by mail-ed1-x530.google.com with SMTP id n30so50123196eda.13
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OkVpat8hHbvVl1uCJJ1sJ7CBxP79yy+nHQCQavq+H94=;
 b=GyMjRvqfJv+xcOSKMUByK1d7Zm9F1c2fa7cheU5UZzzP/oCTzEsu/ftIgnu6RkJexn
 0i5CZnustbb/qzZfFBAmtjJdaIkuVg3SiXiPpSG4sAkJWt6lrza/ecwmBl/IO3fQAaPi
 /V9LVGpKzNW/XjRAnqtBIJcu58d8ANBV0JIQiwIjGbamd8g46vVT1tuXS9DPtsawGhK1
 vcunqdcHwlY7e1Skn/qGpk3qFhWGWL4GIieEGh6Pkbbt2gAW5CJzXvEFL8a+IPKNO7zD
 gBPfSyQiMhEiXngVKBQdqPgjllAPFIcM7Kvg+jurSJQGq05DOjJCyzWNfSRg6KLPCXcP
 MyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OkVpat8hHbvVl1uCJJ1sJ7CBxP79yy+nHQCQavq+H94=;
 b=36TJTndwovUrL0njbwzoVBJwTorBDUQp/BpVBx0lmbNLTmkQCMF7Rk00XlV4r22BPL
 +fMW5fg861Dm81+URAkjRaoWUTxayMCNzu+oAAZrqpYRBYaQd+X4XGto0TseADIxMysl
 ImdzhwOoxu9D7qyDp86LZ4OkePmqd2W4O6KwgN1rJVvC5G6kksQj/r0VJoS7FV7cyraG
 7eDla3PGMrr/LWkRWyMbP4rJ6jKp5MTJ/AUCD72nIjsTUi8zaQWBncRoiK8HTgLqkI9g
 daOQU8ma18D1rrJ1oVzOMTqHe15RYJzx6MmejdG4MR2p/fu13aa3zJfc2ASXy6bxHlO3
 Z2Bw==
X-Gm-Message-State: AOAM532w5uvcPYNlXeelVNYWoOdGqxPIuQ6pWhnP90Xvk7EFKfNZqTEp
 905f/2ILbo+9yxJ6zmkTVGHHSA==
X-Google-Smtp-Source: ABdhPJzHEIldJPcva9g7hlxqD+nZnAEWMw/epVrbqi/0ixBCSuji8YQgxnBALdRfxgs8hSh5qCmBOg==
X-Received: by 2002:a50:ce4a:: with SMTP id k10mr53741174edj.31.1641390630363; 
 Wed, 05 Jan 2022 05:50:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ho14sm12172925ejc.73.2022.01.05.05.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E1901FFC7;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 15/34] tests/docker: updates to alpine package list
Date: Wed,  5 Jan 2022 13:49:50 +0000
Message-Id: <20220105135009.1584676-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

Cleanup the package lists by removing some entries that we don't need to
directly reference

  binutils: implied by the compiler toolchain
  coreutils: not required by QEMU build
  mesa-egl mesa-gbm: implied by mesa-dev
  ninja: alias for samurai package
  shadow: not required by QEMU build
  util-linux-dev: not directly required by QEMU build

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-16-berrange@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7e6997e301..5a1808726e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -8,9 +8,7 @@ RUN apk upgrade
 ENV PACKAGES \
 	alsa-lib-dev \
 	bash \
-	binutils \
 	ccache \
-	coreutils \
 	curl-dev \
 	g++ \
 	gcc \
@@ -33,22 +31,18 @@ ENV PACKAGES \
 	lzo-dev \
 	make \
 	mesa-dev \
-	mesa-egl \
-	mesa-gbm \
 	meson \
 	ncurses-dev \
-	ninja \
 	perl \
 	pulseaudio-dev \
 	python3 \
 	py3-sphinx \
 	py3-sphinx_rtd_theme \
-	shadow \
+	samurai \
 	snappy-dev \
 	spice-dev \
 	texinfo \
 	usbredir-dev \
-	util-linux-dev \
 	vde2-dev \
 	virglrenderer-dev \
 	vte3-dev \
-- 
2.30.2


