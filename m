Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480CA943B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 22:58:10 +0200 (CEST)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5cLw-00028P-Hf
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 16:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5c3v-0000vK-Cw
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5c3t-0003U7-UX
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5c3t-0003TU-Nt
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h7so169706wrt.13
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a+GIa0BNDG6/Dqc09MJyrBtI2tjBB0sKr2+tPxT00to=;
 b=X/GcwSiXEqGZOpL/Cc8ROh8kd37pNJMxOPNTRgZDaVfh0U/ipmWgMYXsDlzOfpuD2c
 yg7fmRQmj7RKGP1FM2RVvTZkmYLx+QauQV93AvjTMXzeAHBnYK3kDTu/w4okLeaEjnmp
 azOM0Jqm1XW2qG4o3+/t3QWxGfgK1XwxNStz/UC+fSDIug0kh1wWl9aVbpl4jiClyJbi
 NCLQFW6vDIAf9HF7b7a9XJCZTYSwzz1k2erh5ztgAOmh1PUU3ImzGPyGditAGo/p0Lu2
 OD76u0XxhZyKbfssZ+fmVNAfGfJuYIKmqOpC8cCxywtjQkLuq4Md0PpnlOUS+IKf5klN
 8R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a+GIa0BNDG6/Dqc09MJyrBtI2tjBB0sKr2+tPxT00to=;
 b=HQyqzzAc+Dw3BGPlreRR9tvcwyQzRNOZlce7xNdX3jCyQve1AOhkvk/m5EoHYUW8TB
 EOxt47FLtdJyttd2SdPaiL9AbpibKKPEdgfo7MxJZXbY9XHDeh/+RoA9auKAVcF7Yo3B
 iCGktlp0kBfuenYhY7mefTMWdrmPfcCMy9kmYz5P1TwzW6pf231Z5yso4B5tCRygh1Bc
 ymZ4mS+jRzXG5Um/RxLSQN8ez2fCUH9qAWn78PH85H9LsxcsQx7dHalXi1zRDp94ijnT
 2Nwa1TuvJfqnBlbQ1tj+751X4ZgnW0greDPQY+caMQ64Mc8QM1tnaIe5FhtZrnanMY+f
 9QOw==
X-Gm-Message-State: APjAAAW/MB4ZkiOpzg4J4iLP9Qo3kH+WLsOsqg7OfZ30bTUntO4hwgMS
 41k+Up35yOAxs+Gj23FJUafc6A==
X-Google-Smtp-Source: APXvYqymb3dDoSczTMTBSNEmM8Yyeb+fBZGSG9oQZHp/wByJIFNGfmD2n7cWOIZuKFBFDDp4l5HAOA==
X-Received: by 2002:adf:e390:: with SMTP id e16mr2585833wrm.29.1567629568663; 
 Wed, 04 Sep 2019 13:39:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x5sm20483706wrg.69.2019.09.04.13.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:39:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BFA01FFA5;
 Wed,  4 Sep 2019 21:30:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 21:29:48 +0100
Message-Id: <20190904203013.9028-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904203013.9028-1-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
Subject: [Qemu-devel] [PATCH v1 17/42] tests/docker: move our sh4 cross
 compile to Buster
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now Buster is released we can stop relying on the movable feast that
is Sid for our cross-compiler for building tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                    | 2 +-
 tests/docker/dockerfiles/debian-sh4-cross.docker | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 50c5e64212a..e946aae14fa 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -103,9 +103,9 @@ docker-image-debian-arm64-cross: docker-image-debian10
 docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-powerpc-cross: docker-image-debian10
+docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
-docker-image-debian-sh4-cross: docker-image-debian-sid
 docker-image-debian-mips64-cross: docker-image-debian-sid
 docker-image-debian-riscv64-cross: docker-image-debian-sid
 docker-image-debian-ppc64-cross: docker-image-debian-sid
diff --git a/tests/docker/dockerfiles/debian-sh4-cross.docker b/tests/docker/dockerfiles/debian-sh4-cross.docker
index 29983b2d75b..9d7663764e4 100644
--- a/tests/docker/dockerfiles/debian-sh4-cross.docker
+++ b/tests/docker/dockerfiles/debian-sh4-cross.docker
@@ -1,10 +1,9 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian sid base image which
-# contains cross compilers for Debian "ports" targets.
+# This docker target builds on the debian Buster base image.
 #
-FROM qemu:debian-sid
+FROM qemu:debian10
 
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
-- 
2.20.1


