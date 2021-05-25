Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE238FCD6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:31:24 +0200 (CEST)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSTD-0005kJ-2D
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOC-0003zh-9q
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOA-0007Ep-OO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i17so31181237wrq.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7v32F7sA+s0nX/521Wn9idR1Uq3Ai0OnDxbO/sW8qQ=;
 b=LZ0N9UwmnVPeCQfxPxHp13HuxnMbWx9vJGeIOZmAIn8RLiAthXy9dGDPkJtd/CfSRy
 TxQ5oHSVhAfqxycYY2JGRc09X5AXmIs/s/l3Rs7x+SuT2VFbv1CPojiBtl+SQVjnl48m
 2H0nLTe0uVfdFag6W4+dbCFOGIeak4a7B8gLgu+lrJKXnp++UjgPzpYFw258zanOZ5zy
 I3I3hh/cd0fyN7QfsE1jCaatpkxenzVcv+3gT5gmmq8CVg4ZYkaofyQKKoOTAj5EsqTT
 TvZkVrqamQ8DMJcpk4JdjAja/ZcB7sJeK4acvtxt01k+SkmtWT7Nix/96dVd4zYvaDZf
 O52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k7v32F7sA+s0nX/521Wn9idR1Uq3Ai0OnDxbO/sW8qQ=;
 b=I+xvFddnNVqcTw71vTNwQNYQCx0LXZDoynXBFaUYFDYWIW2O6dQmsvlIXbAd05ZEO3
 BA4m7M/ryibwcZ40E3nYXbmz5PMPYr4aRr31zZMuu9txBgjoh6YU3+JGXDHCsEJ5ysDl
 v3e9MkdpLc38HqGDPDM8BNO8mZzsFayMiGa0uglegXm4fsJeYEkv/hf052mQFgz2UZaB
 iFjbKCfTUdiwnhM19WPsAZtnoBrHDf04XLjAnmGz/w4MYHkfwn0Ra3bZ1ltKMhuHwhrS
 5/crZ69EJdRDsCJ/yOD1A1OKO3aoX8f3EUEjGVKWG/nRf2/EPhYn6PZJtEf+Gv/zrqbR
 bKZw==
X-Gm-Message-State: AOAM533HVHEPMAgJVltwaekA+UjvnFruTmAq5FauhajGwHU/sB5BrAto
 NYIlNEw23lIOTpXEzQMcit9F98UpJe42Bw==
X-Google-Smtp-Source: ABdhPJy8NWPOnWfAIu00QsiUzcjLgtIuHFCWDWPZo3ykJ8p27RXjXf6wZe+QOHlJPQc7b3j4HGqtIg==
X-Received: by 2002:a5d:490d:: with SMTP id x13mr25963348wrq.49.1621931169253; 
 Tue, 25 May 2021 01:26:09 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m20sm1963910wmi.5.2021.05.25.01.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] gitlab-ci: Move current job set to qemu-project.yml
Date: Tue, 25 May 2021 10:25:49 +0200
Message-Id: <20210525082556.4011380-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
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

To allow forks to easily decide which jobs they want to run,
but without disrupting the current default, move the current
set of jobs to a new file corresponding to the jobs run by
the mainstream project CI:
https://gitlab.com/qemu-project/qemu/-/pipelines

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/qemu-project.yml | 11 +++++++++++
 .gitlab-ci.yml                |  8 +-------
 2 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 .gitlab-ci.d/qemu-project.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
new file mode 100644
index 00000000000..64cb2ba1da5
--- /dev/null
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -0,0 +1,11 @@
+# This file contains the set of jobs run by the QEMU project:
+# https://gitlab.com/qemu-project/qemu/-/pipelines
+
+include:
+  - local: '/.gitlab-ci.d/stages.yml'
+  - local: '/.gitlab-ci.d/edk2.yml'
+  - local: '/.gitlab-ci.d/opensbi.yml'
+  - local: '/.gitlab-ci.d/containers.yml'
+  - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/buildtest.yml'
+  - local: '/.gitlab-ci.d/static_checks.yml'
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index aea58813a25..533a7e61339 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,8 +1,2 @@
 include:
-  - local: '/.gitlab-ci.d/stages.yml'
-  - local: '/.gitlab-ci.d/edk2.yml'
-  - local: '/.gitlab-ci.d/opensbi.yml'
-  - local: '/.gitlab-ci.d/containers.yml'
-  - local: '/.gitlab-ci.d/crossbuilds.yml'
-  - local: '/.gitlab-ci.d/buildtest.yml'
-  - local: '/.gitlab-ci.d/static_checks.yml'
+  - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.26.3


