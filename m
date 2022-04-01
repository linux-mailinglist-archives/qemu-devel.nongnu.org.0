Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952FB4EEF47
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:24:00 +0200 (CEST)
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIBz-00055V-Le
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:23:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI22-0003Tu-Ir
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:42 -0400
Received: from [2a00:1450:4864:20::52d] (port=42569
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI21-0006cV-2f
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:42 -0400
Received: by mail-ed1-x52d.google.com with SMTP id a17so3098853edm.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e5AGSJdgprGKZ/4CwUnR3jujV6g/OQzrNz4HqHgggK4=;
 b=B4v7mJWHSxK95KDv8b6oUSMsyiUz5uqkCooHEzlV8MsacpqdxkjxjeEB490kGX5GOP
 gghNxUk5S3fGIBhvr+HnbVpr0T2bchQBddEW/oGkB71j2KhxxM4jnW3W/u/EneKuDD8/
 3B7RzzzovBxTzB0w50CO7n+ph6cNaqwTlbUkU9d//9PuKDN4p+5sEcSESNpIR7O6EavO
 iO1QIXOC/bmlZRmT7a8Ryk4HcdSheKHT3b7PJg4+515Ur51CaGrJGoLQrv+99+D7hoNG
 yss6NzHLzWvyM1tFUb20YJPFySkCppbNYcMldLe7Pj7N0HPAoRpcghuTxFCvikIZ2Sl8
 0vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e5AGSJdgprGKZ/4CwUnR3jujV6g/OQzrNz4HqHgggK4=;
 b=Y2w84tYbCHE/8wYyQy7W1heXqLLdkRW+Lz/ylX4wHG/1S1+81WwsxTNz7iR6glPjtK
 xEmDFvcmL4OsOysykkZJ3ku2RLPAhlL6T2v6aXCYQG8PTM7OPDWBRCZetWL666YifAEM
 OjPN9mW/m28usNdRe2AP0C1j5NgMKHYYzehr0Yccou7wTUpgpzQguOBosaBXYw4gSCcj
 3qv9t19GyBnC40WZzMHZVgfWSTtpvMXrFwT/dWr5xAduKAVwx3lqxHmJ759Os5KCxzdE
 Tn1nxFNFapEJAfbVOEGgxNbQJ2hf7w3UbOKT40r8VYAKSPIVwYDHbURe4/DFjwMUf1FS
 Vn4Q==
X-Gm-Message-State: AOAM530L5NomVwUx/Bgd27rHSZJcsKeb27lRBz0mw0zPFb2lZm4uUu8F
 IfPJLT30qtXxuFsqR8YPuilVFPQNKng=
X-Google-Smtp-Source: ABdhPJysX9lXPfF0WS+v82i8jAboCMk/nMabtPyQg4IUKdZRy9Kz18jMNqyFRCfVxfR4i1y1uVXdiA==
X-Received: by 2002:a05:6402:2794:b0:419:2ed8:f36e with SMTP id
 b20-20020a056402279400b004192ed8f36emr21430626ede.44.1648822419838; 
 Fri, 01 Apr 2022 07:13:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] tests/docker: simplify docker-TEST@IMAGE targets
Date: Fri,  1 Apr 2022 16:13:16 +0200
Message-Id: <20220401141326.1244422-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to go through the shell when we already have the test and images at
the point where the targets are declared.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-8-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 3b5ebd5567..2a187cb5a2 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -204,7 +204,7 @@ DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
-		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
+		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=$i) \
 	) \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval docker-all-tests: docker-$t@$i) \
@@ -263,7 +263,7 @@ DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
 
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
-# docker-test-foo@bar) which will do additional verification.
+# docker-test-foo@bar) which will also ensure the image is up to date.
 #
 # For example: make docker-run TEST="test-quick" IMAGE="debian:arm64" EXECUTABLE=./aarch64-linux-user/qemu-aarch64
 #
@@ -298,14 +298,6 @@ docker-run: docker-qemu-src
 	$(call quiet-command, rm -r $(DOCKER_SRC_COPY), \
 		"  CLEANUP $(DOCKER_SRC_COPY)")
 
-# Run targets:
-#
-# Of the form docker-TEST-FOO@IMAGE-BAR which will then be expanded into a call to "make docker-run"
-docker-run-%: CMD = $(shell echo '$@' | sed -e 's/docker-run-\([^@]*\)@\(.*\)/\1/')
-docker-run-%: IMAGE = $(shell echo '$@' | sed -e 's/docker-run-\([^@]*\)@\(.*\)/\2/')
-docker-run-%:
-	@$(MAKE) docker-run TEST=$(CMD) IMAGE=qemu/$(IMAGE)
-
 docker-image: ${DOCKER_IMAGES:%=docker-image-%}
 
 docker-clean:
-- 
2.35.1



