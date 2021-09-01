Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167C3FD7CB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:39:36 +0200 (CEST)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNeZ-0001BF-LV
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc7-0006jN-MJ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:03 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc3-0005bV-4f
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:03 -0400
Received: by mail-wm1-x334.google.com with SMTP id g138so1505249wmg.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9C9/PrAdyP+yrPG+bQavBhq69GwpxQyLDrPvOrD8adM=;
 b=tL1GFsQ9lXUycCLaSArCcnno1GgJxKj8SOX2PBtII81krLHdexsTjeVuFTOm51QuF1
 0X/rCvQm9b/HHrophdJsYZfkaaNOzv59legk1ExiqDefvEuFVpUkNnfUOqiPqEVXDyvF
 AuPySas8taoKTQzafME6I/FvAdSjAbQxBiXHvvjq7MDy55rW+bZSSIvPePiJ4sCot8wR
 N8ZERhbmEw2UGTvQGFYUciojkiCtyI2Mt+iyjXGO4m3qnoVitl+9qGPC/dIyS3m0o5pY
 GMUXk4j1NbBngsh9oIjE6Fhr6tlXSw8TgxtcT/LnupfjuUXg/7ag1pvpfjrypvLtw8yD
 JSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9C9/PrAdyP+yrPG+bQavBhq69GwpxQyLDrPvOrD8adM=;
 b=KQL3sx0byhZX+BtFtQK7GmI7o6f3fPHfbJxXu5Xd+AvVJPQuTscvFeqGF4l3VcwByI
 2zuilr03EIxqdKtEFAtC0mMB7k5mPyjHPWiHbqKxGOhh9jty6TLOEmM34flQ9Fw4OrNa
 62hSxjEG/R6+0FGOOkSYkmfRUucSkkp3se+rLx6JI3KJZB8/DnEqaGG14xLkIyoqjmVS
 wdd338afg6vcsnOXyKu6h+SniAHY6mFSgycHOS6qVnal3i/SNI/3r0O6aN0FQ3peMlkP
 RVVpNQr5Rs6kM/GEFfxbkamqp7UsMbQy+1S3FDtLDdakLtmgycv08RanKM4Y7rTGI9cU
 F8PA==
X-Gm-Message-State: AOAM532SWaDeGQ+OETcWHvYuDxCuKr7XXCb2NaZ2Z8dyeFZcYGVzg07K
 5MTwqvVBcRyoqpsFuZcVkE0Oy5h+D1x6tw==
X-Google-Smtp-Source: ABdhPJxbacU6pb8aqrWSiYP79+2g32dOdcCfhMyMhaqyAEI17IbEQmXfzyACLz2HLnKp2xsGDYtLVw==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr9121875wmc.26.1630492617426;
 Wed, 01 Sep 2021 03:36:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.36.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:36:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/51] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Date: Wed,  1 Sep 2021 11:36:04 +0100
Message-Id: <20210901103653.13435-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Remove the raspi2/raspi3 machine aliases,
deprecated since commit 155e1c82ed0.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210827060815.2384760-3-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/deprecated.rst       | 7 -------
 docs/about/removed-features.rst | 7 +++++++
 hw/arm/raspi.c                  | 2 --
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 8d4fd384a59..1e1a5e96ad4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -207,13 +207,6 @@ this CPU is also deprecated.
 System emulator machines
 ------------------------
 
-Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
-to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
-machines have been renamed ``raspi2b`` and ``raspi3b``.
-
 Aspeed ``swift-bmc`` machine (since 6.1)
 ''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 08f9e625ce6..9d0d90c90d9 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -574,6 +574,13 @@ This machine has been renamed ``fuloong2e``.
 These machine types were very old and likely could not be used for live
 migration from old QEMU versions anymore. Use a newer machine type instead.
 
+Raspberry Pi ``raspi2`` and ``raspi3`` machines (removed in 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
+to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
+machines have been renamed ``raspi2b`` and ``raspi3b``.
+
 
 linux-user mode CPUs
 --------------------
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 0ada91c05e9..146d35382bf 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -340,7 +340,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi2";
     rmc->board_rev = 0xa21041;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
@@ -360,7 +359,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi3";
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
-- 
2.20.1


