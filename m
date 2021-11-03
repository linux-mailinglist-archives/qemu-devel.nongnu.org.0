Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7154446E3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:18:11 +0100 (CET)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJtq-0000Ad-KD
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiM-0003qy-4u
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiK-0003lZ-8L
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:17 -0400
Received: by mail-wm1-x334.google.com with SMTP id v127so2513692wme.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LhCMj49V450oWkOKk125VLrGAzkn15HxQfeeMwD8j/0=;
 b=B1hx1u15oK++G9Yz/L54MoPanwALIbmx7eoaAIGjY+OUDbQ6Jy0Tiu2Y/jQDWnImm9
 pdkCEzfn01DvuZ41gleIEnQqZ2GUwLikCYjvoXkQL5wleDHdSOxKB508ihF0kq950d3P
 tH6VXlsJTX2G9NNRu75VFWR5Ag+eH+AuREnHc1GNdY18bsj+Zl09jky/8zuFN25k/UDV
 mqLkO42vQHYsp4beAPZmBQCdRTNKREKCRGxdh9fw4OwxWGg324j12vhqZNaLzIfPI5F4
 w1EbMkkrdsnFF2JCgktythTw8ooMqO7eSDU5qp0mH9KX5laLfEaasC8lCyjntKiCQduc
 N4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LhCMj49V450oWkOKk125VLrGAzkn15HxQfeeMwD8j/0=;
 b=EIqV7yZI2J3yEgz13iewc0+roUVqPUauwCcdMSL+BREN1fNUr/LEnSs959mB/u2Xx5
 1ekvwiKyFKVf+rdh6q5yGRu/aRl2MQD9Y2CMWI+7X4eOqodXaWEapPm1AT8xAblRIWB8
 7sFJGq4e55fkSpvfKTa0HAIGjrsRpCN+6LHBm3/kYtjN4U4zDR33HpVS6nPFkTDpS34H
 R6ZIhN2yl+Qa2Uw3Yja7Qz8B2R15ZdKANm/gGePXK/g/C7DrGxCX5v5Mo5/EGZeTt4N1
 MyiziquOmP2eUx6S7cFym9Xt/MJNrDRr4GbT/fx2KjQdcWveZIezP65aTJZYETaMfNe7
 8RGQ==
X-Gm-Message-State: AOAM5335MFE2PSKWvgm8yBxH+1z72huG3td9QeofcZ2u6Z2ofycWKz3G
 I7WGkOTq+txfD1PxLEB4dF9vnTfegjEEVg==
X-Google-Smtp-Source: ABdhPJzoKkNf+09gFsrgGLcJ/yyvYVYZJ8Q5qCRTuFAlbyaUe1bMRcQL0JmDuTSIr0mWON6jYK4Qtw==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr16548230wmf.55.1635959173760; 
 Wed, 03 Nov 2021 10:06:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u15sm2812406wmq.12.2021.11.03.10.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 250B11FF9E;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/21] tests/docker: split PARTIAL into PARTIAL and VIRTUAL
 images
Date: Wed,  3 Nov 2021 17:05:44 +0000
Message-Id: <20211103170558.717981-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly to ensure we don't include the toolchain and bootstrap
builds in DOCKER_IMAGES which is useful when verifying all images
still build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211026102234.3961636-10-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e943ac33b0..5bbbaceed1 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -11,8 +11,10 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-bootstrap empty
-DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker))))
+DOCKER_PARTIAL_IMAGES := debian10 debian11
+# we don't directly build virtual images (they are used to build other images)
+DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain empty
+DOCKER_IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
 DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
@@ -204,7 +206,7 @@ DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 # packages.
 
 # Expand all the pre-requistes for each docker image and test combination
-$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
+$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
 		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
-- 
2.30.2


