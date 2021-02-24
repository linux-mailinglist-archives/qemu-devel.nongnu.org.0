Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E925323B85
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:53:27 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsjO-0001Vf-By
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfg-0005sC-Ep
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:36 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfe-0002UN-NV
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:36 -0500
Received: by mail-wr1-x431.google.com with SMTP id v1so1595592wrd.6
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5J+h2qu1UVArHEoKx2foQ1Hwm3QIMxAkKu6EvQL389s=;
 b=uEtFHNU15b/hrndoz/Dv/H+VTaax5+1X8bKVngoOKKINspvx2pOZj+SS+XauC0wGK+
 lz2nOv79MDyYdJEvdVpZhZrF0vRErtBNno53oPXUM0dP3ygYjw5IHF+NoRlICQNdEwJR
 Q+I5EUNo5wIhyZRYWOb7YY23ihRZNeyNaSPIdgY2aP8HL68NACZjXcX2Dco7qUsRYMY1
 V24ob5ylpLpwBEKGgk3+tGXR2ELhmo2Y227WShWP9Bijt5m+L28Ff+mam43X3B3W6q4N
 r9P4E2HIzxWHcb14X/iEIkMT0xJGt92xxuFr1X4Sat4NMgWd6CzKoasovn5YWr/nepSO
 57mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5J+h2qu1UVArHEoKx2foQ1Hwm3QIMxAkKu6EvQL389s=;
 b=Y75CEI899eyj9zXj56W5Xz30zS449qYf4mqGgUcf7oLQ8VPh9c41LbI8A5bVh9qjlF
 RSngA2HijlIbYSQMjkZFrPo6DPzH+J6QulXs4N+K4QlB9sc8UF6xm6AGTQyph0ZTN8BD
 Z/J2ivzannieU91HjzwengqAmyNrYRjsb3itrQ++Gpdbnvy1PZ26njnu32dbfwjFLal5
 fhgRnH2/AZkpqbRKKKE7n4vn0zwmqqQofCc281qc1r5h+I0QVchszR7LRRCx6b+Tz6Gx
 LkgYIo5wcwD0nlEpyAmKSQSKdwAx7LeYJF90BykzH3pEL0gjtEePlDIHtFvvZN+1Sk6a
 SAsg==
X-Gm-Message-State: AOAM531K9EoBq/0jNIi+tVLSvJcEMAfrKW42UzOIRE9GDiQXlLNgrY3G
 W92QS5hvS4wVNuul/sO1hFQMqw==
X-Google-Smtp-Source: ABdhPJzyhVilnFN+WZOjP63FATPDIL/vYaJ+RsDb20xE8A8BoTZ09N7Z5SXP39vfKc9ODqUegrFcqQ==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr32014181wrt.334.1614167373480; 
 Wed, 24 Feb 2021 03:49:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 36sm3382901wrh.94.2021.02.24.03.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93ADF1FF8C;
 Wed, 24 Feb 2021 11:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/7] docker: Bump Fedora images to release 33
Date: Wed, 24 Feb 2021 11:49:21 +0000
Message-Id: <20210224114926.6303-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
References: <20210224114926.6303-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fedora 33 was released on October 27, 2020.

Update all the Fedora 32 images to this new release.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210118181255.314672-1-philmd@redhat.com>
Message-Id: <20210222101455.12640-3-alex.bennee@linaro.org>

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


