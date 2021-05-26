Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B633392220
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:34:28 +0200 (CEST)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1AZ-0008Ay-K7
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0w3-0003BC-NJ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0w2-00004y-52
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so1301451wmg.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAWBCS/jkXxoAg50yEeoy5C+3FJkTgMoTfO907Q+3r4=;
 b=Q5umiYmJ2P/wCv3jb03ITY2RHucDhmpy4iaMWkzQJvhlsXFcWr9i/1Oa9cXtNzpZ9b
 /1E8rV2DVZ4rKW84VNLzbrEL/HxwAsscWo5lyga7JmeHJBh7Hdz9FG6WzfZh95xJxv4p
 79SBWLVsrW/QlTX9zbS118Adz+YI4LUPMbeUVcQKxDcnvl1hRyokcyiRmIlsODAkEVgc
 iY9psvRQgpbwC1TOZCvGyij5fXN6OcMQJ0V2tTQpoI1uhPjXGMIgiTMYFk6Rf5765XeB
 iCyzRx8ecs3UfqyCOlstf08qw0Ns91SuK3qZYoNNq5kG24UZqRjcGI22YyeIiFCPki5/
 002Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TAWBCS/jkXxoAg50yEeoy5C+3FJkTgMoTfO907Q+3r4=;
 b=cFsbMbZeQE75RH37GddtX85dmbUO7JUq1cCMPpoQ24vS99DafGH1NthXjh/BgU1ZHw
 v0bFvGW3ykDZPW3Rry4EN6YmSfsZXjs2IMsRl7VSTj30Jvrc5eXZXwwlrQHPiGgwCtJT
 CBbpVY1/02R6GoSqIc64zVUa6QNjOPLCqg4MeZ3CwViq3BqzRYgXqHVBvHYWZSwV8ZeI
 liCLFqZWkURdXLYqcq91v85pQFfCXCUyBdLuxkGrSPzFEkQAUkY7neEQdQDO1HiZJ4pw
 MHn7PcSyZp8ozXUsUOzmUOkAkIqAN2PEviUDfrFzeEILo3g3pFxVmviOeurXTQiPoDzu
 qaqw==
X-Gm-Message-State: AOAM531zDArIXyYAReOcO9hsBGznFqrztOnZ5IlxX09IjB+JKKgzFE5Y
 jm2VjQzkXYxrxz0mHpJr+ux1K3qvDapEhw==
X-Google-Smtp-Source: ABdhPJytiYB6nmIqjxob5ku3XqTdM1sdM4jsqnigSishO04XmchVinKPZYybgWMCDy/NsS6unhVWfg==
X-Received: by 2002:a1c:3183:: with SMTP id x125mr5281926wmx.80.1622063964663; 
 Wed, 26 May 2021 14:19:24 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id b10sm223996wrr.27.2021.05.26.14.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] gitlab: Extract core container jobs to container-core.yml
Date: Wed, 26 May 2021 23:18:28 +0200
Message-Id: <20210526211838.421716-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

It is not possible to use the previously extracted templates
without this set of core containers. Extract them into a new
file (container-core.yml) to be able to build them without
having to build all the other containers by default.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-10-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/container-core.yml | 17 +++++++++++++++++
 .gitlab-ci.d/containers.yml     | 17 +----------------
 2 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 .gitlab-ci.d/container-core.yml

diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
new file mode 100644
index 00000000000..e8dd1f476a2
--- /dev/null
+++ b/.gitlab-ci.d/container-core.yml
@@ -0,0 +1,17 @@
+include:
+  - local: '/.gitlab-ci.d/container-template.yml'
+
+amd64-centos8-container:
+  extends: .container_job_template
+  variables:
+    NAME: centos8
+
+amd64-fedora-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora
+
+amd64-debian10-container:
+  extends: .container_job_template
+  variables:
+    NAME: debian10
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 2b06763d73b..0acc8381ac1 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,5 +1,5 @@
 include:
-  - local: '/.gitlab-ci.d/container-template.yml'
+  - local: '/.gitlab-ci.d/container-core.yml'
 
 amd64-alpine-container:
   extends: .container_job_template
@@ -11,16 +11,6 @@ amd64-centos7-container:
   variables:
     NAME: centos7
 
-amd64-centos8-container:
-  extends: .container_job_template
-  variables:
-    NAME: centos8
-
-amd64-debian10-container:
-  extends: .container_job_template
-  variables:
-    NAME: debian10
-
 amd64-debian11-container:
   extends: .container_job_template
   variables:
@@ -211,11 +201,6 @@ cris-fedora-cross-container:
   variables:
     NAME: fedora-cris-cross
 
-amd64-fedora-container:
-  extends: .container_job_template
-  variables:
-    NAME: fedora
-
 i386-fedora-cross-container:
   extends: .container_job_template
   variables:
-- 
2.26.3


