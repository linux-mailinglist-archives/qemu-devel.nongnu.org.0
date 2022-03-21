Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9864E27F0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:41:48 +0100 (CET)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWII7-0001or-GJ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:41:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWIFi-0000Q5-Fr
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:39:18 -0400
Received: from [2a00:1450:4864:20::62c] (port=42635
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWIFg-0003Ch-QD
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:39:18 -0400
Received: by mail-ej1-x62c.google.com with SMTP id j15so15807811eje.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0rfxDtyPFADXPTxxxeUNjyMio6IDcuCPLrcyoFqTPk=;
 b=ZU1Gs7KNDka2IUPjem5Jz1e/Co2DKjk+fdcB32VvFo/UxFBu5HgNUwO7/r/fNwVy4i
 mJnn5/A4s7pKdd4CNzpuna54tAzCjvOZosre+lqyJhZjBOf6sDTeB5/z1Hi7U7MJFY1K
 5h2EF3z/fUz5qmERcGvJZPEg1N/k4fK/SgVzDjtE9W7TXgcK2gDXYwD/OUOTyakduUVm
 8sleX3tqJOT9q0Oa064/3F2ouNvon26tq+e7PetDcEcdElmN482ayQEU7HOuVkw05ioX
 dmkvP5V1phzIwC6QX1eJYTkgk7ng+v5ymY1FC4KXlkabGPyaLe5VG+FEnsyKU7lxsGH1
 PRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0rfxDtyPFADXPTxxxeUNjyMio6IDcuCPLrcyoFqTPk=;
 b=wf4CRndYWhcdN+1m99/fo2C4TT1Lid39u0YyjlJcjsirroaj9sVfrPpZuKA8grmPWQ
 jrbdbPDJbjcZ8g5qnMBFqCmP1fA7XR6jFNaLKVjdfAmE5qRPWJkZQsJ8GeSdWHOgWAcj
 74Z+noeILuKHSJx9B/0aoFYmo1hzQtjI8/zpeAWjTltyYXYkukAAz06epx6snZ2cBUf7
 6iB8qnc4LcnkUehGKeScj4Zo/uHpHkUe1dgZQdbPuKTazetrXZNXm6TZRNbda05/L/KK
 O3My5qfozIarJb1LLCwkOoOD/IjsOgF6AAGcWrhvZDLBDDQvikJlUdn9GhPUMLUXS6Ze
 gSIw==
X-Gm-Message-State: AOAM5339DkKgSPpXJ6Wik4joXh769EfXhfPitn/ZzA7tO3IgYvPtFp04
 LzJTzNIgxpiUWjtcjoed77xncw==
X-Google-Smtp-Source: ABdhPJxbgb/v4oiOP9atPl4Tt15dh0St0SA5+NMJuRbTu+O/235DJuGS9WiGJ8u4tLEQvmZn18nxog==
X-Received: by 2002:a17:906:9755:b0:6df:c781:9040 with SMTP id
 o21-20020a170906975500b006dfc7819040mr12607344ejy.764.1647869953985; 
 Mon, 21 Mar 2022 06:39:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 hq15-20020a1709073f0f00b006dfc0fe42b1sm3884113ejc.177.2022.03.21.06.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:39:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E74C21FFB7;
 Mon, 21 Mar 2022 13:39:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gitlab: disable accelerated zlib for s390x
Date: Mon, 21 Mar 2022 13:39:05 +0000
Message-Id: <20220321133905.3278054-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apparently this causes problems with migration.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index 0333872113..4f292a8a5b 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -8,6 +8,8 @@ ubuntu-20.04-s390x-all-linux-static:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$S390X_RUNNER_AVAILABLE"
@@ -27,6 +29,8 @@ ubuntu-20.04-s390x-all:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$S390X_RUNNER_AVAILABLE"
@@ -43,6 +47,8 @@ ubuntu-20.04-s390x-alldbg:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -64,6 +70,8 @@ ubuntu-20.04-s390x-clang:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -84,6 +92,8 @@ ubuntu-20.04-s390x-tci:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -103,6 +113,8 @@ ubuntu-20.04-s390x-notcg:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
-- 
2.30.2


