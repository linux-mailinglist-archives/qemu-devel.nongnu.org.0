Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B0355741
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:05:51 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnH4-0001de-3l
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCH-0006Nv-UE
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCB-000515-B2
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so7476101wmj.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hs7mxy20pMj/ITktlM5CnWRfUPzoR68xIyhkZbF5a6I=;
 b=dExffXNCQ5hv6GKqU4Bv4sw0xDV+vo8HK9dnYB72bfroUFhzT8EihwtTs1aUfmHcju
 cuv9wgoUHYVxJJvKbpQ8j68rU52/dQ6obX3OFxn+nVYA2MeOK205cYuk6bIvJFuLRJlY
 UkMOwU+BgqYYFbb2W+6zaxRH3ukNaE4JcWVfg36GfDksOT1owSpD3MSKo6mMsnitRPNc
 90D68IaiWrvMibPtp2IdvMnYcO9rXZtEzVMPL40Vgo8X39pCcxoEzfo5caq+LXoAdBOc
 3Xqq++2nnym/L+7DlQCyvjLvXw0OsUWtfOpYMTZlmDeikWiMQXWcT7B9oveGQOAw7ltO
 54UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hs7mxy20pMj/ITktlM5CnWRfUPzoR68xIyhkZbF5a6I=;
 b=bmPjoJqoal8zCk9MbMVvr7XLBok9/fB9Qm1xDDSUn+o2uu/GvRK2eVCPkCdSdyNYod
 2h8SM2fWau1N4OANOiTydm6Mm9mf+2GjGWRNl1vf7zeG18SJwJzhGAoOLK3aX7VMLV4S
 4yTUlBiUncBx6rXJ9PAqSnh6GaAOJo7JaCAsCvEto7qohY3KA7u44LKmlN79vAAwJ7Ru
 XvuRW9Z1Jx5xYQ4R8xo5GO9L6sKii3zhVz/JFlRYEa3Vn+XEvjiG7Ossnn1WYVcJ4Lmt
 X/32RvK2ZXQunxL5O45HQQqA8YegbZI52jk17KP+/4M1GVrzdPL1BbMtX95j48GnXi1J
 RU9Q==
X-Gm-Message-State: AOAM530yVfcNy8oa2Cyj1y5Xq0di3XWIfyZzStdH+8oOCVLScoT2qfRg
 zpyJxZo25aGd0KleJ/zUEeKN3w==
X-Google-Smtp-Source: ABdhPJybCumaM1dX9ZUOb2vHussVpqrIeMrJQnMbLEcD0F0nWtI4Y9DBPyh5GK6c623s4Er/69ZN3A==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr4612934wmc.51.1617721245591; 
 Tue, 06 Apr 2021 08:00:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o38sm2448461wmp.37.2021.04.06.08.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34BE01FF8C;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/11] tests/docker: don't set DOCKER_REGISTRY on non-x86_64
Date: Tue,  6 Apr 2021 16:00:32 +0100
Message-Id: <20210406150041.28753-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently our gitlab registry is x86_64 only so attempting to pull an
image from it on something else will end in tears.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210401102530.12030-3-alex.bennee@linaro.org>

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


