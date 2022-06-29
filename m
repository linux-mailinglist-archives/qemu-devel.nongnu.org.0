Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DB560713
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 19:12:27 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6bEo-0006na-TR
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 13:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6b9O-0002JG-NU
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:06:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6b9K-0004gN-VL
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656522405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+iCs+NsZ87o2SQlQVrdGbg/0RCPb4MbAcXmvCK++uoM=;
 b=ReoADJi/C6PnNBlKWBa5pZPJS/n8ewmD+F4EL7lZfL32UhlTO2r86zzjNLF3eoQg7ePmNu
 NJboxXBPQiGeqZOp6RG4rI8UDidFGfvkpPD3/l51+pzLTZOFuqa5dI/RjHrKx0puIC/rba
 wutod56x7kwBtvQ5RSl3mpmPiyhfcPY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-D4UrhmvCMhWk8NQVCC6scA-1; Wed, 29 Jun 2022 13:06:44 -0400
X-MC-Unique: D4UrhmvCMhWk8NQVCC6scA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 847F0382ECD5;
 Wed, 29 Jun 2022 17:06:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C16E2166B29;
 Wed, 29 Jun 2022 17:06:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/3] gitlab: normalize indentation in edk2/opensbi rules
Date: Wed, 29 Jun 2022 18:06:36 +0100
Message-Id: <20220629170638.520630-2-berrange@redhat.com>
In-Reply-To: <20220629170638.520630-1-berrange@redhat.com>
References: <20220629170638.520630-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The edk2/opensbi gitlab CI config was using single space indents
which is not consistent with the rest of the gitlab CI config
files.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/edk2.yml    | 108 +++++++++++++++++++-------------------
 .gitlab-ci.d/opensbi.yml | 110 +++++++++++++++++++--------------------
 2 files changed, 109 insertions(+), 109 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 13d0f8b019..fbe763a282 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -1,60 +1,60 @@
 # All jobs needing docker-edk2 must use the same rules it uses.
 .edk2_job_rules:
