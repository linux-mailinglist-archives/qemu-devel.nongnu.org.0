Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D7AE6CB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:24:44 +0200 (CEST)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7cOB-0000BI-DW
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i7c0Z-0004aL-Sl
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i7c0Y-0004p6-LJ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:19 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46953)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i7c0Y-0004oF-Cd
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id d17so5727581wrq.13
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8x8NV3vKCH5acmfgm6iyCsOgI+rOqDu8wV4z7vxG0mk=;
 b=wTEgFCTVbCNGwd90U12RDcSxx3m0j8CijouJ2jz+LxCM+JORiA6C/v9LzY42MwcJG1
 dEuQMunjAM42a45yVQTiQAEDBrYEr58sw7brYrLgLS6KyC8Tq9IGTD3xJzb63EpKIp70
 sq/drUzERUqsMT9fhEHCL2V4X4r0pOo2/CWMN3HeqVCcPQwEsQmswDKZJTmdvQiV6lFf
 mvDxsRZB6Wn78HMgxoR40xiL1fuWTs8WIlYv+Gd+SK0wg4Yv9/7+edPKZNvQWLmQMUKk
 fpKBT1aWQ3kcjgSv5aN7cTGfWjWl2GxUYiwAjAjo5o4IReAHPzVJe7lq7ZdaBivQtFK9
 RcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8x8NV3vKCH5acmfgm6iyCsOgI+rOqDu8wV4z7vxG0mk=;
 b=AAI2N0MdKpsYL9d6z9jgJXFeiqx1rd7DNOgT9LXngVYOo8MwzmJ7KZjtYZvgggyojG
 pAi0USySrOzDSChevCVUSQBrEmP3CNw6/uOZycHipwLuI1FKCVJxrKDQKoqe5wxYzSQE
 xh0RVufww/JpZBsqy0+dkFo3nLOoNqGT5oxsURMJjDiDFqw24xNN5bI+9hnu8YB7dRsW
 P8RjhZhNyOEq/zwgkBgkMHUFXjn8fX4pqhNA8HZvw+YdaJk0iGO3eJXhVfA2EjVIF9ZR
 9zSCYvUnIWqlX6v2lgAeGAvbhHZs8i5oC3DLTMYy4WYKSl4Gigd+BQ3cyOVR2K80Jbtx
 ioNg==
X-Gm-Message-State: APjAAAX/rXBYpfUm5N2JOTffj616q2l6GuDOkH+TvpDEWYfn6PiGXe+w
 9EvI21vJC53G3FvLh71CxQfrEA==
X-Google-Smtp-Source: APXvYqz5NsTA8NVmUOSULrzGOpR6FtWMsfrkwRZx20AqcnJUqZ5ripwRTA2C11vCdsxpWpEWjl9g/g==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr6337951wrp.122.1568106017354; 
 Tue, 10 Sep 2019 02:00:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n1sm21300986wrg.67.2019.09.10.02.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:00:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2904B1FFA3;
 Tue, 10 Sep 2019 09:43:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 10 Sep 2019 09:43:21 +0100
Message-Id: <20190910084349.28817-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910084349.28817-1-alex.bennee@linaro.org>
References: <20190910084349.28817-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: [Qemu-devel] [PULL 17/45] tests/docker: move our HPPA cross compile
 to Buster
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now Buster is released we can stop relying on the movable feast that
is Sid for our cross-compiler for building tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e7379f1d732..ba5a624eaec 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -100,9 +100,9 @@ docker-image-debian-win64-cross: docker-image-debian9-mxe
 
 docker-image-debian-alpha-cross: docker-image-debian10
 docker-image-debian-arm64-cross: docker-image-debian10
+docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-powerpc-cross: docker-image-debian10
 
-docker-image-debian-hppa-cross: docker-image-debian-sid
 docker-image-debian-m68k-cross: docker-image-debian-sid
 docker-image-debian-sh4-cross: docker-image-debian-sid
 docker-image-debian-sparc64-cross: docker-image-debian-sid
diff --git a/tests/docker/dockerfiles/debian-hppa-cross.docker b/tests/docker/dockerfiles/debian-hppa-cross.docker
index ee6d9a24ce8..5c68b2d3304 100644
--- a/tests/docker/dockerfiles/debian-hppa-cross.docker
+++ b/tests/docker/dockerfiles/debian-hppa-cross.docker
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


