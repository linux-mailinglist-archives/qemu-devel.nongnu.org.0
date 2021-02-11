Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4B318AD0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:39:32 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABFr-0007OQ-74
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4n-0002sb-B1
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:05 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4j-0003qu-9P
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n10so3684285wmq.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x1/vAKnRSQADsQsBmMIYqdCFCBIIugEXj3Af6+IKIY4=;
 b=HiO+xL91kWvrQ0kdZ9Cr+7aeFIV/a6y+GrRoOtGGk9fyIYx7igps4FBk/B+LzZXgpC
 eoa421S9vHXH3zJfZr54k5HDYt6p8JtiBQbQk7TIh58T+vQmqnCvpJ6AQAVgpYmGrIyr
 SXE58cfj8JwmLTQe2E6F3dOmwiO2lDf3PniAcVY8K4q7AQeXg9OxteOlfFqI8Llg0H4D
 58yUetPe0X/HJmZuK3NWCCXmZo4cF3I40mg+/M3LPhxaAWXN2B6IiS3glukYACOhmSry
 SWu0sPMc44RNOIyvp+c35RFrVQnjkblc/akISGDX+0crmNV2P0Cn7CVl5p+lzKTMv6SI
 L/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1/vAKnRSQADsQsBmMIYqdCFCBIIugEXj3Af6+IKIY4=;
 b=krFzWKhrcjanE+UmWo0trMLqmxoCbDU98c8BSARrzur605aR8erDsGcj8wshwaIouT
 LtkWaeRxOIJsu3tpT0BH6ahgXNGWpdkHid0sQ6/ZgQ00CEicaVWMZtmSRh0lxnhfNkjy
 pObRVPmJhonhJ9qg5GndeKcVy3uqT8qOzVYJJalTo2dfNAO37lZnc87GiP2kjtkQ8lWP
 Ric/zoIK5Lsum2sCJp5lf5V+VMX1aI3/ZYawAHtM52TWwwbZvsBrNlLNzRJoVYNMXjQn
 4j0iT5la2MLDNaAZD5/zy4qMrYBnZrptTYnPia3VRC/wR33IwsdWafUjblfyMdQ+ySEa
 dfwA==
X-Gm-Message-State: AOAM532GO8DFRqk2/3m2+lpiaScj4HU0DpQLVvXkgo6ySMuHQ74qHMBr
 JWewXqJ8PvyPgkABZFbf4bD02g==
X-Google-Smtp-Source: ABdhPJyirz94XU4fsry3WxLYteemK946Nt92Z5eTNTjd7+s3lNJAqWmNpSKWRViNlFFtm+kFKV6Teg==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr4959610wmg.184.1613046479918; 
 Thu, 11 Feb 2021 04:27:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s64sm10377513wms.21.2021.02.11.04.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 964D61FF92;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/15] .shippable: remove the last bits
Date: Thu, 11 Feb 2021 12:27:41 +0000
Message-Id: <20210211122750.22645-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
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
Message-Id: <20210210154106.20825-1-alex.bennee@linaro.org>

---
v2
  - update MAINTAINERS
---
 .shippable.yml | 23 -----------------------
 MAINTAINERS    |  2 --
 2 files changed, 25 deletions(-)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index cc8767d4b4..0b0b5ddc05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3234,12 +3234,10 @@ S: Maintained
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


