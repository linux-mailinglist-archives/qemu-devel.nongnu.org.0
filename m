Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1D392230
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:39:56 +0200 (CEST)
Received: from localhost ([::1]:60590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Fr-0001AJ-HY
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wr-00047c-ER
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wp-0000Uv-LN
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:17 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1351671wmh.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TY3ef7OherZxOloGST3Aka9cKHY1uYUJOsmuFrhKM3Y=;
 b=bfjDMKl14OGXzzWkJk+3wdXnxbtImRShNmPgu43FTWW2+fKlWp0ZBUyvbUFrtF9xZG
 1wDnwzJxBk03VuNCsBlykxDCdISDFNp6AvqulboyyMnyEV6cMQVRq9RpaRaxwZt0Ffxo
 wnNKicmbFN5fio9qDpvOLGh8aGrn2DcFpAkiTvztKKwDEdDidD4EAhjXVHF5nomxBMxU
 a6DdesyYG+61yVhoxLGSNp32rC+p5onpkcd+o0rwMsxNT5iWQbKpHMUwDmw5XPnHCR7P
 jYfsGJ9Hta3wvruhSH/sE/PqdRiWbq5Q8UoAOKuGsv6806G5KVQTNjE33J3+OWnh6hba
 Avww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TY3ef7OherZxOloGST3Aka9cKHY1uYUJOsmuFrhKM3Y=;
 b=sDxgKyF6IR08uD9030y5QT7d0ZdFlRubvF7jShZ0kNbO8Sos10+RhbcyHxZBIvP0Ly
 rTUSTLosC5+p+4nbByen2TwruLUDfCupNwA0Ju+BfwMmNRBh/I3k/dRVrICf9iksQpXq
 9xI9Yg5Kjip8rDgZ1zKv5y+9+822mrVXHHR7KoSqtEh8vVQKRDRKzq86a8mU/rofulLT
 DbvxPFCo5WoeufZ4dnccAy7LBnuNfMfZmK1TK4uLKpiZNMhEPKwjQwSQsq2aY2YpeS2C
 rcbuCMijZlNAoVl1L7UiuT4WSMcMbn/hHuysw6MjWztSi+YEgwCcZrsGqN8rFkdLjkkX
 MBgA==
X-Gm-Message-State: AOAM530cPjqW2fL0FjUK7UbFjr6I1ovVkIr7DH6Xln+XfJaX205/W6iw
 9FuwpEAEy8+f+gXxN8AynP/+Wx1yb4QJUg==
X-Google-Smtp-Source: ABdhPJz+dAkHXGt+MoyRUwR26qWm3TITJbwf1VahM8RimAZAPVu+prIIoMJhCV4QKF2+JWpSgShwEQ==
X-Received: by 2002:a7b:cb96:: with SMTP id m22mr311301wmi.59.1622064011016;
 Wed, 26 May 2021 14:20:11 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j10sm187378wrt.32.2021.05.26.14.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:20:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/19] gitlab: Convert check-dco/check-patch jobs to the
 'rules' syntax
Date: Wed, 26 May 2021 23:18:37 +0200
Message-Id: <20210526211838.421716-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
 .gitlab-ci.d/static_checks.yml | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 9c9a771b744..91247a6f670 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -4,12 +4,13 @@ check-patch:
   needs:
     job: amd64-centos8-container
   script: .gitlab-ci.d/check-patch.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
   variables:
     GIT_DEPTH: 1000
-  allow_failure: true
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+      when: never
+    - when: on_success
+      allow_failure: true
 
 check-dco:
   stage: build
@@ -17,8 +18,9 @@ check-dco:
   needs:
     job: amd64-centos8-container
   script: .gitlab-ci.d/check-dco.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
   variables:
     GIT_DEPTH: 1000
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+      when: never
+    - when: on_success
-- 
2.26.3


