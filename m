Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D022DC4D7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:59:19 +0100 (CET)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa90-0003bt-FJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyq-0008Hy-Cv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyo-0002PS-Ix
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a12so23816150wrv.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UBVbAOKJHkDQsXBjd+dm95k76D5jiYsHiFF9IIrWfcg=;
 b=VBGN/8QJB6Q3dZnEiay0Hjx0C7blghQh/jMAfb+YQk2XNYvh9U+sMxGiSBVaqBK7S6
 YFAfAn+tUFlvofdfAIGFoT1srVrG50dmSv3N2VNjnA6A5WJeYfevVLzUEUSX9HgrZxlo
 d/8ltlhbjT5mKVN9cSKPBLhDI2LTM5DGs63B2f9/dwfiYp/6kEhtN+lUjBx/gRbRtQLZ
 bRVUVV+gzYAvJ8H9hvlCtxxIhFISCGiCGjwtVQKWX3SlXfFEt4yqL0QFMOKfQxnbQtW0
 pHAZYNo1uRN5r9iLsXT3VwloF+b48UdInAqB41yfI6jEr/qsd7dPmMdBuIVf78hLfZJe
 pWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBVbAOKJHkDQsXBjd+dm95k76D5jiYsHiFF9IIrWfcg=;
 b=mGoNwgM72Y8wUkIBm5uPO26dCqbiRymLDzs0CL+h0LLTWm0KGAE/MPqorR/EDso343
 Ebb3V8nivA9PnN8aQwRee6H/sagX7rzwr3hoqfkyKDJ6U2ajAD16IIDCoWcKnQcWTSjm
 y375axRRA2ufGFLfWGimeQt5ZyJj5+3G851PTMH5dh5SZKMHKA9AxzpxkN3Yce1qbbXK
 Pps/MSXIM3GiKCig9tNToyQtTULsXaz5HoS3zTMswOkkpycirXB9WIE9nCq+KJqYvtgW
 so+0CML8kNir0ej1lqbkRG5eZhj47+blpYLZ1LFZkBVxRMeZQ/D6/NsujguyCM71ghFl
 f8sw==
X-Gm-Message-State: AOAM5320Bagrtb7UfoAwBwtwFyGL+sQFEiLw6pBA4aarTNRTwT06kD8c
 IU6ZEwIw1k3TevyezQI9Sg3Stg==
X-Google-Smtp-Source: ABdhPJziSS02YjMWVd19xcur78kJxRq+9mvG4cRL78itSC+Gl/mn6ncg/CGOlPwJGzAjrTQap1SLHQ==
X-Received: by 2002:a5d:4a09:: with SMTP id m9mr13642653wrq.359.1608137325259; 
 Wed, 16 Dec 2020 08:48:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u7sm2230520wmu.47.2020.12.16.08.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C66A01FF99;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/11] tests/docker: Remove the remainders of debian9
 containers from the Makefile
Date: Wed, 16 Dec 2020 16:48:26 +0000
Message-Id: <20201216164827.24457-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The Debian 9 containers have been removed a while ago, so we can
delete the corresponding entries in the Makefile, too.

Fixes: e3755276d1 ("tests/docker: Remove old Debian 9 containers")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201215083318.92205-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 02ec92830b..c254ac38d0 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -11,8 +11,7 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian9 debian10 debian11
-DOCKER_PARTIAL_IMAGES += debian9-mxe debian-bootstrap
+DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-bootstrap
 DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
@@ -96,7 +95,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 endif
 
 # Enforce dependencies for composite images
-docker-image-debian9-mxe: docker-image-debian9
 ifeq ($(HOST_ARCH),x86_64)
 docker-image-debian-amd64: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64-cross
@@ -104,8 +102,6 @@ else
 docker-image-debian-amd64-cross: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64
 endif
-docker-image-debian-win32-cross: docker-image-debian9-mxe
-docker-image-debian-win64-cross: docker-image-debian9-mxe
 
 # For non-x86 hosts not all cross-compilers have been packaged
 ifneq ($(HOST_ARCH),x86_64)
-- 
2.20.1


