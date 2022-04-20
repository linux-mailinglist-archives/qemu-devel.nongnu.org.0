Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87DC508FD9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:55:41 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFUK-0005CP-0k
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkt-0001xw-R8
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:43 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEks-0001ZB-AS
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:43 -0400
Received: by mail-ed1-x532.google.com with SMTP id s25so3322714edi.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rH+MxEmu2nPgakcbeGfHdvm3tdtgh0bu78sWftU09cM=;
 b=Pa9hSSunKFkMBITVSGDf13epmtrAs2D99m9shgPQdw7U/cydpU+toltNi/HekdqJXc
 BVFowtTlkdewnofwn/BG50gacRNcMzZucE1nOm6f1d5Vby1aNQoXy+wcO+CcYK/PsmOG
 6rfMONRHUYT6fdZKilz+d4G98l46RO1RptyqrgQx/9byg1GjCX95nwRD/HpNL5hxTFgG
 08bmkdUXomhiMRyEQjArCVv8zV482EPbxaEQ3pDYVcBYV/1zu/mZlOcR5tFTMUp65/6e
 MtOxKnit+kJsmFHogBRcTXOdGaM/Te+uOxJcNDxCHNoG4sQ2+mckZWUE0HHWWzLQKoFf
 dCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rH+MxEmu2nPgakcbeGfHdvm3tdtgh0bu78sWftU09cM=;
 b=vI4GO5vSSivcqu1+HldvAblOsd/IVk4HGAA414r0rId65+hM8lEMMBFgY6MTQNr1+K
 wnQ+98rnsOWR73uvK0A4CL7d52/XlaV6djOq/kJaX2sfHRZIpn369x0QA/xxebadiqej
 Qa7FUgUhiH83VrnHmx/K3+stsLAy/yFxWkJKz8KBMqQm7Ra0mR9gom7oS/F3gnnb1LUa
 EvPqk2VQg7DzdIj0U7VXsvgilyrwaCeJBr1I33NUoU6MEu3hX44FejpUTLlSgPr8ul0/
 bu2Z2csxY/uxU+OQ8sa2dcoR7eTZasf+um6q4lMu2+3OnO3GTj1XoZLMbELRmQqlki3c
 7OVg==
X-Gm-Message-State: AOAM530IKpTy6B3lAMya2bmnx1nYp50JfcLAByKSiwPSulV2+9CL784m
 gEEJeD6bm+WLKDgHVwzJjS9KAikD8FFjgQ==
X-Google-Smtp-Source: ABdhPJzjo8tGCFEUfZrxQXMhdGVZOQgPhU7nno1UffWsKQH/s9F6Grrgmvrvki+3deUTWDl3kwqqwg==
X-Received: by 2002:a05:6402:35c3:b0:423:f765:4523 with SMTP id
 z3-20020a05640235c300b00423f7654523mr13216553edc.311.1650478121006; 
 Wed, 20 Apr 2022 11:08:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a056402359300b00423e51be1cesm5175237edc.64.2022.04.20.11.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C82FB1FFBE;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 06/25] tests/docker: remove dead variable
Date: Wed, 20 Apr 2022 19:08:13 +0100
Message-Id: <20220420180832.3812543-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220401141326.1244422-4-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-7-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 06c40a9320..c8d0ec3c66 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -13,7 +13,6 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 TESTS ?= %
 IMAGES ?= %
 
-DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
-- 
2.30.2


