Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2139333D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:11:01 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIb6-0000lp-Iu
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITs-000506-BE
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITq-0000MT-8S
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so2933599wmq.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRPMPWB0aBHeL/5MePNBlEkOxaiPS0L4CeI6VALZd/s=;
 b=NnEFB/X/fcKTDhMHep2ELNzyR4x4ffY269gNCX9Zicaib5ZJ6JcZLTTXPSbFidhL1n
 dxXiU62dNaXlP0T/6fklz4mfC/jkaZw+38k20fSsxf/J6+T4ifMAkaoUtJK9ke9gbq6I
 dWkvzVE8cUpn8/RsvXmJ0kgfkJrsAio9YI1GDhFUuuCDGyBlVMErEGdUBTVU0ej9FG0O
 Rw2zkcNzqyOQKZ63QlU+VktR1gc6KypBCGAx482AXOa3GMByoalO6DiACvg0KiNqJKD5
 Mke4ynTaR/98JFlp97VHELcITE17R0RzEzeHzdKr9cp1z/SP5O+rXG6IhiIGBnae7J8A
 p3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRPMPWB0aBHeL/5MePNBlEkOxaiPS0L4CeI6VALZd/s=;
 b=KehHX1OMOzl7pgaz+JYje2bzRFx57LEFLuGzGsOQc4tTkkT/VaHa5ppCGIofRD8auO
 gKPhq8+k7sTGOzRfo/QFjUooOgAo/51ozOm8tuBPzq/DTU9RPbwgNj6xF1RgkerB8YLi
 IZOuvWtDZ29lpNowjN2OIuE6aH2vPGolr9S3Xn+l5aVU8+KvEc7Gdn74bWOYeTSmSFRI
 MXajGPMmLXBbxiVdlzkIpia+mV60mVtLVbzK0JSyN6MrtNU8F8r8mFn5qQRGbCD+08yH
 elwk/Kls+0N3O4j4KptPKso4tTjGuO1tCZ1Qsl8qWrKSfxS4AF/zEVtic8yywXiffCZX
 zK8g==
X-Gm-Message-State: AOAM5336zV6NXTpK1sZQBe1xcQbyBe0557PV/OCzVkYcpqK+AKIid7Ae
 OIJVn545+bC9ajzlCoRyS7m9lQ==
X-Google-Smtp-Source: ABdhPJyKGInEwtUAO06O6Z/KnoedXtC5cnJE5zj1mOjpyx7nI9B42arGn0r3dN3RDZU7z5W89nSN6w==
X-Received: by 2002:a1c:2456:: with SMTP id k83mr4287216wmk.87.1622131405503; 
 Thu, 27 May 2021 09:03:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m10sm3672480wrr.2.2021.05.27.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:03:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C63501FF90;
 Thu, 27 May 2021 17:03:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/6] gitlab-ci: Convert check-dco/check-patch jobs to the
 'rules' syntax
Date: Thu, 27 May 2021 17:03:17 +0100
Message-Id: <20210527160319.19834-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527160319.19834-1-alex.bennee@linaro.org>
References: <20210527160319.19834-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per GitLab documentation [*]:

  "rules replaces only/except and they can’t be used together
   in the same job."

Since the 'rules' syntax is more powerful and we are already using
it, convert the check-dco/check-patch jobs so no job use the 'only/
except' syntax.

[*] https://docs.gitlab.com/ee/ci/yaml/#rules

Inspired-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210525132418.4133235-3-f4bug@amsat.org>
---
 .gitlab-ci.yml | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1c46392b2f..797403477f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -785,12 +785,13 @@ check-patch:
   needs:
     job: amd64-centos8-container
   script: .gitlab-ci.d/check-patch.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
   variables:
     GIT_DEPTH: 1000
-  allow_failure: true
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == "master"'
+      when: never
+    - when: on_success
+      allow_failure: true
 
 check-dco:
   stage: build
@@ -798,11 +799,12 @@ check-dco:
   needs:
     job: amd64-centos8-container
   script: .gitlab-ci.d/check-dco.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
   variables:
     GIT_DEPTH: 1000
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == "master"'
+      when: never
+    - when: on_success
 
 build-libvhost-user:
   stage: build
-- 
2.20.1


