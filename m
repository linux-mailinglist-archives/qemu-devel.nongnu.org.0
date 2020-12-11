Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394182D7DE0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:18:03 +0100 (CET)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmzS-0001uX-4T
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knm2m-000479-Mh
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knm2k-0005Rn-Cp
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607707041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/86y14GUAh849U3xoqBoq9267qvFGJ2R67n6SR6eH8o=;
 b=I7oqcRQ6IYGJOavtVnptm7gwaSKJJzoZEeqdUUme9Old9hfYGxrWG4G8fA0WzhJL0A2k8z
 wNT+WsX+FOUxCuYRhm/uyKILBy0bfv+Npj7nbLyIhBm59EPS0/wbjMdTxQBfvuetLq54N2
 1CUBisEA/BA1GKpO5/8URK+aQY6vyv8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-4pYz82a_MUCIVL9JdRadBQ-1; Fri, 11 Dec 2020 12:17:18 -0500
X-MC-Unique: 4pYz82a_MUCIVL9JdRadBQ-1
Received: by mail-ej1-f70.google.com with SMTP id m4so2996748ejc.14
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/86y14GUAh849U3xoqBoq9267qvFGJ2R67n6SR6eH8o=;
 b=Ljhnc98+f7mq/CIyAM6P+36HQWx9iLasbXbHqeFfFbj0bBolTOB3MbePANfF8KeUrx
 qQQKVjv8jMmE9yXKDkOM2lQcIeXO66pN46OguaMtCVRR/Jg3hAqZ4KyGzVAO9ktCUQY1
 IH7XsHV7SqRJLsabuUb05Bju5XQC0WzW7n6jxSbwADPnUfuhigBYnNetgMzYa4pqrtQo
 zSI19GfZZJLHANlIWHXTzWUzWNQ/SKoijib5vFq05LDJ/uzVVWQkuD5LR8305pbmk1cY
 PLlECxMWzSogE8RY3wywdTI5fRIJcsFQS0o2uKywd9xLlxWidGpEkCT1OWtPj/d1QAem
 kOPg==
X-Gm-Message-State: AOAM532fQ1nAIfKPWTVD1/v941X50OtE0NDd+SOCo0HJ4AqYtSa5uCzy
 NA+j1wVwNDIRrQMz5QhKlh4M74iws8OSxDxd81ACR+o0QA8w9LQ8vSIdYEygDCretmNjLNYYoG9
 gC+9EREyDiV0dxGOAl2XOT4poDg6l9F9JEsAKdpzmeGLjCCxqoSfC2h3byhhFy0Cu
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr11486705ejd.363.1607707036469; 
 Fri, 11 Dec 2020 09:17:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiiJVu/TPUlRpNFMAHsW1dgeloiSGgkoHzNUPqI4C/GyH4eJ+8LSv/U4nyt76RAY26lSBKNw==
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr11486670ejd.363.1607707036180; 
 Fri, 11 Dec 2020 09:17:16 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n7sm8120868edb.34.2020.12.11.09.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 09:17:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Subject: [RFC PATCH 2/2] gitlab-ci: Introduce allow_skipping_job_template
Date: Fri, 11 Dec 2020 18:17:03 +0100
Message-Id: <20201211171703.537546-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211171703.537546-1-philmd@redhat.com>
References: <20201211171703.537546-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It might be overkill (and frustrating) to rerun all the jobs when
iterating over a single code unit. As some users are interested
in only rerunning a specific set of jobs, allow them to use a
"manual" profile, when jobs are created in the pipeline but not
started. It is up to the user to manually start the jobs of
interest.

To switch a repository to manual, set QEMU_DEFAULT_WORKFLOW_MANUAL
in the project UI, following [1].

Once a repository is using the manual workflow, the user can still
automatically start the jobs by explicitly set the
QEMU_IGNORE_DEFAULT_WORKFLOW which disable the manual mode.

Example while pushing a branch/tag from command line (see [2]):

  $ git push -o ci.variable="QEMU_IGNORE_DEFAULT_WORKFLOW=1" \
      myrepo mybranch

[1] https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
[2] https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml |  4 ++++
 .gitlab-ci.yml               | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 864cad7cec5..56b053cbb52 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,5 @@
 .cross_system_build_job:
+  extends: .allow_skipping_job
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -18,6 +19,7 @@
 # KVM), and set extra options (such disabling other accelerators) via the
 # $ACCEL_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
+  extends: .allow_skipping_job
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 30m
@@ -30,6 +32,7 @@
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_user_build_job:
+  extends: .allow_skipping_job
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -40,6 +43,7 @@
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_sanity_check_job:
+  extends: .allow_skipping_job
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 3m
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98bff03b47b..26b85f08f35 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,7 +13,21 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
 
+.allow_skipping_job_template: &allow_skipping_job_definition
+  rules:
+    # Skip if the user set the QEMU_DEFAULT_WORKFLOW_MANUAL variable for its
+    # project. Can be overridden by setting the QEMU_IGNORE_DEFAULT_WORKFLOW
+    # variable.
+    - if: $CI_PIPELINE_SOURCE == "push" && $QEMU_DEFAULT_WORKFLOW_MANUAL && $QEMU_IGNORE_DEFAULT_WORKFLOW == null
+      when: manual
+      allow_failure: true
+    - when: always
+
+.allow_skipping_job:
+  <<: *allow_skipping_job_definition
+
 .native_build_job_template: &native_build_job_definition
+  <<: *allow_skipping_job_definition
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -35,6 +49,7 @@ include:
       fi
 
 .native_test_job_template: &native_test_job_definition
+  <<: *allow_skipping_job_definition
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -43,6 +58,7 @@ include:
     - make $MAKE_CHECK_ARGS
 
 .acceptance_template: &acceptance_definition
+  <<: *allow_skipping_job_definition
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
@@ -536,6 +552,7 @@ check-dco:
     GIT_DEPTH: 1000
 
 build-libvhost-user:
+  <<: *allow_skipping_job_definition
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
   before_script:
@@ -547,6 +564,7 @@ build-libvhost-user:
     - ninja
 
 pages:
+  <<: *allow_skipping_job_definition
   image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
   stage: test
   needs:
-- 
2.26.2


