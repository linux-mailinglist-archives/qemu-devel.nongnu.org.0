Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992ABD515
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 00:48:26 +0200 (CEST)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCtbc-0003cr-GP
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 18:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iCs51-0003Bf-TG
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iCs4y-0007XG-3A
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:10:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52895)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iCs4x-0007WY-Sh
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:10:36 -0400
Received: by mail-wm1-x331.google.com with SMTP id r19so366397wmh.2
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 14:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hmZpxdjkgA7FxBw6Cw3ynagnSM0zEvZA5Z3NFVOahug=;
 b=G6eb4S6UKDH9V8EiGz5EwQk9eL1oXSrf3oAIOMFZHVtGzhZ4ToKvHFioCoI6uQS2FT
 FCBL2NuXH/CpEea81U6wRTJTMthB1cNrqmNoO+TK2P+HAbWImS2c/FsL0Up/ZDzU4mDQ
 56AWb2p8lrVzewjBcWLSjext0UbhKMSGpIqraUdaHsixBLniogyEOOoFsQtKiAXAuwI0
 vtOeF4z5BCEx8P7PKK4W2VdQYA2HKqtyuXAoSaUlFNfy0/hgRdfzyOIYpF2CJyd8Ti9/
 Hz+xaYxq7f2qM7jx7UF5f1edIH3gujbsu5ULKh2BbKQOhe+MwoCeGk5BqJ8EJaqEy0OE
 dRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hmZpxdjkgA7FxBw6Cw3ynagnSM0zEvZA5Z3NFVOahug=;
 b=m4UXNjj2c6KHawmk3AtbUlMZB9ToAAhy30RywW5oWetGTUOQ5HnEyH4kxhzHEYTZtn
 51V4ZoopzsQ5Eny3ysC1EpV6MCVVUyPEf9tIHtErIGUmSyA/6FqKIxLGqcKcPSa7dpYo
 RUPs+Y7ouXaNOxuQT+UTXSmEyQwMGjPHotAGqQi/BbLswmCtxu6KM04FvYp672jybxZO
 +Fw+yesR+H7MwGaeSPaWMNy5bmOQmmb5wHCSDB68Uz3pcxdarSSJ0k3M2P2rWx43qo/s
 x6DNJ+Jr4edtfMXNNX6N01/rOJBf3f44t7OnZvAxikcut5pOEixhmIs0r4DaQc6xqffp
 C6Lg==
X-Gm-Message-State: APjAAAUOYdRQrrVuxLb3KHYmAX2JN/gWUNGCfKVE08O5VKbclcG3KqgR
 /H79Ct5PKqWI9Egn2nl3PT2n5Q==
X-Google-Smtp-Source: APXvYqzqoEcDOQbDghGKlozkq35znbdAPcBW7cHj9NNdCCsh0nXUujcHa/oFzttXn8Uehm850zC6VQ==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr2565816wmh.105.1569359434632; 
 Tue, 24 Sep 2019 14:10:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f10sm1001931wml.4.2019.09.24.14.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 14:10:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D2B51FFB4;
 Tue, 24 Sep 2019 22:01:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 30/33] docker: remove unused debian-ports
Date: Tue, 24 Sep 2019 22:01:03 +0100
Message-Id: <20190924210106.27117-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924210106.27117-1-alex.bennee@linaro.org>
References: <20190924210106.27117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, jsnow@redhat.com,
 f4bug@amsat.org, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

debian-ports is listed as a partial image, so we cannot run tests against it.
Since it isn't used by any other testable image, remove it for now as it
is prone to bitrot.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20190923181140.7235-5-jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                |  2 +-
 tests/docker/dockerfiles/debian-ports.docker | 36 --------------------
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-ports.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fd6f470fbf8..053c418d8cd 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -6,7 +6,7 @@ DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian9 debian10 debian-sid
-DOCKER_PARTIAL_IMAGES += debian9-mxe debian-ports debian-bootstrap
+DOCKER_PARTIAL_IMAGES += debian9-mxe debian-bootstrap
 DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
diff --git a/tests/docker/dockerfiles/debian-ports.docker b/tests/docker/dockerfiles/debian-ports.docker
deleted file mode 100644
index 61bc3f2993a..00000000000
--- a/tests/docker/dockerfiles/debian-ports.docker
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# Docker multiarch cross-compiler target
-#
-# This docker target is builds on Debian Ports cross compiler targets
-# to build distro with a selection of cross compilers for building test binaries.
-#
-# On its own you can't build much but the docker-foo-cross targets
-# build on top of the base debian image.
-#
-FROM debian:unstable
-
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-RUN echo "deb [arch=amd64] http://deb.debian.org/debian unstable main" > /etc/apt/sources.list
-
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed -ne "s/^deb\ \(\[.*\]\ \)\?\(.*\)/deb-src \2/p" >> /etc/apt/sources.list
-
-# Setup some basic tools we need
-RUN apt-get update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt-get install -y --no-install-recommends \
-        bison \
-        build-essential \
-        ca-certificates \
-        clang \
-        debian-ports-archive-keyring \
-        flex \
-        gettext \
-        git \
-        pkg-config \
-        psmisc \
-        python \
-        texinfo \
-        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
-- 
2.20.1


