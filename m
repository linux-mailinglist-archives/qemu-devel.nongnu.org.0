Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA3038B36B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:42:12 +0200 (CEST)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkoN-00049u-Q8
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljkkz-0006ES-Lf
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:38:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljkkx-0004pW-Sw
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:38:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id z130so9468430wmg.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4PzK0QKrc/sxz/uK0uupygknAR9gMxyZHWgoVewc2C0=;
 b=lrH8hbKtNYAzd1T3kcYRUPB66C0MRS0lN/VMWMWWYVPo8LLkj+ucFwjq3qcxdu9Qxc
 JbYpvlardYkplnLavU4XdL5sQTbYKOUjnPEEhFuV3bvWPE794Shwnzn+9pAfpnR0Tu2y
 mS1K/Fd4M/Z9aJWMo+l2eV4C8pvHhBmVw8iwGiDWawRawbZrRwohmr5Gqy5mjzRCYo1f
 dlMjcwnb3meMzGt/dO4hGDp0hLUONFBY4nA1+tjUSHORxj5moGViXwf7uPlhKDtx1ZId
 31ZrWjiybIU0REvJlcjMFHvRw9vHME6xbAgMS0VktxBn4z0Nl8uxi8kxAae5qgM4k/MC
 UsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4PzK0QKrc/sxz/uK0uupygknAR9gMxyZHWgoVewc2C0=;
 b=cibHoK3N/ebGjqv/F8JPAsfwQ5SZkbejMxxxXvp8zzhUk2hHFj50VmPYFfMZ7H0XU2
 qjIzzWN656aVd60bZTazqxF95AuUs1GKAW+MnW4rST+8jQ8W6ANX6yNlS1dNOkgmb9N+
 KV4TBp5vhpX3rR1qtwkXOMiUU3hQpZF+KrgGov6qw161m84f9RiQXNP2L85SgYklimni
 ZIoiHoRL+jnJxg9cY2K1JSohG4GNonkRAimbINhJjm70q2AqZdBq61MveSVGrJRUeg8V
 BIxVHJ1TlFCe7Z4ip7b9sbYsP0Yf9J4s+lxiFrobEIBeSmNq0z3f/C5PkGP4t/XuSocr
 Mwpg==
X-Gm-Message-State: AOAM531V4KuU3VGuTeVpo4UjftQRow6bLO/tB53C2QcuVh/CvAxq7LjU
 0guNbudbX942qnl4PLwXI0S5CQ==
X-Google-Smtp-Source: ABdhPJzHrf4LXSrNgiBlYMhtoKWM+xsxt7sDWBC6C+T7AGCdndzd7D++tJgolpZuazqV5znYixsDTQ==
X-Received: by 2002:a05:600c:358f:: with SMTP id
 p15mr4817382wmq.14.1621525116427; 
 Thu, 20 May 2021 08:38:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm3615385wrz.57.2021.05.20.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:38:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D2EE1FF7E;
 Thu, 20 May 2021 16:38:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2] gitlab: add special rule for the hexagon container
Date: Thu, 20 May 2021 16:38:31 +0100
Message-Id: <20210520153831.11873-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
v2
  - fix silly typo
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
index f718b61fa7..b2f929c758 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -421,6 +421,8 @@ build-user-static:
 # declared. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
+  needs:
+    job: hexagon-cross-container
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
-- 
2.20.1


