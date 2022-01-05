Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE5485458
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:26:14 +0100 (CET)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57Ez-0006PS-BO
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:26:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56qC-0004g7-Rv
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:37 -0500
Received: from [2a00:1450:4864:20::329] (port=42683
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56qB-0006Uf-8A
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso3369391wme.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=abgAXrEfoE7mCKRHtXtuDiEvQ8khYGNpeRC4vW36dHo=;
 b=XrtDVG4j0A0YqoFjL92WrYSC1Nas3rp6nvCGYRpt2JvEBvNkdDi4ltO/ByzklXPgqO
 MuILrj9qeCmBQ/0BZyUl65JIDyQA8U193WIV6R26Ir07Vfd6TnKZNydEjx4Nxccr2zDo
 jfAw4lPUOf3wWnxp1kA28noEa+DZ0ieEtkItnNZPTCBW8G+nBGo4h+mYcx1NzFFyIfgu
 uQ0gdBFm7vrPtt84tAw/AjbPu+JetFqah896WqVJtD5H5KX4LZXRXplnFHlJDkfA4+2z
 y4u5LqqwMdbaPV7X+Gjfq/o3FapA+WoMt7I8cOP/Ltx4pQKzQcULxjloUJfxoSOpYL/Z
 oC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=abgAXrEfoE7mCKRHtXtuDiEvQ8khYGNpeRC4vW36dHo=;
 b=42+G1MEiSmAFWncNCNUpRkE9ZYeuxNXvrfgNV3hsyKxHVVgMYL3unIB+wi32RDtTwR
 taNNtr+NO+k6iF1Wag23uJiUoaAe3tFqS9aO9ikZCn5VMGNFfyH/TnA9rGsU2G3RK1vD
 bYoNX4SwwQ8inAtig6sQKqkMJG9fz9bqxfDMkdR8Dlb0ETebA9D2dTrk9NE/aDwrAUik
 YuZR9joLY7nwQNp2nVOuQPR9Bo0LEnPob6NogWyQtCBSoV0FSK6LP9cJg3cPFDYm5PZG
 hH4XbW+BM+YzGSMtScIAJcieuvhwNoZArdzojCs17AX1aCd9y+6hwx9ZoP1LQUfD8bix
 kv0w==
X-Gm-Message-State: AOAM533pCv6168C/nzCc7ReDUIbYpFRDOSEQuAeKMCOGLTVw5iwvriPB
 3j4X9hRGwbm4ROS9zzplRKxsjg==
X-Google-Smtp-Source: ABdhPJybvVHxnOGt7tDJSJLWph8fBn8JbILnjaYS8b6gEUXHJiIPboeixFLXSt2fZckhUKCJfBLB8w==
X-Received: by 2002:a7b:c087:: with SMTP id r7mr3008130wmh.17.1641391233915;
 Wed, 05 Jan 2022 06:00:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o5sm2605905wmc.39.2022.01.05.06.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED5271FFCC;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 20/34] tests/docker: add libfuse3 development headers
Date: Wed,  5 Jan 2022 13:49:55 +0000
Message-Id: <20220105135009.1584676-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The FUSE exports feature is not built because most container images do
not have libfuse3 development headers installed. Add the necessary
packages to the Dockerfiles.

Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Tested-by: Beraldo Leal <bleal@redhat.com>
Message-Id: <20211207160025.52466-1-stefanha@redhat.com>
[AJB: migrate to lcitool qemu.yml and regenerate]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/alpine.docker        | 1 +
 tests/docker/dockerfiles/centos8.docker       | 1 +
 tests/docker/dockerfiles/fedora.docker        | 1 +
 tests/docker/dockerfiles/opensuse-leap.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker    | 1 +
 tests/lcitool/projects/qemu.yml               | 1 +
 6 files changed, 6 insertions(+)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 97c7a88d1f..eb2251c81c 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -29,6 +29,7 @@ RUN apk update && \
         dtc-dev \
         eudev-dev \
         findutils \
+        fuse3-dev \
         g++ \
         gcc \
         gcovr \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3c62b62a99..cbb909d02b 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -30,6 +30,7 @@ RUN dnf update -y && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        fuse3-devel \
         gcc \
         gcc-c++ \
         genisoimage \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 6784878b56..60207f3da3 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -37,6 +37,7 @@ exec "$@"' > /usr/bin/nosync && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        fuse3-devel \
         gcc \
         gcc-c++ \
         gcovr \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 5510bdf19c..f57d8cfb29 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -22,6 +22,7 @@ RUN zypper update -y && \
            dbus-1 \
            diffutils \
            findutils \
+           fuse3-devel \
            gcc \
            gcc-c++ \
            gcovr \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 40402b91fe..4e562dfdcd 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -46,6 +46,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libepoxy-dev \
             libfdt-dev \
             libffi-dev \
+            libfuse3-dev \
             libgbm-dev \
             libgcrypt20-dev \
             libglib2.0-dev \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 2e2271510e..ed5ab1407a 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -18,6 +18,7 @@ packages:
  - diffutils
  - dtrace
  - findutils
+ - fuse3
  - g++
  - gcc
  - gcovr
-- 
2.30.2


