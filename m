Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4A38FFE9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:27:04 +0200 (CEST)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVDD-00058D-GC
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAx-0002H2-2z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAr-0002tn-9j
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o127so16535904wmo.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YNRWlOTKhEnGOgpqh6El3wBoWwIX33IcIZ0zip4g6YI=;
 b=leVT+p/k9iQO6TsGXykNlqnjyM4tJpcd9Nc+yYa8zRM27bJkKub59c8Tg6mnc75s29
 AZSUkNkZMb24+kPEgn4enr5Bp3aQ6pLezHB0UQ3FWqEsYArM27xxDkVvnGjfD383eHtF
 2jiTW1EMZ1OCeUHVJ97A/VgiN0ix6sSb1gc6WQaFooyRncGtGy8CWKfvAMP/J+MNZxcO
 CmdeFGB+99xWvmgHBR+ZOUw77AiBQACKFYmj4O2FDvezA8p/iOnhb997a0hAOYtLilbo
 ANyVU+62cjRzKx8vgJt32UgE2lhK5Ve/PVvoy9EPXf0pQmh/Ximy6FJJV9RlRRpon9gm
 isxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNRWlOTKhEnGOgpqh6El3wBoWwIX33IcIZ0zip4g6YI=;
 b=D20kgspeWB5ntTyqpvPilyD8DTM10fv6hwwS4koMkrYtx6tbnpaL8NvL2IAiJJqFby
 bQufVwFiWJbNkygdE/UCsq6NiR3mllK4EXVCpDIKWSvmnSGUe+pSIqkWzgVzT9IRamF4
 TfKnGqjpl/8ZuiY2klDft8+BtmMtMJP3sXatLgtlV86V8oy/pE1jGsglNlR0ceHmPbuh
 KJ8gyjLW1C2Pa7S89KbafZIOvMUMa/52xknPU7cLssNNa1kk+wjxdWEbZKhMQysnRCp5
 nOqDmAiUoftyPpDyOunJyHxj3DkR5EgMBh6abrMd6vVLL6xN9PwgawUfIeLJtByQravB
 nwRg==
X-Gm-Message-State: AOAM530wbHu7UvqU/6m8p3x+GlvUhYbCwfXph1WVm6TObPu1SDDupd+G
 bCToXGjg/ZP0KqrlvGVG0SJSQQ==
X-Google-Smtp-Source: ABdhPJwBqyzpnhC9cpoBLupLgeR13o5hkPmucIf5VALeZJXMHoqfC/lfBzJgNscfc2HiJS3m2A+FTw==
X-Received: by 2002:a1c:e484:: with SMTP id b126mr3316243wmh.35.1621941875783; 
 Tue, 25 May 2021 04:24:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r5sm12650787wmh.23.2021.05.25.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:24:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3FD51FF8C;
 Tue, 25 May 2021 12:24:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/7] gitlab: add special rule for the hexagon container
Date: Tue, 25 May 2021 12:24:26 +0100
Message-Id: <20210525112431.22005-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
References: <20210525112431.22005-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
Tested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210520174303.12310-4-alex.bennee@linaro.org>

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


