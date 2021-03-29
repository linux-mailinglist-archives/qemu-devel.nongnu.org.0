Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF334CE75
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:06:11 +0200 (CEST)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpik-0001W7-Gv
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfr-00007K-8p
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfp-0004gT-Kt
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso6462018wmi.0
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akBhyYj0JdKi/XVZUZPWSNnrTT/4CNaLSZQB5KZh/yg=;
 b=job2IUGM6CkpG4S/GDtE0PpZ/ka/EG+VN6llVK+YgJnw6KX3lfDPGzGLmSKwDGK6xd
 zbqoZcV4x8D4v177bn4u1DlbajuGFgcynDJhdkWLQY0B8zEY8SzzFI4kG+E3EMn9n4b7
 rgntKiJ66oJB5Evg/pZZeHRzC4fT0j6AuRIlZ6t8dP1dKXwQns9SMiebp6cToH0SrLto
 RTA7ver5+ILkqIdo/rMepUgFWAzvCmz4Hu+RV0GTfUNuruQkMIndLkjUh5y+WxhEWRDn
 buve31D9zCmytTjmQ76wVAIG5vh1pXlvKvC71YmCWsu9oWQ2j3X6F7cGSzLGuBkHZUPL
 GHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akBhyYj0JdKi/XVZUZPWSNnrTT/4CNaLSZQB5KZh/yg=;
 b=Ss9tW2JClbS8b/1Z650Qnm/VgcFbwnrfL3KQCcPqnE5uriK3J/PTtCIpMrwXU182ou
 aEch5elEfcghC3IPaJib3/ClkoPLcLGM7q+xjeq1kjRQBXaZQG2fVQhJxQ0ROjaj0FPv
 xnlPIEMl0aMBnKMLtzieEQOvCOgEcRLon6NqJ2NYEMwjAuQL80BY3lAbor1/52kqxd8n
 gEOcYL+qqmrqPSRTGjNLJOGC3fLuOKURKdZq0EdQos+aAgQHCWCChtF/H7WjE6BvfQ5D
 bqQM3C2X/mMEKGODNPDY0DJuv4aT87DcZ6iifLvBVJuzfuASFAgHrIpVob9zPyAWCHGT
 TAHw==
X-Gm-Message-State: AOAM531+uF5mWY6D6ru0kRJARGv1N3zN/j7sNrWRmTTTm2V2fqMeQhVX
 7arywnc9bkFd6wlU5ocLDUdSEQ==
X-Google-Smtp-Source: ABdhPJy41wjWmbXUNIoGc+xyfhLHn2TNfZaiNVsfmGdM3Xp19zpgQb400N8R/h5zMKYnhSHq/WlZSg==
X-Received: by 2002:a05:600c:2254:: with SMTP id
 a20mr25291003wmm.115.1617015788247; 
 Mon, 29 Mar 2021 04:03:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u4sm30661762wrm.24.2021.03.29.04.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:03:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C9FB1FF8C;
 Mon, 29 Mar 2021 12:03:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/6] tests/docker: don't set DOCKER_REGISTRY on non-x86_64
Date: Mon, 29 Mar 2021 12:02:59 +0100
Message-Id: <20210329110303.15235-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329110303.15235-1-alex.bennee@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently our gitlab registry is x86_64 only so attempting to pull an
image from it on something else will end in tears.

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


