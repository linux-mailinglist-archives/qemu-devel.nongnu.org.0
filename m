Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320B580085
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:12:16 +0200 (CEST)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyoh-0000Vp-9Y
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiB-0000st-SS
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyi9-0000FF-IV
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id k11so15663607wrx.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuuXQH2wboaX5IPGA3m9AhAnhitniNjGQ5r1hTwm0bY=;
 b=NKZuv0qNEGzTKaUIUTmBpxVY44OUXGUntwZsgd7wz/7aQxYVFnSfZO3hrkuiUyK2TB
 lEItGRSpa4+WbUhClr4ZFZMW5MjGouq3EydCRsm+1YKkam2aCddFwfPmq9cfOGfjEMTv
 W6i2+Vz/NLWX4711waSi41Cx6iAwWNntx05HaYI4HahZ365XkUICbMQnKjzhiJbNspRz
 cpoR3tywPRIZquZxMGok718TAnFieNXj3qUQHUH1ZTkKAV5K1klc5s3LCiIwrY8iLRWF
 g4zBbeL6kjWXkbX2+gr/GH8PHYao/RZhFVhGozbdSIMnkKZtthqaORSR4k4JFHmHs4hC
 r8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuuXQH2wboaX5IPGA3m9AhAnhitniNjGQ5r1hTwm0bY=;
 b=giC7QMoV+1PYej1BEce++VilB3ny+rLGOm6MLWz6fhqJPCVbKgEXcJgq853i4RssqC
 tygfeCswuwaKEa4ulgzLaliKixLoUAEQV3U08AuY5/7cCaeVrRK2V3RWfFc6zxt0ru8I
 OYW5LqKd68rIjIGMORUwBRAJXio3QWhJvETa57WgfgOfAjmi9O8w5wdRcRJhP7pnp76a
 +OCElo5TrlDZJw9fapvR9WWSmy7L7YzPkflBVqDdWsKmvmSyzWedA2svyaUKzAdm+uRZ
 y+MVD3tmkFG+Pdly72U7gG9Zb3XCZdVDnZ+NesnAjeBChkBDc8Fu6kHSgVT/D5DtR2iw
 ZziQ==
X-Gm-Message-State: AJIora8PlwaV2B4akFnIILsetFbaVvaGOVgw365srOmrZF5jTaz4Djcd
 EXaxDrVH/dziD5O94/X8DjxIlA==
X-Google-Smtp-Source: AGRyM1urw2DBqBmWaVL+d+C7TFw0OoYLb1ospBLWszAYL18Us8oScYowis3dM2O8lMprpch0zlM6mA==
X-Received: by 2002:a5d:6484:0:b0:21e:8ab7:fbc9 with SMTP id
 o4-20020a5d6484000000b0021e8ab7fbc9mr3295507wri.316.1658757927898; 
 Mon, 25 Jul 2022 07:05:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a056000137a00b0021e0147da47sm11935452wrz.96.2022.07.25.07.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCBB51FFBB;
 Mon, 25 Jul 2022 15:05:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 03/13] gitlab: drop 'containers-layer2' stage
Date: Mon, 25 Jul 2022 15:05:10 +0100
Message-Id: <20220725140520.515340-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Since we express dependancies via a 'needs' clause, we don't need to
split container builds into separate stages. GitLab happily lets jobs
depend on other jobs in the same stage and will run them when possible.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220722130431.2319019-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml | 24 ++++++++++++------------
 .gitlab-ci.d/stages.yml          |  1 -
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index b7963498a3..505b267542 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -1,20 +1,20 @@
 alpha-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-alpha-cross
 
 amd64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64-cross
 
 amd64-debian-user-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
@@ -65,21 +65,21 @@ hexagon-cross-container:
 
 hppa-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
 m68k-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-m68k-cross
 
 mips64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
@@ -92,7 +92,7 @@ mips64el-debian-cross-container:
 
 mips-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips-cross
@@ -105,7 +105,7 @@ mipsel-debian-cross-container:
 
 powerpc-test-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-powerpc-test-cross
@@ -127,7 +127,7 @@ riscv64-debian-cross-container:
 # we can however build TCG tests using a non-sid base
 riscv64-debian-test-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-riscv64-test-cross
@@ -140,21 +140,21 @@ s390x-debian-cross-container:
 
 sh4-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
 sparc64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
 tricore-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
diff --git a/.gitlab-ci.d/stages.yml b/.gitlab-ci.d/stages.yml
index f50826018d..f92f57a27d 100644
--- a/.gitlab-ci.d/stages.yml
+++ b/.gitlab-ci.d/stages.yml
@@ -3,6 +3,5 @@
 #  - test (for test stages, using build artefacts from a build stage)
 stages:
   - containers
-  - containers-layer2
   - build
   - test
-- 
2.30.2


