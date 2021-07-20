Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BE3D05E4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:54:33 +0200 (CEST)
Received: from localhost ([::1]:50138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zZI-0000Z5-KS
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zPV-0004tL-G1
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:44:26 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zPS-00086s-50
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:44:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id n4so311543wms.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6HXaeadufTGc/jHjJoB/6ewRfmrNCAr+yGlUDq0TRk=;
 b=McCdR4NeM9p61RbOPhJXh/VlWuePg8fu/owQa0TrF37pEUeYMR0rgvX0b4JrNXVWbR
 1JWAf2SvbnEV75uraJ0c3SR3q8XYlMCpG3zvKLgCqH3guYwdflPH6g5i65okdQmcXxqt
 lpe8hFj1Zw8IfWOGbV9940igvyekEdm5cR19zxXRMm9Rukmbd5eF3UfIGntmIB4Dt6fO
 p0vdhOkq+yxfej5zVwMhFF3rCUrRzier0rqm8gFJR/SCMA4dFzcEheNoldGH16Wn3Je/
 3OvGGXLaw6Zg13amyhqFwehCFsvPhwZ7BH4t0u+kY+eY0yM63aW8IbbsnG9HhSv9IsSg
 lm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6HXaeadufTGc/jHjJoB/6ewRfmrNCAr+yGlUDq0TRk=;
 b=tGayK0hLr5MNG+e9DmE7HxL8wqVbjvW+KzcH+4Ycq+BDjDG8+TardZIfHvLZbFQ90z
 U/JhRESfF0BLdFVdb5Ze3JY1DNPkFi7AoIdrBlVTlUoUp/JUTy3F5BpLneqbNni0Z3jp
 8PH7+zEicJXOLKGERPoP8b1CLJAmud2FKSpJe8qdTUTTj3QGxVC6p8sigXdmOHzBWwBv
 KsjSk8909voSETNCQB+4xP7J9u2Jg4OnSnDRovKMi4LC1Xky01CeqBvAv3/rtrlkJ22E
 FcpahoSoMVrMPTBFf1PHYFs+vvMdbkpU+dRNZyQF5lplh4X/oK7BM3p+dMJTFxDApiz6
 DlTQ==
X-Gm-Message-State: AOAM530VOdLp3v1Y4w5f5JiD2kYCK6+k26jFi0DHneWoE3mQgjno5gvI
 TY4+kQCgAuUEeGva6DrZkZypRQ==
X-Google-Smtp-Source: ABdhPJwprxl3kqEHr96srhsLm0BSbgnw0TITR5smlt6ucoLavJGIgIM0L8AmHCUHBSmJxkDpSu0cEw==
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr989485wmq.32.1626824660574; 
 Tue, 20 Jul 2021 16:44:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o14sm3669283wmq.31.2021.07.20.16.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:44:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F5D41FFB4;
 Wed, 21 Jul 2021 00:27:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 29/29] gitlab-ci: Extract OpenSBI job rules to reusable
 section
Date: Wed, 21 Jul 2021 00:27:03 +0100
Message-Id: <20210720232703.10650-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

All jobs depending on 'docker-opensbi' job must use at most all
the rules that triggers it. The simplest way to ensure that
is to always use the same rules. Extract all the rules to a
reusable section, and include this section (with the 'extends'
keyword) in both 'docker-opensbi' and 'build-opensbi' jobs.

The problem was introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
Add jobs to build OpenSBI firmware binaries"), but was revealed in
commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
container").

This fix is similar to the one used with the EDK2 firmware job in
commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
section").

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210720164829.3949558-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/opensbi.yml | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index f66cd1d908..d8a0456679 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -1,10 +1,23 @@
-docker-opensbi:
- stage: containers
- rules: # Only run this job when the Dockerfile is modified
+# All jobs needing docker-opensbi must use the same rules it uses.
+.opensbi_job_rules:
+ rules: # Only run this job when ...
  - changes:
+   # this file is modified
    - .gitlab-ci.d/opensbi.yml
+   # or the Dockerfile is modified
    - .gitlab-ci.d/opensbi/Dockerfile
    when: always
+ - changes: # or roms/opensbi/ is modified (submodule updated)
+   - roms/opensbi/*
+   when: always
+ - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
+   when: always
+ - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
+   when: always
+
+docker-opensbi:
+ extends: .opensbi_job_rules
+ stage: containers
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -24,16 +37,9 @@ docker-opensbi:
  - docker push $IMAGE_TAG
 
 build-opensbi:
+ extends: .opensbi_job_rules
  stage: build
  needs: ['docker-opensbi']
- rules: # Only run this job when ...
- - changes: # ... roms/opensbi/ is modified (submodule updated)
-   - roms/opensbi/*
-   when: always
- - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
-   when: always
- - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
-   when: always
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
    - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
-- 
2.32.0.264.g75ae10bc75


