Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6113D3C876A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:27:39 +0200 (CEST)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gnR-0008Ip-Tg
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gea-0005HH-Se
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geX-0002Ow-Bb
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id t5so3654447wrw.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGsJyJN7LttFhIAfv8indlVD2zWT1TMrW1Pu0xBSDjk=;
 b=JCvksF7h1F0ZsbuYhcvZt4kJOJgXa1p1hsH2gGYemhjDLs/Ug9ahJnPTuhvmYaBFKS
 C1Wmcdetw8dGRKsGaWtp6ZjSL0JFa9pYSQ52zHPk/l/NmQhAaH1NQwiJfBpjGRwznVqI
 zcslpgLP36gUR3X3KVuUuhje+ZLTgA0EEXeHj/EPdddRGbw8sYy3cLrPzaeksoCNCVi7
 4WFGvbVjJPQSTwjFzwmU6Cz9MZ2gYaayScoOJ6RPWdtnjWJHp5kUUiY8SuGk/7IPf0y0
 8ygPd7cEdTlvVJp9evx01EREksh4HbAMnMTcXoG1T93Nwf5UEV+nTAVfwsEERN0rC5HA
 ShJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGsJyJN7LttFhIAfv8indlVD2zWT1TMrW1Pu0xBSDjk=;
 b=S/iHqYYwVrP0uXF2YTgx4UJQ3HjDC6hC54I9wH3VJy4p5BQt/+qk1rhQS/xpkrp+Gs
 BDvUaOX1EURl4ocnHv6dNps75HIb77P7SNLvntW4GMqrn/XnolVfPlKmIbY8xgXzsLts
 n8+7W8ywprdpaxQaeFisVyneMW3guY9Ol4hG8GkA7ot09mnbXtPqrajQdsgESXsReI4u
 qV9Iat0tWctrwTxL/mH1hE4SzzpRhtDD2SqepcEIYXCgM1VDNxz3P1d0810vkumZhEWH
 twtMfJau8ChO3Qd+5BYqIroWApRqUWvWu6VvVpIeT6LNr4MPmHWQhJsbKOJH//oitlAT
 QGhA==
X-Gm-Message-State: AOAM531nT1C8J4k7WzjygZK20cQ6Y/GOKtfR4yVrF1fSN1mtXRs7knOp
 RrFCu7DfH+iLxP2gQLWvi0JLNA==
X-Google-Smtp-Source: ABdhPJzl39mgd1i1knm4D8+x3qBixqROt1didXs3zT2ZMU9rRpRfrbZQ89bzun77Fo6sDtb4pkxbJg==
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr13580371wrs.153.1626275902087; 
 Wed, 14 Jul 2021 08:18:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r67sm5727904wma.6.2021.07.14.08.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27DD11FF9C;
 Wed, 14 Jul 2021 16:00:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 13/44] tests/docker: use project specific container
 registries
Date: Wed, 14 Jul 2021 16:00:05 +0100
Message-Id: <20210714150036.21060-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-4-berrange@redhat.com>
Message-Id: <20210709143005.1554-12-alex.bennee@linaro.org>

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


