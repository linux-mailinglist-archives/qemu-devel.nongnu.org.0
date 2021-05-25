Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18AC390268
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:27:09 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llX5Q-00030b-Rt
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llX2w-0000Pn-Bj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:24:34 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llX2q-00017T-90
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:24:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id z130so16749648wmg.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fimz6uqMhxdm+Pr3YIAfXrQRcWggaG6gew/x6zwC65o=;
 b=ATxvSsllwughOtUWnx2r6T5kHXjAsSHexBzaqZap6fAK1lJ1BSQl6whhqlAZ2VNKaQ
 gpSE7s5EIImKxj+u/i53Y4IelwYzRNSALAop77eh/wlru37wJtvXgjq7RnwgaqroKGyl
 P0b96hklSEWmymwlhX4sg+U6RMJHAAJX/jHdl+WYAPgBgue4pmojRlIz3O1uUImkjwhB
 fCX8r6be1pF9toEbrebHJWss5A/3wME4Y9RRJ6i7FMz+aUTj3gjOJffzHfVGhE+sPRl2
 HufBKmHyWRqULVZief/ETjC6aUYMOnAWkYUH7QrHymGiOyJYd5uZ5zkORgcPTImVe3LW
 BCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fimz6uqMhxdm+Pr3YIAfXrQRcWggaG6gew/x6zwC65o=;
 b=A2xW42e0OU+RQF/OCzkyFrwXwLxYiMXoBHVJNdp6MYnfUR6edLpaxCEAYs/V39I8V2
 t4mV8zi0H9B4nOSvZbxjhLWlk7DmG14iKJG9I3+CtiM5Ob4OXwIK/4DhWIPo06pXqnJM
 Ohmt6jpGwr6TPFDlyVea28BgJmCTJT1t7sl3fDtkQO8RppsdHrXRi2J7bkAfeAE/MkTQ
 IrT6D7tJiOUNeN1pFM2CFfIdlF/b/Dh6UmmmhcG8o3mn2jy4ZJg046I56hiFXvDDnfbg
 l8TkOJWNU4xWcm72TO4MfD1+hjXWS8Bn6rHVtGl2EydUNc/TLW/Im8yAFvARPv7ZL4f+
 ysSA==
X-Gm-Message-State: AOAM530vYE4q34WKmekv4qIijGOwNClwj+GxrMLhi1dJycBlRBqa4ie9
 g5aN60p2y0r+b1OebYqaJQsMik9zKdscLg==
X-Google-Smtp-Source: ABdhPJyKZr09aMU0stnqSTXvYxEHvSqupg/tLpZ7gqeLy+yEvw/wCeZxBND24a4Tj6t39q3mGCUopA==
X-Received: by 2002:a1c:638b:: with SMTP id x133mr3919599wmb.182.1621949066326; 
 Tue, 25 May 2021 06:24:26 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b10sm18949233wrr.27.2021.05.25.06.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:24:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] !fixup gitlab: add special rule for the hexagon container
Date: Tue, 25 May 2021 15:24:17 +0200
Message-Id: <20210525132418.4133235-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525132418.4133235-1-f4bug@amsat.org>
References: <20210525132418.4133235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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

Make the build-user-hexagon -> hexagon-cross-container optional
to avoid on mainstream CI [*]:

 'build-user-hexagon' job needs 'hexagon-cross-container' job
  but it was not added to the pipeline

[*] https://gitlab.com/qemu-project/qemu/-/pipelines/309137207

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/containers.yml | 7 ++++---
 .gitlab-ci.yml              | 8 +++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 088c7e68c3b..59803453d50 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -106,9 +106,6 @@ armhf-debian-cross-container:
 hexagon-cross-container:
   image: docker:stable
   stage: containers
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project'
   variables:
     NAME: debian-hexagon-cross
     GIT_DEPTH: 1
@@ -127,6 +124,10 @@ hexagon-cross-container:
     - docker push "$TAG"
   after_script:
     - docker logout
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
+      when: never
+    - when: on_success
 
 hppa-debian-cross-container:
   extends: .container_job_template
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b2f929c758b..2b89143f81f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -417,12 +417,14 @@ build-user-static:
     MAKE_CHECK_ARGS: check-tcg
 
 # Because the hexagon cross-compiler takes so long to build we don't rely
-# on the CI system to build it and hence this job has no dependency
-# declared. The image is manually uploaded.
+# on the CI system to build it. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
   needs:
-    job: hexagon-cross-container
+    - job: hexagon-cross-container
+      # Only forks have the hexagon-cross-container job,
+      # keep it optional for mainstream.
+      optional: true
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
-- 
2.26.3


