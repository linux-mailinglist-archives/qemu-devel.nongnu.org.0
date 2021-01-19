Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC70D2FB658
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:28:34 +0100 (CET)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1r3h-0004Rl-TZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1r1d-0003uy-3Y
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:26:28 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1r1b-0001NV-Bm
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:26:24 -0500
Received: by mail-ej1-x62b.google.com with SMTP id gx5so9227971ejb.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nmv2UovycK5ssLEw/JySlZ/QjGyxAI21ZhumFuQrIjw=;
 b=NrqegB/sKTbA/f7xRa62bf+wzDw09TCHCqUuTY0utB9n9psskruTC9Sw+LehmcNOkF
 V3vZIVV5/FxZ6Xa1/XyHLGbPbyiM0Ix0kZRIer8GsQBCmYcDc+7dGjJBkPVJxaX/L1Wq
 ekRZ0BmGGxaClar6hRowTunB8zLoj5gw82HJpk3zpnHjoDymR5vHcFissZtqhH/fYbm/
 a+VmSmZtYmxgTrerlRawFM/iwjrb/QiVN4qfoGKyzT9Mgy0KZonhXI1JWe5Nrs1JNDFt
 nmvbqJRVbxbklXpOjv4iONLgKLtzvm2wkvpmCh+L20qoTY4el+NkA96tjNQX0zN9eI26
 yHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Nmv2UovycK5ssLEw/JySlZ/QjGyxAI21ZhumFuQrIjw=;
 b=GXi5X6JDpj7p7zpuiMP2An9B2H2g0v40BUvgHZDso6F5Q/AaLFqbl2YvzF0sqKUjQ4
 z72PGccrTslsWqBKOaNE66R8OPlC/IQKtEOf5eiRk23/iG+sryVnke6QM13t/o2un0oc
 QJPGm58CqG9TCea4Q85uwtTJUhVllfm0l9+WZOntgStjxWmc/V1X1JhCqP2YDTbVTKpQ
 /8jlIQtvnAmesbhy7Fgm8iUafvloQm3OQNY9pLVPIUeNgOQH2RuXOPSpZVPY8CrXfJz9
 cf/0myURRcy+zIMte4pt2X0HlhOZZBc0CT3YGrLGuGKlq8RftI3Sc/IHZDqOgC6T+Jk3
 ENaA==
X-Gm-Message-State: AOAM533pagotS+nxIzNGIpWCnH04J8XEQB/BQu9HKkDKPmkShNRQHL4w
 iKY0YTpiJ6tHv4p6CrrbeZzFaeGLt34LMA==
X-Google-Smtp-Source: ABdhPJxYuUx+YV+Ft8f77HoYSvygkeTAAjROL/69y9hWRmo0dOqkzk4xV9EydW/nANc0t2WcXweL2Q==
X-Received: by 2002:a17:907:968b:: with SMTP id
 hd11mr2953290ejc.177.1611062781323; 
 Tue, 19 Jan 2021 05:26:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f20sm934202edd.47.2021.01.19.05.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:26:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] deploy docs to qemu-project.org from GitLab CI
Date: Tue, 19 Jan 2021 14:26:19 +0100
Message-Id: <20210119132619.302207-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: alex.bennee@linaro.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the website is rebuilt on qemu-project.org using
a separate container (https://github.com/stefanha/qemu-docs/)
cron job hook.  We can instead reuse the GitLab's CI artifacts.

To do so, we use the same mechanism that is already in place for
qemu-web.git.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml                             | 23 ++++++++++++++++++++++
 tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4532f1718a..729138064c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -6,6 +6,7 @@ stages:
   - containers-layer2
   - build
   - test
+  - update
 
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
@@ -609,3 +610,25 @@ pages:
   artifacts:
     paths:
       - public
+
+deploy:
+  image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
+  stage: update
+  needs:
+    - job: pages
+      artifacts: true
+  before_script:
+    - eval $(ssh-agent -s)
+    - cat "$SSH_PRIVATE_KEY_FILE" | tr -d '\r' | ssh-add -
+    - mkdir -m700 -p ~/.ssh
+    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
+  script:
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new-docs && rsync -az docs/ new-docs"
+    - rsync -avz --delete public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new-docs
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old-docs && mv docs old-docs && mv new-docs docs"
+  only:
+    refs:
+      - master
+    variables:
+      - $SSH_PRIVATE_KEY_FILE
+      - $SSH_DEPLOY_DESTINATION
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index ae889d8482..2bb826c376 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -50,6 +50,7 @@ ENV PACKAGES flex bison \
     make \
     netcat-openbsd \
     ninja-build \
+    openssh-client \
     python3-numpy \
     python3-opencv \
     python3-pil \
@@ -58,6 +59,7 @@ ENV PACKAGES flex bison \
     python3-venv \
     python3-yaml \
     rpm2cpio \
+    rsync \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-- 
2.29.2


