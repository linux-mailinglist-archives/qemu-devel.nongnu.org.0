Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E243B00A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:31:29 +0200 (CEST)
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJjs-00042x-Cx
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbc-00011t-0x
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJba-0007Rv-Ff
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id m42so13566293wms.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pQ3BdzkSMgKgR2yCwD+Jc0cjVeoWcI6lFMea0A48Un4=;
 b=pSTV3+NNeRHm9tnmF2HuuYNYvclG2QKKBD0egEjxFgQU4HhlMXGAbHgztCrSgyhcaH
 a55uzxWIWDqCWW9cAcdmqHQtzdK64KLE7OvDpJCS5tT28RSSToDTvILeRcDPpyoL1oi3
 f36lAayL9fDqkbjZ88pOiLmHLdMiDDe9PrfSzsupiTmTFAzWSlPe8MvT2XkMSkzGK6xK
 Y4x+E6oJy8q3AYwXcVLurRcLnF4I0M6eQR/PMfXznH4Ft/eEH9ySJ6SFMbSfsVDgoxa6
 gqxCOHhQ9RJRFl+ZVRAD7oRmup+OiWE85LqAhyUk6SDEk2zhxbJFWKPHjncwj8Yn+skr
 Xu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQ3BdzkSMgKgR2yCwD+Jc0cjVeoWcI6lFMea0A48Un4=;
 b=Q2JdUb2eP+ngHmenVGS/85ohlnDYZhY8xARpjyCGH7tmYbHvvM+IDZeZ+m+LxWlJSX
 gUHJ0MsedivDfZA9aqx38SZcX0yv4bKw7wYc3aB9satgmzbYsuPm7vXRX6HNpILjojFP
 ZJVkEpdcLhQKlqvusNdkUf7sMjE5es/q90gIBFtSH/3Xr7+IBTrg2OnvfF+RvjqzIpet
 Y7TyS8Lw8JJyUYzO0/QnyEKpfA6pL2k/90XCoaaFLAnEgD8cy584VujRUt8IjQnh6C9g
 3RxAQ1m+sctYiF7YmRoJsVY4uELdTZ3pdyqttkUBPqi7vuy0nwyO46Drzy+Z3xmUJ6Qu
 ya5A==
X-Gm-Message-State: AOAM531xfdRv1zd4h97cDg+A5rMHbaWLyvxDAA8ms8nCR9mUvfpEYWg+
 gO8Qn4i5rxhkJk/bEoCdJdtqJA==
X-Google-Smtp-Source: ABdhPJyyqO8B0WCROWZAqLZp3PPUtVaJr6Sm5YyRmSCBdq3PDfyKMxPh38GkEU/7Jgn9ikVrXMkRng==
X-Received: by 2002:a7b:c955:: with SMTP id i21mr4263332wml.53.1635243773138; 
 Tue, 26 Oct 2021 03:22:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o20sm171536wmq.47.2021.10.26.03.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 882111FFA5;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/28] tests/docker: split PARTIAL into PARTIAL and VIRTUAL
 images
Date: Tue, 26 Oct 2021 11:22:15 +0100
Message-Id: <20211026102234.3961636-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly to ensure we don't include the toolchain and bootstrap
builds in DOCKER_IMAGES which is useful when verifying all images
still build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

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


