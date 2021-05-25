Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98E38FCD5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:30:18 +0200 (CEST)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSSA-0003d9-0F
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOV-0004qW-Da
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOT-0007Rs-U1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j14so29435091wrq.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hYe5uhovemiIm4ZvAvve+Y9rTfAkxnOn7U/FYNhXgRs=;
 b=gLF2aThvBv19wEZCv77vc3adoTOaS7bs5tMMM8rOmpkcp21LvdstfUkVdxOLg6rOxW
 t6durv2zbZ9esQTFPAEmpUvZJwdL9xA197OGK5Fg/wpuKHW1sUkLsBhgKnL2Kx3wOvj+
 sYxQScvlKPY+jlQCGOGuZKQiaJ/DAm1suPEfQPZ2SNJPMUrbePTyc5wIATTjqOqcRVwR
 K3FPfpAzTEQzKMYyF7okcp6Sn9Lznsyd4rlCxfkMYCS/rTiyBNYX5/jkom89oXJHyM24
 4wd41vSPW4MThbth5fjF7OJfXt8gbsd4bnv++uP8wzeXWCS7dc/JNm57OqTMWlGqq5HX
 ukqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hYe5uhovemiIm4ZvAvve+Y9rTfAkxnOn7U/FYNhXgRs=;
 b=aExFG2EBADojG0GuDEshFjWDtvAFcYy0Hflta20F+BH/TOXOExl66PH1UV8+4w1IN7
 X8GU/NALDXfsSq6Bau7+jq0j2URqCpxfDDvxopQNxdmI5CvApTB8tP8SYXLQ/fQpvtnc
 VE8UlmGM2t+5USMdSPkq/seZb8Qx/lN8Sy6p9AJ1VRdklkTFOKSU1c5R8Qy6OOC8vvM8
 RsQYB+YMihfWcwf5TT8DAcZWoQ7uMsDsJnaC8i1cfrLxe3swM4wKvNDbE4twXpOHbqIf
 r2GPe2mSLK8CVQAXKLUwgVKKieF/DStVrFRSN18vwJEmox2piAoUyeZoKaLz4JLhaLyU
 GSCQ==
X-Gm-Message-State: AOAM530AcQf3GRkZOGkZ3jF2eYOG3yxUS9KmAVa011G9A3orQyIp3Ng8
 CijRxA2s28rSs+8zoZPQQUN29cRjwwSzDw==
X-Google-Smtp-Source: ABdhPJxejsKkbHBIWgeTQMJZQgbEVR0L4rqVzNXxdk5KdKZmbEfQM9lfr88z7rXgkHpkB7iV3zGE0g==
X-Received: by 2002:a05:6000:1147:: with SMTP id
 d7mr26548783wrx.302.1621931188464; 
 Tue, 25 May 2021 01:26:28 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n6sm9834032wmq.34.2021.05.25.01.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] gitlab-ci: Split gprof-gcov job
Date: Tue, 25 May 2021 10:25:53 +0200
Message-Id: <20210525082556.4011380-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This job is hitting the 70min limit, so split it in 2 tasks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index f903fdea3f4..894732e203d 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -564,16 +564,27 @@ check-deprecated:
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


