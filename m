Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5950679A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:20:53 +0200 (CEST)
Received: from localhost ([::1]:38700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngk2W-0006Of-Bj
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsg-0005UB-JJ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:48 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjse-0008RF-TK
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:42 -0400
Received: by mail-ej1-x62f.google.com with SMTP id r13so31551953ejd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDxzqp3Flj0T6+GiJJ+RTVc465QiIOPGwrojamZudGA=;
 b=R6VB2FZFM4unCZ1pgoyKw7dGW5682ymO24sqbi8RmW90aw8+ZdHAw4Lj+URG8Nvtwm
 /LjlotHC/DRG6OrgmDSi6AymDlLflbFMBs1FAEbN0JKJ4FyKu1xJdg/b/vYnb/3TqLW2
 TtUYFE92i1iYyDTVB+HkFx+x3ROm+kG4h9n64ZRb/DXsT4lJZbTXXdhGH1kFQsQJiDf/
 aKpes5lYqYPsOzEL3IADMT+uakeO3HVYurTTavM+QZJ5vvInPUtL4M9s7KScy4f+4kvv
 /r5LOq3h7TT30KtdUFCzCufzoCF/i+4PV6XeiZoX/czpVWcEGwGK5tYAfNUgDQb7Kk+Y
 DZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDxzqp3Flj0T6+GiJJ+RTVc465QiIOPGwrojamZudGA=;
 b=cNPa6Qwyn8sCw+jerQsfEeme9JJIU/yfljWDml/weHs/0aY+wLm4sN8bel8R2pS5Se
 KHBzvSIAJifCmqgEARSQO/WKvvzLb9JchNwWXCJARFseygJrWrkAoSln8XCL6O7W+qjO
 LdtZN/LlirEeyfYVYWJAtlM2AswEi6yLXTtlVAVxc1/llmdPDyeNDFV0lNuTd+ogmUsn
 14TQ4aak9mASKOXjdM3vkf3xuVXtvoZbYP0GfK8GY3RvIZZ66rr1eUTfTo5sMYRQNMrO
 +eEsMKdhlG3zTtnNRybgY1Td/HxPBVCXgOTRVW5H3wPKqc2onOISV3ztjPBRaSF4HeIL
 aetQ==
X-Gm-Message-State: AOAM531TiRYLwjxfwbdY0ZR1S2BaLMiW5PO/sxRRZKYoprLINYlJEbMY
 Yn2F+ZQMNlEPSmu+6rIc/SsrR8H74F1Eng==
X-Google-Smtp-Source: ABdhPJxhTH4fTB/VYqL0uOMZ9WYIIZ7InVD3k/8YP7w9btPsxd4cIl8k0mVTxAcU/E9mMANiCjIZWA==
X-Received: by 2002:a17:907:6090:b0:6e8:abda:8933 with SMTP id
 ht16-20020a170907609000b006e8abda8933mr12680673ejc.46.1650359438133; 
 Tue, 19 Apr 2022 02:10:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 eq7-20020a056402298700b00419d8d46a8asm7844369edb.39.2022.04.19.02.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 15BCF1FFC1;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/25] tests/docker: remove unnecessary filtering of
 $(DOCKER_IMAGES)
Date: Tue, 19 Apr 2022 10:10:04 +0100
Message-Id: <20220419091020.3008144-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Now that DOCKER_IMAGES is only defined after DOCKER_VIRTUAL_IMAGES is
complete, there is no need to re-filter DOCKER_IMAGES against it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-7-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9b4d1cf837..3b5ebd5567 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -201,7 +201,7 @@ __TESTS := $(notdir $(shell find $(SRC_PATH)/tests/docker/ -name 'test-*' -type
 DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 
 # Expand all the pre-requistes for each docker image and test combination
-$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
+$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
 		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
-- 
2.30.2


