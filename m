Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807844B29D2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:12:40 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYXH-00081r-JH
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOT-0007NH-5r
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:36 -0500
Received: from [2a00:1450:4864:20::535] (port=33470
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOK-0005B4-Fc
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:26 -0500
Received: by mail-ed1-x535.google.com with SMTP id b13so17348736edn.0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bL3dfSbrVaSF01NjO7Q6NEgAL3df4nWWTbEBQql8YEM=;
 b=SzUJ9T1BZLNqrDDSMXIHEGiYL19oQ+S2Vi1srJmZb1jFft0TZNnASH52voGBG5bpBo
 N21+KyyAiJXSNV4ebjim9SIetZYU6WzBH5f4YmWC0VNiS+kuVph1d4y+2tPxeVuZ2S23
 mDq//ecE+2ZkozRQvqT8ZVfLHuslPQ353smpLw2ffpW75QgeLiGiwAx9nJbPxg7lBhqi
 Lbrw0jxMDmAKAecFMrjOYtWgs+59LalJglmJzZqPMHFGZBMSyWHdCTcruMs2UTBTvJ6a
 pZOxDNfLsiB9jPswkS2Qceq595MvyOQHqAzlONkmW7GKzsnVg5rX5obIS9t24bkOY5La
 0L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bL3dfSbrVaSF01NjO7Q6NEgAL3df4nWWTbEBQql8YEM=;
 b=To+1ziKYBCvWhm4tpZDrrWW7wy9251wBFEupcYd0Nw6nV6dkqxO4zXucZSpodpZ1EV
 QWsoOtsa3kS9Nq7lHTF0UcdJ6ozFw7OcbLE2fJjUlFjheXEUEr+QLm6dgd2/yu7ODf7V
 1GKgd4KkYmZmBpP9Vkb4rV7WUTSwrSI6uJe0dO0HlQQRPHN+PA19ALfZAPSBW2Yq7hKS
 IlbhUSwUNONEjMXhXojdi6zem/DSRtIpi+H+Nhj2UeXaKLvEqhc3r14ihUVsz3SW6mP3
 2gRnuWzZEZ0Z2uOYa5/xN9jEAFw3kZ9bAPzMkmUHyhNMq5xGAVkp3mAH0jZGp6luR1OB
 vzSA==
X-Gm-Message-State: AOAM532D15svMJCrkSvaOv6Lt3MEBQOrQlbAMuxlrVIkjJHXVw/tP6V6
 +RMuteaLIBshHzq5gpENpbk7Iw==
X-Google-Smtp-Source: ABdhPJxMkue+M7t+u3JxvgzzZdxLJ5+5uLSwTVyLFKi0KYdrLLe5AwNAJCdruoDFqzZWC7zJ4NdMJw==
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr2621539eds.46.1644595396073; 
 Fri, 11 Feb 2022 08:03:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e18sm11586801edj.85.2022.02.11.08.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECC0E1FFBB;
 Fri, 11 Feb 2022 16:03:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 03/11] tests/lcitool: update to latest version
Date: Fri, 11 Feb 2022 16:03:01 +0000
Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need an update shortly for some new images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
 tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
 tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
 tests/lcitool/libvirt-ci                      | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 1b78d8369a..e1ad9434a3 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -127,8 +127,7 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 699f2dfc6a..0a622b467c 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -134,8 +134,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 87513125b8..b9d06cb040 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -136,8 +136,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 6dd9b6fab1..f83b916d5e 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 6dd9b6fab1fe081b16bc975485d7a02c81ba5fbe
+Subproject commit f83b916d5efa4bd33fbf4b7ea41bf6d535cc63fb
-- 
2.30.2


