Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7812FB4FE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 10:40:32 +0100 (CET)
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nV1-0006Qs-U8
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 04:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1nSQ-0004xY-St
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:37:50 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1nSP-0007A6-8R
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:37:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id c5so19009093wrp.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 01:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JxnePYTGu0DqhA8fnBHKBUE9Cp3WubYuWELTQuP9FVQ=;
 b=UuC2vKDKOGqmvcS8NV9QFXPDYR7F+AWxkAJ+XB4dz6lJG/66tv8eldXRXWJZ53iG7v
 qJMGWftnD4bvtWjIsT5vYE1Rw1JauU2dK8p5klANiu5yNpY50leDIPuwO92tLhFPgbpf
 vELlqgzyiTXVmNEjgU8BY+VYheKf6nFE90sP2WOijo1taV60zrelBry5PFcWKiooovT4
 Dh/W25b0z7rxKSuIcX88LVJLi74axVlCFtOQP9xMsk/c8QL5Thf2iza8aK733uhV+SKP
 zPNiYcaMPn4Btmgdt35tpY7XMFSlDuZoGKpfdFFjY3G2rLbKlt7lY+qaqlQ/eDQEOlxg
 1T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JxnePYTGu0DqhA8fnBHKBUE9Cp3WubYuWELTQuP9FVQ=;
 b=SaOvKXIncALblg3s1GAnnFXXAjrU/M+s6FDaLPljH1mYUtA9dWC5XkgKfkZrBGRME7
 CHZSu4/bFR7B7Cf3y9ZU0DjApnVvVTB7jYmRhimd4STFxK8ZL3pWUzeLuKa7swHWyfRX
 ZttfRlaE/EzOTmOUFdph8CdBnC8g9TMfuxc16WWNvIxnRjSJe3wotL1WH3IykFrsFsTZ
 CGflVDPMYoGqt0Op8hr3T3tMg8kH+wmZsLTsaF21om1oFpwa6+6wThQeNItluNUIefvq
 7EDGpgckZFPV6jPk0Xs7V5Qtz+u1CHS6MWWnvBcAhEDsFQ9AJ/EtchBDM4e49oiUHxKt
 7TGw==
X-Gm-Message-State: AOAM532XKJcTX6/uJAUVNkx572aEVzn3W7qn93zGdkK+k0zjtsh2pmOn
 NJiWb9xDW5ANtZYZKTlLRudqfjWGsYErOA==
X-Google-Smtp-Source: ABdhPJyL0hhkF9JFj4rorZel0v8NBR6W2/o0zzg+L8F14HuPLDfgx68VKwXZ21iT4QJcoBhx3b1ROA==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr3357394wrl.85.1611049067595; 
 Tue, 19 Jan 2021 01:37:47 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b7sm33750672wrv.47.2021.01.19.01.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 01:37:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] deploy to qemu-project.org from GitLab CI
Date: Tue, 19 Jan 2021 10:37:46 +0100
Message-Id: <20210119093746.293342-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: thuth@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the website is rebuilt on qemu-project.org using
an update hook.  We can reuse instead the Jekyll output of
GitLab's CI.

To do so, a new user qemu-deploy has been created on qemu.org.
The private key is stored into a file variable SSH_PRIVATE_KEY_FILE
(be careful to include the trailing newline after "---END OPENSSH
PRIVATE KEY---"!).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5fa3041..08b6d20 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,6 +1,11 @@
 
+stages:
+  - build
+  - update
+
 pages:
   image: centos:8
+  stage: build
   cache:
     paths:
       - vendor
@@ -14,3 +19,26 @@ pages:
   artifacts:
     paths:
      - public
+
+deploy:
+  image: centos:8
+  stage: update
+  needs:
+    - job: pages
+      artifacts: true
+  before_script:
+    - dnf install -y openssh-clients rsync
+    - eval $(ssh-agent -s)
+    - cat "$SSH_PRIVATE_KEY_FILE" | tr -d '\r' | ssh-add -
+    - mkdir -m700 -p ~/.ssh
+    - - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
+  script:
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new && rsync -avz root/ new"
+    - rsync -avz public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old && mv root old && mv new root"
+  only:
+    refs:
+      - master
+    variables:
+      - $SSH_PRIVATE_KEY_FILE
+      - $SSH_DEPLOY_DESTINATION
-- 
2.29.2


