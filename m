Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23FC39221E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:34:08 +0200 (CEST)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1AF-00080p-Os
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wK-0003O3-5U
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wH-0000Ef-3e
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id z17so2542159wrq.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6j9YrZTaq5jWzBey0qvSrBDDImcEHz2FSmzTTCG5t4=;
 b=BlneFHuPdp2PjI52d9eCDei3jOcpkfuYiZOXXzjOt5iSiFnCs9pu9GRcX05xK3NDvv
 cmSArrFAKthCThofLO3UiH3GVwjlOubPlcW0NijsjSleqHt5iCuskwjDjJRxyU8A9dA1
 jPY9ccFQMPfqlc0i8K8os5e4PqhQeomittNF6IU09ybcLzIUrQsksxKhl1lfO5rQjQ4m
 +rVOTgfayM+1porLscmbZ1aFZoVgReveoeKyJMz/p3c5wJzAwasqtXjjXBqGXWV0K0Bi
 cqzkqbfPzyIuQJM9vueJ1W/wCOaRE9TfV4XeAAFwtZx6u5+u+SbRQUbj/JHRGBQrDzsE
 YExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j6j9YrZTaq5jWzBey0qvSrBDDImcEHz2FSmzTTCG5t4=;
 b=cUFV0GEB5O7oZQRaeZsY+4rD0BSzNzcT6nU2FQ78sxDAnw5D8dwjb297vr36F+XHEB
 dFseU4z87fFzHjoZ6l5oCeUnGexpoxI0zdf+z4JAauTYJDCm4omc0SxyrvtmAKyKs/Xn
 pj3zTYtTAd+PncM4O4otAKwJ/pjWkOgjHbWcXKy5ZO3fA/6zCMfJapmaPpSatWq1cIo7
 stONvIsr/t+kmTb5bs7X2dWBk+b+1l3stNqYZtQwCL/rt3Ay38ShRWHkAqddXBjL9rU0
 9pbv2yzwMrbGGSqZ/gAlGCF3cOX30Hd4O9K7S8ylsTy7NUA7VrNL3QSlhNNw0DAZbvvJ
 8kqA==
X-Gm-Message-State: AOAM532R5nWkqYdoEN0lJY2bqX6tbcfOgczoPcTvlOLQcQBasN8Sw4jh
 iq9CmZbOIQOCRjfEhUUR9lJ3KvHXCwB+jA==
X-Google-Smtp-Source: ABdhPJycEG85ixpawyLp8uhoQ3DfaaLjdGIUt2RVcPOqMNv/iGSFoviTk+l2McePtTv+3awXTse/Nw==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr33933522wrj.175.1622063979117; 
 Wed, 26 May 2021 14:19:39 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id u26sm290708wmn.19.2021.05.26.14.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/19] gitlab: Move current job set to qemu-project.yml
Date: Wed, 26 May 2021 23:18:31 +0200
Message-Id: <20210526211838.421716-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow forks to easily decide which jobs they want to run,
but without disrupting the current default, move the current
set of jobs to a new file corresponding to the jobs run by
the mainstream project CI:
https://gitlab.com/qemu-project/qemu/-/pipelines

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210511072952.2813358-11-f4bug@amsat.org>
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


