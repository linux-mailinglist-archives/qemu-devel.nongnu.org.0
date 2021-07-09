Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB803C264E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:52:00 +0200 (CEST)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rrD-0004d2-D1
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdB-0004a3-KQ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rd9-000090-Jq
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so25919975wmq.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7/mVr7Wht5ohFpSzGRlkrOJNv9dh0GtVvv3G35jqG0=;
 b=v/cjfmOsTvIvTT7JJd22jN2MFyywR9UN9F6htlD910/fJN5Q/7tQ6LneDq70bdeQF4
 EXpRcWvLC7P7vzEicXgO+QH1pIbgwAhD7F+OnRQndIVYxhW6nhvnyW2Kp1ZX00FNfg4s
 nAVX4J6INhN/m3gvQ9JIGmSGrviBuiydLI1TWjMtvs/TPfU4+byzgUGrkJXu+rjFAld+
 ZURZ6wNLz96Zz+NUBe4qy+o1z08sIR89jS9tVedbqMKFaRYm4rc3t2NNfIsdxsD+GO7k
 jukNSqveVr7LCxK3HNvBGUuNhlMFiEWdMVHS6aKPK4TzC+VDcOoS12S6Fj8TB7AEWdZ3
 /DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7/mVr7Wht5ohFpSzGRlkrOJNv9dh0GtVvv3G35jqG0=;
 b=UBH2+ZB0sBXR9UDBnpdlAvw4uLGniMyYXFB/eTzTyAIemWnIZ3zkhwpfnFrxG00bcE
 NgDNCgvMz+OGlIqrHTaEUoX4GSeWKnu26zkWSbxKxbXeiOFtjtND+P9K6lwNT1H3hwQ6
 E1eB3s1U/wL/MM8stl3RzqFAIuUs5TqENBABWelX/xM28tJjNItcqOSPl03PmWGyjv1R
 WqkLlCAalZ96H64G4eTY86dhXJ6SSD+BnTvKpHzbHCjs5iHiLFGfUdMiGcTEyhz9hM/U
 d+M8y3ExzrwvHU7MytWZp1Ghqhqa8FY+lhAlBRMmFlAPPgV2Xs/b6InmaStoJbrBtoQg
 94Zw==
X-Gm-Message-State: AOAM533UWnbNThyIRb+1hLjprMubuLiaubUDjiJxClz3bQv4WbqSsMQ8
 msndMC7WN8ZuDzMIiLPF1v26Tg==
X-Google-Smtp-Source: ABdhPJzrXxtdM8cvhvxZf9Ce0JT168Glf7bQInQP14PClZMvh08ag9nUKuqFyuA083xTrmufuzF/pQ==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr40444322wmj.144.1625841446246; 
 Fri, 09 Jul 2021 07:37:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t22sm5248338wmi.22.2021.07.09.07.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 622331FF99;
 Fri,  9 Jul 2021 15:30:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/40] tests/docker: use project specific container
 registries
Date: Fri,  9 Jul 2021 15:29:36 +0100
Message-Id: <20210709143005.1554-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Since Docker Hub has started to enforce pull rate limits on clients, it
is preferrable to use project specific container registries where they
are available. Fedora and OpenSUSE projects provide registries.

The images in these registries are also refreshed on a more regular
basis than the ones in docker hub, so the package update should
generally be faster.

While CentOS also has a registry it is considerably outdated compared
to docker.io, and also only provides x86 images, while docker.io images
are multi-arch.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora.docker             | 2 +-
 tests/docker/dockerfiles/opensuse-leap.docker      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
index 1dfff6e0b9..91c373fdd3 100644
--- a/tests/docker/dockerfiles/fedora-cris-cross.docker
+++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
@@ -2,7 +2,7 @@
 # Cross compiler for cris system tests
 #
 
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 ENV PACKAGES gcc-cris-linux-gnu
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 8004fd8ee5..dbb8195eb1 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 ENV PACKAGES \
     bzip2 \
     ccache \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index a638afb525..9fed35f4e1 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index f53007ac86..fb641f6104 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 9dde3f6a78..a506e68d33 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index f7e1cbfbe6..7ebff1b3a8 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,4 +1,4 @@
-FROM opensuse/leap:15.2
+FROM registry.opensuse.org/opensuse/leap:15.2
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.20.1


