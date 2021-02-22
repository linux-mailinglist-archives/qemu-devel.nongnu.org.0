Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAB3213F5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:17:43 +0100 (CET)
Received: from localhost ([::1]:41772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8He-0001Fa-Cg
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F6-0007uz-20
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:04 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F3-0005GU-GU
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id m1so13785037wml.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yf/JtQTyTXasemVYJ9Cbb67wN/v6OrbvEPyAgKanodc=;
 b=u+0Xa/b168OBCmdWdRA+1awLOHobx8rOsODL7nSn34sa0OJHfk0WzJD1d8k3ah8OX1
 r+qhhs4Z99ZNFL9IQTdgqfZs2p25LCOwzV5l+ID+wkyjgXWYK0EBvBvMfvNpC8Dzz5CT
 yZzRAq5ilFM4sahQnr1jAonrWZkxX/lYfulhFJF2LxS5NMnes/H1B0VPVFwfEnihJ+Ff
 EoFZblos9KzLZzxBnIVaPKaGJirXgFT5EvpHqpbZHKn8JcAlWcmyG64jvisTq2fwRs9r
 T406vW2RZ3t5+maobz1TjjpjBh3vZFO2CcQ66RAdqe/VLyxzwXQn9WWowy7nkmEaxP7y
 tJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yf/JtQTyTXasemVYJ9Cbb67wN/v6OrbvEPyAgKanodc=;
 b=WeC23W2GZj+kEmUR7wUc7CCA23hd2wrIh+TJwqKbDEgq9pUG0V6y4A4uZOcyovVsYY
 5VCka+6zpS3PFO+09QIzpWy7gmQKjdSCf0CrvjTniPAZHVmYBT/MxZ6l+T0v/p1LRUjW
 kLA/i4ySTMyMkAxTmJjfvVIQ11Ul0Iuz49hJgQ2Ly+8izh9ECl6bc7YEV6c7jN+d1THV
 Stugt6mIUDVhBI3fBBJcNpqlYYSQqVVbGEXkeBXBf5njLXOsquVfJ2hFAiylt/hWampO
 8gOovD16OR0gko5Hvp9jusE3vEsqdX8bTXyaLJvpsKO0ntQ1JzR1YCDUaojJiOVnWDQN
 XTFw==
X-Gm-Message-State: AOAM533OPM54IqKdlkz0j0KOMH11Uklaw2wgRgLqmav9lj7AYZYRay5h
 TqOYsv1kMiO0y7tyFYpwxqA6ww==
X-Google-Smtp-Source: ABdhPJwDqjZIOCSw5wHcdPDQXko8oCU31EXr6seylxKMamyNp2NNysR4EZ2aukYLOuw9wWZhNFwxIg==
X-Received: by 2002:a1c:e905:: with SMTP id q5mr19718672wmc.84.1613988900071; 
 Mon, 22 Feb 2021 02:15:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b83sm21275122wmd.4.2021.02.22.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:14:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 010261FF8C;
 Mon, 22 Feb 2021 10:14:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 2/6] docker: Bump Fedora images to release 33
Date: Mon, 22 Feb 2021 10:14:51 +0000
Message-Id: <20210222101455.12640-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222101455.12640-1-alex.bennee@linaro.org>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fedora 33 was released on October 27, 2020.

Update all the Fedora 32 images to this new release.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118181255.314672-1-philmd@redhat.com>
Message-Id: <20210217121932.19986-5-alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora.docker             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
index 09e7e449f9..1dfff6e0b9 100644
--- a/tests/docker/dockerfiles/fedora-cris-cross.docker
+++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
@@ -2,7 +2,7 @@
 # Cross compiler for cris system tests
 #
 
-FROM fedora:30
+FROM fedora:33
 ENV PACKAGES gcc-cris-linux-gnu
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index a6e411291b..966072c08e 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:31
+FROM fedora:33
 ENV PACKAGES \
     bzip2 \
     diffutils \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 087df598a0..81b5659e9c 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:32
+FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index d5d2f5f00d..bcb428e724 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:32
+FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 0d7602abbe..915fdc1845 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM fedora:32
+FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.20.1


