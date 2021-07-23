Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1E3D3E90
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:24:43 +0200 (CEST)
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yuh-0004eQ-0f
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygM-00061C-Ue
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:56 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygI-0008Ij-2N
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o1so3113051wrp.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0TmBEibHpnC7wbceXWxjynuBFTGjU5YDaan9P11glE=;
 b=V4lDC9kfCGqRrSQS+BGyW8x1ZJdb7Iewb/OjaTNiMdTl0jTDOWYEk+tpJeTW4ncXsE
 2u5uiKvsQ4ajSGuC9vNUqCTaPoLrfFS6U0z9HpRhWQF5dfScsSEhRRIQ0hnXMP68o/TI
 FdmWEFVtcVREqkxYDSReXtv8n8m27sv/ls8viunXDAZXOcGkXtIBkJJ3mBei3mhlvFmR
 +oAr5SsqIxHL80DkDZE4Bnge1u0TQs5iQ0SD1uDPWyNWlkoCtBczfAGse7xW2CbrvXyq
 7SzatKyQWjj6GOZVDObG+SEhDCM3tz+FMJyq4No5HwAPvGCqLNW1iXzeXlZUhEK9SCMW
 Rzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0TmBEibHpnC7wbceXWxjynuBFTGjU5YDaan9P11glE=;
 b=DEiDHH40+8gl1QUFUaOZDZOixJliL9zu2EgvDP5Xh+H41ygOmMdZOlvo/Cvwbu4HUO
 lBN2BSEa4UW2XufykHOn35TLiM8SRTzQ2d/XUyKcoBsPjorxDvIk/y0CU+k7pm3+bKDx
 /fUSQen0Uw9FyhR+mOSA6nd48uikC+fHwX4pY8TH1FmNHU+k6IwLB+uzunSLKUYkdu1G
 Szgc9kOdqJTAgFJjb09Hta9hGARGaI9JNrrsFxlKpEsdAikB9sZvQTOnVgdRxfEgmx++
 wypMESpk2mGqjlHFR61JwlXcDq2BP68MZxrwV3gf4Muuw4nnkLd6RMnJO2XUDczDLZu7
 NdeA==
X-Gm-Message-State: AOAM530eaHpLedQcGmGJwOdfaUanfyet61KWdpOIO3h2w4eiFepCczdH
 E6cntx8OoFMMnD9Mgp6l1YhDUg==
X-Google-Smtp-Source: ABdhPJzIaqzFu+6vf0PKR6RCsdI/LuhHo+jwKk+57lroiDMhPOo5TdBQ1CUrnv1QAkoQeI5i2VBrDQ==
X-Received: by 2002:adf:ef11:: with SMTP id e17mr6492060wro.71.1627060185629; 
 Fri, 23 Jul 2021 10:09:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n23sm26463311wms.4.2021.07.23.10.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD1771FFB5;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 28/28] gitlab-ci: Extract OpenSBI job rules to reusable section
Date: Fri, 23 Jul 2021 18:03:54 +0100
Message-Id: <20210723170354.18975-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210720164829.3949558-1-philmd@redhat.com>
Message-Id: <20210720232703.10650-30-alex.bennee@linaro.org>

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
2.20.1


