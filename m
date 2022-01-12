Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9448C33E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:34:55 +0100 (CET)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bu2-000309-M6
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn8-0002i3-MS
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:47 -0500
Received: from [2607:f8b0:4864:20::a2d] (port=46604
 helo=mail-vk1-xa2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn6-0003Pr-Ba
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:46 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id bj47so1398023vkb.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JBS0UnAvkMjgjVm5KFvh2N9q14vYOpBE5J7+DmeRalQ=;
 b=SPI/zVqrfn78SSwKeWGN8j10Tl3/0lnosYsF3dzH3DFB/qlYLLLwpuHuM4UaukXZHL
 W4KXBakZvhiITDCaejD7uNjGqrXRiX06yASrYPGgQStNMZ3a/19mkYG7wel4AWDg86XI
 RN7A/YzvyVTxv/jGirsBtumckBNJHcPcwwHA98HfTakl+89baHU8a9LqBHnHtTsxAK/Q
 8r3Zh/mt51ENmDeE9IEK+Vf03U1wWWlS9VFZvaZYK3dKjJ048adBs1cVLc2E1QSRvLs6
 rGTjrL4rRuLlgjdGNSWy2XK4u5LlttyUuZczypifLmPVY6bDx0IFgtKqQSscYFxLRaU6
 kVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JBS0UnAvkMjgjVm5KFvh2N9q14vYOpBE5J7+DmeRalQ=;
 b=I17qncU+M41eod/PnkwZK4U4DHtwbS2uL9PmyUlDPtAgtdhnPaJKILzK9fwbBxjWZx
 71M+Et1h0jm52Zp+YVbWCM8k0Py3JYxsGpK/OH2V3Zi5xaDnzw/K1t3ILTkpIjXzt+sU
 6K/iWsVLtJjGM6E+xqL8Dk+KpUNmSSPCV0youMUMKXRUiJb9FuWjuS+pXBDGsRYfJ0YP
 HTPkAMxIOix81zQ/KjsncFdCosLFyBEWtS2fTrkP+yoBei7JVZ/IQK6AZFPXNSsGlYUg
 KzYd0qkzINzd0fhp+Hl9QetdAFrx65Lr0yacXtGWe5kbFYxBxL13fDKKUwgGqhUetiFF
 qxDw==
X-Gm-Message-State: AOAM530Q6QzswWtCUSNOrghfMURoVzc1pvUS2i3HdroQEK0R1GiJR8VE
 vL+jRyGYTyMS/bnD8MbAjLSong==
X-Google-Smtp-Source: ABdhPJxzquoyks7XTfqmaJiWCckcwH/2qy+IwGrnJbBJEbYi3f2rLKVBq9susT2x9qlf8tGlifxIjg==
X-Received: by 2002:a05:6122:208a:: with SMTP id
 i10mr4423011vkd.18.1641986863362; 
 Wed, 12 Jan 2022 03:27:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l27sm4925646vko.17.2022.01.12.03.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77CF31FFC5;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/31] tests/docker: remove ubuntu.docker container
Date: Wed, 12 Jan 2022 11:27:04 +0000
Message-Id: <20220112112722.3641051-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alex.bennee@linaro.org; helo=mail-vk1-xa2d.google.com
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

This duplicates the ubuntu2004 container but with an inconsistent set of
packages.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-14-berrange@redhat.com>
Message-Id: <20220105135009.1584676-14-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index cd06d3f5f4..b9b675fdcb 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -29,11 +29,6 @@ amd64-ubuntu2004-container:
   variables:
     NAME: ubuntu2004
 
-amd64-ubuntu-container:
-  extends: .container_job_template
-  variables:
-    NAME: ubuntu
-
 amd64-opensuse-leap-container:
   extends: .container_job_template
   variables:
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
deleted file mode 100644
index f0e0180d21..0000000000
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ /dev/null
@@ -1,71 +0,0 @@
-#
-# Latest Ubuntu Release
-#
-# Useful for testing against relatively bleeding edge libraries and
-# compilers. We also have seperate recipe for the most recent LTS
-# release.
-#
-# When updating use the full tag not :latest otherwise the build
-# system won't pick up that it has changed.
-#
-
-FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES \
-    ccache \
-    clang \
-    dbus \
-    gcc \
-    gettext \
-    git \
-    glusterfs-common \
-    libaio-dev \
-    libattr1-dev \
-    libbrlapi-dev \
-    libbz2-dev \
-    libcacard-dev \
-    libcap-ng-dev \
-    libcurl4-gnutls-dev \
-    libdrm-dev \
-    libepoxy-dev \
-    libfdt-dev \
-    libffi-dev \
-    libgbm-dev \
-    libgnutls28-dev \
-    libgtk-3-dev \
-    libibverbs-dev \
-    libiscsi-dev \
-    libjemalloc-dev \
-    libjpeg-turbo8-dev \
-    liblzo2-dev \
-    libncurses5-dev \
-    libncursesw5-dev \
-    libnfs-dev \
-    libnuma-dev \
-    libpixman-1-dev \
-    libpng-dev \
-    librados-dev \
-    librbd-dev \
-    librdmacm-dev \
-    libsasl2-dev \
-    libsdl2-dev \
-    libseccomp-dev \
-    libsnappy-dev \
-    libspice-protocol-dev \
-    libspice-server-dev \
-    libssh-dev \
-    libusb-1.0-0-dev \
-    libusbredirhost-dev \
-    libvdeplug-dev \
-    libvte-2.91-dev \
-    libxen-dev \
-    libzstd-dev \
-    make \
-    ninja-build \
-    python3-yaml \
-    python3-sphinx \
-    python3-sphinx-rtd-theme \
-    sparse \
-    xfslibs-dev
-RUN apt-get update && \
-    DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.30.2


