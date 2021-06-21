Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132853AEC41
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:24:21 +0200 (CEST)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLmd-0001GX-MK
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjy-0006Fw-Dj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjr-0000VT-2F
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:34 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so3695129wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=61RWblKSRtqa00hZZOFfYbJ7XqMGRubw2ZJXJzeRDvY=;
 b=VdlxO3NPa/8WLU8Et5MtHOp1eztF1TCFJZtZryDPCMOVPfsnMVdMsJ6oLZFF9f3n93
 Q4EasV2Ep5oneB1XOhqOyL9Gfe0TCkkyFy1Ox8rCBTGy9Vj9MBHi1bWwT7ZOHMsrxos9
 JItqCkaRqgnTF+MWjadXQzVs9xQ2o6DWAyejn76ETSWRrSa2pM+SGQv/epG4i9I5mj1n
 ehXNtfWCd9BwXswjMtbvfpNwakhJ64g8nC+Ztu5+VTYlXMRuA0AFNwn9tOkeskj5UCVR
 2aXEPhlJZWiY0KcNil4PAytvVRQD5VS+tgOVLcLKQTUrQus+XT+r+M2zLJrIxTOoUjmt
 74aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=61RWblKSRtqa00hZZOFfYbJ7XqMGRubw2ZJXJzeRDvY=;
 b=N+Bw20JSVobvtOz3JtITcFtGFWXEyfA9F2+EaJgyRRyraiIzeB2l3pNuiWBG603/Dw
 K3EcUge2gz+7PZO70UxmdOnOtsm55buHAqY95y40wkXFblpM+DxARFKmx96hJ9WDBF3b
 6QiqEzglRHqB4Tk0YJ7EzTaCkXNEw2rzJXeZOxmnbOtSTl+Vh2wyp03v8KDjODPpBnih
 4QTn457M3OykFh4XAYf65QGWZxIMa8vS9mnu3KNb/i81CTdrvbYCHZ2izUCjjMLK2H/J
 44XaI6C/EG1CGgFFmQp+Z3IofggpXGq3oaBjGHWeCdu4xEMzOZxxf3H8KHrS9sGKXqm0
 nf1A==
X-Gm-Message-State: AOAM532fVDfmraRP5pXrlsHdtQ5NykPDPe7klhR4HwspK0y0SYHe75Cs
 tirpXAIt3gUr39XitQxmDpkJgg==
X-Google-Smtp-Source: ABdhPJwZ54EBKbVf/Z6OFUivsOmnkr+5GYlWrLMJ73pGFvdKW5ZsVOn1ivIe1AjFp/60c3gjaeUxoA==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr22426229wmk.135.1624288885598; 
 Mon, 21 Jun 2021 08:21:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g83sm17218216wma.10.2021.06.21.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:21:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5D221FF8F;
 Mon, 21 Jun 2021 16:21:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/5] hw/arm: move CONFIG_V7M out of default-devices
Date: Mon, 21 Jun 2021 16:21:18 +0100
Message-Id: <20210621152120.4465-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621152120.4465-1-alex.bennee@linaro.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently select CONFIG_V7M for a bunch of our m-profile devices.
The last sticking point is translate.c which cannot be compiled
without expecting v7m support. Express this dependency in Kconfig
rather than in default devices as a stepping stone to a fully
configurable translate.c.

While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
as that is implied for M profile machines.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vconfigs
  - cherry pick from re-factor
  - minor tweak to subject line
---
 default-configs/devices/arm-softmmu.mak | 3 ---
 hw/arm/Kconfig                          | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..4114aa9e35 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,8 +1,5 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 528f71bb9d..062fe94b64 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -296,7 +296,10 @@ config ZYNQ
 
 config ARM_V7M
     bool
+    # currently v7M must be included in a TCG build due to translate.c
+    default y if TCG && (ARM || AARCH64)
     select PTIMER
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
-- 
2.20.1


