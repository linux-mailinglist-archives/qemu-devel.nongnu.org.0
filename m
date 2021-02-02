Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EDF30BFBF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:42:34 +0100 (CET)
Received: from localhost ([::1]:38676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vwr-0005LH-0k
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuj-0003XH-1q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:17 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vud-0007En-JK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:16 -0500
Received: by mail-wr1-x429.google.com with SMTP id d16so20465806wro.11
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nz9Cq00egLL1TS+HApF3A/Rij9QOF1bLxSf/x22iz8s=;
 b=NPX8qwmDqvXBYLmk5XWrOdcDhpWowCVXP1W1MLuLOmPhuj/8OMVAQROO4BlGx9L1X7
 9bylHxTiWWjZsWm030JFjpH8BNDU6sh0oHkLE3ZcT83M+LHtYgODEiX5YBgC6k+S7lv5
 /vaall09qKDlEGmpMgjSrpS6BvZRtdYcYIKv7NNyBALZS6JvEmEitE5BUVaKIdvi7OFM
 Pg1vyPXKU8g/6h924axt0d9EKnZBuKlDl/nQoWNn9iwETE8t2WB2M9ILXn47B73lXPp/
 WMtOjNlUp+dRPWSRQS293NBbJWk7eDNR0EQnG8lqP51f0diKyEs1UVqRqLX8OR9e2MJG
 B0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nz9Cq00egLL1TS+HApF3A/Rij9QOF1bLxSf/x22iz8s=;
 b=dhbE2fNj1x3ffbriiq3NRh0xW/9T8THx6jJq9tzOeFyb+Gw2PO5zHmPFewoCR0waNU
 Sue8GIlefoWJaRQmpy5vteCY/a8Bl2/ykpST3XFrNxA4y6fxaCS5LV7afExh/58D+lt2
 WMn1mIixej1XWnjYw4HDJL+ryVGuvrCWGO0fAsJHoAmxcciTeoIN9xstK/NOKK1X/BDG
 xGwRn6OAF89gqNsITIRlYjjA2p2B1I8IClaFHUqpZp7HLI6b4O6qK4qbD9vg489WLbxd
 HEhSeuWz6ggNUSMVddbFvTRFQ3iu/AskASXs6Gj8gzLUlTnSKS7/fBdVU9030Z7IKiCU
 eftw==
X-Gm-Message-State: AOAM531ZO29uPg7F1q14vmG8glreFAOsuytEWDtKxVM/Kmt8w/7cM2px
 DKf+t8lX38lZC9Uh4WFRVWgzazJLf7MZWyKm
X-Google-Smtp-Source: ABdhPJziHBEtRSSrO8V8HLHyCCMtGlYZx8kv7H5h3qJG+rDWhyukr8O6rGBU7mqZx/1JbVU7squCcg==
X-Received: by 2002:a5d:560c:: with SMTP id l12mr23188792wrv.417.1612273210219; 
 Tue, 02 Feb 2021 05:40:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w14sm31546040wro.86.2021.02.02.05.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8353F1FF91;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/15] tests/docker: alias docker-help target for
 consistency
Date: Tue,  2 Feb 2021 13:39:50 +0000
Message-Id: <20210202134001.25738-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a bunch of -help targets so this will save some cognitive
dissonance. Keep the original for those with muscle memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
v2
  - also fix help-on-help text
---
 Makefile                      | 2 +-
 tests/docker/Makefile.include | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b0dff73904..d7fb6b270e 100644
--- a/Makefile
+++ b/Makefile
@@ -305,7 +305,7 @@ endif
 	@echo  'Test targets:'
 	$(call print-help,check,Run all tests (check-help for details))
 	$(call print-help,bench,Run all benchmarks)
-	$(call print-help,docker,Help about targets running tests inside containers)
+	$(call print-help,docker-help,Help about targets running tests inside containers)
 	$(call print-help,vm-help,Help about targets running tests inside VM)
 	@echo  ''
 	@echo  'Documentation targets:'
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index bdc53ddfcf..a5c1e4a615 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -1,6 +1,6 @@
 # Makefile for Docker tests
 
-.PHONY: docker docker-test docker-clean docker-image docker-qemu-src
+.PHONY: docker docker-help docker-test docker-clean docker-image docker-qemu-src
 
 NULL :=
 SPACE := $(NULL) #
@@ -218,6 +218,8 @@ endif
 	@echo '                         Specify which container engine to run.'
 	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
 
+docker-help: docker
+
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
 # docker-test-foo@bar) which will do additional verification.
-- 
2.20.1


