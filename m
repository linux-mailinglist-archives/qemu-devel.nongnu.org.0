Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD0363895
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:46:16 +0200 (CEST)
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH7H-0001pb-RF
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxU-0001cy-Lk
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:36:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxT-0003YY-5A
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:36:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id w186so12651549wmg.3
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7Ep6fYXtdJtKlmnq+PKoKN/lqrVctpakcoxcBuJMWs=;
 b=tAaGxuDvaMkXYKiAF1lIcYGoLfsAl3r1RHTXvQIBCD1cj+RebsQ6tFyWS2mdOSzEZ1
 0jjzBb3zq9VRxiegdMnjgMnKyuP6KM/SEuhKh7tACJgMgXljC+J3tX0B+Yr+OkKIjSGK
 n86ue1Cupn6j2P1UYYMcyQDcSgbpqivILdva3tHsN2H5EX3WGmoru+ei8Agra8q3juDa
 baVldvL3JRpng/nYhtpDKLv8KJEHV4w+CxQ9vKPsycKXOdH/oJzC7lfDbXpIYmxo4OQ7
 aPVbnTg4cpV7Q0J1QUPsPuMHwfS7Y2GxbRvKRVihmqj+B23AGRrHfxLvFADSJWAKGFi6
 X8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z7Ep6fYXtdJtKlmnq+PKoKN/lqrVctpakcoxcBuJMWs=;
 b=VAQsdMlOMDsamnizelNCEywfL/kdffTZ9I9UWI9ZT70X0OGmSAnDjwRXvpCNn9kPsv
 jALGnHFcUlbFy2U4ZmL1xEPXoNnRqEJ1jJGzCoNuDOogq993YLFoxvYK3Pggm0m+b3hk
 ZPnePpYsVg84wgMeP3z05XdRVJnwfujlp9ASOD1i3R5Wu0RYD64qQ7DDHb6W9aVv8iiA
 OofgnIFK5I+oRICqLluqIoQ9Jx7HFeWcWf5yIRyyb+71G8dyd5VCYJMkoCxoC/UlGonN
 jAL2veBGxWyWs0PvuxfdQvd9DhswjkUL5WxCMTp7xy/KKDM2F7qa0/ufBuXn/43SASCI
 7ErA==
X-Gm-Message-State: AOAM531/O9M8ONq92ZwuOVKCUgEc8va/DLH8lWm1GXka6plye/+TtInF
 BNkF1hkDJaotYErJM8Sae2/vD/AZEv04RQ==
X-Google-Smtp-Source: ABdhPJwwo4nLm1MfU9dIqUdAyzUW2Du5yHaE/mDik8s2+L8BAchP7/6xMlQgOM+nDHLtQhpEJzVd3w==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr4432435wmq.111.1618788965550; 
 Sun, 18 Apr 2021 16:36:05 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i15sm20769193wru.12.2021.04.18.16.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:36:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [NOTFORMERGE PATCH 15/15] gitlab-ci: Use my own set of jobs for CI
 pipeline
Date: Mon, 19 Apr 2021 01:34:48 +0200
Message-Id: <20210418233448.1267991-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

This is an example to use a different set of jobs than the
mainstream one (currently 116 jobs).

Here I only select 2 jobs:
- cross-s390x-kvm-only
- build-libvhost-user

Including their dependencies, I have to run 8 jobs.

Result (build time 15 minutes and 25 seconds):
  https://gitlab.com/philmd/qemu/-/pipelines/284362446

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/philmd.yml | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 .gitlab-ci.d/philmd.yml

diff --git a/.gitlab-ci.d/philmd.yml b/.gitlab-ci.d/philmd.yml
new file mode 100644
index 00000000000..402228e6ed1
--- /dev/null
+++ b/.gitlab-ci.d/philmd.yml
@@ -0,0 +1,33 @@
+include:
+  - local: '/.gitlab-ci.d/stages.yml'
+  - local: '/.gitlab-ci.d/container-core.yml'
+  - local: '/.gitlab-ci.d/crossbuild-template.yml'
+  - local: '/.gitlab-ci.d/checks.yml'
+
+build-libvhost-user:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  needs:
+    job: amd64-fedora-container
+  before_script:
+    - dnf install -y meson ninja-build
+  script:
+    - mkdir subprojects/libvhost-user/build
+    - cd subprojects/libvhost-user/build
+    - meson
+    - ninja
+
+s390x-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-s390x-cross
+
+cross-s390x-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: s390x-debian-cross-container
+  variables:
+    IMAGE: debian-s390x-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
-- 
2.26.3


