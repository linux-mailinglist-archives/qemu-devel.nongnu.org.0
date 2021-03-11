Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC88337E3F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:34:39 +0100 (CET)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKR4w-0007OL-Lj
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKR0r-00044I-Vy
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:30:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKR0h-00040f-Ex
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615491014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GcEqEmej+eAfJ0qyKnp2VJXW8vNyKdRM5vBtvmN5s9c=;
 b=R+o3L3gOokPA+mzBH1HcS7B5YdJL6p3Dn5vud9ZKzMPmiTZigol9RfhaiqkRC5sOZyr3Zm
 QL/zRq6g6RC2D/+gnrjbAHbk4xS8c977AuiwBcxc9fgck/rRYiTt6zo/IzrJfAbQ0Oxlg6
 S6GvBpo9Ij0KLI0S/IGpy+ZGzCNQq+w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3--RwqsZDVOF6Kxu8RMwXtCA-1; Thu, 11 Mar 2021 14:30:10 -0500
X-MC-Unique: -RwqsZDVOF6Kxu8RMwXtCA-1
Received: by mail-wr1-f69.google.com with SMTP id s10so9986000wre.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcEqEmej+eAfJ0qyKnp2VJXW8vNyKdRM5vBtvmN5s9c=;
 b=EVW91SP2F+HAGL/OMqFlCr+ZKkDbCpiSfRo/86R4/m1v0VL00Z44Kw3uV0UqTwOnzK
 K71s81aplmb3YtVGC+ReG2E+/qKHp0/T/Z77FAQMYgvW31x2XYyusBHL85JGp65jU4OK
 fvdBgbr67bZGRxYZUT24PlzxoE/FUbDlfrG5Z7d6HBbsATqlZAC14aGPjy//N2fq2Kyz
 d1iS4DFp4QxUwf439aEONJsfmWbleDRJx2Wsl5uiWzmcJ3uNi5gx2bahCq1mB9R9hL5q
 tGcI6Ov29GvLwnl5bJj73ub115NhzYMtQ/3F1x98oI1yBXr9leUTVN2VlwWXd/0zyHbY
 G6ew==
X-Gm-Message-State: AOAM533aJn4EMr6BiYrt2sc5Wdi4VyQkHjAHgav4R47NzHZRCNZSh33r
 kFRiViC23GU4nbDRSlPRxYQ4nrIr3skhU08ecAV+GrizHPlv2CsFto1LVLttnbvV3Z7oAX0fVRN
 ap6lkNT4TNjbajGiaqeA7x2wEkO/JUJbxgD0Trdwy3tiQ/stIGLYMYNl8AfKsg22T
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr10755724wrk.146.1615491009347; 
 Thu, 11 Mar 2021 11:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzrLX0i1VXw7xm0QjrA9Nl6BM2gNPWxcjPoetDWw0KPkucsH5HjLpUulsJIa0HBf94m+Zp1g==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr10755698wrk.146.1615491009063; 
 Thu, 11 Mar 2021 11:30:09 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o14sm4930675wri.48.2021.03.11.11.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:30:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Add a job to run common coccinelle checks
Date: Thu, 11 Mar 2021 20:30:06 +0100
Message-Id: <20210311193006.1442775-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job to run common coccinelle checks.

We use spatch tool from Fedora 32 (Docker image) because
more recent versions are failing.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20210311192700.1441263-1-philmd@redhat.com>
---
 .gitlab-ci.d/containers.yml                   |  5 ++++
 .gitlab-ci.yml                                | 26 +++++++++++++++++++
 .../dockerfiles/fedora-coccinelle.docker      | 16 ++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 tests/docker/dockerfiles/fedora-coccinelle.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e233..8f14afdccab 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -249,3 +249,8 @@ amd64-opensuse-leap-container:
   <<: *container_job_definition
   variables:
     NAME: opensuse-leap
+
+cocci-fedora-container:
+  <<: *container_job_definition
+  variables:
+    NAME: fedora-coccinelle
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 07202f6ffb2..615a0b98fe2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -746,6 +746,32 @@ build-libvhost-user:
     - meson
     - ninja
 
+check-cocci:
+  stage: build
+  needs: ['cocci-fedora-container']
+  image: $CI_REGISTRY_IMAGE/qemu/fedora-coccinelle:latest
+  script:
+    - for script in
+            scripts/coccinelle/errp-guard.cocci
+            scripts/coccinelle/exec_rw_const.cocci
+            scripts/coccinelle/inplace-byteswaps.cocci
+            scripts/coccinelle/overflow_muldiv64.cocci
+            scripts/coccinelle/qom-parent-type.cocci
+            scripts/coccinelle/qom-parent-type.cocci
+            scripts/coccinelle/remove_local_err.cocci
+            scripts/coccinelle/remove_muldiv64.cocci
+            scripts/coccinelle/return_directly.cocci
+            scripts/coccinelle/typecast.cocci
+            scripts/coccinelle/use-after-abort-fatal-errp.cocci
+      ; do
+        spatch --macro-file scripts/cocci-macro-file.h
+               --sp-file $script
+               --timeout 137
+               --jobs 2
+               --use-gitgrep
+               --dir .
+      ; done
+
 # Prepare for GitLab pages deployment. Anything copied into the
 # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
 pages:
diff --git a/tests/docker/dockerfiles/fedora-coccinelle.docker b/tests/docker/dockerfiles/fedora-coccinelle.docker
new file mode 100644
index 00000000000..5392c73fcb2
--- /dev/null
+++ b/tests/docker/dockerfiles/fedora-coccinelle.docker
@@ -0,0 +1,16 @@
+#
+# Docker image to run Coccinelle spatch
+# (program matching and transformation engine)
+#
+# Copyright (C) 2021 Red Hat, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+FROM fedora:32
+
+# Please keep this list sorted alphabetically
+RUN dnf install -y \
+    coccinelle \
+    diffutils \
+    findutils \
+    git-core
-- 
2.26.2


