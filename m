Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27EA2DC4A7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:53:35 +0100 (CET)
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa3S-0004wY-LQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyl-000847-1J
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:43 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyj-0002Ov-FY
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r7so23853118wrc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eIh60hAOdPjs1V7UwiaUpgPMXkzSWEu9LCAuhpD69F4=;
 b=uyDRO/J+ICtAmxyxOdf/dOwtqzS9Aqee7kDwP/Ihiurz5lBHE7rlozKNfXQPJfTZ3a
 Yu6BC5Ve0WdQbifJJyoXg4FiR1pp9MKP2OfytQEzAzBsPrxpaMa9pP6DZz58aw1CPB1U
 qmua8D72MNC21GUOV79+IdTtdmkBxvFmagfh6yaDwuvMgU0RtF7mz5jIHmuWOQ9l4d6W
 pktU/1RIZeHpMHuqKJ4wYJhQY6zYk5FTqZirHEYgNN416VrmdF3cRa8Xip68rPBBNQbb
 W+9IR7dgurw3broSFGt76rnWnRHY5tdRQM1+qp4Tj4sS5DxB0vnIocHFIZRk03bMSJmo
 QJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eIh60hAOdPjs1V7UwiaUpgPMXkzSWEu9LCAuhpD69F4=;
 b=sox+o1c4Lr97Sib1bm5K0e7WRaSLzgl329b0e0zQnmb/xpAsG48WYYqAR3GGTqUDqE
 FLfCaaQr9i67zD4jGV0wCCK2v1rPib51/jg363n1KmPir5JFxjhOnPeqYIOnbGF7ZLXs
 vWJ6vR7051QfKniQZs4ISklkJB8xD6tbD2JJj8izAwFSpzxxBewEuVAwa1yI+6DRMmfV
 qeQxQXnlF3Iy8m8P40gQc54PVBI/evCjhvE0/WALk14X43e7zVbszHcd+i9DtvK8T4jS
 ERcKHGZtGcB5Gxmyfvz/mqTuGT4VmDApuu/WjAJ/senTZhGm37QbytWolAtLaSKS5zFM
 RUfg==
X-Gm-Message-State: AOAM53369SsvxDUKUTM+wLDCjez+l+4SbDlhiq/Dk3cbqQWfK3fx6SQ3
 +uwtAItqYDdkGuPwGddC3GjzIQ==
X-Google-Smtp-Source: ABdhPJxZuf7HoMhqyBy6AIpPuhDAeBkE/73vPtSRvCmLrERPmj5sNSQB+/SffJbvvtq66jPimoWsxQ==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr7982140wrw.42.1608137320131; 
 Wed, 16 Dec 2020 08:48:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t13sm4210933wrs.26.2020.12.16.08.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B9E91FF92;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/11] gitlab: move --without-default-devices build from Travis
Date: Wed, 16 Dec 2020 16:48:22 +0000
Message-Id: <20201216164827.24457-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201210190417.31673-7-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b3bcaacf7b..2134453717 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -514,6 +514,13 @@ build-trace-ust-system:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
 
+# Check our reduced build configurations
+build-without-default-devices:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos8
+    CONFIGURE_ARGS: --without-default-devices --disable-user
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
diff --git a/.travis.yml b/.travis.yml
index d01714a5ae..f2a101936c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -205,14 +205,6 @@ jobs:
         - ${SRC_DIR}/scripts/travis/coverage-summary.sh
 
 
-    # We manually include builds which we disable "make check" for
-    - name: "GCC without-default-devices (softmmu)"
-      env:
-        - CONFIG="--without-default-devices --disable-user"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-        - TEST_CMD=""
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.20.1


