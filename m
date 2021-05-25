Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC939027F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:28:37 +0200 (CEST)
Received: from localhost ([::1]:36606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llX6p-0004T2-OD
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llX2x-0000SK-Rg
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:24:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llX2w-00019J-4W
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:24:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d11so32220427wrw.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hcKUI6D/hdA20ddiBr+GZjA09YdghIV+DGZJsB1vITM=;
 b=Wav52WKIMC1sVCv2td8YmLwj/GJJGWTxrRz2rbd+80JGh6IxYUZx/plzp7Q5oqsJDb
 ftrVhMwrI9Duzyvc7Ji1r19CLBM2SbMJKQQ2LAc/wFGsJWT/fb/CPJkJ/MdIR1wh+Ggg
 kVbe4FXLDSFU+nbRdPslwxObELTTwtI/y2RzdascUxXmmBpfhktl+JPOvGS4EnW54E3Q
 QhykZnFkFDnZ0QYRT3dK6lHO6q60XWL/KbQ1tOGp0cZuAQwenk2LAmLnq3vUv8s8UMHa
 7GHv8RLF4GJmoGqXsf8Ckw1NnMXNMvkIQ3DaTde/73lC6YXsRhiVhBIwgfgOkb5vdIr8
 XByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hcKUI6D/hdA20ddiBr+GZjA09YdghIV+DGZJsB1vITM=;
 b=VaD8/BNZws73EyX8frUzicGpN91Dc3SDMNC1BaTLQZqCbp97BTfN3X1t4WFeTuDnyx
 6bLOehiQV2CGk36Y8ngrPMq42YaF84+Kg9QMpeO0IgvgF+pP2PQPpmfd47Vdbm05XoQr
 FPLK5LpJ4k7wZZst1DKzyC/cRe8xA67Ogb6V2en7lq+4ikoXDCushcbXgPxWUOIT8ib3
 IeBYKPXDc/XBWHWen/Txm8hk64Xfns8BTALdS3bT/0f+YqRqWWBkvQKuCVj8VgOFF/87
 PKm3n+af5XsKdExKvubiva3SwS1ariQTA/Sn8+HK7Bkew4M8qyrwyJip3kJgdD1iIeOH
 FLdQ==
X-Gm-Message-State: AOAM531Abe+m1eQbChLOz00ugaNBVL92hwJ+PZATuoMugDaBTz6uAsZq
 HdOY8YDyRifQUnZ7OzopE5c=
X-Google-Smtp-Source: ABdhPJwMXjmo3s5RYt62xtTow6dE+dytW+nLPns6nDA7NJyXn3V0uAzJogVcDTMagRxqGCKy6C2EaA==
X-Received: by 2002:adf:ee44:: with SMTP id w4mr26356559wro.415.1621949071016; 
 Tue, 25 May 2021 06:24:31 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c6sm16472031wru.50.2021.05.25.06.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:24:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab-ci: Convert check-dco/check-patch jobs to the
 'rules' syntax
Date: Tue, 25 May 2021 15:24:18 +0200
Message-Id: <20210525132418.4133235-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525132418.4133235-1-f4bug@amsat.org>
References: <20210525132418.4133235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
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
---
 .gitlab-ci.yml | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2b89143f81f..83e077d095c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -786,12 +786,13 @@ check-patch:
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
@@ -799,11 +800,12 @@ check-dco:
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
2.26.3


