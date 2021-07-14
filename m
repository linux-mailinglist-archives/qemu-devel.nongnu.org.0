Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D03C8789
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:31:35 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3grG-0001UI-GA
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUw-0006uo-SV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:30 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUv-00042Q-6F
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so1658350wmc.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Es1RG/B2xZon5hl3f2n44IU4fzXdGWAsx08bjdmHm3k=;
 b=UHi9dzsayB66T//4vMOJ8a6eElxVei9xAY/TkCKd6kGTKjq3nhNquAp/L2ezsK0l2N
 ISDacm9QlKfxhXvtiMhZloQHQfH6iWZ+AT5N90atO+QGVw2VR0hW8MwQHfHERAr/TIGb
 bOYVP7uDuiEOx28PPfT3gPugC2zq56DJbLA/+Rbo8MLlaoWrTIfIhH/rbEZtmSU7s3pH
 WOJ8kz5Ar+AHYB2cZH6CKBsHR6Cw8ZCBJtOrSgiJWVX3XkV4vrEPYusxRKpDFoytXdHE
 DgHDWv8Acv0/SMM3EckisQwHjtVpnpUBf1A07SIa2teWKYrz7yZPhwY26xWFmo6Z6bdT
 q3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Es1RG/B2xZon5hl3f2n44IU4fzXdGWAsx08bjdmHm3k=;
 b=kdkQi3IF80ckrdJxr5q99al30Mg7hoZP6PtEHJASinXUujYq06tGZoUFrsZlcB0qxE
 +PNe+ZlGgCjPbRqX50zW6UhHP6WgEtgTzSUyXll2w3Y/L3rXE6VAMV6oGxAjEdZKr6ZS
 D4Lmzbg0PFWn2ruV1eCNGqC49ONRcfTzpYizj521x0Z28f6OExRsq1wHdT1iIah44cfW
 eMvJhpGYG1zQmxgaYyvDW6O8yg940QWQjZc3OO0IuLsMtmVQzzAi9/n77sdN0zFjX+zJ
 g0AsOdAjRQbTA2gR3zOr0EL78IDF9jFxJl0WnOL76iFhHM+3ahYz+OVXmlLaDsMSElcM
 Yczg==
X-Gm-Message-State: AOAM532tGznBmZMUPJA6FPqwF1i3sOLSTTsfaq56ALeNnPulFAM++shq
 DOJe3AjHGB7bN0S4sdCZ2fpIOzkbm9ahLw==
X-Google-Smtp-Source: ABdhPJyV4dDHC6Ay2kOJ4XCqzqHlc+39EDk87i9B3kGc/8bEjnjAGEB1JUSUoUEyaCW/t7Z6ptbg6w==
X-Received: by 2002:a05:600c:b47:: with SMTP id
 k7mr11997099wmr.155.1626275307863; 
 Wed, 14 Jul 2021 08:08:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm2956305wrm.5.2021.07.14.08.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECA691FFA9;
 Wed, 14 Jul 2021 16:00:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 19/44] tests/docker: fix mistakes in ubuntu package lists
Date: Wed, 14 Jul 2021 16:00:11 +0100
Message-Id: <20210714150036.21060-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

librados-dev is not required by QEMU directly, only librbd-dev.

glusterfs-common is not directly needed by QEMU.

QEMU uses ncursesw only on non-Windows hosts.

The clang package is clang 10.

flex and bison are not required by QEMU.

Standardize on nmap ncat implementation to match Fedora/CentOS.

Remove vim since it is not a build pre-requisite and no other containers
include it.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-10-berrange@redhat.com>
Message-Id: <20210709143005.1554-18-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index a50a35e6fe..ee8545e4b1 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -5,7 +5,6 @@ ENV PACKAGES \
     gcc \
     gettext \
     git \
-    glusterfs-common \
     libaio-dev \
     libattr1-dev \
     libbrlapi-dev \
@@ -24,12 +23,10 @@ ENV PACKAGES \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
     liblzo2-dev \
-    libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
     libpixman-1-dev \
-    librados-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index eee2ef3cac..25f56adfb2 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,16 +1,13 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
-    bison \
     bsdmainutils \
     ccache \
-    clang-10\
-    flex \
+    clang \
     gcc \
     gcovr \
     genisoimage \
     gettext \
     git \
-    glusterfs-common \
     libaio-dev \
     libattr1-dev \
     libbrlapi-dev \
@@ -30,12 +27,10 @@ ENV PACKAGES \
     libjpeg-turbo8-dev \
     liblttng-ust-dev \
     liblzo2-dev \
-    libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
     libpixman-1-dev \
-    librados-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
@@ -53,7 +48,7 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
-    netcat-openbsd \
+    ncat \
     ninja-build \
     python3-numpy \
     python3-opencv \
@@ -67,7 +62,6 @@ ENV PACKAGES \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    vim \
     xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-- 
2.20.1


