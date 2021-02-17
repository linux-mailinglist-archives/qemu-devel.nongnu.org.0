Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A031D949
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:21:43 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLpu-00049j-6p
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLo4-0002SY-Bo
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLny-0000KS-NZ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:48 -0500
Received: by mail-wr1-x434.google.com with SMTP id n4so14205936wrx.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJeCzpPJmRXwnd8EbDANEp0YeTs+kON1Az++FO4VakE=;
 b=dt6ypjBvVHbbjRMEbQfDDB6eSgj6Vg+KVZJy/eR/UE84mvyjiiogDI4CsaeGs953+4
 Rdma5pUhTIOE4Ci5KTFZjEJwtIDy84cwnHSP1fWdMMg/CHIpV4NUPydoeHUCKYvZYdaU
 b43eaO0TUfBpNP7gYVwEiVVEBl8e0GVmnPjStI70Sat7SUsVNHYHC0ZpAje0jkp6VCWr
 srfSi8B+k5mdUBI20oV+OBdzxZKbqiL/DIB3vgqXspNfhrCQpbCH3oXWGIA7ZYq7YtSd
 y+ZUhghntVhdnlKXV7Uywa/vJWEm1Hu+KlhdI+fFIXzJXmmUYpVqhhg0ute1Qy87QO2w
 yKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJeCzpPJmRXwnd8EbDANEp0YeTs+kON1Az++FO4VakE=;
 b=lIuAkwZqulfXsAi7rjHCYyz1luufXBVLSWxR81B10l+IveoIrZSBZThOY+lc+3iktw
 rtfLOD/mdTSM3w1hEcUizmLFXHxEOapCzBxLElWMx//u/qKa4nCiigDOs62raahzNQ4D
 mbIGhdg5+kUglZh3TTsCcee11lqok3KCIMEDI7hzalkuWS+h/cmHeTcPmEo09RB6oXvI
 icWgNmYe6WnR2UmuZ4BItREGYxQFAyXvZFW3AAOmlRxBx1wDMGQDavG13X8dvqiiHX6Z
 vQAywwdpqY0Gm68+LTaPnQ4TAMpnG7eX4pan99/LMDFYdN6lE/NPSmLv+lNzwi3dXvry
 DuwA==
X-Gm-Message-State: AOAM532d5mipthrPoQ2euK1Npi7h1xsmOzYuYRkZsh4oroWZ9hyrkurG
 Bb+xelKbQcOuVtHuCbVC4jjKTQ==
X-Google-Smtp-Source: ABdhPJwWq28HvxT7Hsh6KSLVsroIpShQrK8gHIFvdpd1glvV4HrX7Yx4An24qHpF8JpXitm9wCS70g==
X-Received: by 2002:a5d:4850:: with SMTP id n16mr29398700wrs.296.1613564378064; 
 Wed, 17 Feb 2021 04:19:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm2638439wmg.44.2021.02.17.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:19:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7C091FF90;
 Wed, 17 Feb 2021 12:19:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/6] docker: Bump Fedora images to release 33
Date: Wed, 17 Feb 2021 12:19:30 +0000
Message-Id: <20210217121932.19986-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217121932.19986-1-alex.bennee@linaro.org>
References: <20210217121932.19986-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
 stefanha@redhat.com, pbonzini@redhat.com,
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


