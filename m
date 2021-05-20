Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70A38B30C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:22:50 +0200 (CEST)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkVd-0002zw-8l
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljkSa-0007Q1-SS
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:19:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljkSV-0004iL-IC
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:19:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so5461070wmf.1
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvX/iSj6cg3XruBayM0ZW5ZjijRFuAO9KvUrPZMLoOA=;
 b=hIf9IC9hFX43kwGTAXpfIRBFWum2ptArtJ6BAImq+2vnFraQFuud6qDH7CphQsCd5T
 BcV5iKL+vCS/9DT6qD6h52n+Uyg/rx4j7R14bruJ13CXYXP4c4jOiseLSzITvWRSJb70
 5sAAwMmzDTN+XR/H/eY3CHdKJNBespO50ACdKz/WsA73sFU2Uu+qjMyzKsll6SBslJ2l
 KfD1uP+eFXiCKWUuyM1CL0MCKoo1FrogBt6BC0Rl5b7wJBzVdwTPctZC3Iv5rgqtRVjj
 F5RFTaSU/n1K1f/G/NGmaLgpdfrJpDJyx1V1rE76/ezLaCoxlxAqU0GXTr23NNju2Y/E
 dkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvX/iSj6cg3XruBayM0ZW5ZjijRFuAO9KvUrPZMLoOA=;
 b=JGt1O+JQq3yhZe0Tdg53Ix+WX8IzEPVjBoVdS2Ezerlq3cC/tXzQc4/u/LnmHAq0Us
 bgBwZ9BwiCF41hXEyI7b70Rh8V6tWEFRjdsICxgJ8HWtgi0X9dsLXKzxpV9N+GUF7L5K
 WppIInMmZVuT61jVfjCnfLsRZBt1zsu8z1OWSwCw1+AWIhfSBLwHjvAqpVKOXHl/F9tM
 JZGxfftSLyEIriBY8ouZXxGv29jM0xUOrddzoZdUiHUmUM/vBzpIWeRn/7NeNfCp5/bQ
 GOIuoaJY/TJKADpBzPQV5qK2JjRsgn4h6On4K4GIYdxKJpPgRXUE+pu2NPhdWhoecHec
 314Q==
X-Gm-Message-State: AOAM531k9Ul07n6SX+MLwm+xhtlDfYkvbfaKFiQt+JMvzgI5Xi25uzKF
 1L35eEdeHte2s4Cy7E+TF1JNDA==
X-Google-Smtp-Source: ABdhPJwtBmZDmYjw3QPz33ex8MZ61hRgobIX8rK7y479WSNJ103+qJvkUaxp3v9RAgE7gBmxqAC2eQ==
X-Received: by 2002:a1c:44f:: with SMTP id 76mr4180639wme.166.1621523973221;
 Thu, 20 May 2021 08:19:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm3555999wru.73.2021.05.20.08.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:19:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86E4D1FF7E;
 Thu, 20 May 2021 16:19:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gitlab: add special rule for the hexagon container
Date: Thu, 20 May 2021 16:19:24 +0100
Message-Id: <20210520151924.5063-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hexagon container is always manually built but of course not
everyone will be building it themselves and pushing to their
registries. We still need to create a "local" registry copy for the
actual gitlab tests to run. We don't build it in this case, just pull
it across from the upstream registry. We disable this rule from
running on the qemu-project itself so it doesn't accidentally wipe out
our master copy.

Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
---
 .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
 .gitlab-ci.yml              |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 3fb3c14f06..088c7e68c3 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -101,6 +101,33 @@ armhf-debian-cross-container:
   variables:
     NAME: debian-armhf-cross
 
+# We never want to build hexagon in the CI system and by default we
+# always want to refer to the master registry where it lives.
+hexagon-cross-container:
+  image: docker:stable
+  stage: containers
+  except:
+    variables:
+      - $CI_PROJECT_NAMESPACE == 'qemu-project'
+  variables:
+    NAME: debian-hexagon-cross
+    GIT_DEPTH: 1
+  services:
+    - docker:dind
+  before_script:
+    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
+    - docker info
+    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+  script:
+    - echo "TAG:$TAG"
+    - echo "COMMON_TAG:$COMMON_TAG"
+    - docker pull $COMMON_TAG
+    - docker tag $COMMON_TAG $TAG
+    - docker push "$TAG"
+  after_script:
+    - docker logout
+
 hppa-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f718b61fa7..a04cca9db0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -421,6 +421,8 @@ build-user-static:
 # declared. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
+  needs:
+    hob: hexagon-cross-container
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
-- 
2.20.1


