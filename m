Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C137F3513B2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:35:00 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRufD-00043h-Qv
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWp-0002oF-5S
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWP-0001le-Be
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2568027wmy.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aAJIhwawTT8RrDu4up4oKMqj+bPU5YE2QSAzABibnW0=;
 b=sEUVc1ZAkv5JzcV4q6+w2YX+xb+hy+Obr6EI/2XH61EsQb8+FZHoBIEXzmiC44etYz
 2hG4aJbwJf62uvtY6IjL9p3/TPmk72twQi/bu61j3mdoNS5vJlqvFGKavRUD5i7wSCLD
 GUFZWPmcpGxbuT9depyAGqBePbUWAJF4WEwTqoTMPR1mk+AmBxH4a2PS7gXioAZp5/vB
 7Y/3NT67FD7ZZHRNM8kn+jSkUFZC6a2z5nOSY7XZL0IFbsDZzJuAVHna8giUHIH1sj1e
 j8hXOlKp1pm8iEodGs98rm/BoZ0Bq4h+mJNLmJcBGkg/BN4sGS5oHt9ef6SS/4c2NG2J
 MkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aAJIhwawTT8RrDu4up4oKMqj+bPU5YE2QSAzABibnW0=;
 b=mtdG163xR+0Kh7KxYMcxA1FzUC26mU2aq6QKcNF8UOFxCJOxqykQ8YJVZDImk8n0Wd
 u3F4qgU+4aGjuAzJfnlWOQDpeEYA6D2Rq0jFfrzVgWFCszEKLC3tNMslUac9X4nUkoxg
 rVc4NTedjDNODOG4haBMfVGLIk8r5rj5fDE/uni8s3RoPPg0hqSTGx37lYbNqZJt8cx3
 koM/I338hscer+mqjIOWBvhlp9RXG7u8UWMzkDYNC0XjflBUP9r90dshLH8rZtG+gXPJ
 osUgg3qkaMeJOJdm67dcfowC1Mn3r64N/XB56sVvphOzo25lml4YHJS22OSoJ97mmpaV
 4PGQ==
X-Gm-Message-State: AOAM530lcmdxZQ9wc6+Y3sn5LCFgCK32OGi77MyQAst3ZBVzSqSHWRQ9
 /l3IapBd+I/i806NQ+1sZXeoWg==
X-Google-Smtp-Source: ABdhPJxcarL1ph5w2tWkNDoThsoX4+NbTPWyws7oDewBBt9pDxQ/St+KgbRGt6iiEwXAw9daMfcJrQ==
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr7423094wml.7.1617272746222; 
 Thu, 01 Apr 2021 03:25:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x25sm9795456wmj.14.2021.04.01.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 566011FF99;
 Thu,  1 Apr 2021 11:25:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] gitlab-ci.yml: Fix the filtering for the git
 submodules
Date: Thu,  1 Apr 2021 11:25:29 +0100
Message-Id: <20210401102530.12030-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Commit 7d7dbf9dc15be6e introduced a new line starting with
"GIT_SUBMODULES_ACTION=" in the config-host.mak file. The grep that
tries to determine the submodules in the gitlab-ci.yml file matches
this new line, too, causing a warning message when updating the modules:

 warn: ignoring non-existent submodule GIT_SUBMODULES_ACTION=update

Fix it by matching the "GIT_SUBMODULES=..." line only.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210331073316.2965928-1-thuth@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3480d79db3..85b8e10b84 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,7 +42,7 @@ include:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
     - scripts/git-submodule.sh update
-        $(grep GIT_SUBMODULES build/config-host.mak | sed 's/GIT_SUBMODULES=//')
+        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
     - cd build
     - find . -type f -exec touch {} +
     # Avoid recompiling by hiding ninja with NINJA=":"
-- 
2.20.1


