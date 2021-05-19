Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0138969C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:25:32 +0200 (CEST)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRox-0001L8-LG
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRMP-0008JL-6J
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:56:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRMM-0002am-Mj
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:56:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id y14so13016840wrm.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7v32F7sA+s0nX/521Wn9idR1Uq3Ai0OnDxbO/sW8qQ=;
 b=B2mN9RHFMg88UwUpNsvJVUp/2S1lV4FuA8pBoLUa85j+3Y/JC1WidxHiV0Q86ixXD0
 2vpcU3igt0vIY7PvLd38a1Z2XxI1VmG/+StvWNdIUpo2Vu+iRfaRbpUofAY6oaG8AVQU
 RAZ4/kFZ/3x6kFKNA1HaYLXVz4rQdYHS7ZoRyENftuoIB7HO2dHkpFPzOOmLrtn0NV1M
 tacHKT3mRzb3vh8cKkrh6eLm2nt8fkcTZ44WDWoWAWJnw0kDUS4oOd24bVDOAObHtoYM
 YcSEyeIr4DJy8CvJIHs5VL+t/kpBhgSeazkL0X4gsVKYNoJr9VTMSaDgzyKXfj5wqOJh
 nBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k7v32F7sA+s0nX/521Wn9idR1Uq3Ai0OnDxbO/sW8qQ=;
 b=EebVJs9OkikuQk8DVTrtyIrGECCuziNNzmT8Pr5Z1JliC3uxgtWOZze/yoSidB4R2m
 IAwJWF6RAsACgo999uT0wn4CiUxdFXlK9ab59LbbIzMPQDShl8OEiJlIX5xQ7KvHV3K2
 14eclTBpxubC0xFCpb9kJ49PsGqfnG4wa9svJuK4vhAzZjwX89DqrfhFPi4CKaxF3FYr
 AmPAdKgfbV7BIrnqiRb1Oq63REv/d7bSe+Z12dxBQZpmX6zLvDnO25KYjUHKiNIBP0QK
 As5aUhHbN5n5a6MRKXZiK7VgGYfN53YEV/LPLs4tY4g2pzWL4JtNXxVwr8ahml+zQVti
 ZEKg==
X-Gm-Message-State: AOAM532Hrc6L2kj32/xYLMdEwYJFDol6ln/W5Z6K60rQC8f76Rh9yuoM
 +DUGfbfeWHB6g+q3fpO/FdF+/uWDHX63rw==
X-Google-Smtp-Source: ABdhPJybzbtZsKZlWwQTcGxlIOewrpe2QDYbTCw3a3qlYC7J2ZReWaLIF3FYVR37BatCZXwmtSawMg==
X-Received: by 2002:adf:e110:: with SMTP id t16mr355760wrz.359.1621450557184; 
 Wed, 19 May 2021 11:55:57 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a11sm277368wrx.38.2021.05.19.11.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/10] gitlab-ci: Move current job set to qemu-project.yml
Date: Wed, 19 May 2021 20:55:04 +0200
Message-Id: <20210519185504.2198573-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow forks to easily decide which jobs they want to run,
but without disrupting the current default, move the current
set of jobs to a new file corresponding to the jobs run by
the mainstream project CI:
https://gitlab.com/qemu-project/qemu/-/pipelines

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/qemu-project.yml | 11 +++++++++++
 .gitlab-ci.yml                |  8 +-------
 2 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 .gitlab-ci.d/qemu-project.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
new file mode 100644
index 00000000000..64cb2ba1da5
--- /dev/null
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -0,0 +1,11 @@
+# This file contains the set of jobs run by the QEMU project:
+# https://gitlab.com/qemu-project/qemu/-/pipelines
+
+include:
+  - local: '/.gitlab-ci.d/stages.yml'
+  - local: '/.gitlab-ci.d/edk2.yml'
+  - local: '/.gitlab-ci.d/opensbi.yml'
+  - local: '/.gitlab-ci.d/containers.yml'
+  - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/buildtest.yml'
+  - local: '/.gitlab-ci.d/static_checks.yml'
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index aea58813a25..533a7e61339 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,8 +1,2 @@
 include:
-  - local: '/.gitlab-ci.d/stages.yml'
-  - local: '/.gitlab-ci.d/edk2.yml'
-  - local: '/.gitlab-ci.d/opensbi.yml'
-  - local: '/.gitlab-ci.d/containers.yml'
-  - local: '/.gitlab-ci.d/crossbuilds.yml'
-  - local: '/.gitlab-ci.d/buildtest.yml'
-  - local: '/.gitlab-ci.d/static_checks.yml'
+  - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.26.3


