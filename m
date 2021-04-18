Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69136388F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:42:26 +0200 (CEST)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH3Z-0006Vi-AU
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxA-0001HF-Ov
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGx9-0003Q1-9X
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso7175824wmq.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yp2oeeOnRwUm8R3KG/hR76rs8Lvxb/h3WI1buy5HvJU=;
 b=U+78c2EYUsMzGjb3E+3MhaMa3yt4ILdRRaQ0dVya5mDvPl3Zy3QY+YOW8XeCn0wdTR
 O2yp2HwAMlSi/tVlGGIUAI/fEfi0Ozfrzz0MkY3A4pKp8JH0fYnYh8NBcmD4QotFg2Mr
 qc7nDEq70oqpGXkvX842UtUTGlVxbq2RaGRNcJ3eZYyYbJ22Y+lcWVQIfRWpN44/h11z
 5k9QuaMlpzSb7E8jqtJkjwgckQ3i6XqQK1tlDb2lJ0wyXNUGIfeBPLXjxOEzGEHBfJJl
 1cWR5f6FjgfL8s0K/J58CihX66MH7ZJj6P9yJmNNRhbEYwo5iz2/zsI+StLWb0jRlk5G
 UPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yp2oeeOnRwUm8R3KG/hR76rs8Lvxb/h3WI1buy5HvJU=;
 b=VLO2dlp2h+AH9U+kdO9xD7iXSIrKSunU3XbBg07ndq174I3Bq6bI/S98fDbVAU9qaC
 7AesZR6Sa6WPjPMKOWWXF5bxNCy80diU6vOJrYuhw8atMqIjUmjxESVRaCpydvXV8RfO
 C31DH0ZSCMJGLSau/WdX7HHy01NF2lOysGc0DeqdOKwkayZUxSlkYj7hIvX4YPJM64++
 wG0Uw7fxcguv1xPu1dTcPHYDQml5Gf7BJslhhHzT8SsuisvEavwP1K0cNM49ycBp2hc+
 78x+wC8izrWs4m2cH1CnkGlsNVFTihoud6Y0aWMiy6qQ2gxwxPn0TfuS9WDAaJgatW+u
 iqrg==
X-Gm-Message-State: AOAM530DMdBhjIBdSfp/LBKahVuHUK5bPI+pbQ6ZS4VVOpkn1VXJZGCt
 9mnt5ezHQVl/4qmJ+7DoqEQLi7mXymma3g==
X-Google-Smtp-Source: ABdhPJy3RVVB/1dxfxTvvMSEejZQOujG0cGs+nu60tchcc6Zdvz3Zy5vbAA9S2z/SskKy88LvJNM9A==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr18461855wmj.54.1618788945878; 
 Sun, 18 Apr 2021 16:35:45 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u2sm17125918wmc.22.2021.04.18.16.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/15] gitlab-ci: Extract core container jobs to
 container-core.yml
Date: Mon, 19 Apr 2021 01:34:44 +0200
Message-Id: <20210418233448.1267991-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not possible to use the previously extracted templates
without this set of core containers. Extract them into a new
file (container-core.yml) to be able to build them without
having to build all the other containers by default.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/container-core.yml | 17 +++++++++++++++++
 .gitlab-ci.d/containers.yml     | 16 +---------------
 2 files changed, 18 insertions(+), 15 deletions(-)
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
index 0bf4899df10..c371f8587e1 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,5 +1,6 @@
 include:
   - local: '/.gitlab-ci.d/container-template.yml'
+  - local: '/.gitlab-ci.d/container-core.yml'
 
 amd64-alpine-container:
   extends: .container_job_template
@@ -11,16 +12,6 @@ amd64-centos7-container:
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
@@ -190,11 +181,6 @@ cris-fedora-cross-container:
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


