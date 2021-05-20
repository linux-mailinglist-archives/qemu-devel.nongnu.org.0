Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F1C38B57F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:51:27 +0200 (CEST)
Received: from localhost ([::1]:32996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmpS-0007Sy-7O
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhT-0003Dw-Qa
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhR-00015C-VV
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f19-20020a05600c1553b02901794fafcfefso5289621wmg.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZqZq31xIHMpm7PrjzBNfBJf8EWF7gp75FhioXeH7/II=;
 b=zNfSRLNpt/dQDSEvgY+LQ3B5iZjfyPMbVVG9mbCFiH7+ZsBJ4T/NtaO9nP6lYOT4jR
 D7lPteeDf3rFgWduHhoywRAX1bNvS7YpM9STXGQKD5eUfWkH5zzRNgcYg9Z2WJCAiXSH
 J7e1LdmQyWDhpvGhSkOLYUWYV0vqdCk1OmsSKsxfbbhjZZxi7uJ+mThiI9u1Op/EwtOz
 mvCMVLgoXBigizwLewxc7FWWJBKb6x03GIlsOi3ohVXDJ4XW4jkkPWzkiYFnkibza1xo
 +BR2qY3LISBWGn6MI5hyiHzz1fF8CcqIw+ISscuj5m7yXbWnyMVsXhGpebTBpETcHePb
 FKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqZq31xIHMpm7PrjzBNfBJf8EWF7gp75FhioXeH7/II=;
 b=WoZqhDqXSKew7b8PnxCVubYDcrwi+HpMXg3IfIwfFT8faDPQNGJGk/XBKci4NzPCuD
 IHjivwJBshVrRO6YddMxfaoGO/HxbzJvKUuX+7s0f4ovUdOfeVGHvGAiJyq9zzqgR9Be
 XSot8sVilsWSi6EkKnksfObtCjAAhqm2csAZ1DW3bzWBGVPMKUjKdbCx0pKaoVFpovsB
 /cbGEMzCGKq2nKTGF/gHMjNmO1Viv3thO3PuBr2KKBTUab7POolZQliSjcKNIfoWz8sI
 c56RqSXpw2wYPoRRkXj3ciZezvQcUh4TP9wGXWcYYN1M8rLxY8sXEIwwsMaAnhk4r2bu
 FPTA==
X-Gm-Message-State: AOAM531v98NONPR2XITGt7c08mvlb40PciXAZ4p2rM/lQSvRqS/lqnPk
 JEQJFi5KELAemWWSwODxixurjA==
X-Google-Smtp-Source: ABdhPJzEwxU/L0DMV9AfGZbNdTOczCnDAKcA0k2xqqeu+3Pp/7+Kg095IgLFy0T445ELJ+Ak6+sF3w==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr4780296wmf.79.1621532588557;
 Thu, 20 May 2021 10:43:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s11sm7492865wmf.14.2021.05.20.10.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCBAF1FF8F;
 Thu, 20 May 2021 18:43:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/8] gitlab: add special rule for the hexagon container
Date: Thu, 20 May 2021 18:42:58 +0100
Message-Id: <20210520174303.12310-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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
Tested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
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


