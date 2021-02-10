Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91602316A73
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:46:09 +0100 (CET)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rgu-0005Vc-LF
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9rcP-0001uU-J6
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:41:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9rcB-0004x6-Bs
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:41:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id u14so2202430wmq.4
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 07:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N9eIXXjcqifnnBsCFRBC7A7lqfa+vtVhuDORVtIBlIs=;
 b=WxckQ2opycuYCZzJ0SqTMEKhuk+D4uaE28K6nG6A5u7GciBk9Zf9TAyuBc9p9k0Shk
 Bp+AlKoJRRL/erymZMkzggS1FGkWv/koXbOVHu7bbpV+rRQO2EdwfsgWHXgV7WxwvuOY
 hnMqtaWtGYEdjUEfHHHWnPy96qwoAPpBL5ElOoAEbBR1QFH20Gy3vu4G9inJC5qLgzGa
 CN5h7Du5BKQkb+8Kj4g8fTQFp6ATZcbwnQiiNylbeHKFmZl2p9NJYbBGJcW1qITBFAh5
 u+uqabt+Jhb7SDyVtsZaEtHILOZaOoinidfS19fTFyp2z+dOOpoQVmjzZAaFmVRoYZ8g
 bymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N9eIXXjcqifnnBsCFRBC7A7lqfa+vtVhuDORVtIBlIs=;
 b=gsZKe+3vTJm6dqPQ9IpQi4qknW+AC/yI//voz8R2+5nCtsZ4MeYOCu+JujIeh48WoK
 F7b8YhllikfEtTwAxJ0vSx6TMRYZBk80SaMr1+kZd1S1Mt9jlr0uIAINQYwByrsIkW2o
 gkMGuy1ddpom5sgDJO+pfnnx/zsnjDJFeUr9SmTmbubLnOWy3RmuTJFjh+xzElsst8Jv
 TY1xTJlJm3HU+mZlS35mRBBb3ZKR7SuS6wDM+8+OpZbs0U9xp9kDjX9fT0cnzw1loFV7
 8d5AYNsnbCMydqjeFlAwp7zLMLSF2Y+jDr/MMIR19sz0RAIRkMrlc2xIsp3uIujEWg6F
 FJBA==
X-Gm-Message-State: AOAM532vwCUfPcMVEyBIHWw+AbM40AsoH3kYVMNqYoBvB4elUmlbCnWN
 PNFwKArQ6hIM0IW8Af+OdxBFXA==
X-Google-Smtp-Source: ABdhPJxwyBWftDbmX/g5sH6lY67ZJ/deiCGKr7tHGChwwBllwpSFxcV7Fr0PTm2kNkibdjYBf/InxQ==
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr3470458wmf.110.1612971672347; 
 Wed, 10 Feb 2021 07:41:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 11sm2168799wmo.46.2021.02.10.07.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 07:41:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07A551FF7E;
 Wed, 10 Feb 2021 15:41:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] .shippable: remove the last bits
Date: Wed, 10 Feb 2021 15:41:06 +0000
Message-Id: <20210210154106.20825-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shippable is about to sunset in May 2021 [1] and we had already moved
a chunk of the crossbuilds to GitLab. We already cross build
mips-softmmu targets since:

  6bcb5fc0f7 ("gitlab-ci: Add cross-compiling build tests")

and x86 is very well covered.

[1]: https://blog.shippable.com/the-next-step-in-the-evolution-of-shippable-jfrog-pipelines

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .shippable.yml | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 .shippable.yml

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
-- 
2.20.1


