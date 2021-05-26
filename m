Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15605392239
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:42:35 +0200 (CEST)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1IQ-0006mv-2h
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wt-00048q-CD
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wr-0000Vi-Ih
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j14so2548233wrq.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VbyBXzHeoNkDJMekkl7ISJa2BGBdQOhtzOvcT0Bp44k=;
 b=uJEPxNL7zRgbJ97im0GikcElOlCNgBDj5DsKKGE7GRZL6fmK3WQj5lbysLNDPb4YZU
 Cu0OvaFMkf8q82ZfsRk342S/KZ3hqqbjNHYT9wcX3BsMi5TVlxxelai/KjufU/9paCmi
 UjbyuaNiWppOAXFEUYq0A9/OT7Yd0nDw6Jw5a59OHhqdj/oj1/rQVyPGHxobAr7ryKMy
 hRSQw+ry1GKHYXqagLi1eDI51fwaQ5xQoz/f6rqG+JUDEc0ztnRzTyBuh2zBAXC6Hl4s
 bxwp/yV6yAQ6zg7rFa1VeqIVWGcEkmryOPxnxZgAdN0b84A77gtkG5J+uA/ldDi4ljcP
 8k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VbyBXzHeoNkDJMekkl7ISJa2BGBdQOhtzOvcT0Bp44k=;
 b=AUGEXNApdVaIK1oxpMI2cykmXi1yFjTyAHFvBlbHFbKnN+fACdOKfbHqLVSq+Wget7
 8XqxbmpzeZ7wuVzP6sLoKMFBZqneOfXQY8HZbtqc1JlAk1ZntAZFTfc9M0r0O1Zn9qZ8
 u6i32khvsgQcbYikQcs5D6zZPhSIyeQHkNSMD1XK9l7kFwFEas87b9278MrseeXJPXfd
 x4IBfla1OY46roR0mnqAslK9r6+CxxMOR6kkjid4SH/8WUQnsEM1WlMa725EvBnkIQMS
 02xpw1j7jeKd8Ai2WobNuSF00CAW5Vd/TeS8fIYS/Hq0R/wbGirmsSML3jWPKqiYlRGy
 KSPw==
X-Gm-Message-State: AOAM532lEwS5xVp4uiLVlwHdQbs3gUtN206gfmP/BrGnp0FCsdNaeoh/
 53O9ZJLY5rYr1/qmAAUVu8YgEzQYEH5GSw==
X-Google-Smtp-Source: ABdhPJyv2WOy+2FFdCsPevzIPPSnotKd4gtaFhWnzLgI91f/xw4PjpR36XDY5tKqjQuVIt85OSv9fg==
X-Received: by 2002:a5d:410e:: with SMTP id l14mr17126wrp.230.1622064016068;
 Wed, 26 May 2021 14:20:16 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id x65sm2650367wmg.20.2021.05.26.14.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:20:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] gitlab: Split gprof-gcov job
Date: Wed, 26 May 2021 23:18:38 +0200
Message-Id: <20210526211838.421716-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This job is hitting the 70min limit, so split it in 2 tasks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210525082556.4011380-7-f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 807040c1c71..7bfbfab8f20 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -558,16 +558,27 @@ check-deprecated:
   allow_failure: true
 
 # gprof/gcov are GCC features
-gprof-gcov:
+build-gprof-gcov:
   extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-gprof --enable-gcov
-    MAKE_CHECK_ARGS: check
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
-  timeout: 70m
+  artifacts:
+    expire_in: 1 days
+    paths:
+      - build
+
+check-gprof-gcov:
+  extends: .native_test_job_template
+  needs:
+    - job: build-gprof-gcov
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
+    MAKE_CHECK_ARGS: check
   after_script:
     - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
 
-- 
2.26.3


