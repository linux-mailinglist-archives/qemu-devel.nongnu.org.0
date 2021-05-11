Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5C37A0F0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:37:45 +0200 (CEST)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMxc-0006cp-ER
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqs-0004wi-Oa
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqq-0000E9-Mm
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m9so19049600wrx.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3O7dX9rVS1hxltm38JzcGA9w2RaCAolW/vIAHETieA=;
 b=A5si+FU3AqrrWqK3XxtiolRhsIOBvXgYhOceyYzZRt/syN2o97GbIJOdDfLyJ5mhm6
 c8ogjR1dAMK7n9fYlzMT2hUytaIAVvB/ViWMHnEvrZ4yPvEgTalPdpqoXoiYQUWTdF2j
 xorpRE2Mq4JYPfp1LRs7llAKy3ILHycXe+UtzYJWlvwwoJVB0XsCH7plh/RsLvedOj3/
 f/cQYllP5607+FCH0G1PDecarXjALdBupRxFQh+l3oIlSoc9VSh0vjMAk74WL2XPkbr0
 FAEO4qslayn4i6ydFP1xjOt3TXgxgpVXbakm0xFJ82gLOizjVbCAy71ZjM+MCqR48EYP
 g9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L3O7dX9rVS1hxltm38JzcGA9w2RaCAolW/vIAHETieA=;
 b=qiYiv68X6Igq+3T/dK5Ap/BNlsiKN5AeDz+pHDsj0VlLiopVtlXlGLWCV48bF7ntu4
 LlSAsIwLtIS0g/nv5JdivZx4nbZYvKO4DOMreUKtHDewW1kbPwgv6SAf+XXVbN9RgMHr
 5PQfr73Hkn9YciipiMIuDC8/QR5A6EyYq4idosgir5JWJv8bnZdibv9iccR7TrymNGPA
 TiqrUWnQAQ2Zd6iKYSH4FhoeRwavBVg4Bo3XMWGCuuYRQGZ2g8mDcmF/6pFAvft1RYdO
 rcOBL97clYmHTSe4VX2VrQXxveFGLBW43cDrj4gPUI53A+4preTlneuGRhqYzOTsBcwv
 0qog==
X-Gm-Message-State: AOAM532KoKNR0nQE9zTrO8xiTMVvME7gI/9qatbyJPon+ll8HEMGccme
 Xet+JW9VWABYkBs3uDQXTcrkCG2yIBF8oQ==
X-Google-Smtp-Source: ABdhPJwGcqV1gjiK8Os9q+BL4q6W9m+8XnBSdQvtd8X801/ZOb7pe7Ha21UilXfG0fSXZoa7MTBiVQ==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr36398925wrs.9.1620718242491; 
 Tue, 11 May 2021 00:30:42 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id w5sm21352949wrm.10.2021.05.11.00.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/10] gitlab-ci: Move current job set to qemu-project.yml
Date: Tue, 11 May 2021 09:29:52 +0200
Message-Id: <20210511072952.2813358-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


