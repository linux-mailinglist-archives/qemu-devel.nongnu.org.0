Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBF93C1A1B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:49:07 +0200 (CEST)
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a1C-00066L-P2
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWh-0002qG-Sn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWc-0007Yw-EL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:35 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so4722697wms.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7K2T+7/xRZArnCf+GLaEJe8OjH8H/Pc9dQvIHChB5w=;
 b=amPTAAcE8iOPKn5uR+iVtJ984YV7Bi7aQrON8Iiff47CFaL7RCBIsOyN3BifatzXSc
 7/uknD36efl+XQArTS0XXdhUPff9VGLfgMI7Mkdp5jfxxCHTFZeB7lazAzU4lXJZGKb9
 Zrgi4wY2ilwoDTBrRJs+YPwgv69fb/wh6TJmz9tH8v/dbmGvQlZgVD1J23Gz8ruqfjqG
 Pnrfs114ona5ujqFpVk1jvuG8rbv3WvPRWkUOXVmoR/ptSANw3FiY9ilBzXFR32LXIgg
 2tLfjTcHEsFgbE8LXWhTFl+rCg4Y9qm/gHHOqAmsdFbKUmOC7CkPY3gREGn4URO4Zc6B
 HdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7K2T+7/xRZArnCf+GLaEJe8OjH8H/Pc9dQvIHChB5w=;
 b=DODD+P+IYxH0PbkQa6DN5jTkp6SwFgnzPd9eEY7PRneIkGh3kLEEn4elhVtxXwKua3
 agWVKXLg7u9SUh0AUUEiZs7cQp5SNia1UWjcgfaZIlTsF5s99zPmnTMIldGGVv5hMQno
 HkdnI5zXVWuL4a5Hlg4+/alNxOxRyCWMQIUWUdFSQVYblpeDlhxCvrP/MvQD59a0u9LM
 1rw7dXDio4wnytF7CiiBhtxmElqoAtnuJqAFcUxpmdHHwV4bvwL4o6o+a3kZP6SS+w0+
 q+vXsZeeg9RSymL1EG9JK8EjQ5D5kbVEXkNq/jZwZWFCkUSBa/SO3Jmp6OFWote2DAYg
 NFeQ==
X-Gm-Message-State: AOAM530GhJ4EfJ2OtPQ74jeFfzORBF4RIFMBp6jpTI292Y4Ur78aJwqu
 UcuX2tAPItULouuDVoyhOSMZSQ==
X-Google-Smtp-Source: ABdhPJxRB3VyJTNjfodSdr/1QvhoWvWwU9VoO/piuBYEiHvhM9R13oPETmiOisLWok7/wAJBmbwU5Q==
X-Received: by 2002:a05:600c:290c:: with SMTP id
 i12mr33513901wmd.85.1625771849007; 
 Thu, 08 Jul 2021 12:17:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm3137138wrq.10.2021.07.08.12.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEB991FF7E;
 Thu,  8 Jul 2021 20:09:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 17/39] tests/docker: fix mistakes in ubuntu package lists
Date: Thu,  8 Jul 2021 20:09:19 +0100
Message-Id: <20210708190941.16980-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-10-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
 tests/docker/dockerfiles/ubuntu2004.docker | 10 ++--------
 2 files changed, 2 insertions(+), 11 deletions(-)

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


