Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145F3921EF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:23:20 +0200 (CEST)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0zn-0005xU-DS
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vg-0002Wk-FY
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0ve-0008KI-Oj
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id p7so2521100wru.10
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPWremnQeDbf5OKwcSsZMVVUeLqeVe3tozm8/BONWnc=;
 b=WQoU7G/rEy3YKMInZMdagijCjD8TosqyKvf6GG/4Dm+9VhVFtaYESZFpb1z5ZLScfD
 klQUpuTdXZ+Df82c/dO6UPydjyv41+Unx/FwPIr1cQrwE9S10eLDLXNPAKhGY787xFDB
 L3H651tjf4y57KGykqILuKnZxqGGP2SSNPUGrXIrP2Yy8d2a04E+bK0UcaknaajMF1ZD
 Dy1uTiL19+qhMZNzYCBHaRy2PvTDslFdrzE5tzhOKeOwo4ezn3LYUoYJM6pRtGSVwrUF
 iBc2ca7fWBZIxmVNJHhHYjOf9oVzorp1hSSldurmH71VdeA3JE49K2kYESNF8eSm1bKj
 rHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wPWremnQeDbf5OKwcSsZMVVUeLqeVe3tozm8/BONWnc=;
 b=rnPCshzjhnlzEQwl9s5CnufPs1zVdf7draE1iTSIt+mfflGs2hTo/Qdr4j4Dfq4O0/
 DIO5cEy9Wt/DU3fUInADJz0vkF+DCCcw9dApQqmTA9bJ2gVSVcLqE7aHAUxvuXF55SxL
 gmz5aVTAEQUw3D7//TVCQKfuYvby4IwfMjpDAfWv2EYVpv4xA8djbKjPOdCTltG3jc17
 3MlLwvF4boShlfISxoHttw91+fj+TwOSv4JsW2OEFlFH/SRDKkWFiWt9QmkfbRbNFrtS
 HcFb8IzS4RLp4uUIZASfwFpAiWleXQmt9LG4Adngt7RT1VRvsi6qTPL7tZcH6YRuMpAu
 CwGg==
X-Gm-Message-State: AOAM532g7n8KwBTFYkfvcCLSGRfhhzMds9voCkBH0z9lAzcWbvyquUzG
 t4vyuecjTypqV28GWgo2RFK8m5Qf2spwEg==
X-Google-Smtp-Source: ABdhPJwksHf4gqMVUEnBod0YcLkWGVKCyxvvV66ocSxlXkt1k3pfzUbF4EzpPHfNc1lYAMyGjYnJXQ==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr26513wrr.62.1622063940897;
 Wed, 26 May 2021 14:19:00 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id m20sm8073513wmi.5.2021.05.26.14.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] gitlab: Extract container job template to
 container-template.yml
Date: Wed, 26 May 2021 23:18:23 +0200
Message-Id: <20210526211838.421716-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

Extract the container job template to a new file
(container-template.yml) to be able to reuse it
without having to run all the jobs included, which
are mainly useful for mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-4-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/container-template.yml | 21 +++++++++++++++++++++
 .gitlab-ci.d/containers.yml         | 23 ++---------------------
 2 files changed, 23 insertions(+), 21 deletions(-)
 create mode 100644 .gitlab-ci.d/container-template.yml

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
new file mode 100644
index 00000000000..1baecd94606
--- /dev/null
+++ b/.gitlab-ci.d/container-template.yml
@@ -0,0 +1,21 @@
+.container_job_template:
+  image: docker:stable
+  stage: containers
+  services:
+    - docker:dind
+  before_script:
+    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
+    - apk add python3
+    - docker info
+    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+  script:
+    - echo "TAG:$TAG"
+    - echo "COMMON_TAG:$COMMON_TAG"
+    - ./tests/docker/docker.py --engine docker build
+          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
+          -r $CI_REGISTRY/qemu-project/qemu
+    - docker tag "qemu/$NAME" "$TAG"
+    - docker push "$TAG"
+  after_script:
+    - docker logout
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 7b7ca3790df..2b06763d73b 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,24 +1,5 @@
-.container_job_template:
-  image: docker:stable
-  stage: containers
-  services:
-    - docker:dind
-  before_script:
-    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
-    - apk add python3
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
-  script:
-    - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
-    - ./tests/docker/docker.py --engine docker build
-          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY/qemu-project/qemu
-    - docker tag "qemu/$NAME" "$TAG"
-    - docker push "$TAG"
-  after_script:
-    - docker logout
+include:
+  - local: '/.gitlab-ci.d/container-template.yml'
 
 amd64-alpine-container:
   extends: .container_job_template
-- 
2.26.3


