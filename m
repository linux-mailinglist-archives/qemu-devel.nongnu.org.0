Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1349E3D05DA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:51:12 +0200 (CEST)
Received: from localhost ([::1]:39072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zW3-0001bQ-4D
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFo-0003ht-OF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFl-0001c6-UB
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so470404wms.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/v4fEznnL2NUKF3wCgMn0cquOa2XlUKauT8ZtYoGUQ=;
 b=qjx0j57pSoiAE9zq+E7SpZzMvohIJx1Mb2+ggFwmdvfTMM0mf3mODFFfuz8hTjL7bP
 ydQohmLU1UMm7NlyGQWcDU3l7tfIdkU87w9R9BlZqIniUaTnPlVI7eR4hwAhdQQPOVS7
 J6FHYqao82cy6s3AQZm7fNj2vFErURCfb1EEeA175CK1S6Hw17nsKllRaY9+k9x2wkrZ
 vfvWZnUTPPtGNa+db2FHtHmvI2WH+jVHGgyVEBTzInir5Wg4IJvbv4pV90VU3fNriJUD
 /uXBkCWUPzsNX/Kasb7RuF7iJwgHB4S4bBuj/JIRPv+gZVtrKdFbHlauIqO7IZU6Pugt
 51Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/v4fEznnL2NUKF3wCgMn0cquOa2XlUKauT8ZtYoGUQ=;
 b=RWzN2N4ZnbooodqpSq2iRPUm6EEBah/dUv23w0QUsLUmzxHS/Y8JKEV/jKU1uxBPKX
 YKQxA3zcGP+3MwkRj5uABTs6NK9Ijs6tZ1ky0EEGrfgH23NHEuntYXUt+bc3peLX33yg
 LjrPfGnU/ov2ON/0Ts+B7yMNBxO3VN5lnG9mGZ9hPUDqx9aNYJb67Sn6atX7LH+1jWa4
 bDfSnTKk0ix9ZVawdgt4Vl7+x8kzcSkMFEZTDNy0M7uaexbldaDBZ6jBlwsBrpLLG1IH
 /TX4MeR/+lhyYjUW5owMJ7gr3FkBm58PCwPHZZ1zVC4Jm0m4ea3j7SdcRQRuG7U9aQmr
 DJbw==
X-Gm-Message-State: AOAM531sdz4YRiM+fFajG9hpsbutd0pDctjCSqoiaqBmr1JFDfqpywcv
 xK2e6qhkvVOgDrpa3xY8krYDbA==
X-Google-Smtp-Source: ABdhPJzbmlOI4sWZJOZP85ZcqNYr/Z7YgoEpJvQzMkYH21aS0H1ycmq6ecqqd1A7m5knfqc6PlVNmw==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr18065917wmj.44.1626824060313; 
 Tue, 20 Jul 2021 16:34:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm27009991wro.3.2021.07.20.16.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31E6D1FF87;
 Wed, 21 Jul 2021 00:27:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 25/29] hw/tricore: fix inclusion of tricore_testboard
Date: Wed, 21 Jul 2021 00:26:59 +0100
Message-Id: <20210720232703.10650-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We inadvertently added a symbol clash causing the build not to include
the testboard needed for check-tcg.

Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210720114057.32053-2-alex.bennee@linaro.org>
---
 configs/devices/tricore-softmmu/default.mak | 1 +
 hw/tricore/Kconfig                          | 3 +--
 hw/tricore/meson.build                      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/devices/tricore-softmmu/default.mak b/configs/devices/tricore-softmmu/default.mak
index 5cc91cebce..cb8fc286eb 100644
--- a/configs/devices/tricore-softmmu/default.mak
+++ b/configs/devices/tricore-softmmu/default.mak
@@ -1 +1,2 @@
+CONFIG_TRICORE_TESTBOARD=y
 CONFIG_TRIBOARD=y
diff --git a/hw/tricore/Kconfig b/hw/tricore/Kconfig
index 506e6183c1..33c1e852c3 100644
--- a/hw/tricore/Kconfig
+++ b/hw/tricore/Kconfig
@@ -1,9 +1,8 @@
-config TRICORE
+config TRICORE_TESTBOARD
     bool
 
 config TRIBOARD
     bool
-    select TRICORE
     select TC27X_SOC
 
 config TC27X_SOC
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 47e36bb077..7e3585daf8 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,6 +1,6 @@
 tricore_ss = ss.source_set()
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE_TESTBOARD', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE_TESTBOARD', if_true: files('tricore_testdevice.c'))
 tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
 tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
 
-- 
2.32.0.264.g75ae10bc75


