Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAC56683B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:40:51 +0200 (CEST)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fz6-0000kx-GT
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fww-0006Na-M6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwt-0005z1-Kn
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjljmjaSurB1hLyAiuW0ZUv99Il7GokuM4vmCu78YpU=;
 b=dXfT3sTchXj9itcKpKtfUvt2xRYyzq6QbADIhR6e3q0oecBjBS7QHE6fAiXHtX1QJTQDHm
 flAoOHOoi0ng/KvBfkN3/j9yV1iIwv2h/xJ/GGgJYPBCfViKkDCmu8wCNK2ltu5cMjRpF1
 6A5x9HRgfvJgvpB5npphyUHxRcRZ1ZE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-ZG-1NunOMpWBv0kqGcCEJg-1; Tue, 05 Jul 2022 06:38:24 -0400
X-MC-Unique: ZG-1NunOMpWBv0kqGcCEJg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA891185A7B2;
 Tue,  5 Jul 2022 10:38:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBAFE492C3B;
 Tue,  5 Jul 2022 10:38:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 03/14] gitlab: normalize indentation in edk2/opensbi rules
Date: Tue,  5 Jul 2022 12:38:05 +0200
Message-Id: <20220705103816.608166-4-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

The edk2/opensbi gitlab CI config was using single space indents
which is not consistent with the rest of the gitlab CI config
files.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220629170638.520630-2-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.31.1


