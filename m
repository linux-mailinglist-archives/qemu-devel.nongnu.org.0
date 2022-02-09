Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A644AF679
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:25:18 +0100 (CET)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpmP-0003PQ-AF
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:25:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHoRH-0001m8-Q9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:59:24 -0500
Received: from [2a00:1450:4864:20::529] (port=41807
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHoRE-0004Ci-KZ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:59:22 -0500
Received: by mail-ed1-x529.google.com with SMTP id cz16so5602229edb.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95VUsInsBJkWydqDjFNp5aZcy3HHZ58V16PSGr8vvHk=;
 b=n9cCdKCa+Y1dHVx9nOsop7rdkw2tFHm82VIRtxm6C6BelZCdRsgd+YjpnppmQNlW/7
 kX0+QeJPOynk8bazEZjTsu0td6/5m0f4IEqGLB0o+pZ3PurPjM45jVyen+p+lxagKX7X
 6aJU07fAOtf8yTtMWSnUYfuf4VTVR4JFxzsQdVOgQvGa87OzLDJ3QjjmkUkDw8RNNMfY
 79UjZXfF9NPFrkeuRyKTwaHGV35sn8wsJlJDJU84vCK8RhOMZRTwVHbR45P76kMvEeGR
 EOTdmbpI3MWNguKFvkSx4/OmV+YwEIwqHywQ+Q94BYRPo1SxHGoE96qcxwfjUlFCDdHY
 Fcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95VUsInsBJkWydqDjFNp5aZcy3HHZ58V16PSGr8vvHk=;
 b=uBRd/w5V36wwFJMqfAU3h6ZEK8Wy542Tu8PG3Etywa/luaArQ8xWnwbwcWiR15dCDg
 P1nyFJus0W+7aqCuZr52opSoVkt8QIV47xw6D5KQVZkjrMRuljYdu4VcGgZwiqRkLNpw
 EDeEyD8M1Vr4rwUEjJwwKnoaheWYZETVOa+mYL0RUNGRdyOso4S6yPggT6REWuptQrSx
 jBagmtM3bGr2lEp/5NYWWcngd++6w1NCG2RdocgBq0KHaJ06XlKBW3iXtYVY3eHnVSa7
 lDEjy0ZTsU+4btSlD+KGNVHxvOcomPcDuE8fG0SXuM1TzKn3IGMmX3g39h5fqdJLk4T0
 d/Vw==
X-Gm-Message-State: AOAM531nCZMec4F8sgdEAWO/mKiW/dht3B0A40a3l6GRRcrqJ0XOab+r
 6ovdE8uG1Zc/pOsRYA+NBhOQlA==
X-Google-Smtp-Source: ABdhPJziiCnnI330ahkIuKKMxBLMfI81H/bQNQvp7TeTnFu18p9hIL5c7TPCt1JHAEmOjRQ32LE6bw==
X-Received: by 2002:a05:6402:4305:: with SMTP id
 m5mr2933292edc.342.1644418755659; 
 Wed, 09 Feb 2022 06:59:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i17sm6785147edv.40.2022.02.09.06.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:59:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF1BC1FFB7;
 Wed,  9 Feb 2022 14:59:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/docker: restore TESTS/IMAGES filtering
Date: Wed,  9 Feb 2022 14:59:08 +0000
Message-Id: <20220209145908.3432580-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was broken in the re-factor:

  e86c9a64f4 ("tests/docker/Makefile.include: add a generic docker-run target")

Rather than unwind the changes just apply the filters to the total set
of available images and tests. That way we don't inadvertently build
images only not to use them later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Alex Williamson <alex.williamson@redhat.com>
---
 tests/docker/Makefile.include | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f1a0c5db7a..0ec59b2193 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -8,13 +8,19 @@ COMMA := ,
 
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
+# These variables can be set by the user to limit the set of docker
+# images and tests to a more restricted subset
+TESTS ?= %
+IMAGES ?= %
+
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
 # we don't directly build virtual images (they are used to build other images)
 DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain empty
-DOCKER_IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
+__IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
+DOCKER_IMAGES := $(if $(IMAGES), $(filter $(IMAGES), $(__IMAGES)), $(__IMAGES))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
 DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
@@ -23,16 +29,14 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-DOCKER_TESTS := $(notdir $(shell \
-	find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
+__TESTS := $(notdir $(shell \
+		find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
+DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 
 ENGINE := auto
 
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
-TESTS ?= %
-IMAGES ?= %
-
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
 DOCKER_SRC_COPY := $(BUILD_DIR)/docker-src.$(CUR_TIME)
 
@@ -274,8 +278,8 @@ endif
 	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 	@echo '                         Extra configure options.'
-	@echo '    IMAGES="a b c ..":   Filters which images to build or run.'
-	@echo '    TESTS="x y z .."     Filters which tests to run (for docker-test).'
+	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
+	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
 	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
 	@echo '                         (default is 1)'
 	@echo '    DEBUG=1              Stop and drop to shell in the created container'
-- 
2.30.2


