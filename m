Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47434446B0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:09:55 +0100 (CET)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJlq-0006AY-RG
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJi8-0003LR-E0
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:04 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJi5-0003XY-Vo
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id d13so4597357wrf.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6DX1I2E4+u1vvC4m9Xo0AYvLcsWD6MSuCT1+7cARLN0=;
 b=zkZ+wKImbI/mY/M9WdpHuXK1P3St5aTEmKoP8flP705V3CGmALJW6QfAfr8VcZVec0
 ucbWj5pp3TqfCio90hn4Bl/4yqDUPFyR3fBlejpJYgnZC+Y+fCNz7z7cwI+SDNi/FNk+
 /NqzWrk3TuUcGSQa1ealZcWrHmwgneNhlsibWPOg3gKl8kBNe/bBSaqHuOaaYPjgurKM
 yLYXJqetMcjRFVM1QeHWWbz9Uhsdl9tkFNfM7yJrSLGDSo0zxbqOlaZpQSQlCpX7CDzz
 LCh2rUOSSsF/Mb4187z+9gn5VSHi0gkY45WtaUsnQnHk9RRC7EuMPx/CoJk3nsApJq/T
 qolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6DX1I2E4+u1vvC4m9Xo0AYvLcsWD6MSuCT1+7cARLN0=;
 b=TllOC0nFGom2ejM1p9x9NwkEGibhxnfuEdSvZ4nEkdomrPeZQVdcFbRxVJW3lFwoaR
 gf+f+JmAHr0C2sSnqxn3oo+JvgXfrVl0YIWdjJOSAsGVdDPOfH6vkiPF68nVeMiCh0N5
 6MGsxReNafXFJC2QmknmYod7PAWNopGtIs7irMv6QNbXteqLsCeNwyLTh3n37CQK3xuf
 0xHUMT+Kanr5TyNoPCaIIAT2Q86WjmOwEqDqygDswwcXi31+n/qpwsClr7JaV3PNr7gw
 4hny/L5RcaMOwVoE/iP076lD/cer7ZfDwKc5bga0APJ87bOUJbK+aGzk76ypnsWt4msZ
 wV6A==
X-Gm-Message-State: AOAM5305fktTB6QcvB2RxqaNdcFATVHr20Nl0EeNZVz2ikoS1w6LLOVJ
 UUaqzFspNTEcHTagSTGK32vukg==
X-Google-Smtp-Source: ABdhPJwjR4E1Noyu7Yy03yTYfBgD/jLisvxU2RAfXJY9ynuCq9VBrsy2kkcP/xHdoFzAgx1JgFQYZQ==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr13895335wrt.41.1635959160319; 
 Wed, 03 Nov 2021 10:06:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c11sm2866164wmq.27.2021.11.03.10.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:05:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB0371FF99;
 Wed,  3 Nov 2021 17:05:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/21] gitlab-ci: Remove special casing for hexagon testing
Date: Wed,  3 Nov 2021 17:05:39 +0000
Message-Id: <20211103170558.717981-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Now that the hexagon container is using a pre-built
toolchain, we do not need to make the build optional.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-5-richard.henderson@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211026102234.3961636-5-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 6c1301e912..3031917840 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -249,14 +249,10 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
-# Because the hexagon cross-compiler takes so long to build we don't rely
-# on the CI system to build it and hence this job has an optional dependency
-# declared. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
   needs:
     job: hexagon-cross-container
-    optional: true
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3b5b90552..ed7a849a69 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -47,33 +47,12 @@ armhf-debian-cross-container:
   variables:
     NAME: debian-armhf-cross
 
-# We never want to build hexagon in the CI system and by default we
-# always want to refer to the master registry where it lives.
 hexagon-cross-container:
-  image: docker:stable
-  stage: containers
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: always
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hexagon-cross
-    GIT_DEPTH: 1
-  services:
-    - docker:dind
-  before_script:
-    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
-  script:
-    - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
-    - docker pull $COMMON_TAG
-    - docker tag $COMMON_TAG $TAG
-    - docker push "$TAG"
-  after_script:
-    - docker logout
 
 hppa-debian-cross-container:
   extends: .container_job_template
-- 
2.30.2


