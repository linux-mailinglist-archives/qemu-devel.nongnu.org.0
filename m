Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8837A118
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:45:06 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN4j-0004HR-Uh
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqm-0004rp-PQ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMql-000099-Bt
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso610840wmh.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bhDHOqQ2nAkEgCh/bvWHJIp7Jturc4vuFN0lqBTsaWE=;
 b=AZj4+0+PCrIjNIV993bU+m1XrAguCORiJNAo7b7Ur9Bt4hbkkZzHFedUuWfTmFG9Po
 vdsE5gWcG6FmNgGNjboRkT0HBkyvcXAtKLRHKCBgBWxYOfwCV6J0Irk8CaZhqmwU882j
 Rl9lhIYhwPG338lYw1u+ZGIFAKW4SUHZUDuyj9NBKYg9SpCSFOidzwp+qHheD+r+Kh21
 BscvfE9127bemUN3BD0WZcAhHnT9CT9aZVi91+Pl43Em5TKmba8Qr/unF58Oc9brHLb2
 roWTx6uzJu8766a/aQsZdXsx7AL1mzFV0xD8ASu5nqBEWKyGSXekDNZqPWXfxRs/GiQV
 DJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bhDHOqQ2nAkEgCh/bvWHJIp7Jturc4vuFN0lqBTsaWE=;
 b=YLvodfpJh40ct6prj6zlQOG6JV78QVPOStT2ft63mgdkHrlgP2K0ePIt98jklN08La
 zgGQpQwNxmO3Oh9WYaHnRrcfE8/LJe6AbqljhHS+hdiQwL1V2Tdf+rPjyZSmWqXQFfBi
 cyd00+SrN8a6SYk6EW5yCCnZ+VFdELqPsLyGX0HNfxdD0VyP97BDqn1jwnQzO2E2Ci2d
 bHcIIZsIk0qMio4H2t3XENuTT4AxNxKg3NKyLFqPdUOhglrozRah/blLSIgcHFL6453c
 56vBKnWNw38FGpb8onsWe8VtZ2mcPTkUaz2JCDJLPyI3LsrDVewD8TnKsF2bhtQ3slft
 H6rg==
X-Gm-Message-State: AOAM532rABujPb9QLYudFyv309+f51zlNrsWXQtYEk36PCDPV2fK5HFj
 IIZMbdJBlSzMmOetrTZGGGwgZvDJIzYD3A==
X-Google-Smtp-Source: ABdhPJyp4RV3t5w8LzzeNm+Fda1WFxDyhRz91XMo6ylSFlvoeLJBoiYGPnyGNNQW5UKNTTGEVnp1cA==
X-Received: by 2002:a1c:c385:: with SMTP id
 t127mr31597119wmf.169.1620718237804; 
 Tue, 11 May 2021 00:30:37 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u8sm2445910wmq.29.2021.05.11.00.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/10] gitlab-ci: Extract core container jobs to
 container-core.yml
Date: Tue, 11 May 2021 09:29:51 +0200
Message-Id: <20210511072952.2813358-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not possible to use the previously extracted templates
without this set of core containers. Extract them into a new
file (container-core.yml) to be able to build them without
having to build all the other containers by default.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/container-core.yml | 17 +++++++++++++++++
 .gitlab-ci.d/containers.yml     | 17 +----------------
 2 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 .gitlab-ci.d/container-core.yml

diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
new file mode 100644
index 00000000000..e8dd1f476a2
--- /dev/null
+++ b/.gitlab-ci.d/container-core.yml
@@ -0,0 +1,17 @@
+include:
+  - local: '/.gitlab-ci.d/container-template.yml'
+
+amd64-centos8-container:
+  extends: .container_job_template
+  variables:
+    NAME: centos8
+
+amd64-fedora-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora
+
+amd64-debian10-container:
+  extends: .container_job_template
+  variables:
+    NAME: debian10
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 0bf4899df10..2c1380158f8 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,5 +1,5 @@
 include:
-  - local: '/.gitlab-ci.d/container-template.yml'
+  - local: '/.gitlab-ci.d/container-core.yml'
 
 amd64-alpine-container:
   extends: .container_job_template
@@ -11,16 +11,6 @@ amd64-centos7-container:
   variables:
     NAME: centos7
 
-amd64-centos8-container:
-  extends: .container_job_template
-  variables:
-    NAME: centos8
-
-amd64-debian10-container:
-  extends: .container_job_template
-  variables:
-    NAME: debian10
-
 amd64-debian11-container:
   extends: .container_job_template
   variables:
@@ -190,11 +180,6 @@ cris-fedora-cross-container:
   variables:
     NAME: fedora-cris-cross
 
-amd64-fedora-container:
-  extends: .container_job_template
-  variables:
-    NAME: fedora
-
 i386-fedora-cross-container:
   extends: .container_job_template
   variables:
-- 
2.26.3


