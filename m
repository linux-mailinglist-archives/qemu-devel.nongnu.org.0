Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD58A35136E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:28:18 +0200 (CEST)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuYj-0004Xt-EQ
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWT-0002j3-CQ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuW6-0001iq-IK
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o16so1311554wrn.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYro9+doI0v6QdY4ETT7gw047cu/gwITcrYScrukAOc=;
 b=zloWy0+b0V8RriSsEbQtj9nmfMLCGOWC4DZgsA1rRLwxL51WSu7lYNPJjhMAVukmT9
 Jq2bkWUODB1xUoKfYpgrcBFNHEnpo9pJDfYFKHrZ3npOhFYXi40ViWM9NoEP9YFJaUlX
 +wj37cz+OEWSuloaBZXssz5aY60te/rX2P9vV7+3tQjHl2TA524xLrSaIQgPDGI4hQ5M
 D9623O5NWnvnWRrCKH6Dm0Di1qTzTn9hAQlAE7rSI7AQDJWCz6VnO87z09CCBpSlOivF
 1BcESTFnGX3+mH9wqaUrQx407OO0ozFvYtc9ngJ3ql3ozd/TElVe/uDxwwnQR6iayOJM
 pqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYro9+doI0v6QdY4ETT7gw047cu/gwITcrYScrukAOc=;
 b=oHSsfym6tV7sNKK56s4V93E90Nf8pCx9s1SDol4jubDNhfBivDCDgrunvjzm7QxVUR
 c5uz+D4nm5/PlbDQeRgEUtDXb36HbVxp5zUWxBoUQ4J+WxPbaSlpdy8KPdrzrq7ppVSB
 bng/hn3nTCNeeV1fIDPwt8Sa1ZRKO4rCPYLbzOqYKZXhlnrJGC4FTRG3Kq+pMdIpcB2t
 Xb4RaZBZIP7aKnkNiuNrYZkKvfF3429Mi5g1Oj1fUdKe+qmTb7WIlbxlScC5JXJwC9Pb
 IOUp4kTEnbQTWmQ5B6i+x4ESBGhG0uVFNsrRk/5PlNGrn7rD10EgI0K/SIDuyJB/8t8J
 brpQ==
X-Gm-Message-State: AOAM533+Z1VhzlAMq5RtsCZkE1HYiid2D7YfqhPNG3rso0NwQq8M9nct
 8EYEjDUwePK/sz3WarZi5JzpRQ==
X-Google-Smtp-Source: ABdhPJzSYCK0kGTMFfZ9gNE5PtWqd52wcdjnM/rzG3IgofhqBQF1sWDeT6ITJgJBDczVNOUocIot8w==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr8663387wra.239.1617272732907; 
 Thu, 01 Apr 2021 03:25:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n8sm8555367wrm.70.2021.04.01.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 992F51FF8C;
 Thu,  1 Apr 2021 11:25:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] tests/docker: don't set DOCKER_REGISTRY on non-x86_64
Date: Thu,  1 Apr 2021 11:25:21 +0100
Message-Id: <20210401102530.12030-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently our gitlab registry is x86_64 only so attempting to pull an
image from it on something else will end in tears.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7cab761bf5..9f464cb92c 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -16,7 +16,10 @@ DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.doc
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
 DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
-DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),registry.gitlab.com/qemu-project/qemu)
+ifeq ($(HOST_ARCH),x86_64)
+DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
+endif
+DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
 DOCKER_TESTS := $(notdir $(shell \
 	find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
-- 
2.20.1


