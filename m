Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF8531B69B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:45:31 +0100 (CET)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaRe-0001vy-DR
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPH-0000Dx-2T
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPE-0004Qy-OH
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:02 -0500
Received: by mail-wm1-x336.google.com with SMTP id j11so5601050wmi.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30uRIvFfK9uh1twHiZVxA6Z0UZseHQ1oFsBv9gCZGn4=;
 b=xjnJ7LR20HOjNHK8Hylz+DhBBcEPy+JDvLDMEB8F3bALcQLxI6orn1FzDQwdEpxtEJ
 d9uUB2uqa/aY/7JfPayczLfIAU2TlGEyFwEmOWUEu892G8/j5mUBPD1So+MTR/UkV6G+
 Vpt4eUPgM6VsvAcToenv5r2mpUbuaF+ZES+I+Gbx+CfJ1CH/PlG1kseTrdBAm95cYJfK
 QytlsjgNXjwuSKpHvUNRis1WRf6iiKw1tFSHICTLaTE4TQWrWEw8y/Hgd5qqr8cjkd7I
 pOGVKKEOMoaRcxGJ7GEJipPJTQnxZDTlqWDQCs/28hKDdFmuK0jfrD+1J9ObA+52gb5s
 4ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30uRIvFfK9uh1twHiZVxA6Z0UZseHQ1oFsBv9gCZGn4=;
 b=M9zcuRdrZ8PFKwllcNUmFbcIRZ+xTlXDbb5KEWSoktuIhkm2tIkq7K+hlXUUpHLn9O
 zo5Imm0OW02ppTk48XfpH1mkRxcLh8OyQHmcBpTBSU9T3GbU/AYTEzJG08ANkg+8K3bZ
 3iPyCrWXCaVqGcOGogDCGjitUs7sZRr5djR5t7UUXlDn2LhS0g6C2OVW+PBjr0rVekom
 uMTVR1zKZEcRhX2RqfMN9L4NRmimgbrYIvCT8bZTTiLvt6qTwVvglY8tPmrEwEGGQA9K
 oZGZZN8IG6D4EmL2y3TkTqT+ofKACIB6SU38L7eXLJhzAujnvlheJxufFPh6yc3/RXQd
 J0fw==
X-Gm-Message-State: AOAM531nLLT9z+CwF4uv7PT/zjfT9FKSLuoEQe7twfjcRyPH0fRPP2kM
 D6zDp8mJI6Q+zLLbgTDnSUAeIw==
X-Google-Smtp-Source: ABdhPJzL8LABzrjRmR65fNJffnDYDaaKYDFewSMojRBnNhdC/gmesCpTVH3O6J4VYW2rX0HsBwYfzA==
X-Received: by 2002:a05:600c:4285:: with SMTP id
 v5mr13542931wmc.59.1613382179488; 
 Mon, 15 Feb 2021 01:42:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm22538373wrp.65.2021.02.15.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8458E1FF92;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/15] .shippable: remove the last bits
Date: Mon, 15 Feb 2021 09:42:35 +0000
Message-Id: <20210215094244.12716-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shippable is about to sunset in May 2021 [1] and we had already moved
a chunk of the crossbuilds to GitLab. We already cross build
mips-softmmu targets since:

  6bcb5fc0f7 ("gitlab-ci: Add cross-compiling build tests")

and x86 is very well covered.

[1]: https://blog.shippable.com/the-next-step-in-the-evolution-of-shippable-jfrog-pipelines

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210211122750.22645-7-alex.bennee@linaro.org>

diff --git a/.shippable.yml b/.shippable.yml
deleted file mode 100644
index 97bfa2a0f3..0000000000
--- a/.shippable.yml
+++ /dev/null
@@ -1,23 +0,0 @@
-language: c
-git:
-   submodules: false
-env:
-  global:
-    - LC_ALL=C
-  matrix:
-    - IMAGE=debian-amd64
-      TARGET_LIST=x86_64-softmmu,x86_64-linux-user
-    - IMAGE=debian-mips-cross
-      TARGET_LIST=mips-softmmu
-build:
-  pre_ci_boot:
-    image_name: registry.gitlab.com/qemu-project/qemu/qemu/${IMAGE}
-    image_tag: latest
-    pull: true
-    options: "-e HOME=/root"
-  ci:
-    - unset CC
-    - mkdir build
-    - cd build
-    - ../configure --disable-docs ${QEMU_CONFIGURE_OPTS} --target-list=${TARGET_LIST}
-    - make -j$(($(getconf _NPROCESSORS_ONLN) + 1))
diff --git a/MAINTAINERS b/MAINTAINERS
index 7f0781b7cc..6295dfe781 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3236,12 +3236,10 @@ S: Maintained
 F: .github/lockdown.yml
 F: .travis.yml
 F: scripts/ci/
-F: .shippable.yml
 F: tests/docker/
 F: tests/vm/
 F: scripts/archive-source.sh
 W: https://travis-ci.org/qemu/qemu
-W: https://app.shippable.com/github/qemu/qemu
 W: http://patchew.org/QEMU/
 
 FreeBSD Hosted Continuous Integration
-- 
2.20.1


