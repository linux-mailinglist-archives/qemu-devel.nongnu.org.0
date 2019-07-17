Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319CF6BD8F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 15:46:02 +0200 (CEST)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnkFt-0005k1-1w
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 09:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkDj-0005OV-Sg
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:43:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkDh-0004Z2-OJ
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:43:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hnkDh-0004YR-IG
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:43:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id n9so24957161wru.0
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+JHZS9szw7jPxS39YpdN8h8GH5sYnizhpgZEOtZ5EzE=;
 b=Bs7r1z3Rc5UITsZbxQTS+0iQdeX09WyNAxV1fwWaJZPr12FWzb/2zJdiSlyiHXGE1F
 T9QZZFgU0qG6XTBbGVCpaccNItt4tFS7VFmZQxV0qPfSL5bP6exiP40B/Z4aE6laU5Jc
 zyKqqheFWmJlAmLIbRGYkabo5dD6FYhBzOeYxD+cGFQ34MG+YX1hMkphL9N1SGVY2gMj
 XyOWnQT9yriRfkSK/ydC+1HNjrx+in2eDgHtQ2tRKD6Wha6mr+TqqsNXXiHfDNMMhU62
 DRMlqPzyQDkd3GJTPkOJ+btJqKyHZeuoN3YfFBpkEu15PN0Z3vaFTPOjcYxE1wP5c1k1
 QcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+JHZS9szw7jPxS39YpdN8h8GH5sYnizhpgZEOtZ5EzE=;
 b=hQysB4o2E2KfnSdR2gNC1tPK3zvGyU49xfYwKvpoHdIw9G5Ls3D0kJXrI1jKvtt9fz
 RllixDMw/B9r8Qd2UrMxBYestk8ILNapPKJqz8L/mLvyaHW2t2OTGDrZ/khFRPKhY/am
 dPpqMLM5uXdVp2VJyWxULMk7R5JS2gL4aANvaqgPrFTuDD2ADiYllSUX/XJNfnroXfxB
 DCA7SiAo8IOrseTtfjc7CXu2X01jhrW1hMaXueeH3wQw/QOaraL4jtOylZSWI8uiOlgK
 +odDHAcxqv/892kY8mDeGsM5Bx3u807VSYuiMiQArwJXNPkib7y4EPCI0lBU1tEKypDF
 xMNw==
X-Gm-Message-State: APjAAAWxOi+vGsuFvt9yizrBZIwyPHHHmWyhy3fIYd4ojalnqnO9/Hyc
 jCMJ5/3p/IlASFWX8vUWFr868g==
X-Google-Smtp-Source: APXvYqw23Tu6CfqGDPX/KNQjX4ITsuKqB43k4CuIgwEgqCysF8RY+wi+qJf02Osx76Ymd2YWtkEFBw==
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr40674373wrv.19.1563371024356; 
 Wed, 17 Jul 2019 06:43:44 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id b203sm26458811wmd.41.2019.07.17.06.43.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 06:43:40 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A883B1FF99;
 Wed, 17 Jul 2019 14:43:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 14:43:21 +0100
Message-Id: <20190717134335.15351-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717134335.15351-1-alex.bennee@linaro.org>
References: <20190717134335.15351-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: [Qemu-devel] [PATCH v2 09/23] tests/docker: Install Sphinx in the
 Debian images
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 5f71eac06e the Sphinx tool is required
to build the rST documentation.

This fixes:

 $ ./configure --enable-docs

 ERROR: User requested feature docs
        configure was not able to find it.
        Install texinfo, Perl/perl-podlators and python-sphinx

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190715174817.18981-3-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian10.docker | 1 +
 tests/docker/dockerfiles/debian9.docker  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index aeeb151b521..cf57d8218f6 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -27,5 +27,6 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         pkg-config \
         psmisc \
         python \
+        python3-sphinx \
         texinfo \
         $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
diff --git a/tests/docker/dockerfiles/debian9.docker b/tests/docker/dockerfiles/debian9.docker
index 5f23a35404f..52c589a7d64 100644
--- a/tests/docker/dockerfiles/debian9.docker
+++ b/tests/docker/dockerfiles/debian9.docker
@@ -27,5 +27,6 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         pkg-config \
         psmisc \
         python \
+        python3-sphinx \
         texinfo \
         $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
-- 
2.20.1