- rules: # Only run this job when ...
- - changes:
-   # this file is modified
-   - .gitlab-ci.d/edk2.yml
-   # or the Dockerfile is modified
-   - .gitlab-ci.d/edk2/Dockerfile
-   # or roms/edk2/ is modified (submodule updated)
-   - roms/edk2/*
-   when: on_success
- - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
-   when: on_success
- - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
-   when: on_success
+  rules: # Only run this job when ...
+    - changes:
+        # this file is modified
+        - .gitlab-ci.d/edk2.yml
+        # or the Dockerfile is modified
+        - .gitlab-ci.d/edk2/Dockerfile
+        # or roms/edk2/ is modified (submodule updated)
+        - roms/edk2/*
+      when: on_success
+    - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
+      when: on_success
+    - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
+      when: on_success
 
 docker-edk2:
- extends: .edk2_job_rules
- stage: containers
- image: docker:19.03.1
- services:
- - docker:19.03.1-dind
- variables:
-  GIT_DEPTH: 3
-  IMAGE_TAG: $CI_REGISTRY_IMAGE:edk2-cross-build
-  # We don't use TLS
-  DOCKER_HOST: tcp://docker:2375
-  DOCKER_TLS_CERTDIR: ""
- before_script:
- - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
- script:
- - docker pull $IMAGE_TAG || true
- - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
-                                        --tag $IMAGE_TAG .gitlab-ci.d/edk2
- - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
- - docker push $IMAGE_TAG
+  extends: .edk2_job_rules
+  stage: containers
+  image: docker:19.03.1
+  services:
+    - docker:19.03.1-dind
+  variables:
+    GIT_DEPTH: 3
+    IMAGE_TAG: $CI_REGISTRY_IMAGE:edk2-cross-build
+    # We don't use TLS
+    DOCKER_HOST: tcp://docker:2375
+    DOCKER_TLS_CERTDIR: ""
+  before_script:
+    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
+  script:
+    - docker pull $IMAGE_TAG || true
+    - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
+                                           --tag $IMAGE_TAG .gitlab-ci.d/edk2
+    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
+    - docker push $IMAGE_TAG
 
 build-edk2:
- extends: .edk2_job_rules
- stage: build
- needs: ['docker-edk2']
- artifacts:
-   paths: # 'artifacts.zip' will contains the following files:
-   - pc-bios/edk2*bz2
-   - pc-bios/edk2-licenses.txt
-   - edk2-stdout.log
-   - edk2-stderr.log
- image: $CI_REGISTRY_IMAGE:edk2-cross-build
- variables:
-   GIT_DEPTH: 3
- script: # Clone the required submodules and build EDK2
- - git submodule update --init roms/edk2
- - git -C roms/edk2 submodule update --init --
-     ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3
-     BaseTools/Source/C/BrotliCompress/brotli
-     CryptoPkg/Library/OpensslLib/openssl
-     MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
- - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
- - echo "=== Using ${JOBS} simultaneous jobs ==="
- - make -j${JOBS} -C roms efi 2>&1 1>edk2-stdout.log | tee -a edk2-stderr.log >&2
+  extends: .edk2_job_rules
+  stage: build
+  needs: ['docker-edk2']
+  artifacts:
+    paths: # 'artifacts.zip' will contains the following files:
+      - pc-bios/edk2*bz2
+      - pc-bios/edk2-licenses.txt
+      - edk2-stdout.log
+      - edk2-stderr.log
+  image: $CI_REGISTRY_IMAGE:edk2-cross-build
+  variables:
+    GIT_DEPTH: 3
+  script: # Clone the required submodules and build EDK2
+    - git submodule update --init roms/edk2
+    - git -C roms/edk2 submodule update --init --
+       ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3
+       BaseTools/Source/C/BrotliCompress/brotli
+       CryptoPkg/Library/OpensslLib/openssl
+       MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
+    - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
+    - echo "=== Using ${JOBS} simultaneous jobs ==="
+    - make -j${JOBS} -C roms efi 2>&1 1>edk2-stdout.log | tee -a edk2-stderr.log >&2
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 29a22930d1..0745ccdf10 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -1,61 +1,61 @@
 # All jobs needing docker-opensbi must use the same rules it uses.
 .opensbi_job_rules:
- rules: # Only run this job when ...
- - changes:
-   # this file is modified
-   - .gitlab-ci.d/opensbi.yml
-   # or the Dockerfile is modified
-   - .gitlab-ci.d/opensbi/Dockerfile
-   when: on_success
- - changes: # or roms/opensbi/ is modified (submodule updated)
-   - roms/opensbi/*
-   when: on_success
- - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
-   when: on_success
- - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
-   when: on_success
+  rules: # Only run this job when ...
+    - changes:
+        # this file is modified
+        - .gitlab-ci.d/opensbi.yml
+        # or the Dockerfile is modified
+        - .gitlab-ci.d/opensbi/Dockerfile
+      when: on_success
+    - changes: # or roms/opensbi/ is modified (submodule updated)
+        - roms/opensbi/*
+      when: on_success
+    - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
+      when: on_success
+    - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
+      when: on_success
 
 docker-opensbi:
- extends: .opensbi_job_rules
- stage: containers
- image: docker:19.03.1
- services:
- - docker:19.03.1-dind
- variables:
-  GIT_DEPTH: 3
-  IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
-  # We don't use TLS
-  DOCKER_HOST: tcp://docker:2375
-  DOCKER_TLS_CERTDIR: ""
- before_script:
- - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
- script:
- - docker pull $IMAGE_TAG || true
- - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
-                                        --tag $IMAGE_TAG .gitlab-ci.d/opensbi
- - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
- - docker push $IMAGE_TAG
+  extends: .opensbi_job_rules
+  stage: containers
+  image: docker:19.03.1
+  services:
+    - docker:19.03.1-dind
+  variables:
+    GIT_DEPTH: 3
+    IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
+    # We don't use TLS
+    DOCKER_HOST: tcp://docker:2375
+    DOCKER_TLS_CERTDIR: ""
+  before_script:
+    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
+  script:
+    - docker pull $IMAGE_TAG || true
+    - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
+                                           --tag $IMAGE_TAG .gitlab-ci.d/opensbi
+    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
+    - docker push $IMAGE_TAG
 
 build-opensbi:
- extends: .opensbi_job_rules
- stage: build
- needs: ['docker-opensbi']
- artifacts:
-   paths: # 'artifacts.zip' will contains the following files:
-   - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
-   - pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
-   - opensbi32-generic-stdout.log
-   - opensbi32-generic-stderr.log
-   - opensbi64-generic-stdout.log
-   - opensbi64-generic-stderr.log
- image: $CI_REGISTRY_IMAGE:opensbi-cross-build
- variables:
-   GIT_DEPTH: 3
- script: # Clone the required submodules and build OpenSBI
- - git submodule update --init roms/opensbi
- - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
- - echo "=== Using ${JOBS} simultaneous jobs ==="
- - make -j${JOBS} -C roms/opensbi clean
- - make -j${JOBS} -C roms opensbi32-generic 2>&1 1>opensbi32-generic-stdout.log | tee -a opensbi32-generic-stderr.log >&2
- - make -j${JOBS} -C roms/opensbi clean
- - make -j${JOBS} -C roms opensbi64-generic 2>&1 1>opensbi64-generic-stdout.log | tee -a opensbi64-generic-stderr.log >&2
+  extends: .opensbi_job_rules
+  stage: build
+  needs: ['docker-opensbi']
+  artifacts:
+    paths: # 'artifacts.zip' will contains the following files:
+      - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
+      - pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
+      - opensbi32-generic-stdout.log
+      - opensbi32-generic-stderr.log
+      - opensbi64-generic-stdout.log
+      - opensbi64-generic-stderr.log
+  image: $CI_REGISTRY_IMAGE:opensbi-cross-build
+  variables:
+    GIT_DEPTH: 3
+  script: # Clone the required submodules and build OpenSBI
+    - git submodule update --init roms/opensbi
+    - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
+    - echo "=== Using ${JOBS} simultaneous jobs ==="
+    - make -j${JOBS} -C roms/opensbi clean
+    - make -j${JOBS} -C roms opensbi32-generic 2>&1 1>opensbi32-generic-stdout.log | tee -a opensbi32-generic-stderr.log >&2
+    - make -j${JOBS} -C roms/opensbi clean
+    - make -j${JOBS} -C roms opensbi64-generic 2>&1 1>opensbi64-generic-stdout.log | tee -a opensbi64-generic-stderr.log >&2
-- 
2.36.1


