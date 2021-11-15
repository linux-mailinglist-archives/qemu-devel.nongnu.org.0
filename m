Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A792D4501E0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 10:57:55 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYkM-0003Fi-G1
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 04:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmYiv-0000vH-0J
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmYin-0005A9-D1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636970175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lAMNm1iBwkczRjsK7T7x3lFBeAkZS8ZT+Tr/++lByhg=;
 b=hoSYm6Iw8WpRQ3R+jlZjnk3xxfir0ZRbmgDo3QeKGU//h1PhO9AEe+OYbj/71wq8Vsxnu2
 6PV7tkIQTBDpoMD+CGR0VMyahPPp3N2QLcarKwWdl6e47+OyMtiExzOvDCpA62kP3y5U4A
 pmRcpE12cxXOTersEKfZFq92cHbkms0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-yiDBF1BXNfaM566epHCYvw-1; Mon, 15 Nov 2021 04:56:12 -0500
X-MC-Unique: yiDBF1BXNfaM566epHCYvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so7597367wms.8
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 01:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lAMNm1iBwkczRjsK7T7x3lFBeAkZS8ZT+Tr/++lByhg=;
 b=kCQkieHohvXWU35fqScV4gpEor12OScvqirmCdWFGIBSU/B2TifEhlsmhoBgdTejYQ
 2Bwa4w0WTQhYVc1chfZObyiMnpUFGazlNqqTMXnQ+Emk4BvgJZXHYy+/ZIKKnweMPMOx
 ZSY0b+yjX9s7fo09wHSnCBTqSnpaTiJtuJftcTc+lxd3SMvxKQglqR9sSByk/yv0VsYa
 DAwuttTWRn+DYuRn7LpgHSChINOdYokxR2enSzYHgzhqFkuvEXv9aICKbv/L6NHtdff7
 8qyhe2oaSt6xK0Y1Td8cl9NyGt96OQvjLC75qY/e001jbL/NlL/9ZjqEohAE+jIqNcc3
 Sx5Q==
X-Gm-Message-State: AOAM530JchVwgGg8UcD/apF2/sv9nvChcQu+AnSS1CcWMYrf35h24+BF
 MhOjYG28MsQPmVfKhFieJ7AzCdFxsBrR+Jt/A3c0UroCM9T7fPqGDRRf9jlWCw6HjDmGoF1qzqU
 5Vrg3MGz/xyyFQT4LmpdLZ1ASDYZRGeRpYuURWM9mL8ysZpOiGHqdCXAGFQGFBDJk
X-Received: by 2002:a5d:6508:: with SMTP id x8mr45634747wru.388.1636970170761; 
 Mon, 15 Nov 2021 01:56:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwayg1esYHofnlR5teUkUTnWq17ilE2/KtpKrroMFy2VSEe/mF7OXwihHCkZR3EH7eDUvZ9kA==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr45634683wru.388.1636970170319; 
 Mon, 15 Nov 2021 01:56:10 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 s8sm8991404wro.19.2021.11.15.01.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 01:56:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Split custom-runners.yml in one file per runner
Date: Mon, 15 Nov 2021 10:56:08 +0100
Message-Id: <20211115095608.2436223-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To ease maintenance, add the custom-runners/ directory and
split custom-runners.yml in 3 files, all included by the
current custom-runners.yml:
 - ubuntu-18.04-s390x.yml
 - ubuntu-20.04-aarch64.yml
 - centos-stream-8-x86_64.yml

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20211111160501.862396-1-crosa@redhat.com>
https://gitlab.com/stsquad/qemu/-/tree/for-6.2/misc-fixes
---
 .gitlab-ci.d/custom-runners.yml               | 268 +-----------------
 .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
 .../custom-runners/ubuntu-18.04-s390x.yml     | 118 ++++++++
 .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 ++++++++
 4 files changed, 268 insertions(+), 264 deletions(-)
 create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 1f56297dfa1..056c374619b 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -13,267 +13,7 @@
 variables:
   GIT_STRATEGY: clone
 
-# All ubuntu-18.04 jobs should run successfully in an environment
-# setup by the scripts/ci/setup/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
-ubuntu-18.04-s390x-all-linux-static:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
- script:
- # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
- # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
- - mkdir build
- - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
- - make --output-sync -j`nproc` check-tcg V=1
-
-ubuntu-18.04-s390x-all:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-18.04-s390x-alldbg:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --enable-debug --disable-libssh
- - make clean
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-18.04-s390x-clang:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-18.04-s390x-tci:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --enable-tcg-interpreter
- - make --output-sync -j`nproc`
-
-ubuntu-18.04-s390x-notcg:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --disable-tcg
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-# All ubuntu-20.04 jobs should run successfully in an environment
-# setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
-ubuntu-20.04-aarch64-all-linux-static:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$AARCH64_RUNNER_AVAILABLE"
- script:
- # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
- # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
- - mkdir build
- - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
- - make --output-sync -j`nproc` check-tcg V=1
-
-ubuntu-20.04-aarch64-all:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-20.04-aarch64-alldbg:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$AARCH64_RUNNER_AVAILABLE"
- script:
- - mkdir build
- - cd build
- - ../configure --enable-debug --disable-libssh
- - make clean
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-20.04-aarch64-clang:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-20.04-aarch64-tci:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --enable-tcg-interpreter
- - make --output-sync -j`nproc`
-
-ubuntu-20.04-aarch64-notcg:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --disable-tcg
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-centos-stream-8-x86_64:
- allow_failure: true
- needs: []
- stage: build
- tags:
- - centos_stream_8
- - x86_64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
- artifacts:
-   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-   when: on_failure
-   expire_in: 7 days
-   paths:
-     - build/tests/results/latest/results.xml
-     - build/tests/results/latest/test-results
-   reports:
-     junit: build/tests/results/latest/results.xml
- before_script:
- - JOBS=$(expr $(nproc) + 1)
- script:
- - mkdir build
- - cd build
- - ../scripts/ci/org.centos/stream/8/x86_64/configure
- - make -j"$JOBS"
- - make NINJA=":" check
- - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
+include:
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
+  - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
new file mode 100644
index 00000000000..49aa703f55c
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
@@ -0,0 +1,28 @@
+centos-stream-8-x86_64:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - centos_stream_8
+ - x86_64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
+ artifacts:
+   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+   when: on_failure
+   expire_in: 7 days
+   paths:
+     - build/tests/results/latest/results.xml
+     - build/tests/results/latest/test-results
+   reports:
+     junit: build/tests/results/latest/results.xml
+ before_script:
+ - JOBS=$(expr $(nproc) + 1)
+ script:
+ - mkdir build
+ - cd build
+ - ../scripts/ci/org.centos/stream/8/x86_64/configure
+ - make -j"$JOBS"
+ - make NINJA=":" check
+ - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
new file mode 100644
index 00000000000..f39d874a1e1
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
@@ -0,0 +1,118 @@
+# All ubuntu-18.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-18.04-s390x-all-linux-static:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-18.04-s390x-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-alldbg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-clang:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-tci:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-18.04-s390x-notcg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
new file mode 100644
index 00000000000..920e388bd05
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -0,0 +1,118 @@
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-20.04-aarch64-all-linux-static:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-20.04-aarch64-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-alldbg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-clang:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-tci:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-20.04-aarch64-notcg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
-- 
2.31.1


